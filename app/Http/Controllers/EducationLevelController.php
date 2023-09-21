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
        $departments = DB::table('departemen')
            ->distinct()
            ->select('departemen.replid', 'departemen.departemen')
            ->join('tahunajaran', 'tahunajaran.departemen', '=', 'departemen.departemen')
            ->join('hrm_company', 'hrm_company.replid', '=', 'tahunajaran.idcompany')
            ->where('hrm_company.replid', $companyId)
            ->where('hrm_company.ppdb', 1)
            ->where('departemen.aktif', 1)
            ->orderBy('departemen.urutan')
            ->get();

        return (new DepartmentResourceCollection($departments))->response()->setStatusCode(200);
    }

    public function findGradeLevelByCompanyIdAndDepartmentIdAndAcademicYearId(string $companyId, string $departmentId, string $academicYearId) : JsonResponse
    {
        $gradeLevel =  DB::table('tingkat')
            ->distinct()
            ->select('tingkat.replid', 'tingkat.departemen', 'tingkat.tingkat', 'tingkat.keterangan')
            ->join('kelas', 'kelas.idtingkat', '=', 'tingkat.replid')
            ->join('tahunajaran', 'tahunajaran.replid', '=', 'kelas.idtahunajaran')
            ->join('departemen', 'departemen.departemen', '=', 'tahunajaran.departemen')
            ->join('hrm_company', 'hrm_company.replid', '=', 'tahunajaran.idcompany')
            ->where('hrm_company.replid', $companyId)
            ->where('departemen.replid', $departmentId)
            ->where('tahunajaran.replid', $academicYearId)
            ->where('tahunajaran.aktif', 1)
            ->where('tingkat.aktif', 1)
            ->where('hrm_company.ppdb', 1)
            ->orderBy('tingkat.urutan', 'asc')
            ->get();

        return (new GradeLevelResourceCollection($gradeLevel))->response()->setStatusCode(200);

    }
}
