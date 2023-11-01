<?php

namespace App\Http\Controllers;

use App\Http\Resources\ProgramResourceCollection;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class ProgramController extends Controller
{
    public function findByCompanyIdAndDepartment(string $companyId, string $department) : JsonResponse
    {
        $programs= DB::table('tahunajaran')
            ->select('kelompoksiswa.replid', 'kelompoksiswa.kelompok', 'tahunajaran.departemen')
            ->distinct()
            ->join('kelas', 'kelas.idtahunajaran', '=', 'tahunajaran.replid')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'kelas.kelompok_siswa')
            ->where('tahunajaran.idcompany', $companyId)
            ->where('tahunajaran.departemen', $department)
            ->where('kelompoksiswa.aktif', 1)
            ->where('tahunajaran.aktif', 1)
            ->where('kelas.aktif', 1)
            ->orderBy('kelompoksiswa.kelompok', 'asc')
            ->get();

        return (new ProgramResourceCollection($programs))->response()->setStatusCode(200);
    }
    
    public function cekKapasitasKelas($idTahunAjaran, $idTingkat, $idProgram) {
        // Menghitung jumlah siswa dalam kelas yang sesuai dengan tahun ajaran dan tingkat
        $jumlahSiswa = DB::table('siswa')
            ->join('kelas', 'siswa.idkelas', '=', 'kelas.replid')
            ->join('kelompoksiswa', 'kelompoksiswa.replid', '=', 'kelas.kelompok_siswa')
            // ->join('hrm_company', 'kelompoksiswa.idhrmcompany', '=', 'hrm_company.id')
            ->where('kelas.idtahunajaran', $idTahunAjaran)
            ->where('kelas.idtingkat', $idTingkat)
            // ->where('hrm_company.id', $idUnitSekolah)
            ->where('kelompoksiswa.replid', $idProgram)
            ->count();
    
        // Mengambil kapasitas kelas dari tabel kelas
        $kapasitasKelas = DB::table('kelas')
            ->where('idtahunajaran', $idTahunAjaran)
            ->where('idtingkat', $idTingkat)
            ->where('id_program', $idProgram)
            ->value('kapasitas');
    
            if ($jumlahSiswa < $kapasitasKelas) {
                $response = [
                    'status' => 'Kapasitas mencukupi',
                    'jumlah_siswa' => $jumlahSiswa,
                    'kapasitas_kelas' => $kapasitasKelas,
                ];
            } else {
                $response = [
                    'status' => 'Kapasitas tidak mencukupi',
                    'jumlah_siswa' => $jumlahSiswa,
                    'kapasitas_kelas' => $kapasitasKelas,
                ];
            }
        
            return response()->json($response);
    }
}
