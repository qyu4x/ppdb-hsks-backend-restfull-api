<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use \App\Http\Controllers\EducationTypeController;
use \App\Http\Controllers\AcademicYearController;
use \App\Http\Controllers\SchoolController;
use \App\Http\Controllers\GuardianController;


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

Route::middleware([])->group(function () {
    Route::get('/v1/hsks/education-types', [EducationTypeController::class, 'findAllEducationType']);
  
    Route::get('/v1/hsks/education-types/{educationType}/schools', [SchoolController::class, 'findAllSchool']);

    Route::get('/v1/hsks/company/{idCompany}/departemen/{iddepartemen}/academic-years', [AcademicYearController::class, 'findAcademicYearByCompanyIDandDepartemen']);

    Route::get('/v1/hsks/guardians', [GuardianController::class, 'findAllGuardian']);



});
