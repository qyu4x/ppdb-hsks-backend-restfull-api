<?php

namespace App\Http\Controllers;

use App\Http\Resources\DocumentRequirementResource;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class DocumentAttachmentController extends Controller
{

    public function findAllRequirementDocument() : JsonResponse
    {
        $requirements = DB::table('syarat')
            ->select('replid', 'syarat', 'jumlah', 'aktif', 'allcpd', 'upload')
            ->where('aktif', 1)
            ->orderBy('urutan')
            ->get();

        return (DocumentRequirementResource::collection($requirements))->response()->setStatusCode(200);
    }

}
