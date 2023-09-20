<?php

namespace App\Http\Controllers;

use App\Http\Resources\SchoolResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;

class SchoolController extends Controller
{

    public function findAllSchool(string $schoolType): JsonResponse
    {
        $school = DB::table('hrm_company')->where('aktif', 1)
            ->where('jenis_pendidikan', $schoolType)
            ->get();

        $school->each(function ($item) {
            $departments = DB::table('hrm_company')
                ->select('departemen.replid', 'departemen.departemen')
                ->distinct()
                ->join('tahunajaran', 'hrm_company.replid', '=', 'tahunajaran.idcompany')
                ->join('departemen', 'departemen.departemen', '=', 'tahunajaran.departemen')
                ->where('tahunajaran.idcompany', $item->replid)
                ->where('departemen.aktif', 1)
                ->orderBy('departemen.urutan')
                ->get();

            $programs = DB::table('tahunajaran')
                ->select('kelompoksiswa.kelompok')
                ->distinct()
                ->join('kelas', 'kelas.idtahunajaran', '=', 'tahunajaran.replid')
                ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'kelas.kelompok_siswa')
                ->where('tahunajaran.idcompany', $item->replid)
                ->where('kelompoksiswa.aktif', 1)
                ->where('tahunajaran.aktif', 1)
                ->where('kelas.aktif', 1)
                ->orderBy('kelompok')
                ->get()
                ->pluck('kelompok')
                ->toArray();

            $item->departments = $departments;
            $item->programs = $programs;

        });

        return (new SchoolResourceCollection($school))->response()->setStatusCode(200);
    }
}
