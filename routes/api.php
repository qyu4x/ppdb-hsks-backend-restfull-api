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
});


