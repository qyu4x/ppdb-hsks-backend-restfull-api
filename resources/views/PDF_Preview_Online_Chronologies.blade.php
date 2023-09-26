<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDF Registration Confirmation</title>
    <link rel="stylesheet" type="text/css" href="/css/PDF_Preview_Online_Chronologies.blade.css"> 
</head>
<body>
    <div class="flex justify-center items-center text-center text-black">
        <div>
            <div>
                <p class="font-bold text-sm"><?= $onlineChronologies->nama?></p>
                <div class="flex justify-center items-center">
                    <img class="" src="<?= $onlineChronologies->logo?>" alt="LogoHSKS" />
                </div>
                <p class="text-sm"><?= $onlineChronologies->street?>, <?=$onlineChronologies->city?> - <?=$onlineChronologies->country?></p>
                <p class="text-sm">Telp: <?=$onlineChronologies->phone?>, <?=$onlineChronologies->wappdb?> <?=$onlineChronologies->hrm_company_email?> Website: <?=$onlineChronologies->website?></p>
            </div>
            <div class="border-t border-[#A6A4A4] m-w-auto mt-5 mb-1"></div>
            <div class="border-t border-[#A6A4A4] m-w-auto mb-5"></div>
            <div>
                <div>
                    <p class="text-base font-semibold mb-5 lsm:text-start">Registrasi PPDB Sekolah Kak Seto</p>
                    <p class="text-base text-justify">Terima kasih Bapak/Ibu telah mengisi form registrasi PPDB kami, Calon Peserta Didik dengan nama <?= $onlineChronologies->namacalon ?> telah terdaftar dalam sistem kami.</p>
                </div>
                <div>
                    <p class="text-base font-semibold mt-5 mb-5 lsm:text-start">Data Orang Tua/Wali</p>
                    <div class="border-t border-[#A6A4A4] m-w-auto mb-5"></div>
                    <div>
                        <div class="grid grid-cols-2 text-start gap-1">
                            <div class="text-base ">
                                Hubungan Keluarga
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->ortu ?>
                            </div>
                            <div class="text-base ">
                                Nama
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->namaortu ?>
                            </div>
                            <div class="text-base ">
                                No Handphone
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->handphoneortu ?>
                            </div>
                            <div class="text-base ">
                                No Whatsapp
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->whatsapportu ?>
                            </div>
                            <div class="text-base ">
                                Email :
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->emailortu ?>
                            </div>
                        </div>
                    </div>
                    <p class="text-base font-semibold mt-5 mb-5 lsm:text-start">Data Peserta Didik</p>
                    <div class="border-t border-[#A6A4A4] m-w-auto mb-5"></div>
                    <div class="text-center">
                        <div class="grid grid-cols-2 text-start gap-1">
                            <div class="text-base ">
                                Nama Peserta Didik
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->namacalon?>
                            </div>
                            <div class="text-base ">
                                Jenis Kelamin
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->jeniskelamin?>
                            </div>
                            <div class="text-base ">
                                Tanggal Lahir
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->tanggallahir?>
                            </div>
                        </div>
                    </div>
                    <div>
                        <p class="mt-2 text-start text-base font-base">Apakah calon peserta didik terindikasi "Anak Berkebutuhan Khusus"?<span class="text-Hijau ml-2"><?= $onlineChronologies->abk ?></span></p>
                        <p class="mt-2 text-start text-base font-base">Apakah calon peserta didik pernah melakukan pemeriksaan psikologis dari psikolog atau psikiater?<span class="text-SD ml-2"><?= $onlineChronologies->pemeriksaan_psikolog ?></span></p>
                    </div>
                    <p class="text-base font-semibold mt-5 mb-5 lsm:text-start">Jenjang Yang Dituju</p>
                    <div class="border-t border-[#A6A4A4] m-w-auto mb-5"></div>
                    <div class="text-center">
                        <div class="grid grid-cols-2 text-start gap-1">
                            <div class="text-base ">
                                Lokasi Sekolah
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->namaunitbisnis?>
                            </div>
                            <div class="text-base ">
                                Tahun Pelajaran
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->tahunajaran?>
                            </div>
                            <div class="text-base ">
                                Tingkat
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->tingkat ?>
                            </div>
                            <div class="text-base ">
                                Program Yang Dipilih
                            </div>
                            <div class="text-base">
                                <span>:</span> <?= $onlineChronologies->kelompok ?>
                            </div>
                        </div>
                    </div>
                    <div>
                        <p class="mt-5 text-start text-base mb-5 font-base">Proses Selanjutnya dapat dilakukan dengan mengakses halaman <span class="text-Hijau">Login</span>, dengan akun:</p>
                    </div>
                    <div class="grid grid-cols-2 text-start gap-1">
                        <div class="text-base ">
                            Email
                        </div>
                        <div class="text-base">
                            <span>:</span> <?= $onlineChronologies->email ?>
                        </div>
                        <div class="text-base ">
                            Token
                        </div>
                        <div class="text-base">
                            <span>:</span> <?= $onlineChronologies->tokenonline ?>
                        </div>
                        <div class="text-base ">
                            Tanggal Dibuat
                        </div>
                        <div class="text-base">
                            <span>:</span> <?= $onlineChronologies->created_date ?>
                        </div>
                    </div>
                    <div>
                        <p class="mt-5 text-start text-base mb-5 font-base">Untuk melanjutkan proses PPDB, Bapak/Ibu dapat melakukan <span class="font-bold">pembayaran sebesar Rp.500.000,00,-</span> untuk pembelian formulir.</p>
                    </div>
                    <div>
                        <p class="mt-5 text-start text-base mb-5 font-base">Silahkan menghubungi Customer Service kami untuk informasi pembayaran pada nomor berikut:</p>
                    </div>
                    <div class="grid grid-cols-2 text-start gap-1">
                        <div class="text-base ">
                            Email Panitia
                        </div>
                        <div class="text-base">
                            <span>:</span> <?= $onlineChronologies->hrm_company_email ?>
                        </div>
                        <div class="text-base ">
                            Whatsapp Panitia
                        </div>
                        <div class="text-base">
                            <span>:</span> <?= $onlineChronologies->wappdb ?>
                        </div>
                    </div>
                    <div>
                        <p class="mt-5 text-start text-base font-base">Tim kami akan segera menghubungi Bapak/Ibu setelah pembayaran terverifikasi.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>