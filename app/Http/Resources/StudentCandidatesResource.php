<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class StudentCandidatesResource extends JsonResource
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
            'replid' => $this->replid,
            'nik_siswa' => $this->nik_siswa,
            'nama' => $this->nama,
            'panggilan' => $this->panggilan,
            'kelamin' => $this->kelamin,
            'tmplahir' => $this->tmplahir,
            'tgllahir' => $this->tgllahir,
            'agama' => $this->agama,
            'warga' => $this->warga,
            'anakke' => $this->anakke,
            'jsaudara' => $this->jsaudara,
            //'status' => $this->status,
            'bahasa' => $this->bahasa,
            'negara' => $this->negara,
            'provinsi' => $this->provinsi,
            'kota' => $this->kota,
            'kecamatan' => $this->kecamatan,
            'alamatsiswa' => $this->alamatsiswa,
            'kodepossiswa' => $this->kodepossiswa,
            'idtempattinggal' => $this->idtempattinggal,
            'telponsiswa' => $this->telponsiswa,
            'hpsiswa' => $this->hpsiswa,
            'whatsappsiswa' => $this->pinbbm,
            'emailsiswa' => $this->emailsiswa,
            'berat' => $this->berat,
            'tinggi' => $this->tinggi,
            'darah' => $this->darah,
            'lingkarkepala' => $this->lingkarkepala,
            'jenjangasal' => $this->jenjangasal,
            'asalsekolah' => $this->asalsekolah,
            'tingkat' => $this->tingkat,
            'jenjangakhir' => $this->jenjangakhir,
            'sekolahjenjang' => $this->sekolahjenjang,
            'kps' => $this->kps,
            'no_kps' => $this->no_kps,
            'piplayak' => $this->piplayak,
            'kip' => $this->kip,
            'no_kip' => $this->no_kip,
            'almayah' => $this->almayah,
            'almibu' => $this->almibu,
            'wali_opt' => $this->wali_opt,
        ];
    }
}
