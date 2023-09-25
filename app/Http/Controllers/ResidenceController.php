<?php

namespace App\Http\Controllers;

use App\Http\Resources\ResidenceResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ResidenceController extends Controller
{
    public function findAllResidence() : JsonResponse
    {
        $residence = DB::table('tempattinggal')
            ->select('replid', 'nama')
            ->where('aktif', '=', 1)
            ->orderBy('replid')
            ->get();

        return (ResidenceResource::collection($residence))->response()->setStatusCode(200);
    }
}
