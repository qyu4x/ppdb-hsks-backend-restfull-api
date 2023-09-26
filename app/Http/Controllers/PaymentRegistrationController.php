<?php

namespace App\Http\Controllers;

use App\Http\Resources\PaymentRegistrationResource;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class PaymentRegistrationController extends Controller
{
    public function paymentRegistrationStatus(string $onlineChronologiesId): JsonResponse
    {
        $user = auth()->user();
        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'idcalon', 'namacalon')
            ->where('replid', $onlineChronologiesId)
            ->where('iduser', $user->replid)
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'online chronologies not found'
                ]
            ], 404));
        }

        if (!isset($onlineChronologies->idcalon)) {
            return (new PaymentRegistrationResource($onlineChronologies))->response()->setStatusCode(200);
        } else {
            $payment = DB::table('online_kronologis')
                ->select(
                    'online_kronologis.replid',
                    'online_kronologis.idcalon',
                    'online_kronologis.namacalon',
                    'calonsiswa.keu_assessment',
                    'calonsiswa.nopendaftaran',
                    'calonsiswa.keu_form',
                    'calonsiswa.keu_up'
                )
                ->join('calonsiswa', 'calonsiswa.replid', '=', 'online_kronologis.idcalon')
                ->where('online_kronologis.replid', $onlineChronologiesId)
                ->where('online_kronologis.iduser', $user->replid)
                ->get();

            return (new PaymentRegistrationResource($payment))->response()->setStatusCode(200);
        }
    }

}
