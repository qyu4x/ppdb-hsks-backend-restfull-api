<?php

namespace App\Http\Controllers;

use App\Http\Resources\AcademicYearResourceCollection;
use App\Http\Resources\AcademicYearResource;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Http\JsonResponse;



class AcademicYearController extends Controller
{
    public function findAllAcademicYearByCompanyIDandDepartemen() : JsonResponse
    {
        $academicYear = DB::table('tahunajaran')
                -> where('idcompany')
                -> where('departemen')
                -> where('aktif', '=', '1')
                -> get();
        dd($academicYear);

        return (new AcademicYearResourceCollection($academicYear))->response()->setStatusCode(200);
    }
}
