<?php

namespace App\Http\Controllers;

use App\Http\Requests\UserLoginRequest;
use App\Http\Requests\UserRegisterRequest;
use App\Http\Resources\UserLoginResource;
use App\Http\Resources\UserRegisterResource;
use Carbon\Carbon;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;

class UserAuthController extends Controller
{

    private function generateRandomToken(): string
    {
        $length = 8;
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $randomToken = '';

        for ($i = 0; $i < $length; $i++) {
            $randomToken .= $characters[rand(0, strlen($characters) - 1)];
        }

        return $randomToken;
    }

    private function registrationValidationAvailableDependencyData(mixed $data)
    {
        $user = DB::table('users')
            ->where('email', $data['orang_tua']['email'])
            ->first();

        if ($user) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Email already exists'
                    ]
                ]
            ], 409));
        }

        $company = DB::table('hrm_company')
            ->where('replid', $data['calon_siswa']['id_unit_bisnis'])
            ->first();

        if (!$company) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Unit business not found'
                    ]
                ]
            ], 404));
        }

        $academicYear = DB::table('tahunajaran')
            ->where('replid', $data['calon_siswa']['id_tahun_ajaran'])
            ->first();

        if (!$academicYear) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Academic year not found'
                    ]
                ]
            ], 404));
        }

        $grade = DB::table('tingkat')
            ->where('replid', $data['calon_siswa']['id_tingkat'])
            ->first();

        if (!$grade) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Grade level not found'
                    ]
                ]
            ], 404));
        }

        $program = DB::table('kelompoksiswa')
            ->where('replid', $data['calon_siswa']['id_kelompok_siswa'])
            ->first();

        if (!$program) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => [
                        'Student group not found'
                    ]
                ]
            ], 404));
        }
    }

    public function register(UserRegisterRequest $userCreateRequest): JsonResponse
    {
        $data = $userCreateRequest->validated();
        $this->registrationValidationAvailableDependencyData($data);

        $token = $this->generateRandomToken();
        $userId = DB::table("users")->insertGetId([
            'email' => $data['orang_tua']['email'],
            'role' => 'orang_tua',
            'password' => Hash::make($token),
        ]);

        $onlineChronologiesId = DB::table('online_kronologis')->insertGetId([
            'iduser' => $userId,
            'ortu' => $data['orang_tua']['hubungan'],
            'namaortu' => $data['orang_tua']['nama'],
            'handphoneortu' => $data['orang_tua']['handphone'],
            'emailortu' => $data['orang_tua']['email'],
            'whatsapportu' => $data['orang_tua']['whatsapp'],
            'namacalon' => $data['calon_siswa']['nama'],
            'jeniskelamin' => $data['calon_siswa']['jenis_kelamin'],
            'tanggallahir' => $data['calon_siswa']['tanggal_lahir'],
            'abk' => $data['calon_siswa']['abk'],
            'pemeriksaan_psikolog' => $data['calon_siswa']['pemeriksaan_psikolog'],
            'jenjang' => $data['calon_siswa']['jenjang'],
            'idtingkat' => $data['calon_siswa']['id_tingkat'],
            'idunitbisnis' => $data['calon_siswa']['id_unit_bisnis'],
            'idtahunajaran' => $data['calon_siswa']['id_tahun_ajaran'],
            'idkelompokcalon' => $data['calon_siswa']['id_kelompok_siswa'],
            'tokenonline' => $token,
            'status' => 1,
            'created_date' => Carbon::now('Asia/Jakarta'),
            'modified_date' => Carbon::now('Asia/Jakarta')
        ]);


        $user = DB::table('users')
            ->select('users.replid', 'users.email', 'users.role', 'users.created_date', 'users.modified_date')
            ->where('users.replid', $userId)
            ->first();

        $onlineChronologies = DB::table('online_kronologis')
            ->select(
                'online_kronologis.replid',
                'online_kronologis.ortu',
                'online_kronologis.namaortu',
                'online_kronologis.handphoneortu',
                'online_kronologis.emailortu',
                'online_kronologis.whatsapportu',
                'online_kronologis.namacalon',
                'online_kronologis.jeniskelamin',
                'online_kronologis.tanggallahir',
                'online_kronologis.abk',
                'online_kronologis.pemeriksaan_psikolog',
                'online_kronologis.jenjang',
                'online_kronologis.idtingkat',
                'online_kronologis.idunitbisnis',
                'online_kronologis.idtahunajaran',
                'online_kronologis.idkelompokcalon',
                'online_kronologis.tokenonline',
                'online_kronologis.status',
                'online_kronologis.created_date',
                'online_kronologis.modified_date'
            )
            ->where('iduser', $userId)
            ->where('replid', $onlineChronologiesId)
            ->first();


        return (new UserRegisterResource(
            user: $user, onlineChronologies: $onlineChronologies
        ))->response()->setStatusCode(200)->header('Content-Type', 'application/json');
    }

    private function responseWithJwtToken(string $token): array
    {
        return [
            'token' => $token,
            'token_type' => 'Bearer',
            'expires_in' => 43200 * 60, // in second
        ];
    }

    public function login(UserLoginRequest $userLoginRequest) : JsonResponse
    {
        $credential = $userLoginRequest->validated();
        if (!$token = auth('api')->attempt($credential)) {
            return response()->json([
                'errors' => [
                    'message' => 'Unauthorized'
                ]
            ], 401);
        }

        $token = $this->responseWithJwtToken($token);
        $user = auth()->user();

        $onlineChronologies = DB::table('online_kronologis')
            ->select(
                'online_kronologis.replid',
                'online_kronologis.ortu',
                'online_kronologis.namaortu',
                'online_kronologis.handphoneortu',
                'online_kronologis.emailortu',
                'online_kronologis.whatsapportu',
                'online_kronologis.namacalon',
                'online_kronologis.jeniskelamin',
                'online_kronologis.tanggallahir',
                'online_kronologis.abk',
                'online_kronologis.pemeriksaan_psikolog',
                'online_kronologis.jenjang',
                'online_kronologis.idtingkat',
                'online_kronologis.idunitbisnis',
                'online_kronologis.idtahunajaran',
                'online_kronologis.idkelompokcalon',
                'online_kronologis.tokenonline',
                'online_kronologis.status',
                'online_kronologis.created_date',
                'online_kronologis.modified_date'
            )
            ->where('iduser', $user->replid)
            ->first();

        return (new UserLoginResource(
            user: $user, onlineChronologies: $onlineChronologies, token: $token
        ))->response()->setStatusCode(200)->header('Content-Type', 'application/json');
    }

    public function logout() : JsonResponse
    {
        auth()->logout();
        return response()->json([
            'data' => true
        ])->setStatusCode(200);

    }

    public function test() : JsonResponse {
        return response()->json([
            'data' => true
        ])->setStatusCode(200)->header('Content-Type', 'application/json');
    }
}
