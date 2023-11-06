<?php

namespace App\Http\Controllers;

use App\Http\Resources\AssessmentFormStatusResource;
use App\Http\Resources\ParentFormStatusResource;
use App\Http\Resources\PaymentStatusResource;
use App\Http\Resources\RegistrationStatusResource;
use App\Http\Resources\RegularFormStatusResource;
use App\Http\Resources\RequirementStatusResource;
use App\Http\Resources\StepResource;
use Illuminate\Http\Exceptions\HttpResponseException;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Log;

class StepController extends Controller
{
    public function checkStepStatus(string $idOnlineChronologies): JsonResponse
    {
        $user = auth()->user();
        $onlineChronologies = DB::table('online_kronologis')
            ->select('replid', 'idcalon', 'namacalon')
            ->where('replid', $idOnlineChronologies)
            ->where('iduser', $user->replid)
            ->first();

        if (!$onlineChronologies) {
            throw new HttpResponseException(response([
                'errors' => [
                    'message' => 'online chronologies not found'
                ]
            ], 404));
        }


        $payment = DB::table('online_kronologis')
            ->select(
                'calonsiswa.replid as idcalonsiswa',
                'online_kronologis.replid as idonlinekronologis',
                'online_kronologis.idcalon',
                'online_kronologis.namacalon',
                'calonsiswa.keu_assessment',
                'calonsiswa.nopendaftaran',
                'calonsiswa.keu_form',
                'calonsiswa.keu_up'
            )
            ->join('calonsiswa', 'calonsiswa.replid', '=', 'online_kronologis.idcalon')
            ->where('online_kronologis.replid', $idOnlineChronologies)
            ->where('online_kronologis.iduser', $user->replid)
            ->first();

        $registrationStatusResource = new RegistrationStatusResource(finished: true, locked: false);

        if (!$payment) {
            $paymentStatusResource = new PaymentStatusResource(
                finished: false, locked: $registrationStatusResource->isFinished() == true ? false : true
            );
        } else {
            if ($payment->idcalon != null && $payment->keu_assessment && $payment->keu_form && $payment->keu_up) {
                $paymentStatusResource = new PaymentStatusResource(
                    finished: true, locked: $registrationStatusResource->isFinished() == true ? false : true
                );
            } else {
                $paymentStatusResource = new PaymentStatusResource(
                    finished: false, locked: $registrationStatusResource->isFinished() == true ? false : true
                );
            }
        }

        if ($paymentStatusResource->isFinished() && $payment->idcalon != null) {
            $studentCandidates = DB::table('calonsiswa')
                ->select('replid', 'panggilan', 'emailsiswa')
                ->where('replid', $payment->idcalon)
                ->first();

            if ($studentCandidates->panggilan == null || $studentCandidates->emailsiswa == null) {
                $regularFormStatusResource = new RegularFormStatusResource(finished: false, locked: false);
            } else {
                $regularFormStatusResource = new RegularFormStatusResource(finished: true, locked: false);

            }
        } else {
            $regularFormStatusResource = new RegularFormStatusResource(finished: true, locked: true);
        }

        if ($regularFormStatusResource->isFinished() && isset($payment->idcalon)) {
            $parentForm = DB::table('calonsiswa_form_ortu')
                ->select('replid')
                ->where('replidcalonsiswa', $studentCandidates->replid)
                ->first();

            if (!$parentForm) {
                $parentFormStatusResource = new ParentFormStatusResource(finished: false, locked: false);
            } else {
                $parentFormStatusResource = new ParentFormStatusResource(finished: true, locked: false);
            }
        } else {
            $parentFormStatusResource = new ParentFormStatusResource(finished: false, locked: true);
        }

        if ($parentFormStatusResource->isFinished() && isset($payment->idcalon)) {
            $studentCandidatesAssessment = DB::table('calonsiswa_form_assessment')
                ->select('replid')
                ->where('replidcalonsiswa', $studentCandidates->replid)
                ->first();

            if (!$studentCandidatesAssessment) {
                $assessmentFormStatusResource = new AssessmentFormStatusResource(finished: false, locked: false);
            } else {
                $assessmentFormStatusResource = new AssessmentFormStatusResource(finished: true, locked: false);
            }
        } else {
            $assessmentFormStatusResource = new AssessmentFormStatusResource(finished: false, locked: true);
        }

        if ($assessmentFormStatusResource->isFinished() && isset($payment->idcalon)) {
            $attachment = DB::table('psb_calonsiswa_attachment')
                ->select('replid')
                ->where('idcalonsiswa', $studentCandidates->replid)
                ->first();
            if (!$attachment) {
                $requirementStatusResource = new RequirementStatusResource(finished: false, locked: false);
            } else {
                $requirementStatusResource = new RequirementStatusResource(finished: true, locked: false);
            }
        } else {
            $requirementStatusResource = new RequirementStatusResource(finished: false, locked: false);

        }

        return (new StepResource(
            registrationStatusResource: $registrationStatusResource, paymentStatusResource: $paymentStatusResource,
            requirementStatusResource: $requirementStatusResource, regularFormStatusResource: $regularFormStatusResource,
            parentFormStatusResource: $parentFormStatusResource, assessmentFormStatusResource: $assessmentFormStatusResource
        ))->response()->setStatusCode(200);
    }
}
