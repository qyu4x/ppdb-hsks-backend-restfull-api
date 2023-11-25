<?php

namespace App\Http\Controllers;

use App\Http\Resources\AcademicYearResourceCollection;
use App\Http\Resources\AcademicYearResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;



class AcademicYearController extends Controller
{
    public function findAcademicYearByCompanyIdAndDepartmentId($companyId, $departmentId)
    {
        $academicYears = DB::table('departemen')
            ->join('tahunajaran', 'departemen.departemen', '=', 'tahunajaran.departemen')
            ->select('tahunajaran.replid', 'tahunajaran.departemen', 'tahunajaran.tahunajaran', 'tahunajaran.keterangan', 'tahunajaran.tglmulai', 'tahunajaran.tglakhir')
            ->where('departemen.replid', '=', $departmentId)
            ->where('tahunajaran.idcompany', '=', $companyId)
            ->where('tahunajaran.aktif', '=', 1)
            ->get();

        return (new AcademicYearResourceCollection($academicYears))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }
}
