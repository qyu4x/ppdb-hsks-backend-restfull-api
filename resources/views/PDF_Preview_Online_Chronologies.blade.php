<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>PDF Registration Confirmation</title>
    <style>
        /* Internal CSS */
        .flex-container {
            display: flex;
            justify-content: center;
            align-items: center;
            text-align: center;
            color: black;
        }

        .container {
            display: flex;
            color: black;
            text-align: justify
        }

        .bold-text {
            font-weight: bold;
            font-size: 14px;
            margin-top: 1rem;
        }

        .logo-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo img {
            /* Tambahkan properti CSS untuk logo di sini */
        }

        .address-text {
            font-size: 12px;
            margin-top: 5px;
        }

        .text-1{
            font-size: 12px;
            margin-top: 2rem;
        }

        .text-2{
            font-size: 12px;
            margin-bottom: 2rem;
        }

        .border-line {
            border-top: 1px solid #A6A4A4;
            max-width: auto;
        }

        .data-container {
            /* text-align: start; */
            text-align: justify;
            margin-top: 10px;

        }

        .grid-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            text-align: start;
            gap: 1px;
        }

        .green-text {
            color: #00FF00;
            margin-left: 2px;
        }

        .red-text {
            color: #FF0000;
            margin-left: 2px;
        }

        .bold-green-text {
            color: #00FF00;
            font-weight: bold;
        }
    </style>
    

</head>
<body>
   <div class="flex-container">
        <div>
            <div>
                <p class="bold-text"><?= $onlineChronologies->nama?></p>
                <div class="logo-container">
                    <img class="logo" src="<?= $onlineChronologies->logo?>" alt="LogoHSKS" />
                </div>
                <p class="address-text"><?= $onlineChronologies->street?>, <?=$onlineChronologies->city?> - <?=$onlineChronologies->country?></p>
                <p class="address-text">Telp: <?=$onlineChronologies->phone?>, <?=$onlineChronologies->wappdb?> <?=$onlineChronologies->hrm_company_email?> Website: <?=$onlineChronologies->website?></p>
            </div>
            <div class="border-line"></div>
            <div class="border-line"></div>
            <div>
                <div>
                    <p class="bold-text">Registrasi PPDB Sekolah Kak Seto</p>
                    <p class="address-text">Terima kasih Bapak/Ibu telah mengisi form registrasi PPDB kami, Calon Peserta Didik dengan nama <?= $onlineChronologies->namacalon ?> telah terdaftar dalam sistem kami.</p>
                </div>
                <div>
                    <p class="bold-text">Data Orang Tua/Wali</p>
                    <div class="border-line"></div>
                    <div class="data-container">
                            <div class="address-text">Hubungan Keluarga<span>:</span> <?= $onlineChronologies->ortu ?></div>
                            <div class="address-text">Nama<span>:</span> <?= $onlineChronologies->namaortu ?></div>
                            <div class="address-text">No Handphone<span>:</span> <?= $onlineChronologies->handphoneortu ?></div>
                            <div class="address-text">No Whatsapp<span>:</span> <?= $onlineChronologies->whatsapportu ?></div>
                            <div class="address-text">Email<span>:</span> <?= $onlineChronologies->emailortu ?></div>
                        </div>
                    </div>
                    <p class="bold-text">Data Peserta Didik</p>
                    <div class="border-line"></div>
                    <div class="data-container">
                        <div class="grid-container">
                            <div class="address-text">Nama Peserta Didik<span>:</span> <?= $onlineChronologies->namacalon?></div>
                            <div class="address-text"></div>
                            <div class="address-text">Jenis Kelamin<span>:</span> <?= $onlineChronologies->jeniskelamin?></div>
                            <div class="address-text"></div>
                            <div class="address-text">Tanggal Lahir<span>:</span> <?= $onlineChronologies->tanggallahir?></div>
                            <div class="address-text"></div>
                        </div>
                    </div>
                    <div class="data-container">
                        <p class="address-text">Apakah calon peserta didik terindikasi "Anak Berkebutuhan Khusus"?<span class="green-text"><?= $onlineChronologies->abk ?></span></p>
                        <p class="text-2">Apakah calon peserta didik pernah melakukan pemeriksaan psikologis dari psikolog atau psikiater?<span class="red-text"><?= $onlineChronologies->pemeriksaan_psikolog ?></span></p>
                    </div>
                    <p class="bold-text">Jenjang Yang Dituju</p>
                    <div class="border-line"></div>
                    <div class="data-container">
                        <div class="grid-container">
                            <div class="address-text">Lokasi Sekolah<span>:</span> <?= $onlineChronologies->nama?></div>
                            <div class="address-text">Tahun Pelajaran<span>:</span> <?= $onlineChronologies->tahunajaran?></div>
                            <div class="address-text">Tingkat<span>:</span> <?= $onlineChronologies->tingkat ?></div>
                            <div class="address-text">Program Yang Dipilih<span>:</span> <?= $onlineChronologies->kelompok ?></div>
                        </div>
                    </div>
                    <div>
                        <p class="text-1">Proses Selanjutnya dapat dilakukan dengan mengakses halaman <span class="bold-green-text">Login</span>, dengan akun:</p>
                    </div>
                    <div class="grid-container">
                        <div class="address-text">Email<span>:</span> <?= $onlineChronologies->email ?></div>
                        <div class="address-text">Token<span>:</span> <?= $onlineChronologies->tokenonline ?></div>
                        <div class="address-text">Tanggal Dibuat<span>:</span> <?= $onlineChronologies->created_date ?></div>
                    </div>
                    <div class="data-container">
                        <p class="address-text">Untuk melanjutkan proses PPDB, Bapak/Ibu dapat melakukan <span class="bold-text">pembayaran sebesar Rp.500.000,00,-</span> untuk pembelian formulir.</p>
                    </div>
                    <div>
                        <p class="address-text">Silahkan menghubungi Customer Service kami untuk informasi pembayaran pada nomor berikut:</p>
                    </div>
                    <div class="grid-container">
                        <div class="address-text">Email Panitia<span>:</span> <?= $onlineChronologies->hrm_company_email ?></div>
                        <div class="address-text">Whatsapp Panitia<span>:</span> <?= $onlineChronologies->wappdb ?></div>
                    </div>
                    <div>
                        <p class="text-1">Tim kami akan segera menghubungi Bapak/Ibu setelah pembayaran terverifikasi.</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>