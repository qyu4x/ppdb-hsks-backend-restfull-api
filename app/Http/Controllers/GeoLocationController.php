<?php

namespace App\Http\Controllers;

use App\Http\Resources\GeoLocationCityResource;
use App\Http\Resources\GeoLocationCountryResource;
use App\Http\Resources\GeoLocationProvinceResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class GeoLocationController extends Controller
{
    public function findAllCountry() : JsonResponse
    {
        $country = DB::table('negara')
            ->select('replid', 'negara')
            ->orderBy('negara')
            ->get();

        return (GeoLocationCountryResource::collection($country))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');

    }

    public function findAllProvinceByCountryId(string $countryId) : JsonResponse
    {
        $province = DB::table('propinsi')
            ->select('replid', 'propinsi')
            ->where('id_negara', '=', $countryId)
            ->orderBy('urutan')
            ->get();

        return (GeoLocationProvinceResource::collection($province))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');
    }

    public function findAllCityByProvinceId(string $provinceId) : JsonResponse
    {
        $city = DB::table('kota')
            ->select('replid', 'kota')
            ->where('id_propinsi', '=', $provinceId)
            ->where('aktif', '=', 1)
            ->orderBy('urutan')
            ->get();

        return (GeoLocationCityResource::collection($city))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');

    }
}
