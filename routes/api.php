<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\EducationTypeController;
use \App\Http\Controllers\AcademicYearController;
use \App\Http\Controllers\SchoolController;
use \App\Http\Controllers\EducationLevelController;
use \App\Http\Controllers\ProgramController;
use \App\Http\Controllers\GuardianController;
use \App\Http\Controllers\CustomerServiceController;
use \App\Http\Controllers\UserAuthController;
use \App\Http\Controllers\SurveyController;
use \App\Http\Controllers\OnlineChronologiesController;
use \App\Http\Controllers\GeoLocationController;
use \App\Http\Controllers\ReligionController;
use \App\Http\Controllers\ResidenceController;
use \App\Http\Controllers\DocumentAttachmentController;
use \App\Http\Controllers\FormAssessmentController;
use \App\Http\Controllers\ParentFormController;
use \App\Http\Controllers\PaymentRegistrationController;
use \App\Http\Controllers\StepController;
use \App\Http\Controllers\StudentCandidatesController;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

//Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
//    return $request->user();
//});

Route::middleware(['auth-api'])->group(function () {
    Route::get('/v1/hsks/education-types', [EducationTypeController::class, 'findAllEducationType'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/education-types/{educationType}/schools', [SchoolController::class, 'findAllSchool'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/company/{idCompany}/department/{idDepartment}/academic-years', [AcademicYearController::class, 'findAcademicYearByCompanyIdAndDepartmentId'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/company/{idCompany}/department', [EducationLevelController::class, 'findByCompanyId'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/company/{idCompany}/department/{idDepartment}/academic-years/{idAcademicYear}/grade-level', [EducationLevelController::class, 'findGradeLevelByCompanyIdAndDepartmentIdAndAcademicYearId'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/company/{idCompany}/department/{idDepartment}/programs', [ProgramController::class, 'findByCompanyIdAndDepartmentId'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/guardians', [GuardianController::class, 'findAllGuardian']);

    Route::get('/v1/hsks/company/{idCompany}/customer-services', [CustomerServiceController::class, 'findCustomerServiceByCompanyId'])->withoutMiddleware(['auth-api']);

    Route::post('/v1/hsks/users/register', [UserAuthController::class, 'register'])->withoutMiddleware(['auth-api']);
    Route::post('/v1/hsks/users/login', [UserAuthController::class, 'login'])->withoutMiddleware(['auth-api']);
    Route::middleware('can:isParentOrStudent')->post('/v1/hsks/users/logout', [UserAuthController::class, 'logout']);
    Route::middleware('can:isParent')->get('/v1/hsks/users/test-auth', [UserAuthController::class, 'test']);

    Route::get('/v1/hsks/surveys', [SurveyController::class, 'findAll'])->withoutMiddleware(['auth-api']);
    Route::post('/v1/hsks/surveys', [SurveyController::class, 'postAnswer'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/user/{idUser}/online-chronologies/{idOnlineChronologies}/preview', [OnlineChronologiesController::class, 'findPreviewOnlineChronologiesByIdAndUserId'])->withoutMiddleware(['auth-api']);
    Route::middleware('can:isParent')->get('/v1/hsks/online-chronologies/{idOnlineChronologies}/preview', [OnlineChronologiesController::class, 'findCurrentPreviewOnlineChronologiesById']);
    Route::middleware('can:isParent')->get('/v1/hsks/online-chronologies/preview', [OnlineChronologiesController::class, 'findAllCurrentPreviewOnlineChronologies']);
    Route::middleware('can:isParent')->post('/v1/hsks/online-chronologies', [OnlineChronologiesController::class, 'createOnlineChronologies']);

    Route::get('/v1/hsks/country', [GeoLocationController::class, 'findAllCountry'])->withoutMiddleware(['auth-api']);
    Route::get('/v1/hsks/country/{idCountry}/province', [GeoLocationController::class, 'findAllProvinceByCountryId'])->withoutMiddleware(['auth-api']);
    Route::get('/v1/hsks/province/{idProvince}/city', [GeoLocationController::class, 'findAllCityByProvinceId'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/religions', [ReligionController::class, 'findAllReligion'])->withoutMiddleware(['auth-api']);

    Route::get('/v1/hsks/residences', [ResidenceController::class, 'findAllResidence'])->withoutMiddleware(['auth-api']);
    Route::get('/v1/hsks/document-requirements', [DocumentAttachmentController::class, 'findAllRequirementDocument'])->withoutMiddleware(['auth-api']);

    Route::middleware('can:isParent')->post('/v1/hsks/form-assessment', [FormAssessmentController::class, 'createAssessmentForm']);
    Route::middleware('can:isParent')->post('/v1/hsks/form-parent', [ParentFormController::class, 'createParentForm']);

    Route::get('/v1/hsks/onlinechronologies/{idOnlineChronologies}/pdf', [OnlineChronologiesController::class, 'generatePDF']);
    Route::get('/v1/hsks/online-chronologies/{idOnlineChronologies}/payment-registration', [PaymentRegistrationController::class, 'paymentRegistrationStatus']);

    // fake trigger
    Route::post('/v1/hsks/online-chronologies/{idOnlineChronologies}/student-candidates-trigger', [OnlineChronologiesController::class, 'studentCandidatesTrigger'])->withoutMiddleware(['auth-api']);

    Route::middleware('can:isParent')->get('/v1/hsks/online-chronologies/{idOnlineChronologies}/status-steps', [StepController::class, 'checkStepStatus']);
    Route::middleware('can:isParent')->get('/v1/hsks/online-chronologies/{idOnlineChronologies}/student-candidates/{idStudentCandidates}', [StudentCandidatesController::class, 'findAvailableStudentCandidates']);
    Route::middleware('can:isParent')->patch('/v1/hsks/student-candidates', [StudentCandidatesController::class, 'updateStudentCandidates']);

});


