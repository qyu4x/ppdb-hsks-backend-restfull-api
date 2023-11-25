<?php

namespace App\Http\Controllers;

use App\Http\Resources\CustomerServiceResourceCollection;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class CustomerServiceController extends Controller
{
    public function findCustomerServiceByCompanyId(string $companyId)
    {
        $customerServices = DB::table('hrm_company')
            ->select('company_code', 'kodecabang', 'nama', 'wappdb', 'wappdb2', 'wappdb3', 'background_image')
            ->where('ppdb', 1)
            ->where('replid', $companyId)
            ->get();

        return (new CustomerServiceResourceCollection($customerServices))->response()->setStatusCode(200)
            ->header('Content-Type', 'application/json');

    }
}
