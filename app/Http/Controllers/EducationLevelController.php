<?php

namespace App\Http\Controllers;

use App\Http\Resources\DepartmentResourceCollection;
use App\Http\Resources\GradeLevelResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class EducationLevelController extends Controller
{
    public function findByCompanyId(string $companyId) : JsonResponse
    {
        $departments = DB::table('hrm_company')
            ->select('departemen.replid', 'departemen.departemen')
            ->distinct()
            ->join('tahunajaran', 'hrm_company.replid', '=', 'tahunajaran.idcompany')
            ->join('departemen', 'departemen.departemen', '=', 'tahunajaran.departemen')
            ->where('tahunajaran.idcompany', $companyId)
            ->where('departemen.aktif', 1)
            ->orderBy('departemen.urutan')
            ->get();

        return (new DepartmentResourceCollection($departments))->response()->setStatusCode(200);
    }

    public function findGradeLevelByDepartmentAndAcademicYearId(string $department, string $academicYearId) : JsonResponse
    {
        $gradeLevel = DB::table('hrm_company')
            ->select('tingkat.replid', 'tingkat.departemen', 'tingkat.tingkat', 'tingkat.keterangan')
            ->distinct()
            ->join('tahunajaran', 'hrm_company.replid', '=', 'tahunajaran.idcompany')
            ->join('kelas', 'tahunajaran.replid', '=', 'kelas.idtahunajaran')
            ->join('tingkat', 'tingkat.replid', '=', 'kelas.idtingkat')
            ->where('hrm_company.replid', 1)
            ->where('tahunajaran.departemen', $department)
            ->where('tahunajaran.replid', $academicYearId)
            ->where('tahunajaran.aktif', 1)
            ->where('tingkat.aktif', 1)
            ->orderBy('tingkat.urutan', 'asc')
            ->get();

        return (new GradeLevelResourceCollection($gradeLevel))->response()->setStatusCode(200);

    }
}
