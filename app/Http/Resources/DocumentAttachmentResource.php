<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class DocumentAttachmentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array|\Illuminate\Contracts\Support\Arrayable|\JsonSerializable
     */
    public function toArray($request)
    {

        return [
            'replid' => $this['replid'],
            'id_calon_siswa' => $this['idcalonsiswa'],
            'id_document_type' => $this['iddokumentipe'],
            'file' => $this['file'],
            'new_file' => $this['newfile'],
            'created_date' => $this['created_date'],
            'modified_date' => $this['modified_date'],
        ];
    }
}
