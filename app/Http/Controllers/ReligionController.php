<?php

namespace App\Http\Controllers;

use App\Http\Resources\ReligionResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ReligionController extends Controller
{

    public function findAllReligion() : JsonResponse
    {
        $religion = DB::table('agama')
            ->select('replid', 'agama')
            ->where('aktif', '=', 1)
            ->orderBy('agama')
            ->get();

        return (ReligionResource::collection($religion))->response()->setStatusCode(200);
    }
}
