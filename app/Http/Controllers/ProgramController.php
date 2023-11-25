<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProgramResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProgramController extends Controller
{
    public function findByCompanyIdAndDepartmentId(string $companyId, string $departmentId) : JsonResponse
    {

        $programs = DB::table('departemen')
            ->select('kelompoksiswa.replid', 'kelompoksiswa.kelompok', 'tahunajaran.departemen', 'tahunajaran.idcompany')
            ->distinct()
            ->join('tahunajaran', 'tahunajaran.departemen', '=', 'departemen.departemen')
            ->join('kelas', 'kelas.idtahunajaran', '=', 'tahunajaran.replid')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'kelas.kelompok_siswa')
            ->where('tahunajaran.idcompany', $companyId)
            ->where('departemen.replid', $departmentId)
            ->where('kelompoksiswa.aktif', 1)
            ->where('tahunajaran.aktif', 1)
            ->where('kelas.aktif', 1)
            ->orderBy('kelompok')
            ->get();


        return (new ProgramResourceCollection($programs))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }
}
