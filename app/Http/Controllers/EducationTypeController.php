<?php

namespace App\Http\Controllers;

use App\Http\Resources\EducationTypeResource;
use App\Http\Resources\EducationTypeResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\DB;


class EducationTypeController extends Controller
{
    public function findAllEducationType() : JsonResponse
    {
        $educationTypes = DB::table('hrm_company')
            ->distinct()
            ->select('jenis_pendidikan')
            ->whereNot('jenis_pendidikan', null)
            ->get();

        return (new EducationTypeResourceCollection($educationTypes))->response()->setStatusCode(200);

    }
}
