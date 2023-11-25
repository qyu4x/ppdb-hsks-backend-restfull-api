<?php

namespace App\Http\Controllers;

use App\Http\Requests\SurveyAnswerCreateRequest;
use App\Http\Resources\SurveyResource;
use Illuminate\Http\Exceptions\HttpResponseException;
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
        ))->response()->setStatusCode(200)->header('Content-Type', 'application/json');
    }

    private function validationPostAnswer(mixed $data) : void {
        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'iduser')
            ->where('iduser', $data['user_id'])
            ->where('replid', $data['online_kronologis_id'])
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $voting = DB::table('online_kronologis_reff')
            ->select('replid')
            ->where('replid', $data['voting']['voting_id'])
            ->first();

        if (!$voting) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'voting not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        foreach ($data['alasan'] as $reason) {
            $reason = DB::table('online_kronologis_reff')
                ->select('replid')
                ->where('replid', $reason['alasan_id'])
                ->first();

            if (!$reason) {
                throw new HttpResponseException(response([
                    'errors' => [
                        'message' => 'reason not found'
                    ]
                ], 404)->header('Content-Type', 'application/json'));
            }
        }

        foreach ($data['media'] as $media) {
            $reason = DB::table('online_kronologis_reff')
                ->select('replid')
                ->where('replid', $media['media_id'])
                ->first();

            if (!$reason) {
                throw new HttpResponseException(response([
                    'errors' => [
                        'message' => 'media not found'
                    ]
                ], 404)->header('Content-Type', 'application/json'));
            }
        }

    }
    public function postAnswer(SurveyAnswerCreateRequest $surveyAnswerCreateRequest) : JsonResponse
    {
        $data = $surveyAnswerCreateRequest->validated();

        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'iduser')
            ->where('iduser', $data['user_id'])
            ->where('replid', $data['online_kronologis_id'])
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'user or online chronologies not found'
                ]
            ], 404)->header('Content-Type', 'application/json'));
        }

        $this->validationPostAnswer($data);

        DB::transaction(function () use ($data, $onlineChronologies) {
            DB::table('online_kronologis')
                ->where('iduser', $data['user_id'])
                ->where('replid', $data['online_kronologis_id'])
                ->update(['voting' => $data['voting']['voting_id']]);

            foreach ($data['alasan'] as $reason) {
                DB::table('online_kronologis_alasan')->insert([
                    'idkronologis' => $onlineChronologies->replid,
                    'idalasan' => $reason['alasan_id']
                ]);
            }

            foreach ($data['media'] as $media) {
                DB::table('online_kronologis_media')->insert([
                    'idkronologis' => $onlineChronologies->replid,
                    'idmedia' => $media['media_id']
                ]);
            }
        });

        return response()->json([
            'data' => true
        ])->setStatusCode(200)->header('Content-Type', 'application/json');
    }

}
