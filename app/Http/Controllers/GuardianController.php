<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Resources\GuardianResourceCollection;
use Illuminate\Http\JsonResponse;

class GuardianController extends Controller
{
    public function findAllGuardian () : JsonResponse
    {
        $guardian = DB::table ('penanggung_jawab')
            ->select ('replid', 'penanggung_jawab', 'urutan')
            ->orderBy ('urutan')
            ->whereNot('urutan', '=', 0)
            ->get ();

        return (new GuardianResourceCollection($guardian))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }

}
