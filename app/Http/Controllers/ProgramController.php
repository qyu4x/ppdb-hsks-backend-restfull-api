<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProgramResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProgramController extends Controller
{
    public function findByCompanyIdAndDepartment(string $companyId, string $department) : JsonResponse
    {
        $programs= DB::table('tahunajaran')
            ->select('kelompoksiswa.replid', 'kelompoksiswa.kelompok', 'tahunajaran.departemen')
            ->distinct()
            ->join('kelas', 'kelas.idtahunajaran', '=', 'tahunajaran.replid')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'kelas.kelompok_siswa')
            ->where('tahunajaran.idcompany', $companyId)
            ->where('tahunajaran.departemen', $department)
            ->where('kelompoksiswa.aktif', 1)
            ->where('tahunajaran.aktif', 1)
            ->where('kelas.aktif', 1)
            ->orderBy('kelompoksiswa.kelompok', 'asc')
            ->get();

        return (new ProgramResourceCollection($programs))->response()->setStatusCode(200);
    }
}
