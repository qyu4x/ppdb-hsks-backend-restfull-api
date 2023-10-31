<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StepResource extends JsonResource
{
    private $registrationStatusResource;
    private $paymentStatusResource;
    private $requirementStatusResource;
    private $regularFormStatusResource;
    private $parentFormStatusResource;
    private $assessmentFormStatusResource;

    public function __construct(
        RegistrationStatusResource $registrationStatusResource,
        PaymentStatusResource $paymentStatusResource,
        RequirementStatusResource $requirementStatusResource,
        RegularFormStatusResource $regularFormStatusResource,
        ParentFormStatusResource $parentFormStatusResource,
        AssessmentFormStatusResource $assessmentFormStatusResource
    ) {
        $this->registrationStatusResource = $registrationStatusResource;
        $this->paymentStatusResource = $paymentStatusResource;
        $this->requirementStatusResource = $requirementStatusResource;
        $this->regularFormStatusResource = $regularFormStatusResource;
        $this->parentFormStatusResource = $parentFormStatusResource;
        $this->assessmentFormStatusResource = $assessmentFormStatusResource;

        parent::__construct(null);
    }

    /**
     * Transform the resource into an array.
     *
     * @param \Illuminate\Http\Request $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {
        return [
            'registration_status' => collect($this->registrationStatusResource)->toArray(),
            'payment_status' => collect($this->paymentStatusResource)->toArray(),
            'regular_form_status' => collect($this->regularFormStatusResource)->toArray(),
            'parent_form_status' => collect($this->parentFormStatusResource)->toArray(),
            'assessment_form_status' => collect($this->assessmentFormStatusResource)->toArray(),
            'requirement_status' => collect($this->requirementStatusResource)->toArray(),
        ];
    }


}
