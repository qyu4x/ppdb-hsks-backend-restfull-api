<?php

namespace App\Http\Controllers;

use App\Http\Resources\SurveyResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class SurveyController extends Controller
{
    public function findAll() : JsonResponse
    {
        $voting = DB::table('online_kronologis_reff')
            ->select('replid', 'head', 'reff_kronologis', 'reff_kronologis_sub')
            ->where('head', '=', 'voting')
            ->where('aktif', '=', 1)
            ->get();

        $reason = DB::table('online_kronologis_reff')
            ->select('replid', 'head', 'reff_kronologis', 'reff_kronologis_sub')
            ->where('head', '=', 'Alasan')
            ->where('aktif', '=', 1)
            ->get();

        $media = DB::table('online_kronologis_reff')
            ->select('replid', 'head', 'reff_kronologis', 'reff_kronologis_sub')
            ->where('head', '=', 'Media')
            ->where('aktif', '=', 1)
            ->get();

        return (new SurveyResource(
            voting: $voting, reason: $reason, media: $media
        ))->response()->setStatusCode(200);
    }
}
