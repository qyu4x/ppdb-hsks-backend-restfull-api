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
        .bold-text-2{
            font-weight: bold;
            font-size: 12px;
            margin-top: 5px;
            display: inline;
        }

        .logo-container {
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .logo-img {
            /* Tambahkan properti CSS untuk logo di sini */
        }

        .address-text {
            font-size: 12px;
            margin-top: 5px;
        }

        .text-1{
            font-size: 12px;
            margin-top: 2rem;
            text-align: justify;
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
            color: #27B6C1;
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
                    <p class="text-1">Terima kasih Bapak/Ibu telah mengisi form registrasi PPDB kami, Calon Peserta Didik dengan nama <?= $onlineChronologies->namacalon ?> telah terdaftar dalam sistem kami.</p>
                </div>
                <div>
                    <p class="bold-text">Data Orang Tua/Wali</p>
                    <div class="border-line"></div>
                        <div class="data-container">
                            <div class="grid-container">
                                <div class="address-text"><p class="bold-text-2">Hubungan Keluarga</p><span>:</span> <?= $onlineChronologies->ortu ?></div>
                                <div class="address-text"><p class="bold-text-2">Nama</p><span>:</span> <?= $onlineChronologies->namaortu ?></div>
                                <div class="address-text"><p class="bold-text-2">No. Handphone</p><span>:</span> <?= $onlineChronologies->handphoneortu ?></div>
                                <div class="address-text"><p class="bold-text-2">No. Whatsapp</p><span>:</span> <?= $onlineChronologies->whatsapportu ?></div>
                                <div class="address-text"><p class="bold-text-2">Email</p><span>:</span> <?= $onlineChronologies->emailortu ?></div>
                            </div>
                        </div>
                    </div>
                    <p class="bold-text">Data Peserta Didik</p>
                    <div class="border-line"></div>
                    <div class="data-container">
                        <div class="grid-container">
                            <div class="address-text"><p class="bold-text-2">Nama Peserta Didik</p><span>:</span> <?= $onlineChronologies->namacalon?></div>
                            <div class="address-text"><p class="bold-text-2">Jenis Kelamin</p><span>:</span> <?= ($onlineChronologies->jeniskelamin === 'l') ? 'Laki-Laki' : 'Perempuan'?></div>
                            <div class="address-text"><p class="bold-text-2">Tanggal Lahir</p><span>:</span> <?= date('d F Y', strtotime($onlineChronologies->tanggallahir))?></div>
                        </div>
                    </div>
                    <div class="data-container">
                        <p class="address-text">Apakah calon peserta didik terindikasi "Anak Berkebutuhan Khusus"?<span class="green-text"> <?= $onlineChronologies->abk ? 'Iya' : 'Tidak'?></span></p>
                        <p class="text-2">Apakah calon peserta didik pernah melakukan pemeriksaan psikologis dari psikolog atau psikiater?<span class="red-text"> <?= $onlineChronologies->pemeriksaan_psikolog ? 'Iya' : 'Tidak' ?></span></p>
                    </div>
                    <p class="bold-text">Jenjang Yang Dituju</p>
                    <div class="border-line"></div>
                    <div class="data-container">
                        <div class="grid-container">
                            <div class="address-text"><p class="bold-text-2">Lokasi Sekolah</p><span>:</span> <?= $onlineChronologies->nama?></div>
                            <div class="address-text"><p class="bold-text-2">Tahun Pelajaran</p><span>:</span> <?= $onlineChronologies->tahunajaran?></div>
                            <div class="address-text"><p class="bold-text-2">Tingkat</p><span>:</span> <?= $onlineChronologies->tingkat ?></div>
                            <div class="address-text"><p class="bold-text-2">Program Yang Dipilih</p><span>:</span> <?= $onlineChronologies->kelompok ?></div>
                        </div>
                    </div>
                    <div>
                        <p class="text-1">Proses Selanjutnya dapat dilakukan dengan mengakses halaman <span class="bold-green-text">Login</span>, dengan akun:</p>
                    </div>
                    <div class="data-container">
                        <div class="address-text">Email<span>:</span> <p class="bold-text-2"><?= $onlineChronologies->email ?></p></div>
                        <div class="address-text">Token<span>:</span> <p class="bold-text-2"><?= $onlineChronologies->tokenonline ?></p></div>
                        <div class="address-text">Tanggal Dibuat<span>:</span> <p class="bold-text-2"><?= date('d F Y', strtotime($onlineChronologies->created_date)) ?></p></div>
                    </div>
                    <div class="data-container">
                        <p class="address-text">Untuk melanjutkan proses PPDB, Bapak/Ibu dapat melakukan <span class="bold-text">pembayaran sebesar Rp.500.000,00,-</span> untuk pembelian formulir.</p>
                    </div>
                    <div class="data-container">
                        <p class="address-text">Silahkan menghubungi Customer Service kami untuk informasi pembayaran pada nomor berikut:</p>
                    </div>
                    <div class="data-container">
                        <div class="address-text">Email Panitia<span>:</span> <p class="bold-text-2"><?= $onlineChronologies->hrm_company_email ?></p></div>
                        <div class="address-text">Whatsapp Panitia<span>:</span> <p class="bold-text-2"><?= $onlineChronologies->wappdb ?></p></div>
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