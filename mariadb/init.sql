/*
Navicat MySQL Data Transfer

Source Server         : 10.19.1.2
Source Server Version : 50562
Source Host           : 10.19.1.2:3306
Source Database       : siktest

Target Server Type    : MYSQL
Target Server Version : 50562
File Encoding         : 65001

Date: 2023-08-28 09:42:28
*/

SET
    FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for agama
-- ----------------------------
DROP TABLE IF EXISTS `agama`;
CREATE TABLE `agama`
(
    `replid` int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `agama`  varchar(20)          NOT NULL,
    `urutan` tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `info1`  varchar(255)                  DEFAULT NULL,
    `info2`  varchar(255)                  DEFAULT NULL,
    `info3`  varchar(255)                  DEFAULT NULL,
    `ts`     timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`  smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync` tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `aktif`  tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`agama`),
    UNIQUE KEY `UX_agama` (`replid`) USING BTREE,
    KEY `IX_agama_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of agama
-- ----------------------------
INSERT INTO `agama`
VALUES ('31', 'Advent', '7', null, null, null, '2020-08-12 12:09:57', '9294', '0', '1');
INSERT INTO `agama`
VALUES ('29', 'Budha', '5', null, null, null, '2020-08-10 14:59:37', '48581', '0', '1');
INSERT INTO `agama`
VALUES ('28', 'Hindu', '4', null, null, null, '2020-07-23 14:04:00', '61565', '0', '1');
INSERT INTO `agama`
VALUES ('33', 'INTER FAITH', '0', null, null, null, '2014-08-06 16:10:40', '39677', '0', null);
INSERT INTO `agama`
VALUES ('25', 'Islam', '1', null, null, null, '2020-07-23 14:04:03', '31019', '0', '1');
INSERT INTO `agama`
VALUES ('26', 'Katolik', '2', null, null, null, '2022-01-19 09:49:58', '35929', '0', '1');
INSERT INTO `agama`
VALUES ('38', 'Kepercayaan kpd Tuha', '7', null, null, null, '2020-08-10 14:58:43', '14677', '0', '1');
INSERT INTO `agama`
VALUES ('37', 'Khonghucu', '0', null, null, null, '2020-08-10 14:58:55', '32911', '0', '1');
INSERT INTO `agama`
VALUES ('34', 'KRISTEN', '0', null, null, null, '2014-10-01 09:21:11', '39034', '0', null);
INSERT INTO `agama`
VALUES ('27', 'Kristen Protestan', '3', null, null, null, '2020-07-23 14:04:54', '21057', '0', '1');
INSERT INTO `agama`
VALUES ('32', 'Kristen Saksi Yehuwa', '0', null, null, null, '2013-11-20 13:34:19', '65197', '0', null);
INSERT INTO `agama`
VALUES ('30', 'Lainnya', '6', null, null, null, '2020-08-10 14:59:08', '27277', '0', null);
INSERT INTO `agama`
VALUES ('36', 'PROTESTAN PERTAKOSTA', '0', null, null, null, '2016-08-12 10:41:57', '65095', '0', null);
INSERT INTO `agama`
VALUES ('35', 'SIKH-HINDU', '0', null, null, null, '2016-07-28 09:41:59', '33664', '0', null);

-- ----------------------------
-- Table structure for alamat_surat
-- ----------------------------
DROP TABLE IF EXISTS `alamat_surat`;
CREATE TABLE `alamat_surat`
(
    `replid`       int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `alamat_surat` varchar(100)         NOT NULL,
    `urutan`       tinyint(2) unsigned  NOT NULL,
    `ts`           timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`        smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`       tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 5
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of alamat_surat
-- ----------------------------
INSERT INTO `alamat_surat`
VALUES ('1', 'Sesuai Domisili Siswa', '1', '2013-02-05 01:18:33', '0', '0');
INSERT INTO `alamat_surat`
VALUES ('2', 'Sesuai Domisili Ayah', '2', '2013-02-05 01:29:20', '0', '0');
INSERT INTO `alamat_surat`
VALUES ('3', 'Sesuai Domisili Ibu', '3', '2013-07-25 12:22:52', '0', '0');
INSERT INTO `alamat_surat`
VALUES ('4', 'Sesuai Domisili Wali', '4', '2013-02-05 04:20:51', '0', '0');

-- ----------------------------
-- Table structure for calonsiswa
-- ----------------------------
DROP TABLE IF EXISTS `calonsiswa`;
CREATE TABLE `calonsiswa`
(
    `replid`             int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `nopendaftaran`      varchar(20)          NOT NULL,
    `nisn`               varchar(50)                   DEFAULT NULL,
    `nama`               varchar(100)         NOT NULL,
    `panggilan`          varchar(30)                   DEFAULT NULL,
    `aktif`              int(1) unsigned      NOT NULL DEFAULT '1',
    `tahunmasuk`         int(10) unsigned     NOT NULL,
    `idproses`           int(10) unsigned     NOT NULL,
    `idkelompok`         int(10) unsigned     NOT NULL,
    `suku`               varchar(200)         NOT NULL,
    `agama`              int(20)              NOT NULL,
    `status`             int(11)              NOT NULL,
    `kondisi`            int(11)              NOT NULL,
    `kelamin`            varchar(1)           NOT NULL,
    `tmplahir`           varchar(50)          NOT NULL,
    `tgllahir`           date                 NOT NULL,
    `warga`              varchar(5)                    DEFAULT NULL,
    `anakke`             int(2) unsigned               DEFAULT '0',
    `jsaudara`           int(2) unsigned               DEFAULT '0',
    `bahasa`             varchar(30)                   DEFAULT NULL,
    `berat`              decimal(4, 1) unsigned        DEFAULT '0.0',
    `tinggi`             decimal(4, 1) unsigned        DEFAULT '0.0',
    `darah`              varchar(2)                    DEFAULT NULL,
    `foto`               blob,
    `alamatsiswa`        varchar(255)                  DEFAULT NULL,
    `kodepossiswa`       varchar(8)                    DEFAULT NULL,
    `telponsiswa`        varchar(20)                   DEFAULT NULL,
    `hpsiswa`            varchar(20)                   DEFAULT NULL,
    `emailsiswa`         varchar(100)                  DEFAULT NULL,
    `kesehatan`          varchar(150)                  DEFAULT NULL,
    `asalsekolah`        varchar(100)                  DEFAULT NULL,
    `ketsekolah`         varchar(1000)                 DEFAULT NULL,
    `namaayah`           varchar(60)                   DEFAULT NULL,
    `namaibu`            varchar(60)                   DEFAULT NULL,
    `almayah`            int(10) unsigned     NOT NULL DEFAULT '0',
    `almibu`             int(10) unsigned     NOT NULL DEFAULT '0',
    `pendidikanayah`     int(11)                       DEFAULT NULL,
    `pendidikanibu`      int(11)                       DEFAULT NULL,
    `pekerjaanayah`      int(11)                       DEFAULT NULL,
    `pekerjaanibu`       int(11)                       DEFAULT NULL,
    `wali`               varchar(60)                   DEFAULT NULL,
    `penghasilanayah`    int(10) unsigned              DEFAULT '0',
    `penghasilanibu`     int(10) unsigned              DEFAULT '0',
    `emailayah`          varchar(100)                  DEFAULT NULL,
    `alamatsurat`        varchar(100)                  DEFAULT NULL,
    `keterangan`         text,
    `replidsiswa`        int(10) unsigned              DEFAULT NULL,
    `emailibu`           varchar(100)                  DEFAULT NULL,
    `sum1`               decimal(10, 0)       NOT NULL DEFAULT '0',
    `sum2`               decimal(10, 0)       NOT NULL DEFAULT '0',
    `ujian1`             decimal(5, 2)        NOT NULL DEFAULT '0.00',
    `ujian2`             decimal(5, 2)        NOT NULL DEFAULT '0.00',
    `ujian3`             decimal(5, 2)        NOT NULL DEFAULT '0.00',
    `ujian4`             decimal(5, 2)        NOT NULL DEFAULT '0.00',
    `ujian5`             decimal(5, 2)        NOT NULL DEFAULT '0.00',
    `info1`              varchar(20)                   DEFAULT NULL,
    `info2`              varchar(20)                   DEFAULT NULL,
    `info3`              varchar(20)                   DEFAULT NULL,
    `ts`                 timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`              smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`             int(1) unsigned      NOT NULL DEFAULT '0',
    `region`             int(20)                       DEFAULT NULL,
    `kota`               int(20)                       DEFAULT NULL,
    `provinsi`           int(20)                       DEFAULT NULL,
    `negara`             int(20)                       DEFAULT NULL,
    `pinbbm`             varchar(20)                   DEFAULT NULL,
    `tingkat`            char(2)                       DEFAULT NULL,
    `jurusan`            int(11)                       DEFAULT NULL,
    `tingkat_asal`       int(11)                       DEFAULT NULL,
    `jurusan_asal`       int(11)                       DEFAULT NULL,
    `t_ijazah`           char(4)                       DEFAULT NULL,
    `ijazah`             varchar(200)                  DEFAULT NULL,
    `t_skh`              char(4)                       DEFAULT NULL,
    `skh`                varchar(200)                  DEFAULT NULL,
    `t_lhb`              char(4)                       DEFAULT NULL,
    `lhb`                varchar(200)                  DEFAULT NULL,
    `abk`                int(1)                        DEFAULT NULL,
    `instansiayah`       int(11)                       DEFAULT NULL,
    `instansiibu`        int(11)                       DEFAULT NULL,
    `tel_ayah`           varchar(100)                  DEFAULT NULL,
    `tel_ibu`            varchar(100)                  DEFAULT NULL,
    `hp_ayah`            varchar(100)                  DEFAULT NULL,
    `hp_ibu`             varchar(100)                  DEFAULT NULL,
    `bbm_ayah`           varchar(100)                  DEFAULT NULL,
    `bbm_ibu`            varchar(100)                  DEFAULT NULL,
    `pendidikanwali`     int(11)                       DEFAULT NULL,
    `pekerjaanwali`      int(11)                       DEFAULT NULL,
    `instansiwali`       int(11)                       DEFAULT NULL,
    `penghasilanwali`    int(10) unsigned              DEFAULT '0',
    `hpwali`             varchar(20)                   DEFAULT NULL,
    `emailwali`          varchar(100)                  DEFAULT NULL,
    `tel_wali`           varchar(100)                  DEFAULT NULL,
    `hp_wali`            varchar(100)                  DEFAULT NULL,
    `bbm_wali`           varchar(100)                  DEFAULT NULL,
    `alamat_wali`        varchar(100)                  DEFAULT NULL,
    `info_media`         varchar(100)                  DEFAULT NULL,
    `pj`                 int(11)                       DEFAULT NULL,
    `update_by`          varchar(100)                  DEFAULT NULL,
    `update_date`        datetime                      DEFAULT NULL,
    `created_by`         varchar(100)                  DEFAULT NULL,
    `created_date`       datetime             NOT NULL,
    `alamat_ibu`         varchar(300)                  DEFAULT NULL,
    `kota_ibu`           int(10)                       DEFAULT NULL,
    `provinsi_ibu`       int(10)                       DEFAULT NULL,
    `negara_ibu`         int(10)                       DEFAULT NULL,
    `kodepos_ibu`        varchar(10)                   DEFAULT NULL,
    `alamat_ayah`        varchar(300)                  DEFAULT NULL,
    `kota_ayah`          int(10)                       DEFAULT NULL,
    `provinsi_ayah`      int(10)                       DEFAULT NULL,
    `negara_ayah`        int(10)                       DEFAULT NULL,
    `kodepos_ayah`       varchar(10)                   DEFAULT NULL,
    `kota_wali`          int(10)                       DEFAULT NULL,
    `provinsi_wali`      int(10)                       DEFAULT NULL,
    `negara_wali`        int(10)                       DEFAULT NULL,
    `kodepos_wali`       varchar(10)                   DEFAULT NULL,
    `agama_ibu`          int(10)                       DEFAULT NULL,
    `agama_ayah`         int(10)                       DEFAULT NULL,
    `agama_wali`         int(10)                       DEFAULT NULL,
    `negara_asal`        varchar(200)                  DEFAULT NULL,
    `semester_awal`      varchar(200)                  DEFAULT NULL,
    `nis_sk`             varchar(14)                   DEFAULT NULL,
    `statanak`           varchar(100)                  DEFAULT NULL,
    `calon_kelas`        int(11)                       DEFAULT NULL,
    `pja`                int(11)                       DEFAULT NULL,
    `nissementara`       varchar(11)                   DEFAULT NULL,
    `tanggal_daftar`     date                          DEFAULT NULL,
    `remedialperilaku`   tinyint(11)                   DEFAULT NULL,
    `kelasstatus`        tinyint(11)                   DEFAULT NULL,
    `regionalstatus`     tinyint(4)                    DEFAULT NULL,
    `tahunlahirayah`     int(11)                       DEFAULT NULL,
    `tahunlahiribu`      int(11)                       DEFAULT NULL,
    `sekolahjenjang`     varchar(255)                  DEFAULT NULL,
    `kecamatan`          tinyint(4)                    DEFAULT NULL,
    `skor_iq`            varchar(3)                    DEFAULT NULL,
    `lembaga_iq`         varchar(300)                  DEFAULT NULL,
    `tahunlahirwali`     varchar(255)                  DEFAULT NULL,
    `jaraktempuh`        int(11)                       DEFAULT NULL,
    `waktutempuh`        int(11)                       DEFAULT NULL,
    `alattransportasi`   tinyint(2)                    DEFAULT NULL,
    `kps`                tinyint(1)                    DEFAULT NULL,
    `piplayak`           tinyint(1)                    DEFAULT NULL,
    `kip`                tinyint(1)                    DEFAULT NULL,
    `nik_ayah`           varchar(255)                  DEFAULT NULL,
    `nik_ibu`            varchar(255)                  DEFAULT NULL,
    `nik_wali`           varchar(255)                  DEFAULT NULL,
    `nik_siswa`          varchar(255)                  DEFAULT NULL,
    `keu_form`           tinyint(1)                    DEFAULT NULL,
    `keu_assessment`     tinyint(1)                    DEFAULT NULL,
    `keu_up`             tinyint(1)                    DEFAULT NULL,
    `modified_date`      datetime                      DEFAULT NULL,
    `modified_by`        varchar(200)                  DEFAULT NULL,
    `tokenonline`        varchar(255)                  DEFAULT NULL,
    `no_kps`             varchar(255)                  DEFAULT NULL,
    `no_kip`             varchar(255)                  DEFAULT NULL,
    `lulus`              tinyint(4)                    DEFAULT NULL,
    `idtahunajaran`      int(11)                       DEFAULT NULL,
    `tanggal_masuk`      date                          DEFAULT NULL,
    `jenjangasal`        varchar(255)                  DEFAULT NULL,
    `jenjangakhir`       varchar(255)                  DEFAULT NULL,
    `wali_opt`           tinyint(4)                    DEFAULT NULL,
    `kecamatantext`      varchar(255)                  DEFAULT NULL,
    `kecamatantext_ayah` varchar(255)                  DEFAULT NULL,
    `kecamatantext_ibu`  varchar(255)                  DEFAULT NULL,
    `kecamatantext_wali` varchar(255)                  DEFAULT NULL,
    `instansiayahtext`   varchar(255)                  DEFAULT NULL,
    `instansiibutext`    varchar(255)                  DEFAULT NULL,
    `instansiwalitext`   varchar(255)                  DEFAULT NULL,
    `idtempattinggal`    int(11)                       DEFAULT NULL,
    `verifikasi`         tinyint(4)                    DEFAULT NULL,
    `form_reg`           tinyint(4)                    DEFAULT NULL,
    `form_ass`           tinyint(4)                    DEFAULT NULL,
    `form_ortu`          tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`nopendaftaran`),
    UNIQUE KEY `UX_calonsiswa_replid` (`replid`) USING BTREE,
    KEY `FK_calonsiswa_prosespenerimaansiswa` (`idproses`) USING BTREE,
    KEY `FK_calonsiswa_kelompokcalonsiswa` (`idkelompok`) USING BTREE,
    KEY `FK_calonsiswa_suku` (`suku`) USING BTREE,
    KEY `FK_calonsiswa_agama` (`agama`) USING BTREE,
    KEY `FK_calonsiswa_statusiswa` (`status`) USING BTREE,
    KEY `FK_calonsiswa_asalsekolah` (`asalsekolah`) USING BTREE,
    KEY `FK_calonsiswa_tingkatpendidikan` (`pendidikanayah`) USING BTREE,
    KEY `FK_calonsiswa_jenispekerjaan` (`pekerjaanayah`) USING BTREE,
    KEY `FK_calonsiswa_tingkatpendidikanibu` (`pendidikanibu`) USING BTREE,
    KEY `FK_calonsiswa_jenispekerjaanibu` (`pekerjaanibu`) USING BTREE,
    KEY `FK_calonsiswa_kondisisiswa` (`kondisi`) USING BTREE,
    KEY `IX_calonsiswa_ts` (`ts`, `issync`) USING BTREE,
    KEY `suku` (`suku`) USING BTREE,
    KEY `suku_2` (`suku`) USING BTREE,
    KEY `suku_3` (`suku`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7085
  DEFAULT CHARSET = utf8 COMMENT ='InnoDB free: 196608 kB; (`pendidikanibu`) REFER `jbsumum/tin';

-- ----------------------------
-- Records of calonsiswa
-- ----------------------------

-- ----------------------------
-- Table structure for calonsiswa_form_assessment
-- ----------------------------
DROP TABLE IF EXISTS `calonsiswa_form_assessment`;
CREATE TABLE `calonsiswa_form_assessment`
(
    `replid`           int(11) unsigned NOT NULL AUTO_INCREMENT,
    `replidcalonsiswa` int(11)                         DEFAULT NULL,
    `namadokter`       varchar(255)                    DEFAULT NULL,
    `namapsikiater`    varchar(255)                    DEFAULT NULL,
    `namaterapis1`     varchar(255)                    DEFAULT NULL,
    `namaterapis2`     varchar(255)                    DEFAULT NULL,
    `namaterapis3`     varchar(255)                    DEFAULT NULL,
    `diagnosis`        text,
    `keluhan`          text,
    `pakaibaju`        tinyint(4)                      DEFAULT NULL,
    `bukabaju`         tinyint(4)                      DEFAULT NULL,
    `toilet`           tinyint(4)                      DEFAULT NULL,
    `sikatgigi`        tinyint(4)                      DEFAULT NULL,
    `cucitangan`       tinyint(4)                      DEFAULT NULL,
    `makansendiri`     tinyint(4)                      DEFAULT NULL,
    `resleting`        tinyint(4)                      DEFAULT NULL,
    `minum`            tinyint(4)                      DEFAULT NULL,
    `sepatu`           tinyint(4)                      DEFAULT NULL,
    `kaoskaki`         tinyint(4)                      DEFAULT NULL,
    `talisepatu`       tinyint(4)                      DEFAULT NULL,
    `sukubangsaayah`   varchar(255)                    DEFAULT NULL,
    `anakkeayah`       int(11)                         DEFAULT NULL,
    `anakdariayah`     int(11)                         DEFAULT NULL,
    `kawinayah`        int(11)                         DEFAULT NULL,
    `umurkawinayah`    int(11)                         DEFAULT NULL,
    `sukubangsaibu`    int(11)                         DEFAULT NULL,
    `anakkeibu`        int(11)                         DEFAULT NULL,
    `anakdariibu`      int(11)                         DEFAULT NULL,
    `kawinibu`         int(11)                         DEFAULT NULL,
    `umurkawinibu`     int(11)                         DEFAULT NULL,
    `adopsi`           tinyint(4)                      DEFAULT NULL,
    `faktoradopsi`     text,
    `kesehatanhamil`   varchar(255)                    DEFAULT NULL,
    `caesar`           tinyint(255)                    DEFAULT NULL,
    `hamilkaki`        tinyint(255)                    DEFAULT NULL,
    `kondisilahir`     tinyint(255)                    DEFAULT NULL,
    `kondisilahirdesc` text,
    `angkatkaki`       int(11)                         DEFAULT NULL,
    `berguling`        int(11)                         DEFAULT NULL,
    `duduk`            int(11)                         DEFAULT NULL,
    `merangkak`        int(11)                         DEFAULT NULL,
    `merambat`         int(11)                         DEFAULT NULL,
    `berjalan`         int(11)                         DEFAULT NULL,
    `minumumur`        int(11)                         DEFAULT NULL,
    `makan`            int(11)                         DEFAULT NULL,
    `makansendok`      int(11)                         DEFAULT NULL,
    `talisepatuumur`   int(11)                         DEFAULT NULL,
    `toilettraining`   int(11)                         DEFAULT NULL,
    `satukata`         int(11)                         DEFAULT NULL,
    `gabungkata`       int(11)                         DEFAULT NULL,
    `menamaiobjek`     int(11)                         DEFAULT NULL,
    `bertanya`         int(11)                         DEFAULT NULL,
    `sensoris`         text,
    `created_date`     datetime                        DEFAULT NULL,
    `created_by`       varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `modified_date`    datetime                        DEFAULT NULL,
    `modified_by`      varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 39
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of calonsiswa_form_assessment
-- ----------------------------

-- ----------------------------
-- Table structure for calonsiswa_form_ortu
-- ----------------------------
DROP TABLE IF EXISTS `calonsiswa_form_ortu`;
CREATE TABLE `calonsiswa_form_ortu`
(
    `replid`                 int(11) unsigned NOT NULL AUTO_INCREMENT,
    `replidcalonsiswa`       int(11)                         DEFAULT NULL,
    `alasan`                 text,
    `gambarananak`           text,
    `hambatananak`           text,
    `pengalamananak`         text,
    `hubungansaudara`        text,
    `peraturananak`          text,
    `peranortu`              text,
    `responanak`             text,
    `harapanortu_tutor`      text,
    `harapanortu_pendidikan` text,
    `psikologisanak1`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak2`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak3`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak4`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak5`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak6`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak7`        tinyint(4)                      DEFAULT NULL,
    `psikologisanak8`        tinyint(4)                      DEFAULT NULL,
    `created_date`           datetime                        DEFAULT NULL,
    `created_by`             varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `modified_date`          datetime                        DEFAULT NULL,
    `modified_by`            varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 320
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of calonsiswa_form_ortu
-- ----------------------------

-- ----------------------------
-- Table structure for departemen
-- ----------------------------
DROP TABLE IF EXISTS `departemen`;
CREATE TABLE `departemen`
(
    `replid`        int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `departemen`    varchar(50)          NOT NULL,
    `nipkepsek`     varchar(30)          NOT NULL,
    `urutan`        tinyint(2) unsigned  NOT NULL DEFAULT '0',
    `keterangan`    varchar(255)                  DEFAULT NULL,
    `aktif`         tinyint(1) unsigned  NOT NULL DEFAULT '1',
    `info1`         varchar(255)                  DEFAULT NULL,
    `info2`         varchar(255)                  DEFAULT NULL,
    `info3`         varchar(255)                  DEFAULT NULL,
    `ts`            timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`         smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`        tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `nipkonselor`   varchar(30)          NOT NULL DEFAULT '0',
    `nippsikolog`   varchar(30)                   DEFAULT NULL,
    `created_by`    varchar(200)                  DEFAULT NULL,
    `created_date`  datetime                      DEFAULT NULL,
    `modified_by`   varchar(200)                  DEFAULT NULL,
    `modified_date` datetime                      DEFAULT NULL,
    PRIMARY KEY (`departemen`),
    UNIQUE KEY `UX_departemen_replid` (`replid`) USING BTREE,
    KEY `FK_departemen_pegawai` (`nipkepsek`) USING BTREE,
    KEY `IX_departemen_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 15
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of departemen
-- ----------------------------
INSERT INTO `departemen`
VALUES ('14', 'PENSUS', '112019031010', '0', 'Pendidikan Khusus', '0', null, null, null, '2021-06-10 08:34:59', '17818',
        '0', '0', '222019102015', null, null, null, null);
INSERT INTO `departemen`
VALUES ('11', 'SD', '112009021002', '1', 'Sekolah Dasar', '1', '40169', null, null, '2020-07-08 14:34:05', '49522', '0',
        '112019082027', null, null, null, null, null);
INSERT INTO `departemen`
VALUES ('12', 'SMA', '112010102056', '3', 'Sekolah Menengah Atas', '1', '40176', '112017091064', null,
        '2020-07-08 14:34:06', '34486', '0', '112018072039', null, null, null, null, null);
INSERT INTO `departemen`
VALUES ('13', 'SMP', '112012061013', '2', 'Sekolah Menengah Pertama', '1', '40175', null, null, '2020-07-08 14:34:07',
        '41586', '0', '112019052017', null, null, null, null, null);

-- ----------------------------
-- Table structure for hrm_company
-- ----------------------------
DROP TABLE IF EXISTS `hrm_company`;
CREATE TABLE `hrm_company`
(
    `replid`           int(11)                           NOT NULL AUTO_INCREMENT,
    `company_code`     varchar(10)  DEFAULT NULL,
    `kodecabang`       varchar(2)   DEFAULT NULL,
    `idorganization`   int(11)      DEFAULT NULL,
    `nama`             varchar(255) DEFAULT NULL,
    `is_corporate`     int(11)      DEFAULT NULL,
    `job_position`     varchar(255) DEFAULT NULL,
    `street`           varchar(255) DEFAULT NULL,
    `city`             varchar(255) DEFAULT NULL,
    `zip`              varchar(255) DEFAULT NULL,
    `country`          varchar(255) DEFAULT NULL,
    `join_date`        date         DEFAULT NULL,
    `tipe_cust`        int(11)      DEFAULT NULL,
    `branch`           int(11)      DEFAULT NULL,
    `phone`            varchar(30)  DEFAULT NULL,
    `mobile`           varchar(30)  DEFAULT NULL,
    `website`          varchar(300) DEFAULT NULL,
    `fax`              varchar(255) DEFAULT NULL,
    `email`            varchar(50)  DEFAULT NULL,
    `person`           varchar(255) DEFAULT NULL,
    `status`           int(11)      DEFAULT NULL,
    `npwp`             varchar(255) DEFAULT NULL,
    `notes`            varchar(255) DEFAULT NULL,
    `created_by`       varchar(100) CHARACTER SET latin1 NOT NULL,
    `created_date`     datetime                          NOT NULL,
    `modified_by`      varchar(100) CHARACTER SET latin1 NOT NULL,
    `modified_date`    datetime                          NOT NULL,
    `aktif`            tinyint(1)   DEFAULT NULL,
    `ppdb`             tinyint(1)   DEFAULT NULL,
    `whatsapp`         varchar(255) DEFAULT NULL,
    `brivasd`          varchar(255) DEFAULT NULL,
    `brivasmp`         varchar(255) DEFAULT NULL,
    `brivasma`         varchar(255) DEFAULT NULL,
    `brivapensus`      varchar(255) DEFAULT NULL,
    `bcavasd`          varchar(255) DEFAULT NULL,
    `bcavasmp`         varchar(255) DEFAULT NULL,
    `bcavasma`         varchar(255) DEFAULT NULL,
    `bcavapensus`      varchar(255) DEFAULT NULL,
    `emailppdbsd`      varchar(255) DEFAULT NULL,
    `emailppdbsmp`     varchar(255) DEFAULT NULL,
    `emailppdbsma`     varchar(255) DEFAULT NULL,
    `wappdb`           varchar(255) DEFAULT NULL,
    `emailppdbpensus`  varchar(255) DEFAULT NULL,
    `logo`             varchar(255) DEFAULT NULL,
    `cap`              varchar(255) DEFAULT NULL,
    `wappdb2`          varchar(255) DEFAULT NULL,
    `wappdb3`          varchar(255) DEFAULT NULL,
    `alamatrapor`      varchar(255) DEFAULT NULL,
    `awalbayar`        int(11)      DEFAULT NULL,
    `kode_pegawai`     varchar(255) DEFAULT NULL,
    `satuanpendidikan` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 16
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of hrm_company
-- ----------------------------
INSERT INTO `hrm_company`
VALUES ('1', 'HSKS', '11', '2', 'HOMESCHOOLING KAK SETO PUSAT', null, null,
        'Jln. Raya Parigi Lama No. 3A Parigi Lama, Kec. Pd. Aren', 'Tangerang Selatan', '15427', 'Banten Indonesia',
        null, null, null, '(+6221) 2221 1078', '+6282222204453', 'www.hsks.sch.id', '(021) 7451184',
        'info@hsks.sch.id ', null, null, null, null, '', '2021-06-09 08:16:05', '', '0000-00-00 00:00:00', '1', '1',
        '+628119511845', '40169 1920001', '40175 1920002', '40176 1920003', null, '50181 1920001', '50181 1920002',
        '50181 1920003', null, 'billing.sd@hsks.sch.id', 'billing.smp@hsks.sch.id', 'billing.sma@hsks.sch.id',
        '+628119511845', 'billing.sd@hsks.sch.id', 'logohsks.png', 'cappkbm.png', '+6285770127688', '+6287777217460',
        'Perigi Lama, Pondok Aren, <br/>Tangerang Selatan', '500000', null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('2', 'PTKPP', '01', '1', 'PT. KAZETO PUTRA PERKASA', null, null,
        'Jln. Raya Parigi Lama No. 3A Parigi Lama, Kec. Pd. Aren', 'Tangerang Selatan', '15427', 'Banten Indonesia',
        null, null, null, '(+6221) 2221 1078', '+6282222204453', 'www.hsks.sch.id', '021) 7451184', 'info@hsks.sch.id ',
        null, null, null, null, '', '2021-02-19 10:54:38', '', '0000-00-00 00:00:00', '1', null, '+6282222204453', null,
        null, null, null, null, null, null, null, null, null, null, null, null, 'logokpp.png', null, null, null, null,
        null, null, null);
INSERT INTO `hrm_company`
VALUES ('3', 'KSE', '51', '2', 'KAK SETO ENTERPRENEUR', null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, '', '2020-09-29 15:17:15', '', '0000-00-00 00:00:00', '0', null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('4', 'HSKS', '12', '2', 'HOMESCHOOLING KAK SETO PEKANBARU', null, null,
        'Jl. S.Parman No.05 RT 001 RW 001, Kelurahan Suka Maju, Kecamatan Sail', 'Pekanbaru', '28131', 'Riau Indonesia',
        null, null, null, '(+62761)39967', '+6282382386827', 'www.hsks.sch.id', null,
        'Info.pekanbaru@homeschoolingkakseto.sch.id', null, null, null, null, '', '2021-06-09 08:19:29', '',
        '0000-00-00 00:00:00', '1', '1', '+6282382386827', null, null, null, null, null, null, null, null, null, null,
        null, '+6282382386827', null, null, null, null, null, 'Suka Maju, Kecamatan Sail, <br/>Pekanbaru', '300000',
        null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('5', 'PKBKS', '13', '2', 'KOMUNITAS BERLIAN', null, null, null, 'Tangerang Selatan', null, null, null, null,
        null, null, null, null, null, null, null, null, null, 'PROGRAM MOBIL KELAS BERJALAN', '', '2021-06-09 08:16:54',
        '', '0000-00-00 00:00:00', '1', '1', null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, 'logohsks.png', 'cappkbm_mkb.png', null, null, 'Perigi Lama, Pondok Aren, <br/>Tangerang Selatan',
        null, null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('6', 'KBKS', '14', '2', 'KELOMPOK BELAJAR KAK SETO', null, null, null, '', null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, '', '2020-09-29 15:17:24', '', '0000-00-00 00:00:00', '0', null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('7', 'HSKSB', '15', '2', 'HOMESCHOOLING KAK SETO BEKASI', null, null,
        'Jl. Puncak Cikunir No. 25 Kampung Dua Jakasampurna, Bekasi Barat', 'Bekasi', '17145', 'Indonesia', null, null,
        null, '(+6221) 2221 1078', '+6287851056889', 'www.bekasi.hsks.sch.id', null, 'info@bekasi.hsks.sch.id', null,
        null, null, null, '', '2021-06-09 08:20:19', '', '0000-00-00 00:00:00', '1', '1', '+6287851056889',
        '10214 1920001', '10215 1920002', '10216 1920003', null, null, null, null, null, 'billing@bekasi.hsks.sch.id',
        'billing@bekasi.hsks.sch.id', 'billing@bekasi.hsks.sch.id', '+6287851056889', 'billing@bekasi.hsks.sch.id',
        'logohsksbekasi.png', 'cappkbm.png', null, null, 'Puncak Cikunir, Bekasi Barat, <br/>Bekasi', '500000', null,
        'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('8', 'KSS', '21', '2', 'KAK SETO SCHOOL PUSAT', null, null,
        'Jln. Raya Parigi Lama No.3B, Parigi, Kec. Pd. Aren', 'Tangerang Selatan', '15427', 'Banten Indonesia', null,
        null, null, '(+6221) 7451184', '+6281311881184', 'www.kaksetoschool.sch.id', null, 'info@kaksetoschool.id',
        null, null, null, null, '', '2021-06-09 08:16:37', '', '0000-00-00 00:00:00', '1', '1', '+6287889477001',
        '40183-1920-000-001', null, null, null, '50181-1920-000-001', null, null, null, 'info@kaksetoschool.sch.id',
        null, null, '+6281311881184', null, 'logokss.png', 'capkss.png', null, null,
        'Perigi Lama, Pondok Aren, <br/>Tangerang Selatan', '500000', null, 'YAYASAN KAZETO PUTRA PERKASA');
INSERT INTO `hrm_company`
VALUES ('9', 'KSC', '31', '2', 'KAK SETO CENTRE', null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, '', '2020-07-28 09:30:42', '', '0000-00-00 00:00:00', '0', null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null);
INSERT INTO `hrm_company`
VALUES ('10', 'DC', '41', '2', 'DAYCARE', null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, '', '2020-07-28 09:30:42', '', '0000-00-00 00:00:00', '0', null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null);
INSERT INTO `hrm_company`
VALUES ('11', 'HSKS', '16', '2', 'HOMESCHOOLING KAK SETO SURABAYA', null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, null, '', '2020-09-29 15:17:05', '',
        '0000-00-00 00:00:00', '0', null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('12', 'HSKS', '17', '2', 'HOMESCHOOLING KAK SETO SOLO', null, null, null, null, null, null, null, null, null,
        null, null, null, null, null, null, null, null, null, '', '2020-09-29 15:17:07', '', '0000-00-00 00:00:00', '0',
        null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null,
        null, null, null, null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');
INSERT INTO `hrm_company`
VALUES ('13', 'SKKS', '61', '2', 'SEKOLAH KHUSUS KAK SETO', null, null,
        'Jln. Raya Parigi Lama No. 3A Parigi Lama, Kec. Pd. Aren', 'Tangerang Selatan', '15427', ',Banten Indonesia',
        null, null, null, '(+6221) 745 1184', '+6282222204453', null, null, null, null, null, null, null, '',
        '2021-06-09 08:16:25', '', '0000-00-00 00:00:00', '1', '1', '+6282222204453', '401691920004', '401691920004',
        '401691920004', null, null, null, null, null, null, null, null, '+6282222204453', null, 'logoskks.png',
        'capskks.png', null, null, 'Perigi Lama, Pondok Aren, <br/>Tangerang Selatan', '500000', null,
        'YAYASAN KAZETO PUTRA PERKASA');
INSERT INTO `hrm_company`
VALUES ('14', 'YKPP', '01', '1', 'YAYASAN KAZETO PUTRA PERKASA', null, null,
        'Jln. Raya Parigi Lama No. 3A Parigi Lama, Kec. Pd. Aren', 'Tangerang Selatan', '15427', 'Banten Indonesia',
        null, null, null, '(+6221) 2221 1078', '+6282222204453', 'www.hsks.sch.id', '021) 7451184', 'info@hsks.sch.id ',
        null, null, null, null, '', '2021-02-19 10:54:38', '', '0000-00-00 00:00:00', '1', null, '+6282222204453', null,
        null, null, null, null, null, null, null, null, null, null, null, null, 'logokpp.png', null, null, null, null,
        null, null, null);
INSERT INTO `hrm_company`
VALUES ('15', 'KSLC', '18', '2', 'KAK SETO LEARNING CENTER', null, null,
        'Jln. Raya Parigi Lama No. 3A Parigi Lama, Kec. Pd. Aren', 'Tangerang Selatan', '15427', 'Banten Indonesia',
        null, null, null, '(+6221) 2221 1078', '+6282222204453', 'www.hsks.sch.id', '(021) 7451184',
        'info@hsks.sch.id ', null, null, null, null, '', '2021-06-09 08:16:05', '', '0000-00-00 00:00:00', '1', '1',
        '+628119511845', '401691920007', '401751920008', '401761920009', null, '50181 1920004', '50181 1920005',
        '50181 1920006', null, 'billing.sd@hsks.sch.id', 'billing.smp@hsks.sch.id', 'billing.sma@hsks.sch.id',
        '+628119511845', 'billing.sd@hsks.sch.id', 'logohsks.png', 'cappkbm.png', '+6285770127688', '+6287777217460',
        'Perigi Lama, Pondok Aren, <br/>Tangerang Selatan', '300000', null, 'PKBM KAK SETO<br/>PROGRAM HOMESCHOOLING');

-- ----------------------------
-- Table structure for hrm_status
-- ----------------------------
DROP TABLE IF EXISTS `hrm_status`;
CREATE TABLE `hrm_status`
(
    `replid`        int(10) unsigned NOT NULL AUTO_INCREMENT,
    `status`        varchar(100)     NOT NULL DEFAULT '',
    `node`          varchar(100)              DEFAULT NULL,
    `created_date`  datetime                  DEFAULT NULL,
    `created_by`    varchar(200)              DEFAULT NULL,
    `modified_date` datetime                  DEFAULT NULL,
    `modified_by`   varchar(200)              DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of hrm_status
-- ----------------------------
INSERT INTO `hrm_status`
VALUES ('1', 'Baru', '1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('2', 'Outstanding', '2', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('3', 'Diterima', '3', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('4', 'Selesai', '4', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('5', 'Rilis', '5', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('6', 'Approve By Head Dept', 'K1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('7', 'Approve By Manager', 'M1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('8', 'Approve By CEO', 'C1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('9', 'Ditolak', 'R', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('10', 'Approve By Creator', 'P1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('11', 'Menunggu Realisasi', '11', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('12', 'Outstanding Pay', '12', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('13', 'Diterima Oleh Keuangan', 'F1', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('14', 'Dalam Proses', 'OP', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('15', 'Pre Test', 'PR', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('16', 'Post Test', 'PO', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('17', 'Evaluasi Pelatihan', 'EV', null, null, null, null);
INSERT INTO `hrm_status`
VALUES ('18', 'Dibatalkan', 'CC', null, null, null, null);

-- ----------------------------
-- Table structure for jenisjabatan
-- ----------------------------
DROP TABLE IF EXISTS `jenisjabatan`;
CREATE TABLE `jenisjabatan`
(
    `replid`     int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `jenis`      varchar(50)          NOT NULL,
    `keterangan` varchar(255)                  DEFAULT NULL,
    `urutan`     tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `jabatan`    varchar(2)           NOT NULL DEFAULT 'F',
    `isdefault`  tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `info1`      varchar(255)                  DEFAULT NULL,
    `info2`      varchar(255)                  DEFAULT NULL,
    `info3`      varchar(255)                  DEFAULT NULL,
    `ts`         timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`      smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`     tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`jenis`),
    UNIQUE KEY `Index_replid` (`replid`) USING BTREE,
    KEY `IX_jenisjabatan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of jenisjabatan
-- ----------------------------

-- ----------------------------
-- Table structure for jenispekerjaan
-- ----------------------------
DROP TABLE IF EXISTS `jenispekerjaan`;
CREATE TABLE `jenispekerjaan`
(
    `replid`    int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `pekerjaan` varchar(100)         NOT NULL,
    `info1`     varchar(255)                  DEFAULT NULL,
    `info2`     varchar(255)                  DEFAULT NULL,
    `info3`     varchar(255)                  DEFAULT NULL,
    `ts`        timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`     smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`    tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `aktif`     tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`pekerjaan`),
    UNIQUE KEY `UX_jenispekerjaan` (`replid`) USING BTREE,
    KEY `IX_jenispekerjaan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 152
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of jenispekerjaan
-- ----------------------------
INSERT INTO `jenispekerjaan`
VALUES ('46', 'Advokat', null, null, null, '2020-08-12 09:05:04', '58215', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('78', 'AGEN ASURANSI', null, null, null, '2020-08-12 09:05:04', '36319', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('90', 'AGEN PROPERTY', null, null, null, '2020-08-12 09:05:04', '40663', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('127', 'AKTOR', null, null, null, '2020-08-12 09:05:04', '1790', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('107', 'ANGGOTA DPRD', null, null, null, '2020-08-12 09:05:04', '28098', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('81', 'ANGKATAN LAUT', null, null, null, '2020-08-12 09:05:04', '39982', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('57', 'ANGKUNTAN PUBLIK', null, null, null, '2020-08-12 09:05:04', '19579', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('89', 'APARATUR SIPIL NEGARA', null, null, null, '2020-08-12 09:05:04', '55479', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('35', 'ARSITEK', null, null, null, '2020-08-12 09:05:04', '15184', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('24', 'Artist', null, null, null, '2020-08-12 09:05:04', '30222', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('69', 'ASISTEN PIDANA KHUSUS DI KEJAKSAAN BONE', null, null, null, '2020-08-12 09:05:04', '1285', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('73', 'Atlet', null, null, null, '2020-08-12 09:11:24', '3096', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('77', 'BADAN PERTANAHAN NASIONAL', null, null, null, '2020-08-12 09:05:04', '50871', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('80', 'BANGUNAN', null, null, null, '2020-08-12 09:05:04', '7982', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('121', 'BIDAN', null, null, null, '2020-08-12 09:05:04', '38845', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('104', 'BUMD', null, null, null, '2020-08-12 09:05:04', '479', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('129', 'BUPATI', null, null, null, '2020-08-12 09:05:04', '65403', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('147', 'Buruh', null, null, null, '2020-08-12 09:09:20', '2359', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('119', 'DHL GLOBAL FORWARDING', null, null, null, '2020-08-12 09:05:04', '54563', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('58', 'DIPLOMAT', null, null, null, '2020-08-12 09:05:04', '23426', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('23', 'DOKTER', null, null, null, '2020-08-12 09:05:04', '63335', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('110', 'DOKTER GIGI', null, null, null, '2020-08-12 09:05:04', '13653', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('31', 'DOSEN', null, null, null, '2020-08-12 09:05:04', '39164', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('125', 'DPR-RI', null, null, null, '2020-08-12 09:05:04', '19682', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('76', 'Driver', null, null, null, '2020-08-12 09:05:04', '61755', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('79', 'ENGINEER', null, null, null, '2020-08-12 09:05:04', '29000', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('87', 'ENTREPRENEUR', null, null, null, '2020-08-12 09:05:04', '7818', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('49', 'EXECUTIVE CHEF', null, null, null, '2020-08-12 09:05:04', '56004', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('48', 'FINANCE MANAJER', null, null, null, '2020-08-12 09:05:04', '21840', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('20', 'Freelancer', null, null, null, '2020-08-12 09:05:04', '15458', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('22', 'Guru', null, null, null, '2020-08-12 09:05:04', '13176', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('99', 'GURU MUSIK', null, null, null, '2020-08-12 09:05:04', '9531', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('28', 'Hakim', null, null, null, '2020-08-12 09:05:04', '59752', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('95', 'HOSPITALITY (MOTEL BALIKU)', null, null, null, '2020-08-12 09:05:04', '25525', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('21', 'IBU RUMAH TANGGA', null, null, null, '2020-08-12 09:05:04', '4283', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('44', 'ILUSTRATOR', null, null, null, '2020-08-12 09:05:04', '36615', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('118', 'INSTRUKTUR PILATES', null, null, null, '2020-08-12 09:05:04', '54391', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('102', 'INTERIOR JASA', null, null, null, '2020-08-12 09:05:04', '2398', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('52', 'JURNALIS', null, null, null, '2020-08-12 09:05:04', '21774', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('141', 'Karyawan Swasta', null, null, null, '2020-08-12 09:09:04', '3861', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('70', 'KASUBBIDSESPIMMA BIDJEMEN SESPIM POLRI LEMDIKPOL', null, null, null, '2020-08-12 09:05:04', '51898', '0',
        '0');
INSERT INTO `jenispekerjaan`
VALUES ('114', 'KEDUBES BELANDA', null, null, null, '2020-08-12 09:05:04', '20823', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('126', 'KEPALA DAERAH', null, null, null, '2020-08-12 09:05:04', '61406', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('96', 'KEPALA PENDIDIKAN', null, null, null, '2020-08-12 09:05:04', '41688', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('32', 'KONSULTAN', null, null, null, '2020-08-12 09:05:04', '23603', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('61', 'KONSULTAN TELEKOMUNIKASI', null, null, null, '2020-08-12 09:05:04', '34522', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('91', 'KONSULTAN TRAINER SDM', null, null, null, '2020-08-12 09:05:04', '46837', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('56', 'KONTRAKTOR', null, null, null, '2020-08-12 09:05:04', '26567', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('116', 'KPK', null, null, null, '2020-08-12 09:05:04', '30014', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('150', 'Lainnya', null, null, null, '2020-08-12 09:09:20', '27407', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('112', 'MAHASISWA/I', null, null, null, '2020-08-12 09:05:04', '37984', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('50', 'MANAJER', null, null, null, '2020-08-12 09:05:04', '50201', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('130', 'MUA', null, null, null, '2020-08-12 09:05:04', '11013', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('53', 'Musisi', null, null, null, '2020-08-12 09:05:04', '60918', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('131', 'Nelayan', null, null, null, '2020-08-12 09:08:48', '33080', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('106', 'NGO', null, null, null, '2020-08-12 09:05:04', '46707', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('66', 'NOTARIS', null, null, null, '2020-08-12 09:05:04', '60916', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('117', 'NOTARIS DAN PPAT', null, null, null, '2020-08-12 09:05:04', '52584', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('59', 'OFFICER', null, null, null, '2020-08-12 09:05:04', '49620', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('143', 'Pedagang Besar', null, null, null, '2020-08-12 09:09:04', '51589', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('142', 'Pedagang Kecil', null, null, null, '2020-08-12 09:09:04', '25740', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('18', 'Peg. BUMN', null, null, null, '2020-08-12 09:05:04', '54689', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('105', 'PEG. LEMBAGA NEGARA', null, null, null, '2020-08-12 09:05:04', '42864', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('30', 'PEG.BUMD', null, null, null, '2020-08-12 09:05:04', '9069', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('71', 'Peg.Internasional', null, null, null, '2020-08-12 09:05:04', '23567', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('134', 'Pegawai Negeri Sipil', null, null, null, '2020-08-12 09:08:48', '43958', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('17', 'PEGAWAI SWASTA', null, null, null, '2020-08-12 09:05:04', '36270', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('92', 'PEKERJA SOSIAL', null, null, null, '2020-08-12 09:05:04', '33080', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('151', 'Pelaku Seni', null, null, null, '2020-08-12 09:13:16', '31908', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('122', 'PELAUT', null, null, null, '2020-08-12 09:05:04', '8104', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('39', 'Pelayaran', null, null, null, '2020-08-12 09:05:04', '26184', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('33', 'PEMDA DKI', null, null, null, '2020-08-12 09:05:04', '9849', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('74', 'PENARI/PESENAM', null, null, null, '2020-08-12 09:05:04', '13504', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('34', 'PENDETA', null, null, null, '2020-08-12 09:05:04', '31110', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('115', 'PENGACARA', null, null, null, '2020-08-12 09:05:04', '16899', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('37', 'Pengusaha', null, null, null, '2020-08-12 09:05:04', '33378', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('27', 'Pensiun', null, null, null, '2020-08-12 09:05:04', '14389', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('72', 'Pensiun PNS Pemda Prov. Lampung', null, null, null, '2020-08-12 09:05:04', '23184', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('148', 'Pensiunan', null, null, null, '2020-08-12 09:09:20', '38598', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('41', 'PENULIS', null, null, null, '2020-08-12 09:05:04', '6591', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('65', 'PENYANYI', null, null, null, '2020-08-12 09:05:04', '18053', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('36', 'Perbankan', null, null, null, '2020-08-12 09:05:04', '63195', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('94', 'PERDAGANGAN (PERUMAHAN)', null, null, null, '2020-08-12 09:05:04', '28565', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('132', 'Petani', null, null, null, '2020-08-12 09:08:48', '36467', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('133', 'Peternak', null, null, null, '2020-08-12 09:08:48', '17566', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('128', 'PETRONAS', null, null, null, '2020-08-12 09:05:04', '50850', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('25', 'Pilot', null, null, null, '2020-08-12 09:05:04', '25619', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('54', 'PLN', null, null, null, '2020-08-12 09:05:04', '59763', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('14', 'PNS', null, null, null, '2020-08-12 09:05:04', '10914', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('60', 'POLISI', null, null, null, '2020-08-12 09:05:04', '47619', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('88', 'POLITISI', null, null, null, '2020-08-12 09:05:04', '51259', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('55', 'POLRI', null, null, null, '2020-08-12 09:05:04', '5363', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('19', 'PROFESIONAL', null, null, null, '2020-08-12 09:05:04', '52625', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('108', 'PROFESOR', null, null, null, '2020-08-12 09:05:04', '56969', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('68', 'PSIKOLOG ANAK', null, null, null, '2020-08-12 09:05:04', '31602', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('84', 'PT DELTA MANDIRI', null, null, null, '2020-08-12 09:05:04', '62992', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('101', 'PT NOMURA INDONESIA', null, null, null, '2020-08-12 09:05:04', '59665', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('100', 'PT ROYAL JAYA SENTOUSA (JASA/RENTAL)', null, null, null, '2020-08-12 09:05:04', '36460', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('75', 'PT SAUDARA KUSUMA ERA SEJAHTERA (ACCOUNTING)', null, null, null, '2020-08-12 09:05:04', '13055', '0',
        '0');
INSERT INTO `jenispekerjaan`
VALUES ('120', 'PT SIGMA CITRA CARAKA', null, null, null, '2020-08-12 09:05:05', '58041', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('83', 'PT SURYA MEGA SAKTI LAMPUNG', null, null, null, '2020-08-12 09:05:05', '398', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('97', 'PT UFS SERVICES INDONESIA', null, null, null, '2020-08-12 09:05:05', '22730', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('86', 'PT WANA IRJA LESTARI', null, null, null, '2020-08-12 09:05:05', '18849', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('85', 'PT WNA IRJA LESTARI', null, null, null, '2020-08-12 09:05:05', '38068', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('103', 'SECURITY', null, null, null, '2020-08-12 09:05:05', '52415', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('93', 'SEKRETARIS', null, null, null, '2020-08-12 09:05:05', '38280', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('67', 'SENIMAN', null, null, null, '2020-08-12 09:05:05', '46959', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('47', 'Sentral electric', null, null, null, '2020-08-12 09:05:05', '17565', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('29', 'Social Entrepreneur', null, null, null, '2020-08-12 09:05:05', '8667', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('113', 'SPP', null, null, null, '2020-08-12 09:05:05', '10068', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('45', 'TAYLOR', null, null, null, '2020-08-12 09:05:05', '51222', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('123', 'TEACHER COORDINATOR', null, null, null, '2020-08-12 09:05:05', '57567', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('98', 'TEKNISI', null, null, null, '2020-08-12 09:05:05', '47035', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('149', 'Tenaga Kerja Indonesia', null, null, null, '2020-08-12 09:09:20', '54853', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('64', 'TIDAK ADA DATA', null, null, null, '2020-08-12 09:05:05', '7289', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('138', 'Tidak Bekerja', null, null, null, '2020-08-12 09:08:48', '62995', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('111', 'TNI', null, null, null, '2020-08-12 09:10:05', '15912', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('43', 'TNI/POLRI', null, null, null, '2020-08-12 09:05:05', '7075', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('109', 'WALIKOTA', null, null, null, '2020-08-12 09:05:05', '30354', '0', '0');
INSERT INTO `jenispekerjaan`
VALUES ('15', 'Wiraswasta', null, null, null, '2020-08-12 09:09:55', '53173', '0', '1');
INSERT INTO `jenispekerjaan`
VALUES ('124', 'Wirausaha', null, null, null, '2020-08-12 09:09:57', '15284', '0', '1');

-- ----------------------------
-- Table structure for jurusan
-- ----------------------------
DROP TABLE IF EXISTS `jurusan`;
CREATE TABLE `jurusan`
(
    `replid`        int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `jurusan`       varchar(100)         NOT NULL,
    `departemen`    varchar(50)                   DEFAULT NULL,
    `urutan`        tinyint(2) unsigned  NOT NULL,
    `ts`            timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`         smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`        tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `created_date`  datetime                      DEFAULT NULL,
    `created_by`    varchar(200)                  DEFAULT NULL,
    `modified_date` datetime                      DEFAULT NULL,
    `modified_by`   varchar(200)                  DEFAULT NULL,
    `aktif`         tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 19
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of jurusan
-- ----------------------------
INSERT INTO `jurusan`
VALUES ('1', 'Peminatan Matematika dan Ilmu Alam', 'SMA', '0', '2013-02-05 01:18:33', '0', '0', null, null, null, null,
        '1');
INSERT INTO `jurusan`
VALUES ('2', 'Peminatan Ilmu-Ilmu Sosial', 'SMA', '1', '2013-02-05 01:29:20', '0', '0', null, null, null, null, '1');
INSERT INTO `jurusan`
VALUES ('3', 'A (Tunanetra)', 'SD', '0', '2020-07-28 12:03:28', '0', '0', null, null, null, null, '1');
INSERT INTO `jurusan`
VALUES ('4', 'B (Tunarungu)', 'SD', '0', '2020-07-28 12:03:44', '0', '0', null, null, null, null, '1');
INSERT INTO `jurusan`
VALUES ('5', 'C (Tunagrahita)', 'SD', '0', '2020-07-28 12:03:52', '0', '0', null, null, null, null, '1');
INSERT INTO `jurusan`
VALUES ('6', 'D (Tunadaksa)', 'SD', '0', '2020-07-28 12:03:59', '0', '0', null, null, null, null, '1');
INSERT INTO `jurusan`
VALUES ('7', 'Q (Autisme)', 'SD', '0', '2020-07-28 12:04:05', '0', '0', null, null, '2020-09-09 11:32:47', '31', '1');
INSERT INTO `jurusan`
VALUES ('8', 'C1 (Tunagrahita Sedang)', 'SD', '0', '2020-09-09 11:24:00', '0', '0', '2020-09-09 11:24:00', '31',
        '2020-09-09 11:24:17', '31', '1');
INSERT INTO `jurusan`
VALUES ('9', 'D1 (Tunadaksa Sedang)', 'SD', '0', '2020-09-09 11:34:13', '0', '0', '2020-09-09 11:34:13', '31',
        '2020-09-09 11:34:21', '31', '1');
INSERT INTO `jurusan`
VALUES ('10', 'E (Tunalaras)', 'SD', '0', '2020-09-09 11:34:59', '0', '0', '2020-09-09 11:34:59', '31',
        '2020-09-09 11:34:59', '31', '1');
INSERT INTO `jurusan`
VALUES ('11', 'F (Tunawicara)', 'SD', '0', '2020-09-09 11:36:41', '0', '0', '2020-09-09 11:36:41', '31',
        '2020-09-09 11:36:41', '31', '1');
INSERT INTO `jurusan`
VALUES ('12', 'H (Hyperaktif)', 'SD', '0', '2020-09-09 11:37:26', '0', '0', '2020-09-09 11:37:26', '31',
        '2020-09-09 11:37:26', '31', '1');
INSERT INTO `jurusan`
VALUES ('13', 'I (Cerdas Istimewa)', 'SD', '0', '2020-09-09 11:37:39', '0', '0', '2020-09-09 11:37:39', '31',
        '2020-09-09 11:37:39', '31', '1');
INSERT INTO `jurusan`
VALUES ('14', 'J (Bakat Istimewa)', 'SD', '0', '2020-09-09 11:37:50', '0', '0', '2020-09-09 11:37:50', '31',
        '2020-09-09 11:37:50', '31', '1');
INSERT INTO `jurusan`
VALUES ('15', 'K (Kesulitan Belajar)', 'SD', '0', '2020-09-09 11:38:10', '0', '0', '2020-09-09 11:38:10', '31',
        '2020-09-09 11:38:10', '31', '1');
INSERT INTO `jurusan`
VALUES ('16', 'N (Narkoba)', 'SD', '0', '2020-09-09 11:38:19', '0', '0', '2020-09-09 11:38:19', '31',
        '2020-09-09 11:38:19', '31', '1');
INSERT INTO `jurusan`
VALUES ('17', 'O (Indigo)', 'SD', '0', '2020-09-09 11:38:31', '0', '0', '2020-09-09 11:38:31', '31',
        '2020-09-09 11:38:31', '31', '1');
INSERT INTO `jurusan`
VALUES ('18', 'P (Down Syndrome)', 'SD', '0', '2020-09-09 11:38:50', '0', '0', '2020-09-09 11:38:50', '31',
        '2020-09-09 11:38:50', '31', '1');

-- ----------------------------
-- Table structure for jurusan_asal
-- ----------------------------
DROP TABLE IF EXISTS `jurusan_asal`;
CREATE TABLE `jurusan_asal`
(
    `replid`  int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `jurusan` varchar(100)         NOT NULL,
    `urutan`  tinyint(2) unsigned  NOT NULL,
    `ts`      timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`   smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`  tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 6
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of jurusan_asal
-- ----------------------------
INSERT INTO `jurusan_asal`
VALUES ('1', 'IPA', '1', '2013-02-05 01:18:33', '0', '0');
INSERT INTO `jurusan_asal`
VALUES ('2', 'IPS', '2', '2013-02-05 01:29:20', '0', '0');
INSERT INTO `jurusan_asal`
VALUES ('3', 'BAHASA', '3', '2013-02-05 04:20:51', '0', '0');
INSERT INTO `jurusan_asal`
VALUES ('4', '', '0', '2013-11-18 11:31:38', '0', '0');
INSERT INTO `jurusan_asal`
VALUES ('5', 'ERROR', '0', '2013-11-18 11:33:11', '0', '0');

-- ----------------------------
-- Table structure for kecamatan
-- ----------------------------
DROP TABLE IF EXISTS `kecamatan`;
CREATE TABLE `kecamatan`
(
    `replid`    int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `kecamatan` varchar(100)         NOT NULL,
    `id_kota`   int(11)                       DEFAULT NULL,
    `urutan`    tinyint(2) unsigned  NOT NULL,
    `info1`     varchar(255)                  DEFAULT NULL,
    `info2`     varchar(255)                  DEFAULT NULL,
    `info3`     varchar(255)                  DEFAULT NULL,
    `ts`        timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`     smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`    tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_kota` (`replid`) USING BTREE,
    KEY `IX_kota_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 113
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of kecamatan
-- ----------------------------
INSERT INTO `kecamatan`
VALUES ('1', 'Pondok Aren', '3', '0', null, null, null, '2018-05-16 08:39:05', '0', '0');
INSERT INTO `kecamatan`
VALUES ('2', 'KEBAYORAN LAMA', '6', '0', null, null, null, '2018-05-16 10:54:16', '0', '0');
INSERT INTO `kecamatan`
VALUES ('3', 'TEBET BARAT', '6', '0', null, null, null, '2018-07-14 12:01:33', '0', '0');
INSERT INTO `kecamatan`
VALUES ('4', 'GROGOL PETAMBURAN', '5', '0', null, null, null, '2018-07-19 11:13:43', '0', '0');
INSERT INTO `kecamatan`
VALUES ('5', 'JATINEGARA', '7', '0', null, null, null, '2018-07-23 16:18:10', '0', '0');
INSERT INTO `kecamatan`
VALUES ('6', 'CIPAYUNG', '7', '0', null, null, null, '2018-07-24 13:23:39', '0', '0');
INSERT INTO `kecamatan`
VALUES ('7', 'SERPONG UTARA', '3', '0', null, null, null, '2018-07-25 11:50:33', '0', '0');
INSERT INTO `kecamatan`
VALUES ('8', 'TEBET', '6', '0', null, null, null, '2018-07-26 09:06:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('9', 'SERPONG', '3', '0', null, null, null, '2018-07-30 09:49:31', '0', '0');
INSERT INTO `kecamatan`
VALUES ('10', 'TANJUNG DUREN', '5', '0', null, null, null, '2018-07-31 11:05:33', '0', '0');
INSERT INTO `kecamatan`
VALUES ('11', 'LARANGAN', '2', '0', null, null, null, '2018-07-31 12:07:35', '0', '0');
INSERT INTO `kecamatan`
VALUES ('12', 'CIPINANG BESAR', '7', '0', null, null, null, '2018-07-31 13:27:44', '0', '0');
INSERT INTO `kecamatan`
VALUES ('13', 'CILINCING', '8', '0', null, null, null, '2018-07-31 14:53:54', '0', '0');
INSERT INTO `kecamatan`
VALUES ('14', 'BINTARO', '3', '0', null, null, null, '2018-08-01 14:33:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('15', 'CIPUTAT', '3', '0', null, null, null, '2018-08-02 14:13:31', '0', '0');
INSERT INTO `kecamatan`
VALUES ('16', 'PAMULANG', '3', '0', null, null, null, '2018-08-09 10:30:32', '0', '0');
INSERT INTO `kecamatan`
VALUES ('17', 'RAWASARI', '0', '0', null, null, null, '2018-08-09 10:40:57', '0', '0');
INSERT INTO `kecamatan`
VALUES ('18', 'CINERE', '15', '0', null, null, null, '2018-08-29 14:34:45', '0', '0');
INSERT INTO `kecamatan`
VALUES ('19', 'BSD', '2', '0', null, null, null, '2018-08-29 15:38:23', '0', '0');
INSERT INTO `kecamatan`
VALUES ('20', 'BSD', '2', '0', null, null, null, '2018-08-30 11:48:32', '0', '0');
INSERT INTO `kecamatan`
VALUES ('21', 'MAMPANG PRAPATAN', '6', '0', null, null, null, '2018-09-03 13:20:50', '0', '0');
INSERT INTO `kecamatan`
VALUES ('22', 'KEMBANGAN', '5', '0', null, null, null, '2018-09-04 11:13:18', '0', '0');
INSERT INTO `kecamatan`
VALUES ('23', 'PASAR MINGGU', '6', '0', null, null, null, '2018-09-06 11:37:23', '0', '0');
INSERT INTO `kecamatan`
VALUES ('24', 'CIREUNDE', '3', '0', null, null, null, '2018-09-06 15:33:55', '0', '0');
INSERT INTO `kecamatan`
VALUES ('25', 'KEBAYORAN BARU', '6', '0', null, null, null, '2018-09-10 14:20:11', '0', '0');
INSERT INTO `kecamatan`
VALUES ('26', 'BEKASI SELATAN', '14', '0', null, null, null, '2018-09-13 10:52:13', '0', '0');
INSERT INTO `kecamatan`
VALUES ('27', 'CENGKARENG', '5', '0', null, null, null, '2018-09-13 15:22:25', '0', '0');
INSERT INTO `kecamatan`
VALUES ('28', 'PAMULANG', '2', '0', null, null, null, '2018-09-14 15:31:38', '0', '0');
INSERT INTO `kecamatan`
VALUES ('29', 'LIMO', '15', '0', null, null, null, '2018-09-14 15:46:04', '0', '0');
INSERT INTO `kecamatan`
VALUES ('30', 'SUKAMAJAYA', '15', '0', null, null, null, '2018-09-18 13:22:16', '0', '0');
INSERT INTO `kecamatan`
VALUES ('31', 'KARANG TENGAH', '2', '0', null, null, null, '2018-09-18 13:34:09', '0', '0');
INSERT INTO `kecamatan`
VALUES ('32', 'JAGAKARSA', '6', '0', null, null, null, '2018-09-20 14:49:50', '0', '0');
INSERT INTO `kecamatan`
VALUES ('33', 'PESANGGRAHAN', '6', '0', null, null, null, '2018-09-20 15:20:10', '0', '0');
INSERT INTO `kecamatan`
VALUES ('34', 'CIRENDEU', '2', '0', null, null, null, '2018-09-20 15:42:42', '0', '0');
INSERT INTO `kecamatan`
VALUES ('35', 'PALMERAH', '5', '0', null, null, null, '2018-09-21 14:49:06', '0', '0');
INSERT INTO `kecamatan`
VALUES ('36', 'KARAWACI', '2', '0', null, null, null, '2018-09-21 14:52:25', '0', '0');
INSERT INTO `kecamatan`
VALUES ('37', 'MENTENG', '4', '0', null, null, null, '2018-10-02 09:35:15', '0', '0');
INSERT INTO `kecamatan`
VALUES ('38', 'MEKAR MUKTI', '14', '0', null, null, null, '2018-10-02 09:40:43', '0', '0');
INSERT INTO `kecamatan`
VALUES ('39', 'DAAN MOGOT PESING', '5', '0', null, null, null, '2018-10-05 15:09:05', '0', '0');
INSERT INTO `kecamatan`
VALUES ('40', 'CIOMAS', '1', '0', null, null, null, '2018-10-09 11:16:12', '0', '0');
INSERT INTO `kecamatan`
VALUES ('41', 'RAWAMANGUN', '7', '0', null, null, null, '2018-10-10 13:35:10', '0', '0');
INSERT INTO `kecamatan`
VALUES ('42', 'MARISO', '0', '0', null, null, null, '2018-10-11 10:58:47', '0', '0');
INSERT INTO `kecamatan`
VALUES ('43', 'PANCORAN', '6', '0', null, null, null, '2018-10-15 10:45:28', '0', '0');
INSERT INTO `kecamatan`
VALUES ('44', 'PONDOK KACANG', '3', '0', null, null, null, '2018-10-23 09:08:16', '0', '0');
INSERT INTO `kecamatan`
VALUES ('45', 'CIPONDOH', '2', '0', null, null, null, '2018-10-25 13:26:57', '0', '0');
INSERT INTO `kecamatan`
VALUES ('46', 'KALIBATA CITY', '6', '0', null, null, null, '2018-10-29 14:24:45', '0', '0');
INSERT INTO `kecamatan`
VALUES ('47', 'JELUPANG', '3', '0', null, null, null, '2018-10-31 15:13:33', '0', '0');
INSERT INTO `kecamatan`
VALUES ('48', 'PULO GADUNG', '7', '0', null, null, null, '2018-11-01 10:02:46', '0', '0');
INSERT INTO `kecamatan`
VALUES ('49', 'KEMBANGAN', '2', '0', null, null, null, '2018-11-06 14:51:39', '0', '0');
INSERT INTO `kecamatan`
VALUES ('50', 'KEBON JERUK', '5', '0', null, null, null, '2018-11-09 14:00:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('51', 'TANGERANG KOTA', '2', '0', null, null, null, '2018-11-12 10:19:14', '0', '0');
INSERT INTO `kecamatan`
VALUES ('52', 'LEBAK BULUS', '6', '0', null, null, null, '2018-11-21 09:11:43', '0', '0');
INSERT INTO `kecamatan`
VALUES ('53', 'CILANDAK', '6', '0', null, null, null, '2018-11-21 11:23:37', '0', '0');
INSERT INTO `kecamatan`
VALUES ('54', 'GADING SERPONG', '2', '0', null, null, null, '2018-11-22 09:25:24', '0', '0');
INSERT INTO `kecamatan`
VALUES ('55', 'TANAH KUSIR', '6', '0', null, null, null, '2018-11-26 14:21:13', '0', '0');
INSERT INTO `kecamatan`
VALUES ('56', 'BSD', '3', '0', null, null, null, '2018-11-29 13:49:51', '0', '0');
INSERT INTO `kecamatan`
VALUES ('57', 'CILEDUG', '2', '0', null, null, null, '2018-12-05 13:57:40', '0', '0');
INSERT INTO `kecamatan`
VALUES ('58', 'ALAM SUTERA', '3', '0', null, null, null, '2018-12-11 08:59:02', '0', '0');
INSERT INTO `kecamatan`
VALUES ('59', 'TANJUNG BARAT', '6', '0', null, null, null, '2018-12-13 10:03:11', '0', '0');
INSERT INTO `kecamatan`
VALUES ('60', 'KELAPA DUA', '2', '0', null, null, null, '2018-12-13 14:48:00', '0', '0');
INSERT INTO `kecamatan`
VALUES ('61', 'KOLAKA', '0', '0', null, null, null, '2018-12-20 08:45:10', '0', '0');
INSERT INTO `kecamatan`
VALUES ('62', 'TAPOS', '15', '0', null, null, null, '2019-01-10 13:52:58', '0', '0');
INSERT INTO `kecamatan`
VALUES ('63', 'PAUH PADANG', '0', '0', null, null, null, '2019-01-14 09:33:23', '0', '0');
INSERT INTO `kecamatan`
VALUES ('64', 'GAMBIR', '4', '0', null, null, null, '2019-01-22 08:51:58', '0', '0');
INSERT INTO `kecamatan`
VALUES ('65', 'REMPOA', '3', '0', null, null, null, '2019-02-01 11:45:32', '0', '0');
INSERT INTO `kecamatan`
VALUES ('66', 'TANJUNG PRIOK', '8', '0', null, null, null, '2019-02-04 14:31:55', '0', '0');
INSERT INTO `kecamatan`
VALUES ('67', 'KLAPANUNGGAL', '1', '0', null, null, null, '2019-02-08 13:08:53', '0', '0');
INSERT INTO `kecamatan`
VALUES ('68', 'SUDIMARA SELATAN', '2', '0', null, null, null, '2019-02-08 15:26:40', '0', '0');
INSERT INTO `kecamatan`
VALUES ('69', 'SAWANGAN', '15', '0', null, null, null, '2019-02-18 10:42:36', '0', '0');
INSERT INTO `kecamatan`
VALUES ('70', 'GUNUNG PUTRI', '1', '0', null, null, null, '2019-03-19 15:26:53', '0', '0');
INSERT INTO `kecamatan`
VALUES ('71', 'PASAR REBO', '7', '0', null, null, null, '2019-03-22 11:47:10', '0', '0');
INSERT INTO `kecamatan`
VALUES ('72', 'BENDA', '2', '0', null, null, null, '2019-05-03 04:26:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('73', 'CILANDAK BARAT', '6', '0', null, null, null, '2019-05-07 05:59:23', '0', '0');
INSERT INTO `kecamatan`
VALUES ('74', 'PINANG', '2', '0', null, null, null, '2019-05-17 05:38:39', '0', '0');
INSERT INTO `kecamatan`
VALUES ('75', 'CITANGKIL', '12', '0', null, null, null, '2019-05-20 03:31:58', '0', '0');
INSERT INTO `kecamatan`
VALUES ('76', 'MENTENG ATAS', '6', '0', null, null, null, '2019-05-21 05:04:26', '0', '0');
INSERT INTO `kecamatan`
VALUES ('77', 'CIPUTAT TIMUR', '3', '0', null, null, null, '2019-05-22 23:28:56', '0', '0');
INSERT INTO `kecamatan`
VALUES ('78', 'LENGKONG GUDANG TIMUR', '3', '0', null, null, null, '2019-06-17 09:41:41', '0', '0');
INSERT INTO `kecamatan`
VALUES ('79', 'LEGOK', '2', '0', null, null, null, '2019-06-18 10:56:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('80', 'PAGEDANGAN', '3', '0', null, null, null, '2019-06-24 08:57:15', '0', '0');
INSERT INTO `kecamatan`
VALUES ('81', 'TEBET', '7', '0', null, null, null, '2019-06-24 09:10:27', '0', '0');
INSERT INTO `kecamatan`
VALUES ('82', 'SUNTER', '8', '0', null, null, null, '2019-07-09 10:22:20', '0', '0');
INSERT INTO `kecamatan`
VALUES ('83', 'PLUIT', '8', '0', null, null, null, '2019-07-09 13:19:49', '0', '0');
INSERT INTO `kecamatan`
VALUES ('84', 'PONDOK RANJI', '3', '0', null, null, null, '2019-07-10 14:11:49', '0', '0');
INSERT INTO `kecamatan`
VALUES ('85', 'PEKAYON', '14', '0', null, null, null, '2019-07-15 13:31:53', '0', '0');
INSERT INTO `kecamatan`
VALUES ('86', 'HALIM PERDANA KUSUMA', '7', '0', null, null, null, '2019-07-19 09:58:15', '0', '0');
INSERT INTO `kecamatan`
VALUES ('87', 'PERIUK', '2', '0', null, null, null, '2019-07-22 13:24:50', '0', '0');
INSERT INTO `kecamatan`
VALUES ('88', 'TANAH ABANG', '4', '0', null, null, null, '2019-07-29 15:13:33', '0', '0');
INSERT INTO `kecamatan`
VALUES ('89', 'TANAH SAREAL', '1', '0', null, null, null, '2019-08-02 11:30:49', '0', '0');
INSERT INTO `kecamatan`
VALUES ('90', 'TEBET TIMUR', '6', '0', null, null, null, '2019-08-06 09:56:14', '0', '0');
INSERT INTO `kecamatan`
VALUES ('91', 'CIATER', '3', '0', null, null, null, '2019-08-08 10:20:24', '0', '0');
INSERT INTO `kecamatan`
VALUES ('92', 'SELONG', '6', '0', null, null, null, '2019-08-27 09:22:02', '0', '0');
INSERT INTO `kecamatan`
VALUES ('93', 'BABAKAN', '1', '0', null, null, null, '2019-10-01 13:06:29', '0', '0');
INSERT INTO `kecamatan`
VALUES ('94', 'PONDOK INDAH', '6', '0', null, null, null, '2019-10-03 14:20:02', '0', '0');
INSERT INTO `kecamatan`
VALUES ('95', 'PONDOK MELATI', '14', '0', null, null, null, '2019-10-09 16:14:11', '0', '0');
INSERT INTO `kecamatan`
VALUES ('96', 'CIDADAP', '0', '0', null, null, null, '2019-10-23 09:18:55', '0', '0');
INSERT INTO `kecamatan`
VALUES ('97', 'KRAMAT JATI', '7', '0', null, null, null, '2019-11-01 09:26:53', '0', '0');
INSERT INTO `kecamatan`
VALUES ('98', 'RAWA KALONG', '3', '0', null, null, null, '2019-11-01 09:31:40', '0', '0');
INSERT INTO `kecamatan`
VALUES ('99', 'PONDOK LABU', '6', '0', null, null, null, '2019-11-01 09:56:30', '0', '0');
INSERT INTO `kecamatan`
VALUES ('100', 'JURANGMANGU', '3', '0', null, null, null, '2019-11-07 14:00:06', '0', '0');
INSERT INTO `kecamatan`
VALUES ('101', 'PASAR MINGGU', '5', '0', null, null, null, '2019-11-16 11:38:07', '0', '0');
INSERT INTO `kecamatan`
VALUES ('102', 'BEJI', '15', '0', null, null, null, '2019-11-18 12:38:47', '0', '0');
INSERT INTO `kecamatan`
VALUES ('103', 'CISAUK', '2', '0', null, null, null, '2019-11-30 11:01:50', '0', '0');
INSERT INTO `kecamatan`
VALUES ('104', 'DUREN SAWIT', '7', '0', null, null, null, '2019-12-05 14:17:51', '0', '0');
INSERT INTO `kecamatan`
VALUES ('105', 'CIMANGGIS', '15', '0', null, null, null, '2020-01-14 15:51:08', '0', '0');
INSERT INTO `kecamatan`
VALUES ('106', 'CIANGSANA', '1', '0', null, null, null, '2020-01-18 12:38:45', '0', '0');
INSERT INTO `kecamatan`
VALUES ('107', 'BOJONGSARI', '15', '0', null, null, null, '2020-01-28 10:54:06', '0', '0');
INSERT INTO `kecamatan`
VALUES ('108', 'MATRAMAN', '7', '0', null, null, null, '2020-06-17 11:23:05', '0', '0');
INSERT INTO `kecamatan`
VALUES ('109', 'KUNINGAN', '6', '0', null, null, null, '2020-07-08 10:01:26', '0', '0');
INSERT INTO `kecamatan`
VALUES ('110', 'TAMBORA', '5', '0', null, null, null, '2020-07-08 13:49:15', '0', '0');
INSERT INTO `kecamatan`
VALUES ('111', 'PAGE', '3', '0', null, null, null, '2020-07-09 11:40:36', '0', '0');
INSERT INTO `kecamatan`
VALUES ('112', 'PANCORANMAS', '15', '0', null, null, null, '2020-07-14 20:28:53', '0', '0');

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`
(
    `replid`         int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `kelas`          varchar(50)          NOT NULL,
    `idtahunajaran`  int(10) unsigned     NOT NULL,
    `kapasitas`      int(10) unsigned     NOT NULL,
    `nipwali`        varchar(30)          NOT NULL,
    `aktif`          tinyint(1) unsigned  NOT NULL DEFAULT '1',
    `keterangan`     varchar(255)                  DEFAULT NULL,
    `idtingkat`      int(10) unsigned     NOT NULL,
    `info1`          varchar(255)                  DEFAULT NULL,
    `info2`          varchar(255)                  DEFAULT NULL,
    `info3`          varchar(255)                  DEFAULT NULL,
    `ts`             timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`          smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`         tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `kelompok_siswa` int(11)                       DEFAULT NULL,
    `jurusan`        int(11)                       DEFAULT NULL,
    `created_date`   datetime                      DEFAULT NULL,
    `created_by`     varchar(200)                  DEFAULT NULL,
    `modified_date`  datetime                      DEFAULT NULL,
    `modified_by`    varchar(200)                  DEFAULT NULL,
    `idwali`         int(255)                      DEFAULT NULL,
    PRIMARY KEY (`replid`),
    KEY `FK_kelas_pegawai` (`nipwali`) USING BTREE,
    KEY `FK_kelas_tahunajaran` (`idtahunajaran`) USING BTREE,
    KEY `FK_kelas_tingkat` (`idtingkat`) USING BTREE,
    KEY `IX_kelas_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1791
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas`
VALUES ('1', 'IA-KOM', '34', '10', '112009072037', '1', '', '7', '', '', '', '2020-06-26 10:10:49', '35943', '0', '6',
        null, null, null, null, null, '102');
INSERT INTO `kelas`
VALUES ('2', 'IA-DL', '34', '40', '112009072037', '1', '', '7', '', '', '', '2020-06-26 10:10:49', '14897', '0', '5',
        null, null, null, null, null, '102');
INSERT INTO `kelas`
VALUES ('4', 'IIA-KOM', '34', '10', '112008082016', '1', '', '8', '', '', '', '2020-06-26 10:10:49', '50719', '0', '6',
        null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('5', 'IIA-DL', '34', '40', '112008082016', '1', '', '8', '', '', '', '2020-06-26 10:10:49', '25969', '0', '5',
        null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('7', 'IIIA-KOM', '34', '10', '112013101045', '1', '', '9', '', '', '', '2020-06-26 10:10:49', '7112', '0', '6',
        null, null, null, null, null, '29');
INSERT INTO `kelas`
VALUES ('8', 'IIIA-DL', '34', '40', '112013101045', '1', '', '9', '', '', '', '2020-06-26 10:10:49', '36972', '0', '5',
        null, null, null, null, null, '29');
INSERT INTO `kelas`
VALUES ('10', 'IVA-KOM', '34', '10', '112010081041', '1', '', '10', '', '', '', '2020-06-26 10:10:49', '51404', '0',
        '6', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('11', 'IVA-DL', '34', '40', '112010081041', '1', '', '10', '', '', '', '2020-06-26 10:10:49', '28566', '0', '5',
        null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('13', 'VA-KOM', '34', '10', '112012022001', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '53981', '0', '6',
        null, null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('14', 'VA-DL', '34', '40', '112012022001', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '41929', '0', '5',
        null, null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('16', 'VIA-KOM', '34', '10', '112010081041', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '47196', '0',
        '6', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('17', 'VIA-DL', '34', '40', '112010081041', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '27340', '0', '5',
        null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('19', 'VIIA-KOM', '27', '10', '112012042009', '1', '', '4', '', '', '', '2020-06-26 10:10:49', '24598', '0',
        '4', null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('20', 'VIIA-DL', '27', '40', '112012042009', '1', '', '4', '', '', '', '2020-06-26 10:10:49', '6596', '0', '3',
        null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('25', 'VIIIA-KOM', '27', '10', '112009072035', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '36984', '0',
        '4', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('26', 'VIIIA-DL', '27', '40', '112009072035', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '17437', '0',
        '3', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('28', 'VIIIB-KOM', '27', '10', '112013091041', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '25453', '0',
        '4', null, null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('29', 'VIIIB-DL', '27', '40', '112013091041', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '1970', '0', '3',
        null, null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('31', 'IXA-KOM', '27', '10', '112010101050', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '54728', '0', '4',
        null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('32', 'IXA-DL', '27', '40', '112010101050', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '14454', '0', '3',
        null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('34', 'IXB-KOM', '27', '10', '112013011005', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '21312', '0', '4',
        null, null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('35', 'IXB-DL', '27', '40', '112013011005', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '54649', '0', '3',
        null, null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('60', 'XA-KOM', '20', '10', '112008102044', '1', '', '1', '', '', '', '2020-06-26 10:10:49', '21523', '0', '2',
        null, null, null, null, null, '25');
INSERT INTO `kelas`
VALUES ('61', 'XA-DL', '20', '40', '112008102044', '1', '', '1', '', '', '', '2020-06-26 10:10:49', '18793', '0', '1',
        null, null, null, null, null, '25');
INSERT INTO `kelas`
VALUES ('69', 'XI.IPA.A-KOM ', '20', '10', '112008102028', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '32148',
        '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('70', 'XI.IPA.A-DL', '20', '40', '112008102028', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '36020', '0',
        '1', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('75', 'XI.IPS.A-KOM ', '20', '10', '112008100844', '1', '', '2', '', '', '', '2014-09-04 16:18:39', '30559',
        '0', '2', '2', null, null, null, null, null);
INSERT INTO `kelas`
VALUES ('76', 'XI.IPS.A-DL', '20', '40', '112008100844', '1', '', '2', '', '', '', '2014-09-04 16:18:41', '22300', '0',
        '1', '2', null, null, null, null, null);
INSERT INTO `kelas`
VALUES ('81', 'XII.IPS.A-KOM', '20', '10', '112012122039', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '47391',
        '0', '2', '2', null, null, null, null, '170');
INSERT INTO `kelas`
VALUES ('82', 'XII.IPS.A-DL', '20', '30', '112012122039', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '51931', '0',
        '1', '2', null, null, null, null, '170');
INSERT INTO `kelas`
VALUES ('87', 'XII.IPA.A-KOM ', '20', '10', '112010102056', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '26211',
        '0', '2', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('88', 'XII.IPA.A-DL', '20', '40', '112010102056', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '63031', '0',
        '1', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('99', 'XB-KOM', '20', '10', '112012022002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '25275', '0',
        '2', null, null, null, null, null, '85');
INSERT INTO `kelas`
VALUES ('100', 'XC-KOM', '20', '10', '112008102044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '26315',
        '0', '2', null, null, null, null, null, '25');
INSERT INTO `kelas`
VALUES ('101', 'XB-DL', '20', '30', '112012022002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '38626', '0',
        '1', null, null, null, null, null, '85');
INSERT INTO `kelas`
VALUES ('102', 'XI.IPA.B-KOM', '20', '10', '112008102028', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '39208', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('103', 'XI.IPS.B-DL', '20', '30', '112010042014', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '4497',
        '0', '1', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('104', 'XI.IPS.B-KOM', '20', '10', '112010042014', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '11241', '0', '2', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('105', 'XI.IPS.C-KOM', '20', '10', '112008100844', '1', '', '2', null, null, null, '2014-09-04 16:18:48',
        '6445', '0', '2', '2', null, null, null, null, null);
INSERT INTO `kelas`
VALUES ('106', 'XII.IPA.B-KOM', '20', '10', '112010102056', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '53227', '0', '2', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('107', 'XII.IPS.B-DL', '20', '40', '112010092042', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '7507', '0', '1', '2', null, null, null, null, '175');
INSERT INTO `kelas`
VALUES ('108', 'XII.IPS.B-KOM', '20', '10', '112010092042', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '58316', '0', '2', '2', null, null, null, null, '175');
INSERT INTO `kelas`
VALUES ('109', 'XII.IPS.C-KOM', '20', '10', '112010092042', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '43735', '0', '2', '2', null, null, null, null, '175');
INSERT INTO `kelas`
VALUES ('110', 'VIIB-DL', '27', '40', '112013031029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '19717',
        '0', '3', null, null, null, null, null, '88');
INSERT INTO `kelas`
VALUES ('111', 'VIIB-KOM', '27', '10', '112013031029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '29183',
        '0', '4', null, null, null, null, null, '88');
INSERT INTO `kelas`
VALUES ('112', 'VIB-KOM', '34', '10', '112010081041', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '58104',
        '0', '6', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('113', 'VIB-DL', '34', '40', '112010081041', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '42041',
        '0', '5', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('114', 'IVB-KOM', '34', '10', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '16948',
        '0', '6', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('115', 'IXC-KOM', '27', '10', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '29193',
        '0', '4', null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('116', 'IXC-DL', '27', '40', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '7988', '0',
        '3', null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('117', 'VIIIC-KOM', '27', '10', '112009072035', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '38654',
        '0', '4', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('118', 'VIIIC-DL', '27', '40', '112009072035', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '37916',
        '0', '3', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('119', 'VIIC-DL', '27', '40', '112012042009', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '6701',
        '0', '3', null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('120', 'VIIC-KOM', '27', '10', '112012042009', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '8262',
        '0', '4', null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('121', 'IA-DL', '41', '30', '112009072037', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '12909', '0',
        '5', null, null, null, null, null, '102');
INSERT INTO `kelas`
VALUES ('122', 'IA-KOM', '41', '10', '112009072037', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '42241',
        '0', '6', null, null, null, null, null, '102');
INSERT INTO `kelas`
VALUES ('125', 'IIA-DL', '41', '30', '112012022001', '1', '', '8', '', '', '', '2020-06-26 10:10:49', '37214', '0', '5',
        null, null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('126', 'IIA-KOM', '41', '10', '112012022001', '1', '', '8', '', '', '', '2020-06-26 10:10:49', '4463', '0', '6',
        null, null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('129', 'IIIA-DL', '41', '30', '112013101045', '1', '', '9', '', '', '', '2020-06-26 10:10:49', '64790', '0',
        '5', null, null, null, null, null, '29');
INSERT INTO `kelas`
VALUES ('130', 'IIIA-KOM', '41', '10', '112013101045', '1', '', '9', '', '', '', '2020-06-26 10:10:49', '260', '0', '6',
        null, null, null, null, null, '29');
INSERT INTO `kelas`
VALUES ('133', 'IVA-DL', '41', '30', '112010081041', '1', '', '10', '', '', '', '2020-06-26 10:10:49', '8073', '0', '5',
        null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('134', 'IVA-KOM', '41', '10', '112010081041', '1', '', '10', '', '', '', '2020-06-26 10:10:49', '55390', '0',
        '6', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('135', 'IVB-DL', '41', '30', '112010081041', '1', '', '10', '', '', '', '2020-06-26 10:10:49', '56139', '0',
        '5', null, null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('137', 'VA-DL', '41', '30', '112008082016', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '11035', '0', '5',
        null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('138', 'VA-KOM', '41', '10', '112008082016', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '39244', '0',
        '6', null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('139', 'VB-DL', '41', '30', '112008082016', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '32055', '0', '5',
        null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('140', 'VB-KOM', '41', '10', '112008082016', '1', '', '11', '', '', '', '2020-06-26 10:10:49', '42544', '0',
        '6', null, null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('141', 'VIA-DL', '41', '30', '112009021002', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '51023', '0',
        '5', null, null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('142', 'VIA-KOM', '41', '10', '112009021002', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '61954', '0',
        '6', null, null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('143', 'VIB-DL', '41', '30', '112009021002', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '25638', '0',
        '5', null, null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('144', 'VIB-KOM', '41', '10', '112009021002', '1', '', '12', '', '', '', '2020-06-26 10:10:49', '7859', '0',
        '6', null, null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('145', 'VIIA-DL', '42', '30', '112013011005', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '5606',
        '0', '3', null, null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('146', 'VIIA-KOM', '42', '10', '112013011005', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '27320',
        '0', '4', null, null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('148', 'VIIB-KOM', '42', '10', '112012061013', '1', '', '4', '', '', '', '2020-06-26 10:10:49', '50440', '0',
        '4', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('151', 'VIIIA-DL', '42', '30', '112010101050', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '898', '0', '3',
        null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('152', 'VIIIA-KOM', '42', '10', '112010101050', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '28355', '0',
        '4', null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('153', 'VIIIB-DL', '42', '35', '112013091041', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '8020', '0',
        '3', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('154', 'VIIIB-KOM', '42', '10', '112013091041', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '20563', '0',
        '4', null, null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('156', 'VIIIC-KOM', '42', '10', '112010101050', '1', '', '5', '', '', '', '2020-06-26 10:10:49', '4444', '0',
        '4', null, null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('157', 'IXA-DL', '42', '30', '112009072035', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '48069', '0', '3',
        null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('158', 'IXA-KOM', '42', '10', '112009072035', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '30421', '0',
        '4', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('159', 'IXB-DL', '42', '30', '112012042009', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '7899', '0', '3',
        null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('160', 'IXB-KOM', '42', '10', '112012042009', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '13760', '0',
        '4', null, null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('162', 'IXC-KOM', '42', '10', '112009072035', '1', '', '6', '', '', '', '2020-06-26 10:10:49', '53176', '0',
        '4', null, null, null, null, null, '57');
INSERT INTO `kelas`
VALUES ('163', 'XA-DL', '43', '30', '112014061016', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '1008', '0',
        '1', '0', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('164', 'XA-KOM', '43', '10', '112014061016', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '300', '0',
        '2', '0', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('166', 'XB-KOM', '43', '10', '112012022002', '1', '', '1', '', '', '', '2020-06-26 10:10:49', '34602', '0', '2',
        '0', null, null, null, null, '85');
INSERT INTO `kelas`
VALUES ('168', 'XC-KOM', '43', '10', '112012022002', '1', '', '1', '', '', '', '2020-06-26 10:10:49', '47789', '0', '2',
        null, null, null, null, null, '85');
INSERT INTO `kelas`
VALUES ('169', 'XI.IPA.A-DL', '43', '30', '112008102028', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '43139', '0',
        '1', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('170', 'XI.IPA.A-KOM', '43', '10', '112008102028', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '6800', '0',
        '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('172', 'XI.IPA.B-KOM', '43', '10', '112008102028', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '26737',
        '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('173', 'XI.IPS.A-DL', '43', '40', '112013012007', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '26765', '0',
        '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('174', 'XI.IPS.A-KOM', '43', '10', '112013012007', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '53616',
        '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('175', 'XI.IPS.B-DL', '43', '30', '112013102052', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '56723', '0',
        '1', '2', null, null, null, null, '124');
INSERT INTO `kelas`
VALUES ('176', 'XI.IPS.B-KOM', '43', '10', '112013012007', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '57236',
        '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('178', 'XI.IPS.C-KOM', '43', '10', '112013102052', '1', '', '2', '', '', '', '2020-06-26 10:10:49', '15175',
        '0', '2', '2', null, null, null, null, '124');
INSERT INTO `kelas`
VALUES ('179', 'XII.IPA.A-DL', '43', '30', '112010102056', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '55487',
        '0', '1', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('180', 'XII.IPA.A-KOM', '43', '10', '112010102056', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '35318',
        '0', '2', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('182', 'XII.IPA.B-KOM', '43', '10', '112010102056', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '10213',
        '0', '2', '1', null, null, null, null, '101');
INSERT INTO `kelas`
VALUES ('183', 'XII.IPS.A-DL', '43', '30', '112014081020', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '20683',
        '0', '1', '2', null, null, null, null, '40');
INSERT INTO `kelas`
VALUES ('184', 'XII.IPS.A-KOM', '43', '10', '112014081020', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '7247',
        '0', '2', '2', null, null, null, null, '40');
INSERT INTO `kelas`
VALUES ('185', 'XII.IPS.B-DL', '43', '40', '112010042014', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '39715',
        '0', '1', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('186', 'XII.IPS.B-KOM', '43', '10', '112010042014', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '45772',
        '0', '2', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('187', 'XII.IPS.C-DL', '43', '30', '112010042014', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '44186',
        '0', '1', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('188', 'XII.IPS.C-KOM', '43', '10', '112010042014', '1', '', '3', '', '', '', '2020-06-26 10:10:49', '18084',
        '0', '2', '2', null, null, null, null, '97');
INSERT INTO `kelas`
VALUES ('189', 'TRP', '41', '10', '112011092027', '1', '', '14', null, null, null, '2020-06-26 10:10:49', '52373', '0',
        '16', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('190', 'TRP', '27', '10', '112011092027', '1', 'Kelas Terapi', '15', null, null, null, '2020-06-26 10:10:49',
        '21180', '0', '3', null, null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('191', 'TRP', '20', '10', '112011092027', '1', '', '16', null, null, null, '2020-06-26 10:10:49', '56612', '0',
        '1', null, null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('192', 'TRP', '34', '10', '112011092027', '1', '', '14', null, null, null, '2020-06-26 10:10:49', '57346', '0',
        '5', null, null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('193', 'TRP', '42', '10', '112011092027', '1', '', '15', null, null, null, '2020-06-26 10:10:49', '3267', '0',
        '3', null, null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('194', 'TRP', '43', '10', '112011092027', '1', '', '16', null, null, null, '2020-06-26 10:10:49', '18865', '0',
        '1', null, null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('195', 'XI.IPA.A-DL', '21', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '61878', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('196', 'XB-DL', '43', '30', '112012022002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '18906', '0',
        '1', '0', null, null, null, null, '85');
INSERT INTO `kelas`
VALUES ('198', 'I-KHUSUS', '41', '5', '112014082022', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '19476',
        '0', '13', null, null, null, null, null, '143');
INSERT INTO `kelas`
VALUES ('199', 'II-KHUSUS', '41', '5', '112014082022', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '16395',
        '0', '13', null, null, null, null, null, '143');
INSERT INTO `kelas`
VALUES ('200', 'III-KHUSUS', '41', '5', '112014082022', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '40766',
        '0', '13', null, null, null, null, null, '143');
INSERT INTO `kelas`
VALUES ('201', 'IV-KHUSUS', '41', '5', '112014082022', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '3867',
        '0', '13', null, null, null, null, null, '143');
INSERT INTO `kelas`
VALUES ('202', 'VIIB-DL', '42', '30', '112012061013', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '51479',
        '0', '3', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('203', 'VIIIC-DL', '42', '30', '112013091041', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '52471',
        '0', '3', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('204', 'TRP', '44', '10', '112011092027', '1', '', '14', null, null, null, '2020-06-26 10:10:49', '45160', '0',
        '16', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('205', 'I-KHUSUS', '44', '5', '112014082019', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '33874',
        '0', '6', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('206', 'IA-DL', '44', '30', '112008082016', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '53175', '0',
        '5', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('207', 'IA-KOM', '44', '10', '112008082016', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '54314',
        '0', '6', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('208', 'II-KOM KHUSUS', '44', '5', '112014082019', '1', '', '8', null, null, null, '2020-06-26 10:10:49',
        '57416', '0', '13', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('209', 'IIA-DL', '44', '30', '112013102049', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '17115',
        '0', '5', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('210', 'IIA-KOM', '44', '10', '112013102049', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '39004',
        '0', '6', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('211', 'III-KOM KHUSUS', '44', '5', '112015032008', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '53382', '0', '13', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('212', 'IIIA-DL', '44', '30', '112014042011', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '9551',
        '0', '5', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('213', 'IIIA-KOM', '44', '10', '112014042011', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '61905',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('214', 'IV-DL KHUSUS', '44', '5', '112014082019', '1', '', '10', null, null, null, '2020-06-26 10:10:49',
        '57521', '0', '5', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('215', 'IVA-DL', '44', '30', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '16916',
        '0', '5', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('216', 'IVA-KOM', '44', '10', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '22075',
        '0', '6', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('217', 'V-KOM KHUSUS', '44', '5', '112014082019', '1', '', '11', null, null, null, '2020-06-26 10:10:49',
        '27435', '0', '13', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('218', 'VA-DL', '44', '30', '112012022001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '49040',
        '0', '5', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('219', 'VA-KOM', '44', '10', '112012022001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '14088',
        '0', '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('220', 'VI-KHUSUS', '44', '5', '112014082019', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '24847',
        '0', '6', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('221', 'VI-DL', '44', '30', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '27874',
        '0', '5', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('222', 'VI.A-KOM', '44', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '20600',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('223', 'TRP', '45', '10', '112011092027', '1', '', '15', null, null, null, '2020-06-26 10:10:49', '51729', '0',
        '17', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('224', 'VIIA-DL', '45', '30', '112010101050', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '36613',
        '0', '3', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('225', 'VIIA-KOM', '45', '13', '112010101050', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '30835',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('226', 'VIIIA-DL', '45', '30', '112012042009', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '49895',
        '0', '3', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('228', 'VIIIB-DL', '45', '30', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '19451',
        '0', '3', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('230', 'IXA-DL', '45', '30', '112013091041', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '54900',
        '0', '3', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('232', 'IXB-DL', '45', '30', '112012061013', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '847', '0',
        '3', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('234', 'TRP', '46', '10', '112011092027', '1', '', '16', null, null, null, '2020-06-26 10:10:49', '38807', '0',
        '18', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('237', 'XA-DL', '46', '40', '112015072016', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '9976', '0',
        '1', '0', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('238', 'XA-KOM', '46', '10', '112015072016', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '33181',
        '0', '2', '0', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('239', 'XI.IPA.A-DL', '46', '30', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '61177', '0', '1', '0', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('240', 'XI.IPA.A-KOM', '46', '11', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '41552', '0', '2', '0', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('241', 'XI.IPS.A-DL', '46', '30', '112014081020', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '6710',
        '0', '1', '2', null, null, null, null, '40');
INSERT INTO `kelas`
VALUES ('242', 'XI.IPS.A-KOM', '46', '10', '112014081020', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '49669', '0', '2', '2', null, null, null, null, '40');
INSERT INTO `kelas`
VALUES ('243', 'XII.IPA.A-DL', '46', '30', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '48709', '0', '1', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('244', 'XII.IPA.A-KOM', '46', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '32563', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('245', 'XII.IPS.A-DL', '46', '30', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '54924', '0', '1', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('246', 'XII.IPS.A-KOM', '46', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '34640', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('247', 'XII.IPS.B-DL', '46', '30', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '46262', '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('248', 'XII.IPS.B-KOM', '46', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '61323', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('249', 'XII.IPS.C-KOM', '46', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '39569', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('250', 'XII.IPA.B-KOM', '46', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '28724', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('251', 'XI.IPS.B-KOM', '46', '10', '112013012006', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '23216', '0', '2', '2', null, null, null, null, '56');
INSERT INTO `kelas`
VALUES ('252', 'XI.IPS.C-KOM', '46', '10', '112014081020', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '58575', '0', '2', '2', null, null, null, null, '40');
INSERT INTO `kelas`
VALUES ('253', 'XI.IPS.B-DL', '46', '30', '112013012006', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '64263', '0', '1', '2', null, null, null, null, '56');
INSERT INTO `kelas`
VALUES ('254', 'VI.B-KOM', '44', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '62018',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('255', 'XI.IPA.B-KOM', '46', '10', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '47563', '0', '2', '1', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('256', 'II-DL KHUSUS', '44', '5', '112015032008', '1', '', '8', null, null, null, '2020-06-26 10:10:49',
        '56273', '0', '20', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('257', 'V-DL KHUSUS', '44', '5', '112014082019', '1', '', '11', null, null, null, '2020-06-26 10:10:49',
        '30198', '0', '20', '0', null, null, null, null, '149');
INSERT INTO `kelas`
VALUES ('258', 'IV-KOM KHUSUS', '44', '5', '112015032008  ', '1', '', '10', null, null, null, '2020-06-26 10:10:49',
        '44621', '0', '13', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('259', 'III-DL KHUSUS', '44', '5', '112015032008  ', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '30950', '0', '13', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('261', 'XB-KOM', '46', '10', '112015072016', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '15869',
        '0', '2', '0', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('262', 'XC-KOM', '46', '10', '112014072018', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '42464',
        '0', '2', '0', null, null, null, null, '183');
INSERT INTO `kelas`
VALUES ('263', 'XB-DL', '46', '30', '112014072018', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '9614', '0',
        '1', '0', null, null, null, null, '183');
INSERT INTO `kelas`
VALUES ('264', 'VIIB-DL', '45', '30', '112010101050', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '45649',
        '0', '3', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('265', 'VIIB-KOM', '45', '10', '112010101050', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '64431',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('266', 'XD-KOM', '46', '10', '112014072018', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '15219',
        '0', '2', '0', null, null, null, null, '183');
INSERT INTO `kelas`
VALUES ('267', 'XE-KOM', '46', '10', '112014072018', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '14031',
        '0', '2', '0', null, null, null, null, '183');
INSERT INTO `kelas`
VALUES ('268', 'XI.IPS.D-KOM', '46', '10', '112013012006', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '33297', '0', '2', '2', null, null, null, null, '56');
INSERT INTO `kelas`
VALUES ('269', 'XII.IPS.D-KOM', '46', '10', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '25936', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('270', 'XII.IPS.E-KOM', '46', '10', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '22984', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('271', 'XII.IPA.C-KOM', '46', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '21727', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('272', 'VIIC-KOM', '45', '10', '112010101050', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '19022',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('275', 'VIIIA.1-KOM', '45', '5', '112012042009', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '37771',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('276', 'VIIIA.2-KOM', '45', '5', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '26882',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('277', 'VIIIB.1-KOM', '45', '5', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '9554',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('278', 'VIIIB.2-KOM', '45', '5', '112012042009', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '60426',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('279', 'VIIIC.1-KOM', '45', '5', '112012042009', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '7244',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('280', 'VIIIC.2-KOM', '45', '5', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '45305',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('281', 'IXA.1-KOM', '45', '5', '112013091041', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '21225',
        '0', '4', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('282', 'IXA.2-KOM', '45', '5', '112012061013', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '35300',
        '0', '4', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('283', 'IXB.1-KOM', '45', '5', '112013091041', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '58195',
        '0', '4', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('284', 'IXB.2-KOM', '45', '5', '112012061013', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '56320',
        '0', '4', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('285', 'IXC.1-KOM', '45', '5', '112013091041', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '23003',
        '0', '4', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('286', 'IXC.2-KOM', '45', '5', '112012061013', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '23954',
        '0', '4', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('287', 'IXD.1-KOM', '45', '10', '112013091041', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '18535',
        '0', '4', '0', null, null, null, null, '48');
INSERT INTO `kelas`
VALUES ('288', 'IXD.2-KOM', '45', '5', '112012061013', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '789',
        '0', '4', '0', null, null, null, null, '42');
INSERT INTO `kelas`
VALUES ('289', 'XA-KOM', '47', '10', '112015112044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '22777',
        '0', '2', '0', null, null, null, null, '229');
INSERT INTO `kelas`
VALUES ('290', 'XB-KOM', '47', '10', '112015112044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '36574',
        '0', '2', '0', null, null, null, null, '229');
INSERT INTO `kelas`
VALUES ('291', 'XC-KOM', '47', '10', '112015072019', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '35231',
        '0', '2', '0', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('292', 'XI.IPA.A-KOM', '47', '10', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '1781', '0', '2', '1', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('293', 'XI.IPA.B-KOM', '47', '10', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '1305', '0', '2', '1', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('294', 'XI.IPS.A-KOM', '47', '10', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '34281', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('295', 'XI.IPS.B-KOM', '47', '10', '112015072016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '59331', '0', '2', '2', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('296', 'XI.IPS.C-KOM', '47', '10', '112015072016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '60032', '0', '2', '2', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('297', 'XII.IPA.A-KOM', '47', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '12967', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('298', 'XII.IPA.B-KOM', '47', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '22665', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('299', 'XII.IPS.A-KOM', '47', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '5005', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('300', 'XII.IPS.B-KOM', '47', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '35907', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('301', 'XII.IPS.C-KOM', '47', '10', '112015102034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '46729', '0', '2', '2', null, null, null, null, '235');
INSERT INTO `kelas`
VALUES ('302', 'XII.IPS.D-KOM', '47', '10', '112015102034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '9739', '0', '2', '2', null, null, null, null, '235');
INSERT INTO `kelas`
VALUES ('303', 'XII.IPA.A-DL', '47', '40', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '40409', '0', '1', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('304', 'VII A-KOM', '49', '10', '112014071017', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '65291',
        '0', '4', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('305', 'XII.IPS.A-DL', '47', '40', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '53282', '0', '1', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('306', 'VII B-KOM', '49', '10', '112014071017', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '9104',
        '0', '4', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('307', 'XII.IPS.B-DL', '47', '40', '112015102034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '46231', '0', '1', '2', null, null, null, null, '235');
INSERT INTO `kelas`
VALUES ('308', 'VII C-KOM', '49', '10', '112014071017', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '56378',
        '0', '4', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('309', 'XI.IPA.A-DL', '47', '40', '112014061016', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '37772', '0', '1', '1', null, null, null, null, '34');
INSERT INTO `kelas`
VALUES ('310', 'VII A-DL', '49', '40', '112014071017', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '9754',
        '0', '3', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('311', 'XI.IPS.A-DL', '47', '40', '112015072016', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '4749',
        '0', '1', '2', null, null, null, null, '210');
INSERT INTO `kelas`
VALUES ('312', 'VIII A-KOM', '49', '10', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '15443',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('313', 'VIII B-KOM', '49', '10', '112015042012', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '23179',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('314', 'XI.IPS.B-DL', '47', '40', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '38828', '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('315', 'VIII C-KOM', '49', '10', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '39937',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('316', 'VIII A-DL', '49', '40', '112013011005', '1', '', '5', null, null, null, '2021-12-10 15:20:08', '22241',
        '0', '3', '0', null, null, '2021-12-10 14:35:10', '452', '46');
INSERT INTO `kelas`
VALUES ('317', 'IX A-KOM', '49', '10', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '53421',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('318', 'IX B-KOM', '49', '10', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '52741',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('319', 'X.A-DL', '47', '40', '112015112044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '5400', '0',
        '1', '0', null, null, null, null, '229');
INSERT INTO `kelas`
VALUES ('320', 'X.B-DL', '47', '40', '112015072019', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '44700',
        '0', '1', '0', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('321', 'IX A-DL', '49', '40', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '52325',
        '0', '3', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('322', 'IX B-DL', '49', '40', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '40006',
        '0', '3', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('323', 'IA-KOM', '48', '10', '112008082016', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '48500',
        '0', '6', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('324', 'IA-DL', '48', '30', '112008082016', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '4699', '0',
        '5', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('325', 'IIA-KOM', '48', '10', '112013102049', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '19791',
        '0', '6', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('326', 'IIA-DL', '48', '30', '112013102049', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '23982',
        '0', '5', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('327', 'IIIA-KOM', '48', '10', '112014042011', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '5047',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('328', 'IIIA-DL', '48', '30', '112014042011', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '62323',
        '0', '5', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('329', 'IIIA-DL KHUSUS', '48', '5', '112016062012', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '51800', '0', '20', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('330', 'IIIA-KOM KHUSUS', '48', '5', '112016062012', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '55117', '0', '13', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('331', 'IVA-KOM', '48', '10', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '7954',
        '0', '6', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('332', 'IVB-KOM', '48', '10', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '14909',
        '0', '6', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('333', 'IVA-DL', '48', '30', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '50400',
        '0', '5', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('334', 'IVA-DL KHUSUS', '48', '5', '112016062012', '1', '', '10', null, null, null, '2020-06-26 10:10:49',
        '24881', '0', '13', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('335', 'IVA-KOM KHUSUS', '48', '5', '112016062012', '1', '', '10', null, null, null, '2020-06-26 10:10:49',
        '8049', '0', '13', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('336', 'VA-KOM', '48', '10', '112012022001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '46674',
        '0', '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('337', 'VB-KOM', '48', '10', '112012022001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '30513',
        '0', '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('338', 'VA-DL', '48', '30', '112012022001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '22573',
        '0', '5', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('339', 'VA-KOM KHUSUS', '48', '5', '112016072019  ', '1', '', '11', null, null, null, '2020-06-26 10:10:49',
        '62976', '0', '13', '0', null, null, null, null, '243');
INSERT INTO `kelas`
VALUES ('340', 'VA-DL KHUSUS', '48', '5', '112016072019  ', '1', '', '11', null, null, null, '2020-06-26 10:10:49',
        '53914', '0', '13', '0', null, null, null, null, '243');
INSERT INTO `kelas`
VALUES ('341', 'VIA-KOM', '48', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '38390',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('342', 'VIB-KOM', '48', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '48208',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('343', 'VIA-DL KHUSUS', '48', '5', '112015032008', '1', '', '12', null, null, null, '2020-06-26 10:10:49',
        '13696', '0', '20', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('344', 'VIA-KOM KHUSUS', '48', '5', '112015032008  ', '1', '', '12', null, null, null, '2020-06-26 10:10:49',
        '25711', '0', '13', '0', null, null, null, null, '198');
INSERT INTO `kelas`
VALUES ('345', 'VIA-DL', '48', '30', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '6694',
        '0', '5', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('348', 'TRP', '48', '10', '112011092027', '1', '', '14', null, null, null, '2020-06-26 10:10:49', '6181', '0',
        '16', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('349', 'TRP', '49', '10', '112011092027', '1', '', '15', null, null, null, '2020-06-26 10:10:49', '51075', '0',
        '17', '0', null, null, null, null, '59');
INSERT INTO `kelas`
VALUES ('350', 'IX C KOM', '49', '10', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '53896',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('351', 'I KOM', '40', '10', '112007011001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '7304', '0',
        '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('352', 'II KOM', '40', '10', '112007011001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '60118',
        '0', '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('353', 'III KOM', '40', '10', '112007011001', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '33929',
        '0', '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('354', 'IV KOM', '40', '10', '112007011001', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '48775',
        '0', '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('355', 'V KOM', '40', '10', '112007011001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '6220', '0',
        '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('356', 'VI KOM', '40', '10', '112007011001', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '21085',
        '0', '6', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('357', 'X.A-DL', '25', '30', '112008011002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '12087',
        '0', '1', '0', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('358', 'VII A-DL', '32', '30', '112007082010', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '9394',
        '0', '3', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('359', 'XA-KOM', '25', '10', '112008011002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '63905',
        '0', '2', '0', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('360', 'VII A-KOM', '32', '10', '112007082010', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '38744',
        '0', '4', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('361', 'XI.IPA.A-DL', '25', '30', '112008011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '8078',
        '0', '1', '1', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('362', 'XI.IPA.A-KOM', '25', '10', '112008011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '25368', '0', '2', '1', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('363', 'XI.IPS.A-DL', '25', '30', '112008011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '23209', '0', '1', '2', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('364', 'XI.IPS.A-KOM', '25', '10', '112008011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '43813', '0', '2', '2', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('365', 'VIII A-DL', '32', '30', '112007082010', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '58033',
        '0', '3', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('366', 'XII.IPA.A-DL', '25', '30', '112008011002', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '62277', '0', '1', '1', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('367', 'XII.IPA.A-KOM', '25', '10', '112008011002', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '33912', '0', '2', '1', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('368', 'VIII A-KOM', '32', '10', '112007082010', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '2643',
        '0', '4', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('369', 'XII.IPS.A-DL', '25', '30', '112008011002', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '55086', '0', '1', '0', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('370', 'IX A-DL', '32', '30', '112007082010', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '21897',
        '0', '3', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('371', 'XII.IPS.A-KOM', '25', '10', '112008011002', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '57051', '0', '2', '2', null, null, null, null, '255');
INSERT INTO `kelas`
VALUES ('372', 'IX A-KOM', '32', '10', '112007082010', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '62383',
        '0', '4', '0', null, null, null, null, '111');
INSERT INTO `kelas`
VALUES ('373', 'X.A-DL', '24', '30', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '3722', '0',
        '1', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('374', 'XA-KOM', '24', '20', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '20372',
        '0', '2', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('375', 'VII A-DL', '31', '30', '112008091023', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '34215',
        '0', '3', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('376', 'XI.IPA.A-DL', '24', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '31211', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('377', 'VII A-KOM', '31', '10', '112008091023', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '22345',
        '0', '4', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('378', 'XI.IPA.A-KOM', '24', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '29910', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('379', 'VIII A-DL', '31', '30', '112008091023', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '26430',
        '0', '3', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('380', 'XI.IPS.A-DL', '24', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '64205', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('381', 'VIII A-KOM', '31', '20', '112008091023', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '10102',
        '0', '4', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('382', 'XI.IPS.A-KOM', '24', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '10193', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('383', 'IX A-DL', '31', '40', '112008091023', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '41546',
        '0', '3', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('384', 'IX A-KOM', '31', '18', '112008091023', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '41321',
        '0', '4', '0', null, null, null, null, '80');
INSERT INTO `kelas`
VALUES ('385', 'XII.IPA.A-DL', '24', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '50021', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('386', 'XII.IPA.A-KOM', '24', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '27859', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('387', 'XII.IPS.A-DL', '24', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '17039', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('388', 'XI.IPS.A-KOM', '24', '17', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '38346', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('389', 'X.A-DL', '23', '30', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '22365',
        '0', '1', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('390', 'XA-KOM', '23', '201', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '39822',
        '0', '2', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('391', 'VII A-DL', '30', '30', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '6350',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('392', 'XI.IPA.A-DL', '23', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '56591', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('393', 'VII A-KOM', '30', '10', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '6137',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('394', 'VIII A-DL', '30', '100', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '19858',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('395', 'VIII A-KOM', '30', '50', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '48565',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('396', 'XI.IPA.A-KOM', '23', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '57722', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('397', 'IX A-DL', '30', '100', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '52940',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('398', 'XI.IPS.A-DL', '23', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '1477',
        '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('399', 'IX A-KOM', '30', '50', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '350',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('400', 'XI.IPS.A-KOM', '23', '20', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '51314', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('401', 'VII A-DL', '29', '30', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '2406',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('402', 'VII A-KOM', '29', '10', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '29488',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('403', 'VIII A-DL', '29', '100', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '43378',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('404', 'VIII A-KOM', '29', '100', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49',
        '14770', '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('405', 'IX A-DL', '29', '100', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '29670',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('406', 'IX A-KOM', '29', '100', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '45699',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('407', 'VII A-DL', '28', '30', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '33231',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('408', 'XII.IPS.A-DL', '23', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '7920', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('409', 'VII A-KOM', '28', '10', '112008102029', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '37729',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('410', 'XII.IPA.A-DL', '23', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '29082', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('411', 'VIII A-DL', '28', '30', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '1270',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('412', 'XII.IPA.A-KOM', '23', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '3499', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('413', 'VIII A-KOM', '28', '10', '112008102029', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '46939',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('414', 'XII.IPS.A-KOM', '23', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '48119', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('415', 'IX A-DL', '28', '100', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '50844',
        '0', '3', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('416', 'I KOM', '39', '10', '112008012001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '52649', '0',
        '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('417', 'IX A-KOM', '28', '100', '112008102029', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '33352',
        '0', '4', '0', null, null, null, null, '83');
INSERT INTO `kelas`
VALUES ('418', 'X.A-DL', '22', '30', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '2219', '0',
        '1', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('419', 'XA-KOM', '22', '10', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '40459',
        '0', '2', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('420', 'XI.IPS.A-KOM', '22', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '15575', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('421', 'VII A-DL', '33', '30', '112007012002', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '9716',
        '0', '3', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('422', 'XI.IPS.A-DL', '22', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '46214', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('423', 'VII A-KOM', '33', '10', '112007012002', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '10816',
        '0', '4', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('424', 'II KOM', '39', '10', '112008012001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '49778',
        '0', '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('425', 'XI.IPA.A-DL', '22', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '489',
        '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('426', 'VIII A-DL', '33', '30', '112007012002', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '7518',
        '0', '3', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('427', 'VIII A-KOM', '33', '10', '112007012002', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '59846',
        '0', '4', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('428', 'III KOM', '39', '10', '112008012001', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '38923',
        '0', '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('429', 'XI.IPA.A-KOM', '22', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '13921', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('430', 'IX A-DL', '33', '30', '112007012002', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '61000',
        '0', '3', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('431', 'IV KOM', '39', '10', '112008012001', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '38411',
        '0', '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('432', 'IX A-KOM', '33', '10', '112007012002', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '11013',
        '0', '4', '0', null, null, null, null, '251');
INSERT INTO `kelas`
VALUES ('433', 'XII.IPA.A-DL', '22', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '29973', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('434', 'V KOM', '39', '10', '112008012001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '813', '0',
        '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('435', 'XII.IPS.A-DL', '22', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '26454', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('436', 'VI KOM', '39', '10', '112008012001', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '3911',
        '0', '6', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('437', 'XI.IPA.A-KOM', '22', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '32146', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('438', 'XII.IPS.A-KOM', '22', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '29705', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('439', 'I DL', '39', '30', '112008012001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '27670', '0',
        '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('440', 'X.A-DL', '21', '30', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '12854',
        '0', '1', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('441', 'II DL', '39', '30', '112008012001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '43702', '0',
        '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('442', 'III DL', '39', '30', '112008012001', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '58162',
        '0', '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('443', 'IV DL', '39', '30', '112008012001', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '20155',
        '0', '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('444', 'XA-KOM', '21', '10', '112009011001', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '34380',
        '0', '2', '0', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('445', 'V DL', '39', '30', '112008012001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '49493', '0',
        '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('446', 'VI DL', '39', '30', '112008012001', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '9941', '0',
        '5', '0', null, null, null, null, '256');
INSERT INTO `kelas`
VALUES ('447', 'I KOM', '38', '10', '112008032003', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '48479', '0',
        '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('448', 'I DL', '38', '30', '112008032003', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '2662', '0',
        '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('449', 'II KOM', '38', '10', '112008032003', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '15620',
        '0', '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('450', 'XI.IPA.A-KOM', '21', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '58791', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('451', 'II DL', '38', '30', '112008032003', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '17194', '0',
        '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('452', 'III KOM', '38', '10', '112008032003', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '7961',
        '0', '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('453', 'XI.IPS.A-DL', '21', '30', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '939',
        '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('454', 'III DL', '38', '30', '112008032003', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '17106',
        '0', '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('455', 'XI.IPS.A-KOM', '21', '10', '112009011001', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '54478', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('456', 'IV KOM', '38', '10', '112008032003', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '54947',
        '0', '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('457', 'IV DL', '38', '30', '112008032003', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '8532', '0',
        '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('458', 'V KOM', '38', '10', '112008032003', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '60458',
        '0', '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('459', 'XII.IPA.A-DL', '21', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '31166', '0', '1', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('460', 'V DL', '38', '30', '112008032003', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '31794', '0',
        '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('461', 'XII.IPA.A-KOM', '21', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '59384', '0', '2', '1', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('462', 'VI KOM', '38', '10', '112008032003', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '61158',
        '0', '6', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('463', 'XII.IPS.A-DL', '21', '30', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '34657', '0', '1', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('464', 'VI DL', '38', '30', '112008032003', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '48389',
        '0', '5', '0', null, null, null, null, '110');
INSERT INTO `kelas`
VALUES ('465', 'XII.IPS.A-KOM', '21', '10', '112009011001', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '52726', '0', '2', '2', null, null, null, null, '253');
INSERT INTO `kelas`
VALUES ('466', 'I KOM', '37', '15', '112008102025', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '5168', '0',
        '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('467', 'I DL', '37', '47', '112008102025', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '38069', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('468', 'II KOM', '37', '10', '112008102025', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '30260',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('469', 'II DL', '37', '30', '112008102025', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '22526', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('470', 'III KOM', '37', '10', '112008102025', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '12854',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('471', 'III DL', '37', '30', '112008102025', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '7232', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('472', 'IV KOM', '37', '10', '112008102025', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '65443',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('473', 'IV DL', '37', '30', '112008102025', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '54275',
        '0', '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('474', 'V KOM', '37', '10', '112008102025', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '27290',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('475', 'V DL', '37', '30', '112008102025', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '702', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('476', 'VI KOM', '37', '10', '112008102025', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '48800',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('477', 'VI DL', '37', '30', '112008102025', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '32286',
        '0', '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('478', 'I KOM', '36', '10', '112008102025', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '36527', '0',
        '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('479', 'I DL', '36', '30', '112008102025', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '778', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('480', 'II KOM', '36', '10', '112008102025', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '30926',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('481', 'II DL', '36', '30', '112008102025', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '18663', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('482', 'III KOM', '36', '10', '112008102025', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '36040',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('483', 'III DL', '36', '30', '112008102025', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '37139',
        '0', '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('484', 'IV KOM', '36', '10', '112008102025', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '36030',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('485', 'IV DL', '36', '35', '112008102025', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '1211', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('486', 'V KOM', '36', '10', '112008102025', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '23994',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('487', 'V DL', '36', '50', '112008102025', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '17912', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('488', 'VI KOM', '36', '15', '112008102025', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '52887',
        '0', '6', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('489', 'VI DL', '36', '35', '112008102025', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '3508', '0',
        '5', '0', null, null, null, null, '173');
INSERT INTO `kelas`
VALUES ('490', 'I KOM', '35', '100', '112008052014', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '8433', '0',
        '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('491', 'I DL', '35', '100', '112008052014', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '13974', '0',
        '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('492', 'II KOM', '35', '100', '112008052014', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '59428',
        '0', '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('493', 'II DL', '35', '100', '112008052014', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '63451',
        '0', '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('494', 'III KOM', '35', '100', '112008052014', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '30350',
        '0', '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('495', 'III DL', '35', '100', '112008052014', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '56337',
        '0', '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('496', 'IV KOM', '35', '100', '112008052014', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '10043',
        '0', '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('497', 'IV DL', '35', '100', '112008052014', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '6070',
        '0', '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('498', 'V KOM', '35', '100', '112008052014', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '57536',
        '0', '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('499', 'V DL', '35', '110', '112008052014', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '6780', '0',
        '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('500', 'VI KOM', '35', '100', '112008052014', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '64180',
        '0', '6', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('501', 'VI DL', '35', '100', '112008052014', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '31400',
        '0', '5', '0', null, null, null, null, '94');
INSERT INTO `kelas`
VALUES ('502', 'VI DL', '40', '30', '112007011001', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '3620', '0',
        '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('503', 'V DL', '40', '30', '112007011001', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '23017', '0',
        '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('504', 'IV DL', '40', '30', '112007011001', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '45756',
        '0', '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('505', 'III DL', '40', '30', '112007011001', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '40089',
        '0', '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('506', 'II DL', '40', '30', '112007011001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '5455', '0',
        '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('507', 'I DL', '40', '30', '112007011001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '26386', '0',
        '5', '0', null, null, null, null, '250');
INSERT INTO `kelas`
VALUES ('508', 'VIII B-DL', '49', '40', '112015042012', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '50221',
        '0', '3', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('509', 'VII A-KOM', '51', '10', '112015042012', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '3327',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('510', 'VII B KOM', '51', '10', '112015042012', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '4360',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('511', 'VII A-DL', '51', '40', '112015042012', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '39737',
        '0', '3', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('512', 'VII B-DL', '51', '40', '112015042012', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '23697',
        '0', '3', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('513', 'XI.IPS.A-DL', '50', '40', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '64720', '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('514', 'XI.IPS.B-DL', '50', '40', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '15713', '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('515', 'VIII A-KOM', '51', '10', '112014071017', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '50756',
        '0', '4', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('516', 'VIII A-DL', '51', '40', '112014071017', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '22130',
        '0', '3', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('517', 'VIII B-KOM', '51', '10', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '20825',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('518', 'XI.IPS.A-KOM', '50', '10', '112013032023', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '26011', '0', '2', '2', null, null, null, null, '129');
INSERT INTO `kelas`
VALUES ('519', 'VIII B-DL', '51', '40', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '43723',
        '0', '3', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('520', 'XI.IPS.B-KOM', '50', '10', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '50660', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('521', 'IX A-KOM', '51', '10', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '44746',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('522', 'XI.IPS.C-KOM', '50', '10', '112013012007', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '20944', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('523', 'IX A-DL', '51', '40', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '4369',
        '0', '3', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('524', 'IX B-KOM', '51', '10', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '40308',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('525', 'XI.IPA.A-DL', '50', '40', '112015072020', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '55696', '0', '1', '1', null, null, null, null, '211');
INSERT INTO `kelas`
VALUES ('526', 'IX B-DL', '51', '40', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '34278',
        '0', '3', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('527', 'I KOM', '52', '10', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '52647', '0',
        '6', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('528', 'XI.IPA.A-KOM', '50', '10', '112015072020', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '39561', '0', '2', '1', null, null, null, null, '211');
INSERT INTO `kelas`
VALUES ('529', 'I DL', '52', '40', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '18742', '0',
        '5', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('530', 'XI.IPA.B-KOM', '50', '10', '112015072020', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '3813', '0', '2', '1', null, null, null, null, '211');
INSERT INTO `kelas`
VALUES ('531', 'XII.IPA.A-DL', '50', '40', '112008102028', '1', '', '3', null, null, null, '2020-10-26 08:19:44',
        '11260', '0', '1', '1', null, null, '2020-10-21 22:39:37', '453', '32');
INSERT INTO `kelas`
VALUES ('532', 'XII.IPA.A-KOM', '50', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '30253', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('533', 'XII.IPA.B-KOM', '50', '10', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '49945', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('534', 'XII.IPS.A-DL', '50', '40', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '20626', '0', '1', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('535', 'XII.IPS.A-KOM', '50', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '55943', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('536', 'XII.IPS.B-KOM', '50', '10', '112010071034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '58904', '0', '2', '2', null, null, null, null, '30');
INSERT INTO `kelas`
VALUES ('537', 'XII.IPS.B-DL', '50', '40', '112015102034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '63037', '0', '1', '2', null, null, null, null, '235');
INSERT INTO `kelas`
VALUES ('538', 'XII.IPS.C-KOM', '50', '10', '112015102034', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '41436', '0', '2', '2', null, null, null, null, '235');
INSERT INTO `kelas`
VALUES ('539', 'II KOM', '52', '10', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '61901',
        '0', '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('540', 'II DL', '52', '40', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '10803', '0',
        '5', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('541', 'III KOM', '52', '10', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '40777',
        '0', '6', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('542', 'III DL', '52', '40', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '30062',
        '0', '5', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('543', 'IV KOM', '52', '10', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '15773',
        '0', '6', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('544', 'IV DL', '52', '40', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '15248',
        '0', '5', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('545', 'VA-KOM', '52', '10', '112014042011', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '27816',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('546', 'VB-KOM', '52', '10', '112014042011', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '61627',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('547', 'V DL', '52', '40', '112014042011', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '18513', '0',
        '5', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('548', 'VIA-KOM', '52', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '16786',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('549', 'VIB-KOM', '52', '10', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '12798',
        '0', '6', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('550', 'VI DL', '52', '40', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '49172',
        '0', '5', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('551', 'IX C-KOM', '51', '10', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '11148',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('552', 'X.IPA.A-DL', '50', '40', '112015112044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '50660',
        '0', '1', '1', null, null, null, null, '229');
INSERT INTO `kelas`
VALUES ('553', 'X.IPS.A-DL', '50', '40', '112015072019', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '36572',
        '0', '1', '2', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('554', 'X.IPA.A-KOM', '50', '10', '112015112044', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '1873',
        '0', '2', '1', null, null, null, null, '229');
INSERT INTO `kelas`
VALUES ('555', 'X.IPS.A-KOM', '50', '10', '112015072019', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '28406', '0', '2', '2', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('556', 'VA-RA', '52', '2', '112014042011', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '38405', '0',
        '21', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('557', 'VI RA', '52', '2', '112009021002', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '185', '0',
        '21', '0', null, null, null, null, '117');
INSERT INTO `kelas`
VALUES ('558', 'X.IPS.B-KOM', '50', '10', '112015072019', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '49484', '0', '2', '2', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('559', 'VIII C-KOM', '51', '10', '112014071017', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '3799',
        '0', '4', '0', null, null, null, null, '113');
INSERT INTO `kelas`
VALUES ('560', 'IV RA', '52', '2', '112010081041', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '51196', '0',
        '21', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('561', 'IIIA-KOM KHUSUS', '48', '10', '112016062012', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '39951', '0', '13', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('562', 'IIIA-DL KHUSUS', '48', '10', '112016062012', '1', '', '9', null, null, null, '2020-06-26 10:10:49',
        '26019', '0', '13', '0', null, null, null, null, '239');
INSERT INTO `kelas`
VALUES ('563', 'IVA-DL KHUSUS', '52', '10', '112010081041', '0', '', '10', null, null, null, '2020-06-26 10:10:49',
        '17216', '0', '21', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('564', 'I RA', '52', '2', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '38980', '0',
        '21', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('565', 'Developmental Class', '52', '10', '112016072018', '0', '', '14', null, null, null,
        '2020-06-26 10:10:49', '6006', '0', '22', '0', null, null, null, null, '265');
INSERT INTO `kelas`
VALUES ('566', 'II RA', '52', '2', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '48336', '0',
        '21', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('567', 'III RA', '52', '2', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '4293', '0',
        '21', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('568', 'IVA-KOM KHUSUS', '52', '2', '112010081041', '0', '', '10', null, null, null, '2020-06-26 10:10:49',
        '18555', '0', '13', '0', null, null, null, null, '112');
INSERT INTO `kelas`
VALUES ('569', 'Developmental Class', '52', '10', '112016072018', '1', '', '10', null, null, null,
        '2020-06-26 10:10:49', '63581', '0', '22', '0', null, null, null, null, '265');
INSERT INTO `kelas`
VALUES ('570', '0', '52', '10', '112016072018', '1', '', '14', null, null, null, '2020-06-26 10:10:49', '33275', '0',
        '16', '0', null, null, null, null, '265');
INSERT INTO `kelas`
VALUES ('571', 'Developmental Class', '48', '10', '112016072018', '1', '', '14', null, null, null,
        '2020-06-26 10:10:49', '55532', '0', '22', '0', null, null, null, null, '265');
INSERT INTO `kelas`
VALUES ('572', 'VB-RA', '52', '2', '112014042011', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '3943', '0',
        '21', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('573', 'DCA', '53', '4', '112016102023', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '36245', '0',
        '25', '0', null, null, null, null, '298');
INSERT INTO `kelas`
VALUES ('574', 'DCB', '53', '3', '112015112037', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '32138', '0',
        '25', '0', null, null, null, null, '248');
INSERT INTO `kelas`
VALUES ('575', 'DCC', '53', '3', '112017112072', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '43606', '0',
        '25', '0', null, null, null, null, '332');
INSERT INTO `kelas`
VALUES ('576', 'VII A-DL', '54', '40', '112017092067', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '36598',
        '0', '3', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('577', 'VII A-KOM', '54', '12', '112017092067', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '43415',
        '0', '4', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('578', 'VII B KOM', '54', '12', '112017092067', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '63493',
        '0', '4', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('579', 'VIII A-DL', '54', '40', '112015042012', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '15469',
        '0', '3', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('580', 'VIII A-KOM', '54', '12', '112015042012', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '54610',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('581', 'VIII B-DL', '54', '40', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '4892',
        '0', '3', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('582', 'VIII B-KOM', '54', '12', '112013011005', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '31108',
        '0', '4', '0', null, null, null, null, '46');
INSERT INTO `kelas`
VALUES ('583', 'IX A-DL', '54', '40', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '23157',
        '0', '3', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('584', 'IX A-KOM', '54', '12', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '21338',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('585', 'IX B-DL', '54', '40', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '6251',
        '0', '3', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('586', 'IX B-KOM', '54', '12', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '21793',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('587', 'IX C-KOM', '54', '12', '112010101050', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '34061',
        '0', '4', '0', null, null, null, null, '134');
INSERT INTO `kelas`
VALUES ('594', '10 IPA DL', '55', '40', '112017112073', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '22462',
        '0', '1', '0', null, null, null, null, '333');
INSERT INTO `kelas`
VALUES ('595', '10 IPA A KOM', '55', '12', '112017112073', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '61348', '0', '2', '0', null, null, null, null, '333');
INSERT INTO `kelas`
VALUES ('596', '10 IPS DL', '55', '44', '112018011002', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '48907',
        '0', '1', '2', null, null, null, null, '342');
INSERT INTO `kelas`
VALUES ('597', '10 IPS A KOM', '55', '12', '112018011002', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '61064', '0', '2', '2', null, null, null, null, '342');
INSERT INTO `kelas`
VALUES ('598', '10 IPS B KOM', '55', '12', '112018011002', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '33911', '0', '2', '2', null, null, null, null, '342');
INSERT INTO `kelas`
VALUES ('599', '11 IPA DL', '55', '40', '112015072019', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '14898',
        '0', '1', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('600', '11 IPA A KOM', '55', '12', '112015072019', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '4488', '0', '2', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('601', '11 IPA B KOM', '55', '12', '112015072019', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '21235', '0', '2', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('602', '11 IPS A DL', '55', '40', '112018032012', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '63842', '0', '1', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('603', '11 IPS B DL', '55', '40', '112017022029', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '11135', '0', '1', '2', null, null, null, null, '280');
INSERT INTO `kelas`
VALUES ('604', '11 IPS A KOM', '55', '12', '112018032012', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '12308', '0', '2', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('605', '11 IPS B KOM', '55', '12', '112018032012', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '28688', '0', '2', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('606', '11 IPS C KOM', '55', '12', '112017022029', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '11925', '0', '2', '2', null, null, null, null, '280');
INSERT INTO `kelas`
VALUES ('607', '12 IPS A DL', '55', '40', '112018072037', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '15258', '0', '1', '2', null, null, null, null, '381');
INSERT INTO `kelas`
VALUES ('608', '12 IPS B DL', '55', '40', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '16628', '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('609', '12 IPS A KOM', '55', '12', '112018072037', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '26865', '0', '2', '2', null, null, null, null, '381');
INSERT INTO `kelas`
VALUES ('610', '12 IPS B KOM', '55', '12', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '30541', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('611', '12 IPS C KOM', '55', '12', '112013012007', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '24898', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('612', '12 IPA DL', '55', '40', '112008102028', '1', '', '3', null, null, null, '2020-12-10 14:19:18', '23436',
        '0', '1', '1', null, null, '2020-12-02 09:57:37', '31', '32');
INSERT INTO `kelas`
VALUES ('613', '12 IPA A KOM', '55', '12', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '5495', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('614', '12 IPA B KOM', '55', '12', '112008102028', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '22400', '0', '2', '1', null, null, null, null, '32');
INSERT INTO `kelas`
VALUES ('615', 'I KOM', '56', '10', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '23807', '0',
        '6', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('616', 'I DL', '56', '40', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '14572', '0',
        '5', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('617', 'II KOM', '56', '10', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '34672',
        '0', '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('618', 'II DL', '56', '40', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '12422', '0',
        '5', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('619', 'II RA', '56', '2', '112012022001', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '8160', '0',
        '21', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('620', '1 RA', '56', '2', '112013102049', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '11450', '0',
        '21', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('621', 'III DL', '56', '40', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '22141',
        '0', '5', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('622', 'III KOM', '56', '10', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '57135',
        '0', '6', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('623', 'III RA', '56', '2', '112008082016', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '26603', '0',
        '21', '0', null, null, null, null, '168');
INSERT INTO `kelas`
VALUES ('624', 'IV KOM', '56', '10', '112015102026', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '14771',
        '0', '6', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('625', 'IV DL', '56', '40', '112015102026', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '52838',
        '0', '5', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('626', 'IV RA', '56', '2', '112015102026', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '44398', '0',
        '21', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('627', 'V KOM', '56', '10', '112015122046', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '19982',
        '0', '6', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('628', 'V DL', '56', '40', '112015122046', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '63528', '0',
        '5', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('629', 'V RA', '56', '2', '112015122046', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '39579', '0',
        '21', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('630', 'VI-A RA', '56', '3', '112014042011', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '21087',
        '0', '21', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('631', 'VI-B-RA', '56', '3', '112014042011', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '21631',
        '0', '21', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('632', 'VI-A KOM', '56', '10', '112014042011', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '27004',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('633', 'VI DL', '56', '40', '112014042011', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '43944',
        '0', '5', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('637', 'DCA', '64', '10', '112016102023', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '46530', '0',
        '25', '0', null, null, null, null, '298');
INSERT INTO `kelas`
VALUES ('638', 'DCB', '64', '10', '112015112037', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '52388', '0',
        '25', '0', null, null, null, null, '248');
INSERT INTO `kelas`
VALUES ('639', 'DCC', '64', '10', '112018072042', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '7934', '0',
        '25', '0', null, null, null, null, '387');
INSERT INTO `kelas`
VALUES ('640', 'VI-B KOM', '56', '10', '112014042011', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '11039',
        '0', '6', '0', null, null, null, null, '187');
INSERT INTO `kelas`
VALUES ('641', 'DCD', '64', '5', '112018112058', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '3554', '0',
        '25', '0', null, null, null, null, '385');
INSERT INTO `kelas`
VALUES ('642', 'VIII C-KOM', '54', '12', '112015042012', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '35339',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('643', 'VII A-DL', '58', '40', '112017032031', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '65396',
        '0', '3', '0', null, null, null, null, '269');
INSERT INTO `kelas`
VALUES ('644', 'VII A-KOM', '58', '12', '112017032031', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '57965',
        '0', '4', '0', null, null, null, null, '269');
INSERT INTO `kelas`
VALUES ('645', 'VIII A-DL', '58', '40', '112017092067', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '32429',
        '0', '3', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('646', 'VIII A-KOM', '58', '12', '112017092067', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '4743',
        '0', '4', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('647', 'VIII B-KOM', '58', '12', '112017092067', '1', '', '5', null, null, null, '2020-06-26 10:10:49', '48903',
        '0', '4', '0', null, null, null, null, '324');
INSERT INTO `kelas`
VALUES ('648', 'IX A-KOM', '58', '12', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '49877',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('649', 'IX B-KOM', '58', '12', '112015042012', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '64929',
        '0', '4', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('650', 'IX C-KOM', '58', '12', '112012042009', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '55020',
        '0', '4', '0', null, null, null, null, '132');
INSERT INTO `kelas`
VALUES ('651', 'IX A-DL', '58', '40', '112012042009', '1', '', '6', null, null, null, '2020-08-18 11:27:31', '43945',
        '0', '3', '0', null, null, '2020-08-18 11:27:31', '120', '132');
INSERT INTO `kelas`
VALUES ('652', 'IX B-DL', '58', '40', '112015042012', '1', '', '6', null, null, null, '2020-06-26 10:10:49', '32110',
        '0', '3', '0', null, null, null, null, '202');
INSERT INTO `kelas`
VALUES ('653', '10 IPS DL', '57', '40', '112013012007', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '8530',
        '0', '1', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('654', '10 IPS A KOM', '57', '10', '112013012007', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '9720', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('655', '10 IPS B KOM', '57', '10', '112013012007', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '45486', '0', '2', '2', null, null, null, null, '153');
INSERT INTO `kelas`
VALUES ('656', '10 IPA DL', '57', '40', '112018112061', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '59200',
        '0', '1', '1', null, null, null, null, '406');
INSERT INTO `kelas`
VALUES ('657', '10 IPA KOM', '57', '10', '112018112061', '1', '', '1', null, null, null, '2020-06-26 10:10:49', '16017',
        '0', '2', '1', null, null, null, null, '406');
INSERT INTO `kelas`
VALUES ('658', '11 IPA A KOM', '57', '10', '112014092026', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '8441', '0', '2', '1', null, null, null, null, '130');
INSERT INTO `kelas`
VALUES ('659', '11 IPA B KOM', '57', '10', '112014092026', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '23888', '0', '2', '1', null, null, null, null, '130');
INSERT INTO `kelas`
VALUES ('660', '11 IPA DL', '57', '40', '112014092026', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '60438',
        '0', '1', '1', null, null, null, null, '130');
INSERT INTO `kelas`
VALUES ('661', '11 IPS A KOM', '57', '10', '112018072037', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '39468', '0', '2', '2', null, null, null, null, '381');
INSERT INTO `kelas`
VALUES ('662', '11 IPS B KOM', '57', '10', '112018072037', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '13167', '0', '2', '2', null, null, null, null, '381');
INSERT INTO `kelas`
VALUES ('663', '11 IPS C KOM', '57', '10', '112018011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '25454', '0', '2', '2', null, null, null, null, '342');
INSERT INTO `kelas`
VALUES ('664', '11 IPS A DL', '57', '40', '112018072037', '1', '', '2', null, null, null, '2020-06-26 10:10:49', '7112',
        '0', '1', '2', null, null, null, null, '381');
INSERT INTO `kelas`
VALUES ('665', '11 IPS B DL', '57', '40', '112018011002', '1', '', '2', null, null, null, '2020-06-26 10:10:49',
        '50317', '0', '1', '2', null, null, null, null, '342');
INSERT INTO `kelas`
VALUES ('666', '12 IPA A KOM', '57', '10', '112015072019', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '51234', '0', '2', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('667', '12 IPA B KOM', '57', '10', '112015072019', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '34687', '0', '2', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('668', '12 IPA DL', '57', '41', '112015072019', '1', '', '3', null, null, null, '2020-06-26 10:10:49', '64547',
        '0', '1', '1', null, null, null, null, '208');
INSERT INTO `kelas`
VALUES ('669', '12 IPS A KOM', '57', '10', '112018032012', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '1023', '0', '2', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('670', '12 IPS B KOM', '57', '10', '112018032012', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '63772', '0', '2', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('671', '12 IPS C KOM', '57', '10', '112017022029', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '33760', '0', '2', '2', null, null, null, null, '280');
INSERT INTO `kelas`
VALUES ('672', '12 IPS D KOM', '57', '10', '112017022029', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '17919', '0', '2', '2', null, null, null, null, '280');
INSERT INTO `kelas`
VALUES ('673', '12 IPS A DL', '57', '40', '112018032012', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '44856', '0', '1', '2', null, null, null, null, '352');
INSERT INTO `kelas`
VALUES ('674', '12 IPS B DL', '57', '40', '112017022029', '1', '', '3', null, null, null, '2020-06-26 10:10:49',
        '43426', '0', '1', '2', null, null, null, null, '280');
INSERT INTO `kelas`
VALUES ('675', 'I-KOM', '60', '10', '112012022001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '20532', '0',
        '6', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('676', 'I-DL', '60', '40', '112012022001', '1', '', '7', null, null, null, '2020-07-02 14:30:36', '37564', '0',
        '5', '0', null, null, '2020-07-02 14:30:36', '117', '108');
INSERT INTO `kelas`
VALUES ('677', 'I-RA', '60', '2', '112012022001', '1', '', '7', null, null, null, '2020-06-26 10:10:49', '51288', '0',
        '21', '0', null, null, null, null, '108');
INSERT INTO `kelas`
VALUES ('678', 'II-KOM', '60', '10', '112015122046', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '55684',
        '0', '6', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('679', 'II-DL', '60', '40', '112015122046', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '65077', '0',
        '5', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('680', 'II-RA', '60', '2', '112015122046', '1', '', '8', null, null, null, '2020-06-26 10:10:49', '47458', '0',
        '21', '0', null, null, null, null, '230');
INSERT INTO `kelas`
VALUES ('681', 'III-KOM', '60', '10', '112015102026', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '52245',
        '0', '6', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('682', 'III-DL', '60', '40', '112015102026', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '8756', '0',
        '5', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('683', 'III-RA', '60', '2', '112015102026', '1', '', '9', null, null, null, '2020-06-26 10:10:49', '25244', '0',
        '21', '0', null, null, null, null, '217');
INSERT INTO `kelas`
VALUES ('684', 'IV-KOM', '60', '10', '112018071028', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '4067',
        '0', '6', '0', null, null, null, null, '372');
INSERT INTO `kelas`
VALUES ('685', 'IV-DL', '60', '40', '112018071028', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '61099',
        '0', '5', '0', null, null, null, null, '372');
INSERT INTO `kelas`
VALUES ('686', 'IV-RA', '60', '2', '112018071028', '1', '', '10', null, null, null, '2020-06-26 10:10:49', '7041', '0',
        '21', '0', null, null, null, null, '372');
INSERT INTO `kelas`
VALUES ('687', 'V-KOM', '60', '10', '112018012007', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '51888',
        '0', '6', '0', null, null, null, null, '343');
INSERT INTO `kelas`
VALUES ('688', 'V-DL', '60', '40', '112018012007', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '53897', '0',
        '5', '0', null, null, null, null, '343');
INSERT INTO `kelas`
VALUES ('689', 'V-RA', '60', '2', '112018012007', '1', '', '11', null, null, null, '2020-06-26 10:10:49', '10964', '0',
        '21', '0', null, null, null, null, '343');
INSERT INTO `kelas`
VALUES ('690', 'VI-KOM', '60', '10', '112013102049', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '53110',
        '0', '6', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('691', 'VI-DL', '60', '40', '112013102049', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '11421',
        '0', '5', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('692', 'VI-RA', '60', '3', '112013102049', '1', '', '12', null, null, null, '2020-06-26 10:10:49', '50015', '0',
        '21', '0', null, null, null, null, '151');
INSERT INTO `kelas`
VALUES ('693', 'DCA', '65', '3', '112019042012', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '30824', '0',
        '25', '0', null, null, null, null, '429');
INSERT INTO `kelas`
VALUES ('694', 'DCB', '65', '3', '112015112037', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '61865', '0',
        '25', '0', null, null, null, null, '248');
INSERT INTO `kelas`
VALUES ('695', 'DCC', '65', '3', '112018072042', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '13506', '0',
        '25', '0', null, null, null, null, '387');
INSERT INTO `kelas`
VALUES ('696', 'DCD', '65', '3', '112019081028', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '31168', '0',
        '25', '0', null, null, '2020-03-02 14:59:41', '157', '450');
INSERT INTO `kelas`
VALUES ('697', 'VII B-KOM', '58', '12', '112017032031', '1', '', '4', null, null, null, '2020-06-26 10:10:49', '61464',
        '0', '4', '0', null, null, null, null, '269');
INSERT INTO `kelas`
VALUES ('698', 'DCE', '65', '3', '112020011005', '1', '', '17', null, null, null, '2020-06-26 10:10:49', '25808', '0',
        '25', '0', null, null, null, null, '473');
INSERT INTO `kelas`
VALUES ('699', 'VII A - DL TUNGGAL', '58', '40', '112017032031', '1', '', '4', null, null, null, '2020-06-26 10:10:49',
        '23646', '0', '28', '0', null, null, null, null, '269');
INSERT INTO `kelas`
VALUES ('700', '10 IPA DL TUNGGAL', '57', '40', '112018112061', '1', '', '1', null, null, null, '2020-06-26 10:10:49',
        '8888', '0', '27', '1', null, null, null, null, '406');
INSERT INTO `kelas`
VALUES ('703', 'DCA', '66', '3', '', '0', '', '17', null, null, null, '2020-08-25 15:45:10', '10062', '0', '25', '0',
        '2020-06-26 15:00:29', '117', '2020-08-25 15:45:10', '117', '480');
INSERT INTO `kelas`
VALUES ('704', 'VII A - KOM', '61', '12', '', '1', '', '4', null, null, null, '2020-06-26 15:14:24', '47614', '0', '4',
        '0', '2020-06-26 15:00:45', '452', '2020-06-26 15:14:24', '452', '369');
INSERT INTO `kelas`
VALUES ('705', 'I - KOM', '62', '10', '', '1', '', '7', null, null, null, '2020-10-19 11:34:10', '60843', '0', '6', '0',
        '2020-06-26 15:06:16', '117', '2020-10-19 11:34:10', '117', '513');
INSERT INTO `kelas`
VALUES ('706', 'VII A - DL', '61', '40', '', '1', '', '4', null, null, null, '2020-08-03 14:36:49', '34876', '0', '3',
        '0', '2020-06-26 15:11:38', '452', '2020-08-03 14:36:49', '452', '369');
INSERT INTO `kelas`
VALUES ('712', 'I - DL', '62', '40', '', '1', '', '7', null, null, null, '2020-10-19 11:33:48', '7949', '0', '5', '0',
        '2020-06-26 15:16:40', '117', '2020-10-19 11:33:48', '117', '513');
INSERT INTO `kelas`
VALUES ('713', 'VIII A - KOM', '61', '12', '', '1', '', '5', null, null, null, '2020-06-26 15:19:01', '24451', '0', '4',
        '0', '2020-06-26 15:19:01', '452', '2020-06-26 15:19:01', '452', '269');
INSERT INTO `kelas`
VALUES ('714', 'VIII A - DL', '61', '40', '', '1', '', '5', null, null, null, '2020-06-26 15:19:59', '5580', '0', '3',
        '0', '2020-06-26 15:19:59', '452', '2020-06-26 15:19:59', '452', '269');
INSERT INTO `kelas`
VALUES ('715', 'IX A - KOM', '61', '12', '', '1', '', '6', null, null, null, '2020-06-26 15:21:03', '43730', '0', '4',
        '0', '2020-06-26 15:21:03', '452', '2020-06-26 15:21:03', '452', '132');
INSERT INTO `kelas`
VALUES ('716', 'IX A - DL', '61', '40', '', '1', '', '6', null, null, null, '2020-06-26 15:22:01', '13098', '0', '3',
        '0', '2020-06-26 15:22:01', '452', '2020-06-26 15:22:01', '452', '132');
INSERT INTO `kelas`
VALUES ('718', 'IX B - KOM', '61', '12', '', '1', '', '6', null, null, null, '2020-06-26 15:23:19', '12146', '0', '4',
        '0', '2020-06-26 15:23:19', '452', '2020-06-26 15:23:19', '452', '324');
INSERT INTO `kelas`
VALUES ('719', 'IX B - DL', '61', '40', '', '1', '', '6', null, null, null, '2020-06-26 15:24:00', '57545', '0', '3',
        '0', '2020-06-26 15:24:00', '452', '2020-06-26 15:24:00', '452', '324');
INSERT INTO `kelas`
VALUES ('720', 'I - RA', '62', '3', '', '1', '', '7', null, null, null, '2020-10-23 15:18:37', '45894', '0', '21', '0',
        '2020-06-26 16:11:02', '117', '2020-10-23 15:18:37', '117', '513');
INSERT INTO `kelas`
VALUES ('721', 'DCB', '66', '3', '', '0', '', '17', null, null, null, '2020-08-25 15:45:16', '423', '0', '25', '0',
        '2020-06-26 16:13:57', '117', '2020-08-25 15:45:16', '117', '248');
INSERT INTO `kelas`
VALUES ('722', 'DCC', '66', '3', '', '0', '', '17', null, null, null, '2020-08-25 15:45:22', '2788', '0', '25', '0',
        '2020-06-26 16:15:33', '117', '2020-08-25 15:45:22', '117', '387');
INSERT INTO `kelas`
VALUES ('723', 'DCD', '66', '3', '', '0', '', '17', null, null, null, '2020-08-25 15:45:28', '33747', '0', '25', '0',
        '2020-06-26 16:18:35', '117', '2020-08-25 15:45:28', '117', '450');
INSERT INTO `kelas`
VALUES ('724', 'DCE', '66', '3', '', '0', '', '17', null, null, null, '2020-08-25 15:45:33', '25822', '0', '25', '0',
        '2020-06-26 16:19:38', '117', '2020-08-25 15:45:33', '117', '473');
INSERT INTO `kelas`
VALUES ('725', 'II - KOM', '62', '10', '', '1', '', '8', null, null, null, '2020-06-26 16:22:36', '34436', '0', '6',
        '0', '2020-06-26 16:22:36', '117', '2020-06-26 16:22:36', '117', '230');
INSERT INTO `kelas`
VALUES ('726', 'II - DL', '62', '40', '', '1', '', '8', null, null, null, '2020-06-26 16:23:43', '53218', '0', '5', '0',
        '2020-06-26 16:23:43', '117', '2020-06-26 16:23:43', '117', '230');
INSERT INTO `kelas`
VALUES ('727', 'II - RA', '62', '3', '', '1', '', '8', null, null, null, '2020-10-23 15:33:09', '53550', '0', '21', '0',
        '2020-06-26 16:25:32', '117', '2020-10-23 15:33:09', '117', '230');
INSERT INTO `kelas`
VALUES ('728', 'III - KOM', '62', '10', '', '1', '', '9', null, null, null, '2020-06-26 16:27:45', '45726', '0', '6',
        '0', '2020-06-26 16:27:45', '117', '2020-06-26 16:27:45', '117', '217');
INSERT INTO `kelas`
VALUES ('729', 'III - DL', '62', '40', '', '1', '', '9', null, null, null, '2020-06-26 16:31:35', '24019', '0', '5',
        '0', '2020-06-26 16:31:35', '117', '2020-06-26 16:31:35', '117', '217');
INSERT INTO `kelas`
VALUES ('730', 'III - RA', '62', '3', '', '1', '', '9', null, null, null, '2020-10-23 15:33:17', '15288', '0', '21',
        '0', '2020-06-26 16:33:37', '117', '2020-10-23 15:33:17', '117', '217');
INSERT INTO `kelas`
VALUES ('731', 'IV - KOM', '62', '10', '', '1', '', '10', null, null, null, '2020-06-26 16:35:24', '20933', '0', '6',
        '0', '2020-06-26 16:35:24', '117', '2020-06-26 16:35:24', '117', '108');
INSERT INTO `kelas`
VALUES ('732', 'IV - DL', '62', '40', '', '1', '', '10', null, null, null, '2020-06-26 16:36:10', '38661', '0', '5',
        '0', '2020-06-26 16:36:10', '117', '2020-06-26 16:36:10', '117', '108');
INSERT INTO `kelas`
VALUES ('733', 'IV - RA', '62', '3', '', '1', '', '10', null, null, null, '2020-10-23 15:33:23', '30005', '0', '21',
        '0', '2020-06-26 16:37:05', '117', '2020-10-23 15:33:23', '117', '108');
INSERT INTO `kelas`
VALUES ('734', 'V - KOM', '62', '10', '', '1', '', '11', null, null, null, '2021-07-06 11:18:26', '25174', '0', '6',
        '0', '2020-06-26 16:38:10', '117', '2021-07-06 11:18:26', '117', '343');
INSERT INTO `kelas`
VALUES ('735', 'V - DL', '62', '40', '', '1', '', '11', null, null, null, '2021-07-06 11:18:09', '13915', '0', '5', '0',
        '2020-06-26 16:40:06', '117', '2021-07-06 11:18:09', '117', '343');
INSERT INTO `kelas`
VALUES ('736', 'V - RA', '62', '3', '', '1', '', '11', null, null, null, '2021-03-31 09:54:50', '53519', '0', '21', '0',
        '2020-06-26 16:40:54', '117', '2021-03-31 09:54:50', '117', '522');
INSERT INTO `kelas`
VALUES ('737', 'VI - KOM', '62', '10', '', '1', '', '12', null, null, null, '2020-06-26 16:42:03', '8484', '0', '6',
        '0', '2020-06-26 16:42:03', '117', '2020-06-26 16:42:03', '117', '151');
INSERT INTO `kelas`
VALUES ('738', 'VI - RA', '62', '3', '', '1', '', '12', null, null, null, '2020-10-23 15:33:44', '5909', '0', '21', '0',
        '2020-06-26 16:42:57', '117', '2020-10-23 15:33:44', '117', '151');
INSERT INTO `kelas`
VALUES ('739', 'VI - DL', '62', '40', '', '1', '', '12', null, null, null, '2020-06-26 16:43:55', '36081', '0', '5',
        '0', '2020-06-26 16:43:55', '117', '2020-06-26 16:43:55', '117', '151');
INSERT INTO `kelas`
VALUES ('740', 'VIII B - KOM', '61', '12', '', '1', '', '5', null, null, null, '2020-07-01 15:22:05', '37065', '0', '4',
        '0', '2020-07-01 15:22:05', '452', '2020-07-01 15:22:05', '452', '269');
INSERT INTO `kelas`
VALUES ('741', 'I - DLT', '62', '40', '', '1', '', '7', null, null, null, '2020-10-19 11:34:00', '46180', '0', '26',
        '0', '2020-07-02 15:31:15', '117', '2020-10-19 11:34:00', '117', '513');
INSERT INTO `kelas`
VALUES ('742', 'II - DLT', '62', '40', '', '1', '', '8', null, null, null, '2020-07-02 15:35:09', '7404', '0', '26',
        '0', '2020-07-02 15:35:09', '117', '2020-07-02 15:35:09', '117', '230');
INSERT INTO `kelas`
VALUES ('743', 'III - DLT', '62', '40', '', '1', '', '9', null, null, null, '2020-07-02 15:36:00', '24926', '0', '26',
        '0', '2020-07-02 15:36:00', '117', '2020-07-02 15:36:00', '117', '217');
INSERT INTO `kelas`
VALUES ('744', 'IV - DLT', '62', '40', '', '1', '', '10', null, null, null, '2020-07-02 15:36:49', '35048', '0', '26',
        '0', '2020-07-02 15:36:49', '117', '2020-07-02 15:36:49', '117', '108');
INSERT INTO `kelas`
VALUES ('745', 'V - DLT', '62', '40', '', '1', '', '11', null, null, null, '2021-07-06 11:18:17', '22181', '0', '26',
        '0', '2020-07-02 15:37:33', '117', '2021-07-06 11:18:17', '117', '343');
INSERT INTO `kelas`
VALUES ('746', 'VI - DLT', '62', '40', '', '1', '', '12', null, null, null, '2020-07-02 15:39:00', '37144', '0', '26',
        '0', '2020-07-02 15:39:00', '117', '2020-07-02 15:39:00', '117', '151');
INSERT INTO `kelas`
VALUES ('747', 'X - IPA - DL', '59', '40', '', '1', '', '1', null, null, null, '2020-07-02 22:30:05', '32524', '0', '1',
        '1', '2020-07-02 22:30:05', '453', '2020-07-02 22:30:05', '453', '130');
INSERT INTO `kelas`
VALUES ('748', 'X - IPA - KOM', '59', '10', '', '1', '', '1', null, null, null, '2020-08-12 14:55:37', '1142', '0', '2',
        '1', '2020-07-02 22:30:35', '453', '2020-08-12 14:55:37', '320', '130');
INSERT INTO `kelas`
VALUES ('749', 'X - IPA - DLT', '59', '40', '', '1', '', '1', null, null, null, '2020-07-02 22:35:05', '56171', '0',
        '27', '1', '2020-07-02 22:35:05', '453', '2020-07-02 22:35:05', '453', '130');
INSERT INTO `kelas`
VALUES ('750', 'X - IPS - B - DL', '59', '40', '', '1', '', '1', null, null, null, '2020-09-10 16:25:00', '2402', '0',
        '1', '2', '2020-07-02 22:38:40', '453', '2020-09-10 16:25:00', '453', '406');
INSERT INTO `kelas`
VALUES ('751', 'X - IPS - B - KOM', '59', '10', '', '1', '', '1', null, null, null, '2020-09-24 15:57:01', '9228', '0',
        '2', '2', '2020-07-02 22:40:10', '453', '2020-09-24 15:57:01', '453', '406');
INSERT INTO `kelas`
VALUES ('752', 'X - IPS - DLT', '59', '40', '', '1', '', '1', null, null, null, '2022-09-20 14:20:55', '55309', '0',
        '27', '2', '2020-07-02 22:41:24', '453', '2022-09-20 14:20:55', '120', '412');
INSERT INTO `kelas`
VALUES ('753', 'XI - IPA - DL', '59', '40', '', '1', '', '2', null, null, null, '2020-07-02 22:46:54', '42715', '0',
        '1', '1', '2020-07-02 22:46:53', '453', '2020-07-02 22:46:53', '453', '153');
INSERT INTO `kelas`
VALUES ('754', 'XI - IPA - KOM', '59', '10', '', '1', '', '2', null, null, null, '2020-08-12 14:56:07', '20210', '0',
        '2', '1', '2020-07-02 22:48:57', '453', '2020-08-12 14:56:07', '320', '153');
INSERT INTO `kelas`
VALUES ('755', 'XI - IPA - DLT', '59', '40', '', '1', '', '2', null, null, null, '2020-07-02 22:50:31', '60642', '0',
        '27', '1', '2020-07-02 22:50:31', '453', '2020-07-02 22:50:31', '453', '153');
INSERT INTO `kelas`
VALUES ('756', 'XII - IPA - DL', '59', '40', '', '1', '', '3', null, null, null, '2020-07-02 22:55:21', '32309', '0',
        '1', '1', '2020-07-02 22:55:21', '453', '2020-07-02 22:55:21', '453', '208');
INSERT INTO `kelas`
VALUES ('757', 'XII - IPA - KOM', '59', '10', '', '1', '', '3', null, null, null, '2020-08-12 14:56:50', '7336', '0',
        '2', '1', '2020-07-02 22:57:19', '453', '2020-08-12 14:56:50', '320', '208');
INSERT INTO `kelas`
VALUES ('758', 'XII - IPA - DLT', '59', '40', '', '1', '', '3', null, null, null, '2020-07-02 22:58:23', '36209', '0',
        '27', '1', '2020-07-02 22:58:23', '453', '2020-07-02 22:58:23', '453', '208');
INSERT INTO `kelas`
VALUES ('759', 'XI - IPS - A - DL', '59', '40', '', '1', '', '2', null, null, null, '2020-07-03 10:45:14', '49069', '0',
        '1', '2', '2020-07-03 10:45:14', '453', '2020-07-03 10:45:14', '453', '381');
INSERT INTO `kelas`
VALUES ('760', 'XI-A-DL-IPA', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '2', null, null, null,
        '2020-07-03 15:01:17', '60906', '0', '1', '1', null, null, '2020-07-03 15:01:17', '466', '478');
INSERT INTO `kelas`
VALUES ('761', 'X-A-DL-IPA', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '1', null, null, null,
        '2020-07-03 15:00:19', '50221', '0', '1', '1', null, null, '2020-07-03 15:00:19', '466', '478');
INSERT INTO `kelas`
VALUES ('762', 'X-A-KOM-IPA', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '1', null, null, null,
        '2020-07-03 15:00:59', '2857', '0', '2', '1', null, null, '2020-07-03 15:00:59', '466', '478');
INSERT INTO `kelas`
VALUES ('763', 'X-A-DL-IPS', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '1', null, null, null,
        '2020-07-03 15:00:44', '60211', '0', '1', '2', null, null, '2020-07-03 15:00:44', '466', '478');
INSERT INTO `kelas`
VALUES ('764', 'X-A-KOM-IPS', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '1', null, null, null,
        '2020-07-03 15:01:08', '30362', '0', '2', '2', null, null, '2020-07-03 15:01:08', '466', '478');
INSERT INTO `kelas`
VALUES ('765', 'XI-A-DL-IPS', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '2', null, null, null,
        '2020-07-03 15:01:27', '36709', '0', '1', '2', null, null, '2020-07-03 15:01:27', '466', '478');
INSERT INTO `kelas`
VALUES ('766', 'XI-A-KOM-IPA', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '2', null, null, null,
        '2020-07-03 15:01:36', '26929', '0', '2', '1', null, null, '2020-07-03 15:01:36', '466', '478');
INSERT INTO `kelas`
VALUES ('767', 'XI-A-KOM-IPS', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '2', null, null, null,
        '2020-07-03 15:01:48', '24516', '0', '2', '2', null, null, '2020-07-03 15:01:48', '466', '478');
INSERT INTO `kelas`
VALUES ('768', 'XII-A-DL-IPA', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '3', null, null, null,
        '2020-07-03 15:01:57', '41795', '0', '1', '1', null, null, '2020-07-03 15:01:57', '466', '478');
INSERT INTO `kelas`
VALUES ('769', 'XIII-A-KOM-IPS', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '3', null, null, null,
        '2020-07-03 15:02:23', '4363', '0', '2', '2', null, null, '2020-07-03 15:02:23', '466', '478');
INSERT INTO `kelas`
VALUES ('770', 'XIII-A-DL-IPS', '68', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '3', null, null, null,
        '2020-07-03 15:02:06', '27492', '0', '1', '1', null, null, '2020-07-03 15:02:06', '466', '478');
INSERT INTO `kelas`
VALUES ('771', 'XIII-A-KOM-IPA', '68', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '3', null, null, null,
        '2020-07-03 15:02:15', '58839', '0', '2', '1', null, null, '2020-07-03 15:02:15', '466', '478');
INSERT INTO `kelas`
VALUES ('772', 'VII-A-DL', '74', '35', '152020032009', '1', 'Tahun Ajaran ke 1', '4', null, null, null,
        '2020-07-03 14:59:04', '15127', '0', '3', '0', null, null, '2020-07-03 14:59:04', '466', '479');
INSERT INTO `kelas`
VALUES ('773', 'VII-A-KOM', '74', '10', '152020032009', '1', 'Tahun Ajaran ke 1', '4', null, null, null,
        '2020-07-03 14:59:12', '30179', '0', '4', '0', null, null, '2020-07-03 14:59:12', '466', '479');
INSERT INTO `kelas`
VALUES ('774', 'VIII-A-KOM', '74', '10', '152020032009', '1', 'Tahun Ajaran ke 1', '5', null, null, null,
        '2020-07-03 14:59:27', '39981', '0', '4', '0', null, null, '2020-07-03 14:59:27', '466', '479');
INSERT INTO `kelas`
VALUES ('775', 'VIII-A-DL', '74', '35', '152020032009', '1', 'Tahun Ajaran ke 1', '5', null, null, null,
        '2020-07-03 14:59:19', '43841', '0', '3', '0', null, null, '2020-07-03 14:59:19', '466', '479');
INSERT INTO `kelas`
VALUES ('776', 'IX-A-DL', '74', '35', '152020032008', '1', 'Tahun Ajaran ke 1', '6', null, null, null,
        '2020-07-03 14:59:35', '33732', '0', '3', '0', null, null, '2020-07-03 14:59:35', '466', '479');
INSERT INTO `kelas`
VALUES ('777', 'IX-A-KOM', '74', '10', '152020032008', '1', 'Tahun Ajaran ke 1', '6', null, null, null,
        '2020-07-03 14:59:43', '37133', '0', '4', '0', null, null, '2020-07-03 14:59:43', '466', '479');
INSERT INTO `kelas`
VALUES ('778', 'I-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '7', null, null, null,
        '2020-07-03 14:57:17', '18941', '0', '6', '0', null, null, '2020-07-03 14:57:17', '466', '477');
INSERT INTO `kelas`
VALUES ('779', 'I-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '7', null, null, null,
        '2020-07-03 14:57:07', '48836', '0', '5', '0', null, null, '2020-07-03 14:57:07', '466', '477');
INSERT INTO `kelas`
VALUES ('780', 'II-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '8', null, null, null,
        '2020-07-03 14:57:35', '56296', '0', '6', '0', null, null, '2020-07-03 14:57:35', '466', '477');
INSERT INTO `kelas`
VALUES ('781', 'II-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '8', null, null, null,
        '2020-07-03 14:57:27', '3910', '0', '5', '0', null, null, '2020-07-03 14:57:27', '466', '477');
INSERT INTO `kelas`
VALUES ('782', 'III-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '9', null, null, null,
        '2020-07-03 14:57:51', '47253', '0', '6', '0', null, null, '2020-07-03 14:57:51', '466', '477');
INSERT INTO `kelas`
VALUES ('783', 'III-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '9', null, null, null,
        '2020-07-03 14:57:43', '27942', '0', '5', '0', null, null, '2020-07-03 14:57:43', '466', '477');
INSERT INTO `kelas`
VALUES ('784', 'IV-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '10', null, null, null,
        '2020-07-03 14:58:06', '63482', '0', '6', '0', null, null, '2020-07-03 14:58:06', '466', '477');
INSERT INTO `kelas`
VALUES ('785', 'IV-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '10', null, null, null,
        '2020-07-03 14:57:59', '36995', '0', '5', '0', null, null, '2020-07-03 14:57:59', '466', '477');
INSERT INTO `kelas`
VALUES ('786', 'V-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '11', null, null, null,
        '2020-07-03 14:58:27', '60059', '0', '6', '0', null, null, '2020-07-03 14:58:27', '466', '477');
INSERT INTO `kelas`
VALUES ('787', 'V-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '11', null, null, null,
        '2020-07-03 14:58:14', '58248', '0', '5', '0', null, null, '2020-07-03 14:58:14', '466', '477');
INSERT INTO `kelas`
VALUES ('788', 'VI-A-KOM', '73', '10', '152020022006', '1', 'Tahun Ajaran ke 1', '12', null, null, null,
        '2020-07-03 14:58:43', '45534', '0', '6', '0', null, null, '2020-07-03 14:58:43', '466', '477');
INSERT INTO `kelas`
VALUES ('789', 'VI-A-DL', '73', '35', '152020022006', '1', 'Tahun Ajaran ke 1', '12', null, null, null,
        '2020-07-03 14:58:35', '52927', '0', '5', '0', null, null, '2020-07-03 14:58:35', '466', '477');
INSERT INTO `kelas`
VALUES ('790', 'I-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '7', null, null, null, '2020-12-16 10:20:33',
        '3793', '0', '6', '0', '2020-07-03 14:08:29', '466', '2020-12-16 10:20:33', '466', '514');
INSERT INTO `kelas`
VALUES ('791', 'I-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '7', null, null, null, '2020-12-16 10:20:21',
        '14088', '0', '5', '0', '2020-07-03 14:09:51', '466', '2020-12-16 10:20:21', '466', '514');
INSERT INTO `kelas`
VALUES ('792', 'II-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '8', null, null, null, '2020-12-16 10:21:08',
        '54670', '0', '6', '0', '2020-07-03 14:11:36', '466', '2020-12-16 10:21:08', '466', '514');
INSERT INTO `kelas`
VALUES ('793', 'II-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '8', null, null, null, '2020-12-16 10:20:51',
        '47941', '0', '5', '0', '2020-07-03 14:12:16', '466', '2020-12-16 10:20:51', '466', '514');
INSERT INTO `kelas`
VALUES ('794', 'III-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '9', null, null, null, '2020-12-16 10:21:19',
        '49134', '0', '5', '0', '2020-07-03 14:13:08', '466', '2020-12-16 10:21:19', '466', '514');
INSERT INTO `kelas`
VALUES ('795', 'III-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '9', null, null, null, '2020-12-16 10:21:32',
        '61187', '0', '6', '0', '2020-07-03 14:13:44', '466', '2020-12-16 10:21:32', '466', '514');
INSERT INTO `kelas`
VALUES ('796', 'IV-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '10', null, null, null, '2020-08-27 15:32:45',
        '46098', '0', '5', '0', '2020-07-03 14:14:30', '466', '2020-08-27 15:32:45', '466', '506');
INSERT INTO `kelas`
VALUES ('797', 'IV-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '10', null, null, null, '2020-08-27 15:34:36',
        '45321', '0', '6', '0', '2020-07-03 14:15:10', '466', '2020-08-27 15:34:36', '466', '506');
INSERT INTO `kelas`
VALUES ('798', 'V-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '11', null, null, null, '2020-08-27 15:34:52',
        '13522', '0', '5', '0', '2020-07-03 14:31:48', '466', '2020-08-27 15:34:52', '466', '506');
INSERT INTO `kelas`
VALUES ('799', 'V-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '11', null, null, null, '2020-08-27 15:35:07',
        '2230', '0', '6', '0', '2020-07-03 14:32:39', '466', '2020-08-27 15:35:07', '466', '506');
INSERT INTO `kelas`
VALUES ('800', 'VI-A-DL', '75', '35', '', '1', 'Tahun Ajaran ke 2', '12', null, null, null, '2020-08-27 15:35:18',
        '47755', '0', '5', '0', '2020-07-03 14:34:37', '466', '2020-08-27 15:35:18', '466', '506');
INSERT INTO `kelas`
VALUES ('801', 'VI-A-KOM', '75', '10', '', '1', 'Tahun Ajaran ke 2', '12', null, null, null, '2020-08-27 15:35:30',
        '58229', '0', '6', '0', '2020-07-03 14:35:34', '466', '2020-08-27 15:35:30', '466', '506');
INSERT INTO `kelas`
VALUES ('802', 'VII-A-DL', '76', '35', '', '1', 'Tahun Ajaran ke 2', '4', null, null, null, '2020-07-03 14:37:07',
        '8901', '0', '3', '0', '2020-07-03 14:37:07', '466', '2020-07-03 14:37:07', '466', '479');
INSERT INTO `kelas`
VALUES ('803', 'VII-A-KOM', '76', '10', '', '1', 'Tahun Ajaran ke 2', '4', null, null, null, '2020-07-03 14:39:23',
        '60456', '0', '4', '0', '2020-07-03 14:39:23', '466', '2020-07-03 14:39:23', '466', '479');
INSERT INTO `kelas`
VALUES ('804', 'VIII-A-DL', '76', '35', '', '1', 'Tahun Ajaran ke 2', '5', null, null, null, '2020-07-03 14:40:15',
        '5054', '0', '3', '0', '2020-07-03 14:40:15', '466', '2020-07-03 14:40:15', '466', '479');
INSERT INTO `kelas`
VALUES ('805', 'VIII-A-KOM', '76', '10', '', '1', 'Tahun Ajaran ke 2', '5', null, null, null, '2020-07-03 14:40:48',
        '33092', '0', '4', '0', '2020-07-03 14:40:48', '466', '2020-07-03 14:40:48', '466', '479');
INSERT INTO `kelas`
VALUES ('806', 'IX-A-DL', '76', '35', '', '1', 'Tahun Ajaran ke 2', '6', null, null, null, '2020-07-03 14:42:00',
        '7755', '0', '3', '0', '2020-07-03 14:42:00', '466', '2020-07-03 14:42:00', '466', '479');
INSERT INTO `kelas`
VALUES ('807', 'IX-A-KOM', '76', '10', '', '1', 'Tahun Ajaran ke 2', '6', null, null, null, '2020-07-03 14:42:34',
        '48817', '0', '4', '0', '2020-07-03 14:42:34', '466', '2020-07-03 14:42:34', '466', '479');
INSERT INTO `kelas`
VALUES ('808', 'X-A-DL-IPA', '68', '35', '', '1', 'Tahun Ajaran ke 1', '1', null, null, null, '2020-07-03 15:00:33',
        '54987', '0', '1', '1', '2020-07-03 14:44:10', '466', '2020-07-03 15:00:33', '466', '478');
INSERT INTO `kelas`
VALUES ('809', 'X-A-DL-IPA', '77', '35', '', '1', 'Tahun Ajaran ke 2', '1', null, null, null, '2020-07-03 14:45:31',
        '13690', '0', '1', '1', '2020-07-03 14:45:31', '466', '2020-07-03 14:45:31', '466', '478');
INSERT INTO `kelas`
VALUES ('810', 'X-A-KOM-IPA', '77', '10', '', '1', 'Tahun Ajaran ke 2', '1', null, null, null, '2020-07-03 14:46:37',
        '48908', '0', '2', '1', '2020-07-03 14:46:37', '466', '2020-07-03 14:46:37', '466', '478');
INSERT INTO `kelas`
VALUES ('811', 'X-A-DL-IPS', '77', '35', '', '1', 'Tahun Ajaran ke 2', '1', null, null, null, '2020-07-03 14:47:30',
        '37226', '0', '1', '2', '2020-07-03 14:47:30', '466', '2020-07-03 14:47:30', '466', '478');
INSERT INTO `kelas`
VALUES ('812', 'X-A-KOM-IPS', '77', '10', '', '1', 'Tahun Ajaran ke 2', '1', null, null, null, '2020-07-03 14:48:35',
        '49256', '0', '2', '2', '2020-07-03 14:48:35', '466', '2020-07-03 14:48:35', '466', '478');
INSERT INTO `kelas`
VALUES ('813', 'XI-A-DL-IPS', '77', '35', '', '1', 'Tahun Ajaran ke 2', '2', null, null, null, '2020-07-03 14:49:29',
        '60933', '0', '1', '2', '2020-07-03 14:49:29', '466', '2020-07-03 14:49:29', '466', '478');
INSERT INTO `kelas`
VALUES ('814', 'XI-A-DL-IPA', '77', '35', '', '1', 'Tahun Ajaran ke 2', '2', null, null, null, '2020-07-03 14:50:33',
        '40011', '0', '1', '1', '2020-07-03 14:50:33', '466', '2020-07-03 14:50:33', '466', '478');
INSERT INTO `kelas`
VALUES ('815', 'XI-A-KOM-IPA', '77', '10', '', '1', 'Tahun Ajaran ke 2', '2', null, null, null, '2020-07-03 14:51:22',
        '7644', '0', '2', '1', '2020-07-03 14:51:22', '466', '2020-07-03 14:51:22', '466', '478');
INSERT INTO `kelas`
VALUES ('816', 'XI-A-KOM-IPS', '77', '10', '', '1', 'Tahun Ajaran ke 2', '2', null, null, null, '2020-07-03 14:52:17',
        '50152', '0', '2', '2', '2020-07-03 14:52:03', '466', '2020-07-03 14:52:17', '466', '478');
INSERT INTO `kelas`
VALUES ('817', 'XII-A-DL-IPA', '77', '35', '', '1', 'Tahun Ajaran ke 2', '3', null, null, null, '2020-07-03 14:53:22',
        '38375', '0', '1', '1', '2020-07-03 14:53:22', '466', '2020-07-03 14:53:22', '466', '478');
INSERT INTO `kelas`
VALUES ('818', 'XII-A-DL-IPS', '77', '35', '', '1', 'Tahun Ajaran ke 2', '3', null, null, null, '2020-07-03 14:54:13',
        '35308', '0', '1', '2', '2020-07-03 14:54:13', '466', '2020-07-03 14:54:13', '466', '478');
INSERT INTO `kelas`
VALUES ('819', 'XII-A-KOM-IPA', '77', '10', '', '1', 'Tahun Ajaran ke 2', '3', null, null, null, '2020-07-03 14:54:56',
        '34610', '0', '2', '1', '2020-07-03 14:54:56', '466', '2020-07-03 14:54:56', '466', '478');
INSERT INTO `kelas`
VALUES ('820', 'XII-A-KOM-IPS', '77', '10', '', '1', 'Tahun Ajaran ke 2', '3', null, null, null, '2020-07-03 14:55:38',
        '59457', '0', '2', '2', '2020-07-03 14:55:38', '466', '2020-07-03 14:55:38', '466', '478');
INSERT INTO `kelas`
VALUES ('821', 'XI - IPS - A - DLT', '59', '40', '', '1', '', '2', null, null, null, '2020-07-03 16:11:33', '60896',
        '0', '27', '2', '2020-07-03 16:11:33', '453', '2020-07-03 16:11:33', '453', '381');
INSERT INTO `kelas`
VALUES ('822', 'XI - IPS - A - KOM', '59', '10', '', '1', '', '2', null, null, null, '2020-08-12 14:56:17', '39056',
        '0', '2', '2', '2020-07-03 16:12:53', '453', '2020-08-12 14:56:17', '320', '381');
INSERT INTO `kelas`
VALUES ('823', 'XI - IPS - B - DL', '59', '40', '', '1', '', '2', null, null, null, '2020-07-03 16:15:06', '43791', '0',
        '1', '2', '2020-07-03 16:15:06', '453', '2020-07-03 16:15:06', '453', '454');
INSERT INTO `kelas`
VALUES ('824', 'XI - IPS - B - DLT', '59', '40', '', '1', '', '2', null, null, null, '2020-07-03 16:16:26', '39297',
        '0', '27', '2', '2020-07-03 16:16:26', '453', '2020-07-03 16:16:26', '453', '454');
INSERT INTO `kelas`
VALUES ('825', 'XI - IPS - B - KOM', '59', '10', '', '1', '', '2', null, null, null, '2020-08-12 14:56:26', '935', '0',
        '2', '2', '2020-07-03 16:17:45', '453', '2020-08-12 14:56:26', '320', '454');
INSERT INTO `kelas`
VALUES ('826', 'XII - IPS - A - DL', '59', '40', '', '1', '', '3', null, null, null, '2020-07-16 10:10:25', '10641',
        '0', '1', '2', '2020-07-03 16:20:21', '453', '2020-07-16 10:10:25', '453', '342');
INSERT INTO `kelas`
VALUES ('827', 'XII - IPS - A - DLT', '59', '40', '', '1', '', '3', null, null, null, '2020-07-16 10:12:59', '34501',
        '0', '27', '2', '2020-07-03 16:21:22', '453', '2020-07-16 10:12:59', '453', '342');
INSERT INTO `kelas`
VALUES ('828', 'XII - IPS - A - KOM', '59', '10', '', '1', '', '3', null, null, null, '2020-08-12 14:56:57', '30080',
        '0', '2', '2', '2020-07-03 16:22:13', '453', '2020-08-12 14:56:57', '320', '342');
INSERT INTO `kelas`
VALUES ('829', 'XII - IPS - B - DL', '59', '40', '', '1', '', '3', null, null, null, '2020-07-16 13:48:49', '22154',
        '0', '1', '2', '2020-07-03 16:23:50', '453', '2020-07-16 13:48:49', '453', '352');
INSERT INTO `kelas`
VALUES ('830', 'XII - IPS - B - DLT', '59', '40', '', '1', '', '3', null, null, null, '2020-07-16 10:40:59', '11365',
        '0', '27', '2', '2020-07-03 16:24:37', '453', '2020-07-16 10:40:59', '453', '352');
INSERT INTO `kelas`
VALUES ('831', 'XII - IPS - B - KOM', '59', '10', '', '1', '', '3', null, null, null, '2020-08-12 14:57:04', '31679',
        '0', '2', '2', '2020-07-03 16:25:34', '453', '2020-08-12 14:57:04', '320', '342');
INSERT INTO `kelas`
VALUES ('832', 'XII - IPS - C - KOM', '59', '10', '', '1', '', '3', null, null, null, '2020-08-12 14:57:13', '50036',
        '0', '2', '2', '2020-07-09 14:42:05', '453', '2020-08-12 14:57:13', '320', '352');
INSERT INTO `kelas`
VALUES ('833', 'I - KOMO', '62', '25', '', '1', '', '7', null, null, null, '2020-10-19 11:34:25', '29420', '0', '29',
        '0', '2020-07-15 14:42:47', '117', '2020-10-19 11:34:25', '117', '513');
INSERT INTO `kelas`
VALUES ('834', 'II - KOMO', '62', '25', '', '1', '', '8', null, null, null, '2020-07-15 14:48:19', '59705', '0', '29',
        '0', '2020-07-15 14:48:19', '117', '2020-07-15 14:48:19', '117', '230');
INSERT INTO `kelas`
VALUES ('835', 'III - KOMO', '62', '25', '', '1', '', '9', null, null, null, '2020-07-15 14:56:55', '59979', '0', '29',
        '0', '2020-07-15 14:56:55', '117', '2020-07-15 14:56:55', '117', '217');
INSERT INTO `kelas`
VALUES ('836', 'IV - KOMO', '62', '25', '', '1', '', '10', null, null, null, '2020-07-15 14:57:40', '46313', '0', '29',
        '0', '2020-07-15 14:57:40', '117', '2020-07-15 14:57:40', '117', '108');
INSERT INTO `kelas`
VALUES ('837', 'V - KOMO', '62', '25', '', '1', '', '11', null, null, null, '2021-07-06 11:18:35', '4256', '0', '29',
        '0', '2020-07-15 14:58:27', '117', '2021-07-06 11:18:35', '117', '343');
INSERT INTO `kelas`
VALUES ('838', 'VI - KOMO', '62', '25', '', '1', '', '12', null, null, null, '2020-07-15 14:59:00', '46287', '0', '29',
        '0', '2020-07-15 14:59:00', '117', '2020-07-15 14:59:00', '117', '151');
INSERT INTO `kelas`
VALUES ('839', 'VII A - DLT', '61', '40', '', '1', '', '4', null, null, null, '2021-02-02 14:17:42', '54086', '0', '28',
        '0', '2020-07-21 11:00:50', '452', '2021-02-02 14:17:42', '452', '369');
INSERT INTO `kelas`
VALUES ('840', 'VII A - KOMO', '61', '30', '', '1', '', '4', null, null, null, '2021-02-02 14:21:32', '27619', '0',
        '30', '0', '2020-07-21 11:01:53', '452', '2021-02-02 14:21:32', '452', '369');
INSERT INTO `kelas`
VALUES ('841', 'VIII - DLT', '61', '40', '', '1', '', '5', null, null, null, '2020-07-21 11:08:56', '11000', '0', '28',
        '0', '2020-07-21 11:08:56', '452', '2020-07-21 11:08:56', '452', '269');
INSERT INTO `kelas`
VALUES ('842', 'VIII - KOMO', '61', '30', '', '1', '', '5', null, null, null, '2020-07-21 11:09:43', '42911', '0', '30',
        '0', '2020-07-21 11:09:43', '452', '2020-07-21 11:09:43', '452', '269');
INSERT INTO `kelas`
VALUES ('843', 'IX A - DLT', '61', '40', '', '1', '', '6', null, null, null, '2020-07-21 11:11:43', '40727', '0', '28',
        '0', '2020-07-21 11:11:43', '452', '2020-07-21 11:11:43', '452', '132');
INSERT INTO `kelas`
VALUES ('844', 'IX A - KOMO', '61', '30', '', '1', '', '6', null, null, null, '2020-07-21 11:12:24', '20491', '0', '30',
        '0', '2020-07-21 11:12:24', '452', '2020-07-21 11:12:24', '452', '132');
INSERT INTO `kelas`
VALUES ('845', 'IX B - DLT', '61', '40', '', '1', '', '6', null, null, null, '2020-07-21 11:12:59', '53582', '0', '28',
        '0', '2020-07-21 11:12:59', '452', '2020-07-21 11:12:59', '452', '324');
INSERT INTO `kelas`
VALUES ('846', 'IX B - KOMO', '61', '30', '', '1', '', '6', null, null, null, '2020-07-21 11:13:33', '59056', '0', '30',
        '0', '2020-07-21 11:13:32', '452', '2020-07-21 11:13:32', '452', '324');
INSERT INTO `kelas`
VALUES ('847', 'X - IPS - KOMO', '59', '30', '', '1', '', '1', null, null, null, '2020-07-24 11:43:25', '43090', '0',
        '31', '2', '2020-07-24 11:43:25', '453', '2020-07-24 11:43:25', '453', '406');
INSERT INTO `kelas`
VALUES ('848', 'X - IPA - KOMO', '59', '30', '', '1', '', '1', null, null, null, '2020-07-24 11:45:02', '60899', '0',
        '31', '1', '2020-07-24 11:45:02', '453', '2020-07-24 11:45:02', '453', '130');
INSERT INTO `kelas`
VALUES ('849', 'XI - IPS - KOMO', '59', '30', '', '1', '', '2', null, null, null, '2020-07-24 11:47:07', '58200', '0',
        '31', '2', '2020-07-24 11:47:07', '453', '2020-07-24 11:47:07', '453', '381');
INSERT INTO `kelas`
VALUES ('850', 'XI - IPA - KOMO', '59', '30', '', '1', '', '2', null, null, null, '2020-07-24 11:49:08', '12984', '0',
        '31', '1', '2020-07-24 11:49:08', '453', '2020-07-24 11:49:08', '453', '153');
INSERT INTO `kelas`
VALUES ('851', 'XII - IPA - KOMO', '59', '30', '', '1', '', '3', null, null, null, '2020-07-27 10:18:33', '31906', '0',
        '31', '1', '2020-07-27 10:18:33', '453', '2020-07-27 10:18:33', '453', '208');
INSERT INTO `kelas`
VALUES ('852', 'XII - IPS - KOMO', '59', '30', '', '1', '', '3', null, null, null, '2020-07-27 10:30:23', '12654', '0',
        '31', '2', '2020-07-27 10:30:23', '453', '2020-07-27 10:30:23', '453', '342');
INSERT INTO `kelas`
VALUES ('853', 'I - A', '79', '5', '', '1', '', '7', null, null, null, '2020-07-28 13:29:10', '57367', '0', '6', '3',
        '2020-07-28 13:12:45', '117', '2020-07-28 13:29:10', '117', '248');
INSERT INTO `kelas`
VALUES ('854', 'I - B', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:46:54', '38983', '0', '6', '4',
        '2020-07-28 13:27:03', '117', '2020-09-09 11:46:54', '117', '248');
INSERT INTO `kelas`
VALUES ('855', 'I - C', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:46:45', '58944', '0', '6', '5',
        '2020-07-28 13:27:43', '117', '2020-09-09 11:46:45', '117', '248');
INSERT INTO `kelas`
VALUES ('856', 'I - D', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:46:37', '10674', '0', '6', '6',
        '2020-07-28 13:28:33', '117', '2020-09-09 11:46:37', '117', '248');
INSERT INTO `kelas`
VALUES ('857', 'I - Q', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:49:03', '28180', '0', '6', '7',
        '2020-07-28 13:30:02', '117', '2020-09-09 11:49:03', '117', '248');
INSERT INTO `kelas`
VALUES ('858', 'II - A - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:00:02', '61361', '0', '6',
        '3', '2020-07-28 17:37:18', '117', '2020-10-15 15:00:02', '117', '387');
INSERT INTO `kelas`
VALUES ('859', 'II - B - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:04:08', '60169', '0', '6',
        '4', '2020-07-28 17:38:06', '117', '2020-10-15 15:04:08', '117', '387');
INSERT INTO `kelas`
VALUES ('860', 'II - C - I', '79', '5', '', '1', '', '8', null, null, null, '2020-07-28 17:39:08', '4421', '0', '6',
        '5', '2020-07-28 17:39:08', '117', '2020-07-28 17:39:08', '117', '387');
INSERT INTO `kelas`
VALUES ('861', 'II - D - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:05:50', '48212', '0', '6',
        '6', '2020-07-28 17:39:44', '117', '2020-10-15 15:05:50', '117', '387');
INSERT INTO `kelas`
VALUES ('862', 'II - Q - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:16', '51554', '0', '6',
        '7', '2020-07-28 17:40:24', '117', '2020-10-15 15:07:16', '117', '387');
INSERT INTO `kelas`
VALUES ('863', 'II - A - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:04:00', '23201', '0', '6',
        '3', '2020-07-28 17:41:07', '117', '2020-10-15 15:04:00', '117', '473');
INSERT INTO `kelas`
VALUES ('864', 'II - B - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:04:14', '62783', '0', '6',
        '4', '2020-07-28 17:41:55', '117', '2020-10-15 15:04:14', '117', '473');
INSERT INTO `kelas`
VALUES ('865', 'II - C - II', '79', '5', '', '0', '', '8', null, null, null, '2021-03-31 09:40:51', '18680', '0', '6',
        '5', '2020-07-28 17:42:30', '117', '2021-03-31 09:40:51', '117', '519');
INSERT INTO `kelas`
VALUES ('866', 'II - D - II', '79', '5', '', '0', '', '8', null, null, null, '2021-03-31 09:41:19', '53384', '0', '6',
        '6', '2020-07-28 17:43:12', '117', '2021-03-31 09:41:19', '117', '519');
INSERT INTO `kelas`
VALUES ('867', 'II - Q - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:04:46', '58324', '0', '6',
        '7', '2020-07-28 17:43:50', '117', '2020-10-15 15:04:46', '117', '473');
INSERT INTO `kelas`
VALUES ('868', 'III - A', '79', '5', '', '1', '', '9', null, null, null, '2020-07-28 17:44:31', '12154', '0', '6', '3',
        '2020-07-28 17:44:31', '117', '2020-07-28 17:44:31', '117', '480');
INSERT INTO `kelas`
VALUES ('869', 'III - B', '79', '5', '', '1', '', '9', null, null, null, '2020-07-28 17:45:14', '7382', '0', '6', '4',
        '2020-07-28 17:45:14', '117', '2020-07-28 17:45:14', '117', '480');
INSERT INTO `kelas`
VALUES ('870', 'III - C', '79', '5', '', '1', '', '9', null, null, null, '2020-07-28 17:45:44', '32922', '0', '6', '5',
        '2020-07-28 17:45:44', '117', '2020-07-28 17:45:44', '117', '480');
INSERT INTO `kelas`
VALUES ('871', 'III - D', '79', '5', '', '1', '', '9', null, null, null, '2020-07-28 17:46:13', '43039', '0', '6', '6',
        '2020-07-28 17:46:13', '117', '2020-07-28 17:46:13', '117', '480');
INSERT INTO `kelas`
VALUES ('872', 'III - Q', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:37:20', '7401', '0', '6', '7',
        '2020-07-28 17:46:44', '117', '2020-09-09 13:37:20', '117', '480');
INSERT INTO `kelas`
VALUES ('873', 'IV - A', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:44:33', '26772', '0', '6', '3',
        '2020-07-28 17:47:31', '117', '2021-03-10 11:44:33', '117', '248');
INSERT INTO `kelas`
VALUES ('874', 'IV - B', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:44:46', '22957', '0', '6', '4',
        '2020-07-28 17:48:05', '117', '2021-03-10 11:44:46', '117', '248');
INSERT INTO `kelas`
VALUES ('875', 'IV - C', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:00', '12262', '0', '6', '5',
        '2020-07-28 17:48:37', '117', '2021-03-10 11:45:00', '117', '248');
INSERT INTO `kelas`
VALUES ('876', 'IV - D', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:24', '19598', '0', '6', '6',
        '2020-07-28 17:49:11', '117', '2021-03-10 11:45:24', '117', '248');
INSERT INTO `kelas`
VALUES ('877', 'IV - Q', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:34', '50897', '0', '6', '7',
        '2020-07-28 17:49:48', '117', '2021-03-10 11:45:34', '117', '248');
INSERT INTO `kelas`
VALUES ('878', 'V - A', '79', '5', '', '1', '', '11', null, null, null, '2020-07-28 17:50:29', '25936', '0', '6', '3',
        '2020-07-28 17:50:29', '117', '2020-07-28 17:50:29', '117', '485');
INSERT INTO `kelas`
VALUES ('879', 'V - B', '79', '5', '', '1', '', '11', null, null, null, '2020-07-28 17:50:57', '18685', '0', '6', '4',
        '2020-07-28 17:50:57', '117', '2020-07-28 17:50:57', '117', '485');
INSERT INTO `kelas`
VALUES ('880', 'V - C', '79', '5', '', '1', '', '11', null, null, null, '2020-07-28 17:51:22', '64070', '0', '6', '5',
        '2020-07-28 17:51:22', '117', '2020-07-28 17:51:22', '117', '485');
INSERT INTO `kelas`
VALUES ('881', 'V - D', '79', '5', '', '1', '', '11', null, null, null, '2020-07-28 17:52:01', '8515', '0', '6', '6',
        '2020-07-28 17:52:01', '117', '2020-07-28 17:52:01', '117', '485');
INSERT INTO `kelas`
VALUES ('882', 'V - Q', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 13:55:32', '40455', '0', '6', '7',
        '2020-07-28 17:52:40', '117', '2020-09-09 13:55:32', '117', '485');
INSERT INTO `kelas`
VALUES ('883', 'I-KOM', '80', '10', '', '1', '', '7', null, null, null, '2022-04-14 13:45:09', '63167', '0', '38', '0',
        '2020-08-18 19:50:30', '503', '2020-08-18 19:50:30', '503', '490');
INSERT INTO `kelas`
VALUES ('884', 'II-KOM', '80', '10', '', '1', '', '8', null, null, null, '2022-04-14 13:45:09', '16659', '0', '38', '0',
        '2020-08-18 19:50:30', '503', '2020-08-18 20:00:47', '503', '490');
INSERT INTO `kelas`
VALUES ('885', 'III-KOM', '80', '10', '', '1', '', '9', null, null, null, '2022-04-14 13:45:09', '51570', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2020-08-18 19:50:30', '503', null);
INSERT INTO `kelas`
VALUES ('886', 'IV-KOM', '80', '10', '', '1', '', '10', null, null, null, '2022-04-14 13:45:09', '11284', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2020-08-18 19:50:30', '503', null);
INSERT INTO `kelas`
VALUES ('887', 'V-KOM', '80', '10', '', '1', '', '11', null, null, null, '2022-04-14 13:45:09', '32770', '0', '38', '0',
        '2020-08-18 19:50:30', '503', '2020-08-18 20:01:42', '503', '491');
INSERT INTO `kelas`
VALUES ('888', 'VI-KOM', '80', '10', '', '1', '', '12', null, null, null, '2022-04-14 13:45:09', '64465', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2020-08-18 20:02:08', '503', '491');
INSERT INTO `kelas`
VALUES ('889', 'VII-KOM', '81', '13', '', '1', '', '4', null, null, null, '2022-04-14 13:44:49', '27426', '0', '39',
        '0', '2020-08-18 19:50:30', '503', '2020-08-18 20:18:11', '503', '492');
INSERT INTO `kelas`
VALUES ('890', 'VIII-KOM', '81', '13', '', '1', '', '5', null, null, null, '2022-04-14 13:44:49', '9262', '0', '39',
        '0', '2020-08-18 19:50:30', '503', '2020-09-26 11:37:43', '503', '493');
INSERT INTO `kelas`
VALUES ('891', 'IX-KOM', '81', '13', '', '1', '', '6', null, null, null, '2022-04-14 13:44:49', '29565', '0', '39', '0',
        '2020-08-18 19:50:30', '503', '2020-08-18 20:18:31', '503', '494');
INSERT INTO `kelas`
VALUES ('892', 'X-IPA-KOM', '82', '13', '', '1', '', '1', null, null, null, '2022-04-14 13:44:08', '54506', '0', '40',
        '1', '2020-08-18 19:50:30', '503', '2020-08-18 20:16:57', '503', '495');
INSERT INTO `kelas`
VALUES ('893', 'XI-IPA-KOM', '82', '13', '', '1', '', '2', null, null, null, '2022-04-14 13:44:08', '52775', '0', '40',
        '1', '2020-08-18 19:50:30', '503', '2020-09-26 10:26:18', '503', '497');
INSERT INTO `kelas`
VALUES ('894', 'XII-IPA-KOM', '82', '10', '', '1', '', '3', null, null, null, '2022-04-14 13:44:08', '34826', '0', '40',
        '1', '2020-08-18 19:50:30', '503', '2020-08-18 19:50:30', '503', null);
INSERT INTO `kelas`
VALUES ('895', 'XII-IPS-KOM', '82', '13', '', '1', '', '3', null, null, null, '2022-04-14 13:44:08', '15806', '0', '40',
        '2', '2020-08-18 19:50:30', '503', '2020-08-18 20:16:43', '503', '497');
INSERT INTO `kelas`
VALUES ('896', 'XI-IPS-KOM', '82', '10', '', '1', '', '2', null, null, null, '2022-04-14 13:44:08', '40080', '0', '40',
        '2', '2020-08-18 19:50:30', '503', '2020-09-25 21:47:00', '503', '511');
INSERT INTO `kelas`
VALUES ('897', 'X-IPS-KOM', '82', '13', '', '1', '', '1', null, null, null, '2022-04-14 13:44:08', '21924', '0', '40',
        '2', '2020-08-18 19:50:30', '503', '2020-08-18 20:17:09', '503', '496');
INSERT INTO `kelas`
VALUES ('898', '1', '84', '20', '112008052014', '1', '', '7', null, null, null, '2020-08-25 14:14:20', '365', '0', '6',
        '0', null, null, '2020-08-25 14:14:20', '117', '462');
INSERT INTO `kelas`
VALUES ('899', 'I', '85', '20', '112008052014', '1', '', '7', null, null, null, '2020-10-19 11:35:45', '9671', '0', '6',
        '0', '0000-00-00 00:00:00', null, '2020-10-19 11:35:45', '117', '513');
INSERT INTO `kelas`
VALUES ('900', 'II', '85', '20', '112008052014', '1', '', '8', null, null, null, '2020-10-19 16:10:30', '47259', '0',
        '6', '0', '0000-00-00 00:00:00', null, '2020-10-19 16:10:30', '117', '230');
INSERT INTO `kelas`
VALUES ('901', 'X - IPS - A - KOM', '59', '10', '', '1', '', '1', null, null, null, '2022-09-20 14:20:39', '46294', '0',
        '2', '2', '2020-09-04 10:54:49', '453', '2022-09-20 14:20:39', '120', '412');
INSERT INTO `kelas`
VALUES ('902', 'II - C1 - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:04:36', '57534', '0', '6',
        '8', '2020-09-09 11:29:06', '117', '2020-10-15 15:04:36', '117', '387');
INSERT INTO `kelas`
VALUES ('905', 'I - C1', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:42:48', '14506', '0', '6', '8',
        '2020-09-09 11:42:48', '117', '2020-09-09 11:42:48', '117', '248');
INSERT INTO `kelas`
VALUES ('907', 'I - D1', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:46:26', '41025', '0', '6', '9',
        '2020-09-09 11:44:43', '117', '2020-09-09 11:46:26', '117', '248');
INSERT INTO `kelas`
VALUES ('908', 'I - E', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:48:36', '34883', '0', '6', '10',
        '2020-09-09 11:48:36', '117', '2020-09-09 11:48:36', '117', '248');
INSERT INTO `kelas`
VALUES ('909', 'I - F', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:49:53', '14812', '0', '6', '11',
        '2020-09-09 11:49:53', '117', '2020-09-09 11:49:53', '117', '248');
INSERT INTO `kelas`
VALUES ('910', 'I - H', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:50:33', '4432', '0', '6', '12',
        '2020-09-09 11:50:33', '117', '2020-09-09 11:50:33', '117', '248');
INSERT INTO `kelas`
VALUES ('911', 'I - I', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:52:28', '31359', '0', '6', '13',
        '2020-09-09 11:51:33', '117', '2020-09-09 11:52:28', '117', '248');
INSERT INTO `kelas`
VALUES ('912', 'I - J', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:53:12', '12673', '0', '6', '14',
        '2020-09-09 11:53:12', '117', '2020-09-09 11:53:12', '117', '248');
INSERT INTO `kelas`
VALUES ('913', 'I - K', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:53:50', '29249', '0', '6', '15',
        '2020-09-09 11:53:50', '117', '2020-09-09 11:53:50', '117', '248');
INSERT INTO `kelas`
VALUES ('914', 'I - N', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:54:52', '65388', '0', '6', '16',
        '2020-09-09 11:54:52', '117', '2020-09-09 11:54:52', '117', '248');
INSERT INTO `kelas`
VALUES ('915', 'I - O', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:56:04', '65413', '0', '6', '17',
        '2020-09-09 11:56:04', '117', '2020-09-09 11:56:04', '117', '248');
INSERT INTO `kelas`
VALUES ('916', 'I - P', '79', '5', '', '1', '', '7', null, null, null, '2020-09-09 11:56:53', '13247', '0', '6', '18',
        '2020-09-09 11:56:53', '117', '2020-09-09 11:56:53', '117', '248');
INSERT INTO `kelas`
VALUES ('917', 'II - C1 - I', '79', '5', '', '1', '', '8', null, null, null, '2021-03-31 09:41:03', '3953', '0', '6',
        '8', '2020-09-09 13:15:25', '117', '2021-03-31 09:41:03', '117', '519');
INSERT INTO `kelas`
VALUES ('918', 'II - D1 - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:01', '16396', '0', '6',
        '9', '2020-09-09 13:16:18', '117', '2020-10-15 15:06:01', '117', '387');
INSERT INTO `kelas`
VALUES ('919', 'II - E - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:11', '25570', '0', '6',
        '10', '2020-09-09 13:17:47', '117', '2020-10-15 15:06:11', '117', '387');
INSERT INTO `kelas`
VALUES ('920', 'II - F - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:20', '29225', '0', '6',
        '11', '2020-09-09 13:19:09', '117', '2020-10-15 15:06:20', '117', '387');
INSERT INTO `kelas`
VALUES ('921', 'II - H - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:27', '50150', '0', '6',
        '12', '2020-09-09 13:20:06', '117', '2020-10-15 15:06:27', '117', '387');
INSERT INTO `kelas`
VALUES ('922', 'II - I - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:33', '19928', '0', '6',
        '13', '2020-09-09 13:20:51', '117', '2020-10-15 15:06:33', '117', '387');
INSERT INTO `kelas`
VALUES ('923', 'II - J - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:42', '8652', '0', '6',
        '14', '2020-09-09 13:21:34', '117', '2020-10-15 15:06:42', '117', '387');
INSERT INTO `kelas`
VALUES ('924', 'II - K - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:49', '48736', '0', '6',
        '15', '2020-09-09 13:22:20', '117', '2020-10-15 15:06:49', '117', '387');
INSERT INTO `kelas`
VALUES ('925', 'II - N - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:47', '53701', '0', '6',
        '16', '2020-09-09 13:23:03', '117', '2020-10-15 15:07:47', '117', '387');
INSERT INTO `kelas`
VALUES ('926', 'II - O - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:00', '39003', '0', '6',
        '17', '2020-09-09 13:26:25', '117', '2020-10-15 15:07:00', '117', '387');
INSERT INTO `kelas`
VALUES ('927', 'II - P - I', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:09', '28190', '0', '6',
        '18', '2020-09-09 13:27:18', '117', '2020-10-15 15:07:09', '117', '387');
INSERT INTO `kelas`
VALUES ('928', 'II - D1 - II', '79', '5', '', '0', '', '8', null, null, null, '2021-03-31 09:41:34', '7805', '0', '6',
        '9', '2020-09-09 13:28:48', '117', '2021-03-31 09:41:34', '117', '519');
INSERT INTO `kelas`
VALUES ('929', 'II - E - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:16', '45414', '0', '6',
        '10', '2020-09-09 13:30:01', '117', '2020-10-15 15:06:16', '117', '473');
INSERT INTO `kelas`
VALUES ('930', 'II - F - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:24', '6863', '0', '6',
        '11', '2020-09-09 13:34:14', '117', '2020-10-15 15:06:24', '117', '473');
INSERT INTO `kelas`
VALUES ('931', 'II - H - II', '79', '5', '', '1', '', '8', null, null, null, '2020-09-09 13:34:30', '23375', '0', '6',
        '12', '2020-09-09 13:34:30', '117', '2020-09-09 13:34:30', '117', '473');
INSERT INTO `kelas`
VALUES ('932', 'II - I - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:37', '41848', '0', '6',
        '13', '2020-09-09 13:34:45', '117', '2020-10-15 15:06:37', '117', '473');
INSERT INTO `kelas`
VALUES ('933', 'II - J - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:46', '59722', '0', '6',
        '14', '2020-09-09 13:35:03', '117', '2020-10-15 15:06:46', '117', '473');
INSERT INTO `kelas`
VALUES ('934', 'II - K - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:53', '29522', '0', '6',
        '15', '2020-09-09 13:35:26', '117', '2020-10-15 15:06:53', '117', '473');
INSERT INTO `kelas`
VALUES ('935', 'II - N - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:06:57', '11359', '0', '6',
        '16', '2020-09-09 13:35:43', '117', '2020-10-15 15:06:57', '117', '473');
INSERT INTO `kelas`
VALUES ('936', 'II - O - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:05', '23879', '0', '6',
        '17', '2020-09-09 13:35:59', '117', '2020-10-15 15:07:05', '117', '473');
INSERT INTO `kelas`
VALUES ('937', 'II - P - II', '79', '5', '', '0', '', '8', null, null, null, '2020-10-15 15:07:12', '28026', '0', '6',
        '18', '2020-09-09 13:36:23', '117', '2020-10-15 15:07:12', '117', '473');
INSERT INTO `kelas`
VALUES ('938', 'III - C1', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:42:32', '24064', '0', '6', '8',
        '2020-09-09 13:42:32', '117', '2020-09-09 13:42:32', '117', '480');
INSERT INTO `kelas`
VALUES ('939', 'III - D1', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:42:36', '921', '0', '6', '9',
        '2020-09-09 13:42:36', '117', '2020-09-09 13:42:36', '117', '480');
INSERT INTO `kelas`
VALUES ('940', 'III - E', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:43:27', '611', '0', '6', '10',
        '2020-09-09 13:43:27', '117', '2020-09-09 13:43:27', '117', '480');
INSERT INTO `kelas`
VALUES ('941', 'III - F', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:43:46', '45415', '0', '6', '11',
        '2020-09-09 13:43:46', '117', '2020-09-09 13:43:46', '117', '480');
INSERT INTO `kelas`
VALUES ('942', 'III - H', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:44:09', '63372', '0', '6', '12',
        '2020-09-09 13:44:09', '117', '2020-09-09 13:44:09', '117', '480');
INSERT INTO `kelas`
VALUES ('943', 'III - I', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:44:30', '1688', '0', '6', '13',
        '2020-09-09 13:44:30', '117', '2020-09-09 13:44:30', '117', '480');
INSERT INTO `kelas`
VALUES ('944', 'III - J', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:44:48', '25226', '0', '6', '14',
        '2020-09-09 13:44:48', '117', '2020-09-09 13:44:48', '117', '480');
INSERT INTO `kelas`
VALUES ('945', 'III - K', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:45:06', '48952', '0', '6', '15',
        '2020-09-09 13:45:06', '117', '2020-09-09 13:45:06', '117', '480');
INSERT INTO `kelas`
VALUES ('946', 'III - N', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:45:23', '61036', '0', '6', '16',
        '2020-09-09 13:45:23', '117', '2020-09-09 13:45:23', '117', '480');
INSERT INTO `kelas`
VALUES ('947', 'III - O', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:45:40', '45171', '0', '6', '17',
        '2020-09-09 13:45:40', '117', '2020-09-09 13:45:40', '117', '480');
INSERT INTO `kelas`
VALUES ('948', 'III - P', '79', '5', '', '1', '', '9', null, null, null, '2020-09-09 13:45:55', '39211', '0', '6', '18',
        '2020-09-09 13:45:55', '117', '2020-09-09 13:45:55', '117', '480');
INSERT INTO `kelas`
VALUES ('949', 'IV - C1', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:11', '4675', '0', '6', '8',
        '2020-09-09 13:51:25', '117', '2021-03-10 11:45:11', '117', '248');
INSERT INTO `kelas`
VALUES ('950', 'IV - D1', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:16', '1641', '0', '6', '9',
        '2020-09-09 13:51:46', '117', '2021-03-10 11:46:16', '117', '248');
INSERT INTO `kelas`
VALUES ('951', 'IV - E', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:26', '44345', '0', '6', '10',
        '2020-09-09 13:52:08', '117', '2021-03-10 11:46:26', '117', '248');
INSERT INTO `kelas`
VALUES ('952', 'IV - F', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:38', '403', '0', '6', '11',
        '2020-09-09 13:52:27', '117', '2021-03-10 11:46:38', '117', '248');
INSERT INTO `kelas`
VALUES ('953', 'IV - H', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:46', '33259', '0', '6', '12',
        '2020-09-09 13:52:46', '117', '2021-03-10 11:46:46', '117', '248');
INSERT INTO `kelas`
VALUES ('954', 'IV - I', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:55', '54273', '0', '6', '13',
        '2020-09-09 13:53:04', '117', '2021-03-10 11:46:55', '117', '248');
INSERT INTO `kelas`
VALUES ('955', 'IV - J', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:47:03', '56652', '0', '6', '14',
        '2020-09-09 13:53:23', '117', '2021-03-10 11:47:03', '117', '248');
INSERT INTO `kelas`
VALUES ('956', 'IV - K', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:47:11', '10227', '0', '6', '15',
        '2020-09-09 13:53:41', '117', '2021-03-10 11:47:11', '117', '248');
INSERT INTO `kelas`
VALUES ('957', 'IV - N', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:46:06', '2437', '0', '6', '16',
        '2020-09-09 13:54:01', '117', '2021-03-10 11:46:06', '117', '248');
INSERT INTO `kelas`
VALUES ('958', 'IV - O', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:54', '37649', '0', '6', '17',
        '2020-09-09 13:54:22', '117', '2021-03-10 11:45:54', '117', '248');
INSERT INTO `kelas`
VALUES ('959', 'IV - P', '79', '5', '', '1', '', '10', null, null, null, '2021-03-10 11:45:44', '46847', '0', '6', '18',
        '2020-09-09 13:54:44', '117', '2021-03-10 11:45:44', '117', '248');
INSERT INTO `kelas`
VALUES ('960', 'V - C1', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:03:03', '30024', '0', '6', '8',
        '2020-09-09 14:03:03', '117', '2020-09-09 14:03:03', '117', '485');
INSERT INTO `kelas`
VALUES ('961', 'V - D1', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:03:35', '44367', '0', '6', '9',
        '2020-09-09 14:03:35', '117', '2020-09-09 14:03:35', '117', '485');
INSERT INTO `kelas`
VALUES ('962', 'V - E', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:03:58', '22959', '0', '6', '10',
        '2020-09-09 14:03:58', '117', '2020-09-09 14:03:58', '117', '485');
INSERT INTO `kelas`
VALUES ('963', 'V - H', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:04:34', '50420', '0', '6', '12',
        '2020-09-09 14:04:34', '117', '2020-09-09 14:04:34', '117', '485');
INSERT INTO `kelas`
VALUES ('964', 'V - F', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:05:02', '11087', '0', '6', '11',
        '2020-09-09 14:05:02', '117', '2020-09-09 14:05:02', '117', '485');
INSERT INTO `kelas`
VALUES ('965', 'V - I', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:05:25', '53849', '0', '6', '13',
        '2020-09-09 14:05:25', '117', '2020-09-09 14:05:25', '117', '485');
INSERT INTO `kelas`
VALUES ('966', 'V - J', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:05:43', '7198', '0', '6', '14',
        '2020-09-09 14:05:43', '117', '2020-09-09 14:05:43', '117', '485');
INSERT INTO `kelas`
VALUES ('967', 'V - K', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:06:04', '14117', '0', '6', '15',
        '2020-09-09 14:06:04', '117', '2020-09-09 14:06:04', '117', '485');
INSERT INTO `kelas`
VALUES ('968', 'V - N', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:06:22', '27424', '0', '6', '16',
        '2020-09-09 14:06:22', '117', '2020-09-09 14:06:22', '117', '485');
INSERT INTO `kelas`
VALUES ('969', 'V - O', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:06:47', '33232', '0', '6', '17',
        '2020-09-09 14:06:47', '117', '2020-09-09 14:06:47', '117', '485');
INSERT INTO `kelas`
VALUES ('970', 'V - P', '79', '5', '', '1', '', '11', null, null, null, '2020-09-09 14:07:09', '46294', '0', '6', '18',
        '2020-09-09 14:07:09', '117', '2020-09-09 14:07:09', '117', '485');
INSERT INTO `kelas`
VALUES ('971', 'X - IPS - A - DL', '59', '40', '', '1', '', '1', null, null, null, '2022-09-20 14:20:19', '9916', '0',
        '1', '2', '2020-09-10 16:26:19', '453', '2022-09-20 14:20:19', '120', '412');
INSERT INTO `kelas`
VALUES ('972', 'I - DL', '87', '40', '', '1', '', '7', null, null, null, '2020-10-19 11:32:37', '65428', '0', '5', '0',
        '2020-09-15 14:08:18', '117', '2020-10-19 11:32:37', '117', '513');
INSERT INTO `kelas`
VALUES ('973', 'I - DLT', '87', '40', '', '1', '', '7', null, null, null, '2020-10-19 11:32:52', '42983', '0', '26',
        '0', '2020-09-15 14:12:28', '117', '2020-10-19 11:32:52', '117', '513');
INSERT INTO `kelas`
VALUES ('974', 'I - KOM', '87', '10', '', '1', '', '7', null, null, null, '2020-10-19 11:33:08', '63863', '0', '6', '0',
        '2020-09-15 14:14:03', '117', '2020-10-19 11:33:08', '117', '513');
INSERT INTO `kelas`
VALUES ('975', 'I - KOMO', '87', '25', '', '1', '', '7', null, null, null, '2020-10-19 11:33:18', '15402', '0', '29',
        '0', '2020-09-15 14:14:55', '117', '2020-10-19 11:33:18', '117', '513');
INSERT INTO `kelas`
VALUES ('976', 'I - RA', '87', '3', '', '1', '', '7', null, null, null, '2020-10-23 15:34:08', '56836', '0', '21', '0',
        '2020-09-15 14:15:52', '117', '2020-10-23 15:34:08', '117', '513');
INSERT INTO `kelas`
VALUES ('977', 'II - DL', '87', '40', '', '1', '', '8', null, null, null, '2020-10-19 10:51:50', '19773', '0', '5', '0',
        '2020-09-15 14:23:39', '117', '2020-10-19 10:51:50', '117', '230');
INSERT INTO `kelas`
VALUES ('978', 'II - DLT', '87', '40', '', '1', '', '8', null, null, null, '2020-10-19 10:51:55', '48208', '0', '26',
        '0', '2020-09-15 14:24:17', '117', '2020-10-19 10:51:55', '117', '230');
INSERT INTO `kelas`
VALUES ('979', 'II - KOM', '87', '10', '', '1', '', '8', null, null, null, '2020-10-19 10:52:00', '30030', '0', '6',
        '0', '2020-09-15 14:24:56', '117', '2020-10-19 10:52:00', '117', '230');
INSERT INTO `kelas`
VALUES ('980', 'XII - IPA - DL', '88', '40', '', '1', '', '3', null, null, null, '2021-07-07 08:56:02', '29236', '0',
        '1', '1', '2020-09-15 14:45:09', '453', '2021-07-07 08:56:02', '453', '406');
INSERT INTO `kelas`
VALUES ('981', 'VII B - KOM', '61', '12', '', '1', '', '4', null, null, null, '2021-06-28 11:38:05', '21723', '0', '4',
        '0', '2020-09-18 15:04:14', '452', '2021-06-28 11:38:05', '452', '369');
INSERT INTO `kelas`
VALUES ('982', 'XI - IPA - DL', '88', '40', '', '1', '', '2', null, null, null, '2021-11-01 15:14:31', '57091', '0',
        '1', '1', '2020-10-01 08:24:15', '453', '2021-11-01 15:14:31', '120', '469');
INSERT INTO `kelas`
VALUES ('983', 'XI - IPS - A - DL', '88', '40', '', '1', '', '2', null, null, null, '2021-07-07 08:49:02', '56483', '0',
        '1', '2', '2020-10-01 08:26:08', '453', '2021-07-07 08:49:02', '453', '153');
INSERT INTO `kelas`
VALUES ('984', 'XI - IPS - B - DL', '88', '40', '', '1', '', '2', null, null, null, '2021-07-07 08:52:19', '48282', '0',
        '1', '2', '2020-10-01 08:27:01', '453', '2021-07-07 08:52:19', '453', '486');
INSERT INTO `kelas`
VALUES ('985', 'XI - IPA - DLT', '88', '40', '', '1', '', '2', null, null, null, '2021-11-01 15:15:58', '23195', '0',
        '27', '1', '2020-10-01 08:29:03', '453', '2021-11-01 15:15:58', '120', '469');
INSERT INTO `kelas`
VALUES ('987', 'II - KOMO', '87', '25', '', '1', '', '8', null, null, null, '2020-10-19 10:52:04', '56240', '0', '29',
        '0', '2020-10-01 09:49:43', '117', '2020-10-19 10:52:04', '117', '230');
INSERT INTO `kelas`
VALUES ('988', 'II - RA', '87', '3', '', '1', '', '8', null, null, null, '2020-10-23 15:34:18', '24623', '0', '21', '0',
        '2020-10-01 09:54:32', '117', '2020-10-23 15:34:18', '117', '230');
INSERT INTO `kelas`
VALUES ('989', 'III - DLT', '87', '40', '', '1', '', '9', null, null, null, '2020-10-19 10:52:21', '44551', '0', '26',
        '0', '2020-10-01 09:55:32', '117', '2020-10-19 10:52:21', '117', '217');
INSERT INTO `kelas`
VALUES ('990', 'III - DL', '87', '40', '', '1', '', '9', null, null, null, '2020-10-19 10:52:13', '45546', '0', '5',
        '0', '2020-10-01 09:56:14', '117', '2020-10-19 10:52:13', '117', '217');
INSERT INTO `kelas`
VALUES ('991', 'III - KOM', '87', '10', '', '1', '', '9', null, null, null, '2020-10-19 10:52:26', '40323', '0', '6',
        '0', '2020-10-01 09:58:00', '117', '2020-10-19 10:52:26', '117', '217');
INSERT INTO `kelas`
VALUES ('992', 'III - KOMO', '87', '25', '', '1', '', '9', null, null, null, '2020-10-19 10:52:30', '14323', '0', '29',
        '0', '2020-10-01 09:58:44', '117', '2020-10-19 10:52:30', '117', '217');
INSERT INTO `kelas`
VALUES ('993', 'III - RA', '87', '3', '', '1', '', '9', null, null, null, '2020-10-23 15:34:24', '18989', '0', '21',
        '0', '2020-10-01 09:59:49', '117', '2020-10-23 15:34:24', '117', '217');
INSERT INTO `kelas`
VALUES ('994', 'IV - DL', '87', '40', '', '1', '', '10', null, null, null, '2020-10-19 10:52:40', '28069', '0', '5',
        '0', '2020-10-01 10:01:27', '117', '2020-10-19 10:52:40', '117', '108');
INSERT INTO `kelas`
VALUES ('995', 'IV - DLT', '87', '40', '', '1', '', '10', null, null, null, '2020-10-19 10:52:44', '27012', '0', '26',
        '0', '2020-10-01 10:02:51', '117', '2020-10-19 10:52:44', '117', '108');
INSERT INTO `kelas`
VALUES ('996', 'IV - KOM', '87', '10', '', '1', '', '10', null, null, null, '2020-10-19 10:52:50', '33842', '0', '6',
        '0', '2020-10-01 10:03:26', '117', '2020-10-19 10:52:50', '117', '108');
INSERT INTO `kelas`
VALUES ('997', 'IV - KOMO', '87', '25', '', '1', '', '10', null, null, null, '2020-10-19 10:52:54', '38321', '0', '29',
        '0', '2020-10-01 10:04:03', '117', '2020-10-19 10:52:54', '117', '108');
INSERT INTO `kelas`
VALUES ('998', 'IV - RA', '87', '3', '', '1', '', '10', null, null, null, '2020-10-23 15:34:30', '61036', '0', '21',
        '0', '2020-10-01 10:04:43', '117', '2020-10-23 15:34:30', '117', '108');
INSERT INTO `kelas`
VALUES ('999', 'V - DL', '87', '40', '', '1', '', '11', null, null, null, '2021-07-09 01:07:04', '42252', '0', '5', '0',
        '2020-10-01 10:05:26', '117', '2021-07-09 01:07:04', '117', '522');
INSERT INTO `kelas`
VALUES ('1000', 'V - DLT', '87', '40', '', '1', '', '11', null, null, null, '2021-07-09 01:07:31', '64856', '0', '26',
        '0', '2020-10-01 10:05:56', '117', '2021-07-09 01:07:31', '117', '522');
INSERT INTO `kelas`
VALUES ('1001', 'V - KOM', '87', '10', '', '1', '', '11', null, null, null, '2021-07-09 01:07:45', '51294', '0', '6',
        '0', '2020-10-01 10:06:29', '117', '2021-07-09 01:07:45', '117', '522');
INSERT INTO `kelas`
VALUES ('1002', 'V - KOMO', '87', '25', '', '1', '', '11', null, null, null, '2021-07-09 01:08:00', '12559', '0', '29',
        '0', '2020-10-01 10:07:01', '117', '2021-07-09 01:08:00', '117', '522');
INSERT INTO `kelas`
VALUES ('1003', 'V - RA', '87', '3', '', '1', '', '11', null, null, null, '2021-07-09 01:08:18', '39818', '0', '21',
        '0', '2020-10-01 10:07:25', '117', '2021-07-09 01:08:18', '117', '522');
INSERT INTO `kelas`
VALUES ('1004', 'VI - DL', '87', '40', '', '1', '', '12', null, null, null, '2020-10-19 10:51:15', '58034', '0', '5',
        '0', '2020-10-01 10:08:51', '117', '2020-10-19 10:51:15', '117', '151');
INSERT INTO `kelas`
VALUES ('1005', 'VI - DLT', '87', '40', '', '1', '', '12', null, null, null, '2020-10-19 10:51:08', '19445', '0', '26',
        '0', '2020-10-01 10:09:20', '117', '2020-10-19 10:51:08', '117', '151');
INSERT INTO `kelas`
VALUES ('1006', 'VI - KOM', '87', '10', '', '1', '', '12', null, null, null, '2020-10-19 10:51:00', '56578', '0', '6',
        '0', '2020-10-01 10:09:43', '117', '2020-10-19 10:51:00', '117', '151');
INSERT INTO `kelas`
VALUES ('1007', 'VI - KOMO', '87', '25', '', '1', '', '12', null, null, null, '2020-10-19 10:50:53', '44722', '0', '29',
        '0', '2020-10-01 10:10:11', '117', '2020-10-19 10:50:53', '117', '151');
INSERT INTO `kelas`
VALUES ('1008', 'VI - RA', '87', '3', '', '1', '', '12', null, null, null, '2020-10-23 15:34:42', '38706', '0', '21',
        '0', '2020-10-01 10:10:38', '117', '2020-10-23 15:34:42', '117', '151');
INSERT INTO `kelas`
VALUES ('1009', 'I', '89', '20', '', '1', '', '7', null, null, null, '2022-01-11 11:39:38', '40868', '0', '36', '0',
        '2020-10-01 10:16:06', '117', '2020-10-19 16:12:34', '117', '513');
INSERT INTO `kelas`
VALUES ('1010', 'II', '89', '20', '', '1', '', '8', null, null, null, '2022-01-11 11:39:38', '56939', '0', '36', '0',
        '2020-10-01 10:17:17', '117', '2020-10-19 16:12:46', '117', '230');
INSERT INTO `kelas`
VALUES ('1011', 'III', '89', '20', '', '1', '', '9', null, null, null, '2022-01-11 11:39:38', '26690', '0', '36', '0',
        '2020-10-01 10:17:49', '117', '2020-10-19 16:12:58', '117', '217');
INSERT INTO `kelas`
VALUES ('1012', 'I - A', '90', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:05', '3992', '0', '36', '3',
        '2020-10-01 10:35:02', '117', '2021-10-26 14:53:10', '117', '387');
INSERT INTO `kelas`
VALUES ('1013', 'I - B', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '563', '0', '36', '4',
        '2020-10-01 10:36:36', '117', '2021-08-23 16:19:44', '117', '387');
INSERT INTO `kelas`
VALUES ('1014', 'I - C - I', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '20443', '0', '36',
        '5', '2020-10-01 10:37:51', '117', '2021-09-15 10:13:27', '117', '387');
INSERT INTO `kelas`
VALUES ('1015', 'I - C1 - I', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '28959', '0', '36',
        '8', '2020-10-01 10:39:36', '117', '2021-09-15 14:56:50', '117', '387');
INSERT INTO `kelas`
VALUES ('1016', 'I - D', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '24332', '0', '36', '6',
        '2020-10-01 10:40:20', '117', '2021-08-23 16:20:21', '117', '387');
INSERT INTO `kelas`
VALUES ('1017', 'I - D1', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '29086', '0', '36', '9',
        '2020-10-01 10:43:59', '117', '2021-08-23 16:20:32', '117', '387');
INSERT INTO `kelas`
VALUES ('1019', 'I - F', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '62483', '0', '36', '11',
        '2020-10-01 10:45:11', '117', '2021-08-23 16:20:47', '117', '387');
INSERT INTO `kelas`
VALUES ('1020', 'I - H', '90', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:05', '16524', '0', '36', '12',
        '2020-10-01 10:45:35', '117', '2021-08-23 16:21:00', '117', '387');
INSERT INTO `kelas`
VALUES ('1023', 'I - K', '90', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:05', '54376', '0', '36', '15',
        '2020-10-01 10:46:46', '117', '2021-08-23 16:21:12', '117', '387');
INSERT INTO `kelas`
VALUES ('1026', 'I - P', '90', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:05', '6395', '0', '36', '18',
        '2020-10-01 10:47:53', '117', '2021-08-23 16:21:22', '117', '387');
INSERT INTO `kelas`
VALUES ('1027', 'I - Q - I', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:05', '14345', '0', '36',
        '7', '2020-10-01 10:48:18', '117', '2021-09-15 14:58:03', '117', '387');
INSERT INTO `kelas`
VALUES ('1028', 'II - A', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '36973', '0', '36', '3',
        '2020-10-01 10:56:38', '117', '2021-08-23 16:49:03', '117', '480');
INSERT INTO `kelas`
VALUES ('1029', 'II - B', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '34833', '0', '36', '4',
        '2020-10-01 10:57:05', '117', '2021-08-23 16:49:12', '117', '480');
INSERT INTO `kelas`
VALUES ('1030', 'II - C', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '64613', '0', '36', '5',
        '2020-10-01 10:57:29', '117', '2021-08-23 16:49:20', '117', '480');
INSERT INTO `kelas`
VALUES ('1031', 'II - C1', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '61057', '0', '36',
        '8', '2020-10-01 10:58:03', '117', '2021-08-23 16:49:28', '117', '480');
INSERT INTO `kelas`
VALUES ('1032', 'II - D', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '14645', '0', '36', '6',
        '2020-10-01 10:58:31', '117', '2021-08-23 16:49:55', '117', '480');
INSERT INTO `kelas`
VALUES ('1033', 'II - D1', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '21116', '0', '36',
        '9', '2020-10-01 10:58:54', '117', '2021-08-23 16:50:05', '117', '480');
INSERT INTO `kelas`
VALUES ('1035', 'II - F', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '18659', '0', '36',
        '11', '2020-10-01 10:59:43', '117', '2021-08-23 16:50:12', '117', '480');
INSERT INTO `kelas`
VALUES ('1036', 'II - H', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '9824', '0', '36', '12',
        '2020-10-01 11:00:15', '117', '2021-08-23 16:50:22', '117', '480');
INSERT INTO `kelas`
VALUES ('1039', 'II - K', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '54646', '0', '36',
        '15', '2020-10-01 11:01:24', '117', '2021-08-23 16:50:32', '117', '480');
INSERT INTO `kelas`
VALUES ('1042', 'II - P', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '24213', '0', '36',
        '18', '2020-10-01 11:02:36', '117', '2021-08-23 16:50:41', '117', '480');
INSERT INTO `kelas`
VALUES ('1043', 'II - Q', '90', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:05', '60677', '0', '36', '7',
        '2020-10-01 11:03:01', '117', '2021-08-23 16:51:12', '117', '480');
INSERT INTO `kelas`
VALUES ('1044', 'III - A - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '33712', '0', '36',
        '3', '2020-10-01 11:12:25', '117', '2021-07-16 17:51:55', '117', '387');
INSERT INTO `kelas`
VALUES ('1045', 'III - B - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '12850', '0', '36',
        '4', '2020-10-01 11:13:16', '117', '2021-07-16 17:49:46', '117', '387');
INSERT INTO `kelas`
VALUES ('1046', 'III - C1 - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '18530', '0',
        '36', '8', '2020-10-01 11:15:05', '117', '2021-08-23 16:59:31', '117', '526');
INSERT INTO `kelas`
VALUES ('1047', 'III - C - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '42643', '0', '36',
        '5', '2020-10-01 11:15:44', '117', '2021-08-23 16:54:10', '117', '248');
INSERT INTO `kelas`
VALUES ('1048', 'III - D - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '63577', '0', '36',
        '6', '2020-10-01 11:16:07', '117', '2021-07-16 17:50:18', '117', '387');
INSERT INTO `kelas`
VALUES ('1049', 'III - D1 - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '984', '0', '36',
        '9', '2020-10-01 11:16:30', '117', '2021-07-16 17:50:30', '117', '387');
INSERT INTO `kelas`
VALUES ('1051', 'III - F - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '34843', '0', '36',
        '11', '2020-10-01 11:17:27', '117', '2021-07-16 17:50:41', '117', '387');
INSERT INTO `kelas`
VALUES ('1052', 'III - H - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '42704', '0', '36',
        '12', '2020-10-01 11:17:49', '117', '2021-07-16 17:51:58', '117', '387');
INSERT INTO `kelas`
VALUES ('1055', 'III - K - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '48116', '0', '36',
        '15', '2020-10-01 11:19:10', '117', '2021-07-16 17:52:05', '117', '387');
INSERT INTO `kelas`
VALUES ('1058', 'III - P - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '18768', '0', '36',
        '18', '2020-10-01 11:20:38', '117', '2021-07-16 17:52:02', '117', '387');
INSERT INTO `kelas`
VALUES ('1059', 'III - Q - I', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '38928', '0', '36',
        '7', '2020-10-01 11:21:02', '117', '2021-07-16 17:51:13', '117', '387');
INSERT INTO `kelas`
VALUES ('1060', 'III - A - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '11657', '0',
        '36', '3', '2020-10-01 11:28:02', '117', '2021-07-16 17:51:56', '117', '473');
INSERT INTO `kelas`
VALUES ('1061', 'III - B - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:05', '37934', '0',
        '36', '4', '2020-10-01 11:31:30', '117', '2021-07-16 17:49:51', '117', '473');
INSERT INTO `kelas`
VALUES ('1062', 'III - C - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '15654', '0',
        '36', '5', '2020-10-01 11:32:29', '117', '2021-08-23 16:54:42', '117', '248');
INSERT INTO `kelas`
VALUES ('1063', 'III - C1 - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '57300', '0',
        '36', '8', '2020-10-01 11:32:36', '117', '2021-08-23 16:59:45', '117', '526');
INSERT INTO `kelas`
VALUES ('1064', 'III - D - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '14839', '0',
        '36', '6', '2020-10-01 11:33:31', '117', '2021-07-16 17:50:25', '117', '473');
INSERT INTO `kelas`
VALUES ('1065', 'III - D1 - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '25263', '0',
        '36', '9', '2020-10-01 11:33:53', '117', '2021-07-16 17:50:34', '117', '473');
INSERT INTO `kelas`
VALUES ('1067', 'III - F - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '26621', '0',
        '36', '11', '2020-10-01 11:34:44', '117', '2021-07-16 17:50:55', '117', '473');
INSERT INTO `kelas`
VALUES ('1068', 'III - H - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '18669', '0',
        '36', '12', '2020-10-01 11:35:07', '117', '2021-07-16 17:52:07', '117', '473');
INSERT INTO `kelas`
VALUES ('1071', 'III - K - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '55300', '0',
        '36', '15', '2020-10-01 11:36:07', '117', '2021-07-16 17:52:04', '117', '473');
INSERT INTO `kelas`
VALUES ('1074', 'III - P - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '16716', '0',
        '36', '18', '2020-10-01 11:37:23', '117', '2021-07-16 17:52:00', '117', '473');
INSERT INTO `kelas`
VALUES ('1075', 'III - Q - II', '90', '3', '', '1', '', '9', null, null, null, '2022-01-11 12:01:06', '47284', '0',
        '36', '7', '2020-10-01 11:37:44', '117', '2021-07-16 17:51:07', '117', '473');
INSERT INTO `kelas`
VALUES ('1076', 'IV - A', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '46626', '0', '36',
        '3', '2020-10-01 12:56:18', '117', '2021-08-23 17:00:32', '117', '481');
INSERT INTO `kelas`
VALUES ('1077', 'IV - B', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '32535', '0', '36',
        '4', '2020-10-01 12:56:41', '117', '2021-08-23 17:00:41', '117', '481');
INSERT INTO `kelas`
VALUES ('1078', 'IV - C', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '51055', '0', '36',
        '5', '2020-10-01 12:57:06', '117', '2021-08-23 17:00:50', '117', '481');
INSERT INTO `kelas`
VALUES ('1079', 'IV - C1', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '49864', '0', '36',
        '8', '2020-10-01 12:57:37', '117', '2021-08-23 17:00:59', '117', '481');
INSERT INTO `kelas`
VALUES ('1080', 'IV - D', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '30626', '0', '36',
        '6', '2020-10-01 12:58:03', '117', '2021-08-23 17:01:10', '117', '481');
INSERT INTO `kelas`
VALUES ('1081', 'IV - D1', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '2191', '0', '36',
        '9', '2020-10-01 12:58:33', '117', '2021-08-23 17:01:22', '117', '481');
INSERT INTO `kelas`
VALUES ('1083', 'IV - F', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '64120', '0', '36',
        '11', '2020-10-01 12:59:22', '117', '2021-08-23 17:01:36', '117', '481');
INSERT INTO `kelas`
VALUES ('1084', 'IV - H', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '32515', '0', '36',
        '12', '2020-10-01 12:59:43', '117', '2021-08-23 17:01:47', '117', '481');
INSERT INTO `kelas`
VALUES ('1087', 'IV - K', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '4856', '0', '36',
        '15', '2020-10-01 13:00:50', '117', '2021-08-23 17:02:04', '117', '481');
INSERT INTO `kelas`
VALUES ('1090', 'IV - P', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '15523', '0', '36',
        '18', '2020-10-01 13:01:59', '117', '2021-08-23 17:02:23', '117', '481');
INSERT INTO `kelas`
VALUES ('1091', 'IV - Q', '90', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '9218', '0', '36', '7',
        '2020-10-01 13:02:21', '117', '2021-08-23 17:02:36', '117', '481');
INSERT INTO `kelas`
VALUES ('1092', 'V - A', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '64274', '0', '36', '3',
        '2020-10-01 13:10:22', '117', '2021-08-23 16:45:49', '117', '519');
INSERT INTO `kelas`
VALUES ('1093', 'V - B', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '37005', '0', '36', '4',
        '2020-10-01 13:10:50', '117', '2021-08-23 16:46:01', '117', '519');
INSERT INTO `kelas`
VALUES ('1094', 'V - C - I', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '13949', '0', '36',
        '5', '2020-10-01 13:11:23', '117', '2021-08-23 17:06:19', '117', '519');
INSERT INTO `kelas`
VALUES ('1095', 'V - C1', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '8501', '0', '36', '8',
        '2020-10-01 13:11:51', '117', '2021-08-23 16:46:22', '117', '519');
INSERT INTO `kelas`
VALUES ('1096', 'V - D', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '25665', '0', '36', '6',
        '2020-10-01 13:12:13', '117', '2021-08-23 16:46:31', '117', '519');
INSERT INTO `kelas`
VALUES ('1097', 'V - D1', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '39412', '0', '36',
        '9', '2020-10-01 13:12:37', '117', '2021-08-23 16:46:40', '117', '519');
INSERT INTO `kelas`
VALUES ('1099', 'V - F', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '57037', '0', '36',
        '11', '2020-10-01 13:13:33', '117', '2021-08-23 16:46:49', '117', '519');
INSERT INTO `kelas`
VALUES ('1100', 'V - H', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '12907', '0', '36',
        '12', '2020-10-01 13:13:54', '117', '2021-08-23 16:46:59', '117', '519');
INSERT INTO `kelas`
VALUES ('1103', 'V - K', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '54051', '0', '36',
        '15', '2020-10-01 13:15:05', '117', '2021-08-23 16:47:13', '117', '519');
INSERT INTO `kelas`
VALUES ('1106', 'V - P', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '45318', '0', '36',
        '18', '2020-10-01 13:16:19', '117', '2021-08-23 16:47:24', '117', '519');
INSERT INTO `kelas`
VALUES ('1107', 'V - Q', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '62865', '0', '36', '7',
        '2020-10-01 13:16:51', '117', '2021-08-23 16:47:38', '117', '519');
INSERT INTO `kelas`
VALUES ('1108', 'VI - A', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '39563', '0', '36',
        '3', '2020-10-01 13:20:35', '117', '2021-07-16 17:57:28', '117', '485');
INSERT INTO `kelas`
VALUES ('1109', 'VI - B', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '18940', '0', '36',
        '4', '2020-10-01 13:20:56', '117', '2021-07-16 17:56:37', '117', '485');
INSERT INTO `kelas`
VALUES ('1110', 'VI - C', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '21782', '0', '36',
        '5', '2020-10-01 13:21:17', '117', '2021-07-16 17:56:41', '117', '485');
INSERT INTO `kelas`
VALUES ('1111', 'VI - C1', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '59195', '0', '36',
        '8', '2020-10-01 13:21:47', '117', '2021-07-16 17:56:48', '117', '485');
INSERT INTO `kelas`
VALUES ('1112', 'VI - D', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '511', '0', '36', '6',
        '2020-10-01 13:22:10', '117', '2021-07-16 17:56:52', '117', '485');
INSERT INTO `kelas`
VALUES ('1113', 'VI - D1', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '18775', '0', '36',
        '9', '2020-10-01 13:22:41', '117', '2021-07-16 17:56:57', '117', '485');
INSERT INTO `kelas`
VALUES ('1115', 'VI - F', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '21704', '0', '36',
        '11', '2020-10-01 13:23:30', '117', '2021-07-16 17:57:02', '117', '485');
INSERT INTO `kelas`
VALUES ('1116', 'VI - H', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '54310', '0', '36',
        '12', '2020-10-01 13:23:56', '117', '2021-07-16 17:57:30', '117', '485');
INSERT INTO `kelas`
VALUES ('1119', 'VI - K', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '7394', '0', '36',
        '15', '2020-10-01 13:25:09', '117', '2021-07-16 17:57:31', '117', '485');
INSERT INTO `kelas`
VALUES ('1122', 'VI - P', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '61155', '0', '36',
        '18', '2020-10-01 13:26:25', '117', '2021-07-16 17:57:32', '117', '485');
INSERT INTO `kelas`
VALUES ('1123', 'VI - Q', '90', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '56125', '0', '36',
        '7', '2020-10-01 13:26:47', '117', '2021-07-16 17:57:20', '117', '485');
INSERT INTO `kelas`
VALUES ('1124', 'XI - IPA - KOMO', '88', '30', '', '1', '', '2', null, null, null, '2021-07-07 08:48:05', '25791', '0',
        '31', '1', '2020-10-01 13:50:21', '453', '2021-07-07 08:48:05', '453', '469');
INSERT INTO `kelas`
VALUES ('1125', 'XI - IPA - KOM', '88', '10', '', '1', '', '2', null, null, null, '2021-11-01 15:16:08', '34647', '0',
        '2', '1', '2020-10-01 13:51:20', '453', '2021-11-01 15:16:08', '120', '469');
INSERT INTO `kelas`
VALUES ('1126', 'XI - IPS - A - KOM', '88', '10', '', '1', '', '2', null, null, null, '2021-07-07 08:49:24', '36705',
        '0', '2', '2', '2020-10-01 13:54:28', '453', '2021-07-07 08:49:24', '453', '153');
INSERT INTO `kelas`
VALUES ('1127', 'XI - IPS - B - KOM', '88', '10', '', '1', '', '2', null, null, null, '2021-07-07 08:53:19', '49888',
        '0', '2', '2', '2020-10-01 13:56:19', '453', '2021-07-07 08:53:19', '453', '486');
INSERT INTO `kelas`
VALUES ('1128', 'XI - IPS - DLT', '88', '40', '', '1', '', '2', null, null, null, '2021-07-07 08:53:43', '30096', '0',
        '27', '2', '2020-10-01 13:59:09', '453', '2021-07-07 08:53:43', '453', '486');
INSERT INTO `kelas`
VALUES ('1129', 'XI - IPS - KOMO', '88', '30', '', '1', '', '2', null, null, null, '2021-07-07 08:51:36', '62787', '0',
        '31', '2', '2020-10-01 14:00:22', '453', '2021-07-07 08:51:36', '453', '153');
INSERT INTO `kelas`
VALUES ('1130', 'XII - IPA - KOM', '88', '10', '', '1', '', '3', null, null, null, '2021-07-07 08:57:10', '63793', '0',
        '2', '1', '2020-10-01 14:06:47', '453', '2021-07-07 08:57:10', '453', '406');
INSERT INTO `kelas`
VALUES ('1131', 'XII - IPA - DLT', '88', '40', '', '1', '', '3', null, null, null, '2021-07-07 08:56:27', '53121', '0',
        '27', '1', '2020-10-01 14:07:34', '453', '2021-07-07 08:56:27', '453', '406');
INSERT INTO `kelas`
VALUES ('1132', 'XII - IPA - KOMO', '88', '30', '', '1', '', '3', null, null, null, '2021-07-07 08:57:36', '6883', '0',
        '31', '1', '2020-10-01 14:08:11', '453', '2021-07-07 08:57:36', '453', '406');
INSERT INTO `kelas`
VALUES ('1133', 'XII - IPS - A - DL', '88', '40', '', '1', '', '3', null, null, null, '2021-07-12 12:10:49', '41142',
        '0', '1', '2', '2020-10-01 14:09:42', '453', '2021-07-12 12:10:49', '453', '352');
INSERT INTO `kelas`
VALUES ('1134', 'XII - IPS - A - KOM', '88', '10', '', '1', '', '3', null, null, null, '2021-07-12 12:11:47', '35444',
        '0', '2', '2', '2020-10-01 14:10:47', '453', '2021-07-12 12:11:47', '453', '352');
INSERT INTO `kelas`
VALUES ('1135', 'XII - IPS - A - DLT', '88', '40', '', '1', '', '3', null, null, null, '2021-12-09 16:03:41', '30415',
        '0', '27', '2', '2020-10-01 14:12:37', '453', '2021-12-09 16:03:41', '120', '428');
INSERT INTO `kelas`
VALUES ('1136', 'XII - IPS - KOMO', '88', '30', '', '1', '', '3', null, null, null, '2021-07-23 15:05:41', '46223', '0',
        '31', '2', '2020-10-01 14:16:04', '453', '2021-07-23 15:05:41', '453', '352');
INSERT INTO `kelas`
VALUES ('1137', 'XII - IPS - B - DL', '88', '40', '', '1', '', '3', null, null, null, '2021-12-09 16:03:59', '2140',
        '0', '1', '2', '2020-10-01 14:17:09', '453', '2021-12-09 16:03:59', '120', '428');
INSERT INTO `kelas`
VALUES ('1138', 'XII - IPS - B - KOM', '88', '10', '', '1', '', '3', null, null, null, '2021-12-09 16:04:22', '46790',
        '0', '2', '2', '2020-10-01 14:18:13', '453', '2021-12-09 16:04:22', '120', '428');
INSERT INTO `kelas`
VALUES ('1140', 'X - IPA - DL', '88', '40', '', '1', '', '1', null, null, null, '2020-10-01 14:22:56', '50727', '0',
        '1', '1', '2020-10-01 14:22:56', '453', '2020-10-01 14:22:56', '453', '130');
INSERT INTO `kelas`
VALUES ('1141', 'X - IPA - KOM', '88', '10', '', '1', '', '1', null, null, null, '2020-10-01 14:23:58', '28884', '0',
        '2', '1', '2020-10-01 14:23:58', '453', '2020-10-01 14:23:58', '453', '130');
INSERT INTO `kelas`
VALUES ('1142', 'X - IPA - KOMO', '88', '30', '', '1', '', '1', null, null, null, '2020-10-01 14:25:45', '10934', '0',
        '31', '1', '2020-10-01 14:25:45', '453', '2020-10-01 14:25:45', '453', '130');
INSERT INTO `kelas`
VALUES ('1143', 'X - IPA - DLT', '88', '40', '', '1', '', '1', null, null, null, '2020-10-01 14:26:30', '31979', '0',
        '27', '1', '2020-10-01 14:26:30', '453', '2020-10-01 14:26:30', '453', '130');
INSERT INTO `kelas`
VALUES ('1144', 'X - IPS - A - DL', '88', '40', '', '1', '', '1', null, null, null, '2021-07-07 08:42:51', '17924', '0',
        '1', '2', '2020-10-01 14:27:29', '453', '2021-07-07 08:42:51', '453', '381');
INSERT INTO `kelas`
VALUES ('1145', 'X - IPS - A - KOM', '88', '10', '', '1', '', '1', null, null, null, '2021-07-07 08:43:19', '45830',
        '0', '2', '2', '2020-10-01 14:28:40', '453', '2021-07-07 08:43:19', '453', '381');
INSERT INTO `kelas`
VALUES ('1146', 'X - IPS - B - DL', '88', '40', '', '1', '', '1', null, null, null, '2021-07-07 08:43:53', '52265', '0',
        '1', '2', '2020-10-01 14:30:11', '453', '2021-07-07 08:43:53', '453', '381');
INSERT INTO `kelas`
VALUES ('1147', 'X - IPS - B - KOM', '88', '10', '', '1', '', '1', null, null, null, '2021-07-07 08:44:18', '4230', '0',
        '2', '2', '2020-10-01 14:30:54', '453', '2021-07-07 08:44:18', '453', '381');
INSERT INTO `kelas`
VALUES ('1148', 'X - IPS - DLT', '88', '40', '', '1', '', '1', null, null, null, '2021-07-07 08:44:50', '13790', '0',
        '27', '2', '2020-10-01 14:32:32', '453', '2021-07-07 08:44:50', '453', '381');
INSERT INTO `kelas`
VALUES ('1149', 'X - IPS - KOMO', '88', '30', '', '1', '', '1', null, null, null, '2021-07-07 08:45:15', '4249', '0',
        '31', '2', '2020-10-01 14:33:39', '453', '2021-07-07 08:45:15', '453', '381');
INSERT INTO `kelas`
VALUES ('1150', 'IX A - KOM', '91', '12', '', '1', '', '6', null, null, null, '2020-10-01 14:59:16', '47360', '0', '4',
        '0', '2020-10-01 14:59:16', '452', '2020-10-01 14:59:16', '452', '132');
INSERT INTO `kelas`
VALUES ('1151', 'IX B - KOM', '91', '12', '', '1', '', '6', null, null, null, '2021-06-25 09:14:41', '33439', '0', '4',
        '0', '2020-10-01 14:59:48', '452', '2021-06-25 09:14:41', '452', '269');
INSERT INTO `kelas`
VALUES ('1152', 'IX A - DL', '91', '40', '', '1', '', '6', null, null, null, '2020-10-01 15:00:39', '51005', '0', '3',
        '0', '2020-10-01 15:00:39', '452', '2020-10-01 15:00:39', '452', '132');
INSERT INTO `kelas`
VALUES ('1153', 'IX B - DL', '91', '40', '', '1', '', '6', null, null, null, '2021-06-25 09:13:59', '12939', '0', '3',
        '0', '2020-10-01 15:01:12', '452', '2021-06-25 09:13:59', '452', '269');
INSERT INTO `kelas`
VALUES ('1154', 'IX A - KOMO', '91', '30', '', '1', '', '6', null, null, null, '2020-10-01 15:02:03', '7937', '0', '30',
        '0', '2020-10-01 15:02:03', '452', '2020-10-01 15:02:03', '452', '132');
INSERT INTO `kelas`
VALUES ('1155', 'IX B - KOMO', '91', '30', '', '1', '', '6', null, null, null, '2021-06-25 09:15:06', '8734', '0', '30',
        '0', '2020-10-01 15:02:41', '452', '2021-06-25 09:15:06', '452', '269');
INSERT INTO `kelas`
VALUES ('1156', 'IX A - DLT', '91', '40', '', '1', '', '6', null, null, null, '2020-10-01 15:03:33', '62019', '0', '28',
        '0', '2020-10-01 15:03:33', '452', '2020-10-01 15:03:33', '452', '132');
INSERT INTO `kelas`
VALUES ('1157', 'IX B - DLT', '91', '40', '', '1', '', '6', null, null, null, '2021-06-25 09:14:20', '20140', '0', '28',
        '0', '2020-10-01 15:04:10', '452', '2021-06-25 09:14:20', '452', '269');
INSERT INTO `kelas`
VALUES ('1158', 'VIII A - KOM', '91', '12', '', '1', '', '5', null, null, null, '2021-06-25 09:13:06', '45699', '0',
        '4', '0', '2020-10-01 15:05:11', '452', '2021-06-25 09:13:06', '452', '324');
INSERT INTO `kelas`
VALUES ('1159', 'VIII B - KOM', '91', '12', '', '1', '', '5', null, null, null, '2021-06-25 09:12:33', '20176', '0',
        '4', '0', '2020-10-01 15:05:50', '452', '2021-06-25 09:12:33', '452', '368');
INSERT INTO `kelas`
VALUES ('1160', 'VIII A - DL', '91', '40', '', '1', '', '5', null, null, null, '2021-06-25 09:10:56', '17991', '0', '3',
        '0', '2020-10-01 15:07:00', '452', '2021-06-25 09:10:56', '452', '324');
INSERT INTO `kelas`
VALUES ('1161', 'VIII A - DLT', '91', '40', '', '1', '', '5', null, null, null, '2021-06-25 09:11:27', '10886', '0',
        '28', '0', '2020-10-01 15:07:41', '452', '2021-06-25 09:11:27', '452', '324');
INSERT INTO `kelas`
VALUES ('1162', 'VIII A - KOMO', '91', '30', '', '1', '', '5', null, null, null, '2021-06-25 09:12:07', '10981', '0',
        '30', '0', '2020-10-01 15:08:35', '452', '2021-06-25 09:12:07', '452', '324');
INSERT INTO `kelas`
VALUES ('1163', 'VII - KOM', '91', '12', '', '1', '', '4', null, null, null, '2021-06-25 09:06:45', '6702', '0', '4',
        '0', '2020-10-01 15:09:20', '452', '2021-06-25 09:06:45', '452', '405');
INSERT INTO `kelas`
VALUES ('1165', 'VII - DL', '91', '40', '', '1', '', '4', null, null, null, '2021-06-25 09:04:03', '17632', '0', '3',
        '0', '2020-10-01 15:10:23', '452', '2021-06-25 09:04:03', '452', '405');
INSERT INTO `kelas`
VALUES ('1166', 'VII - DLT', '91', '40', '', '1', '', '4', null, null, null, '2021-06-25 09:05:03', '44492', '0', '28',
        '0', '2020-10-01 15:10:49', '452', '2021-06-25 09:05:03', '452', '405');
INSERT INTO `kelas`
VALUES ('1167', 'VII - KOMO', '91', '30', '', '1', '', '4', null, null, null, '2021-06-25 09:05:48', '45248', '0', '30',
        '0', '2020-10-01 15:11:23', '452', '2021-06-25 09:05:48', '452', '405');
INSERT INTO `kelas`
VALUES ('1168', 'I-A-DL', '86', '35', '', '1', 'Tahun Pelajaran ke 3', '7', null, null, null, '2021-05-24 12:59:40',
        '54713', '0', '5', '0', '2020-11-05 14:44:06', '466', '2021-05-24 12:59:40', '466', '514');
INSERT INTO `kelas`
VALUES ('1169', 'I-A-KOM', '86', '10', '', '1', 'Tahun Pelajaran ke 3', '7', null, null, null, '2021-05-24 12:59:30',
        '16215', '0', '6', '0', '2020-11-05 14:47:09', '466', '2021-05-24 12:59:30', '466', '514');
INSERT INTO `kelas`
VALUES ('1170', 'II-A-DL', '86', '35', '', '1', 'Tahun Ajaran ke 3', '8', null, null, null, '2021-05-24 12:59:52',
        '23576', '0', '5', '0', '2020-11-16 10:45:55', '466', '2021-05-24 12:59:52', '466', '514');
INSERT INTO `kelas`
VALUES ('1171', 'II-A-KOM', '86', '10', '', '1', 'Tahun Ajaran ke 3', '8', null, null, null, '2021-05-24 13:00:00',
        '33577', '0', '6', '0', '2020-11-16 10:47:59', '466', '2021-05-24 13:00:00', '466', '514');
INSERT INTO `kelas`
VALUES ('1172', 'III-A-DL', '86', '35', '', '1', 'Tahun Ajaran ke 3', '9', null, null, null, '2021-05-24 13:00:10',
        '45678', '0', '5', '0', '2020-11-16 10:50:39', '466', '2021-05-24 13:00:10', '466', '514');
INSERT INTO `kelas`
VALUES ('1173', 'III-A-KOM', '86', '10', '', '1', 'Tahun Ajaran ke 3', '9', null, null, null, '2021-05-24 13:00:15',
        '10760', '0', '6', '0', '2020-11-16 10:52:41', '466', '2021-05-24 13:00:15', '466', '514');
INSERT INTO `kelas`
VALUES ('1174', 'IV-A-DL', '86', '35', '', '1', 'Tahun Ajaran ke 3', '10', null, null, null, '2021-05-24 13:00:46',
        '19431', '0', '5', '0', '2020-11-16 10:53:56', '466', '2021-05-24 13:00:46', '466', '506');
INSERT INTO `kelas`
VALUES ('1175', 'IV-A-KOM', '86', '10', '', '1', 'Tahun Ajaran ke 3', '10', null, null, null, '2021-05-24 13:00:51',
        '65029', '0', '6', '0', '2020-11-16 10:58:43', '466', '2021-05-24 13:00:51', '466', '506');
INSERT INTO `kelas`
VALUES ('1176', 'V-A-DL', '86', '35', '', '1', 'Tahun Ajaran ke 3', '11', null, null, null, '2021-05-24 13:03:47',
        '56282', '0', '5', '0', '2020-11-16 11:01:45', '466', '2021-05-24 13:03:47', '466', '506');
INSERT INTO `kelas`
VALUES ('1177', 'V-A-KOM', '86', '10', '', '1', 'Tahun Ajaran ke 3', '11', null, null, null, '2021-05-24 13:02:12',
        '11507', '0', '6', '0', '2020-11-16 11:02:20', '466', '2021-05-24 13:02:12', '466', '506');
INSERT INTO `kelas`
VALUES ('1178', 'VI-A-DL', '86', '35', '', '1', 'Tahun Ajaran ke 3', '12', null, null, null, '2021-05-24 13:02:17',
        '49742', '0', '5', '0', '2020-11-16 11:05:18', '466', '2021-05-24 13:02:17', '466', '506');
INSERT INTO `kelas`
VALUES ('1179', 'VI-A-KOM', '86', '10', '', '1', 'Tahun Ajaran ke 3', '12', null, null, null, '2021-05-24 13:02:23',
        '45723', '0', '6', '0', '2020-11-16 11:06:09', '466', '2021-05-24 13:02:23', '466', '506');
INSERT INTO `kelas`
VALUES ('1180', 'VII-A-DL', '92', '35', '', '1', 'Tahun Ajaran ke 3', '4', null, null, null, '2021-05-24 13:02:40',
        '42555', '0', '3', '0', '2020-11-16 11:11:35', '466', '2021-05-24 13:02:40', '466', '479');
INSERT INTO `kelas`
VALUES ('1181', 'VII-A-KOM', '92', '10', '', '1', 'Tahun Ajaran ke 3', '4', null, null, null, '2021-05-24 13:02:42',
        '54209', '0', '4', '0', '2020-11-16 11:16:35', '466', '2021-05-24 13:02:42', '466', '479');
INSERT INTO `kelas`
VALUES ('1182', 'VIII-A-DL', '92', '35', '', '1', 'Tahun Ajaran ke 3', '5', null, null, null, '2021-05-24 13:02:48',
        '12065', '0', '3', '0', '2020-11-16 11:18:29', '466', '2021-05-24 13:02:48', '466', '479');
INSERT INTO `kelas`
VALUES ('1183', 'VIII-A-KOM', '92', '10', '', '1', 'Tahun Ajaran ke 3', '5', null, null, null, '2021-05-24 13:02:50',
        '11865', '0', '4', '0', '2020-11-16 11:20:07', '466', '2021-05-24 13:02:50', '466', '479');
INSERT INTO `kelas`
VALUES ('1184', 'IX-A-DL', '92', '35', '', '1', 'Tahun Ajaran ke 3', '6', null, null, null, '2021-05-24 13:02:59',
        '47448', '0', '3', '0', '2020-11-16 11:21:22', '466', '2021-05-24 13:02:59', '466', '479');
INSERT INTO `kelas`
VALUES ('1185', 'IX-A-KOM', '92', '10', '', '1', 'Tahun Ajaran ke 3', '6', null, null, null, '2021-05-24 13:03:01',
        '17821', '0', '4', '0', '2020-11-16 11:27:06', '466', '2021-05-24 13:03:01', '466', '479');
INSERT INTO `kelas`
VALUES ('1186', 'X-A-DL-IPA', '93', '35', '', '1', 'Tahun Ajaran ke 3', '1', null, null, null, '2022-06-20 14:49:07',
        '33903', '0', '1', '1', '2020-11-16 11:33:03', '466', '2022-06-20 14:49:07', '562', '605');
INSERT INTO `kelas`
VALUES ('1187', 'X-A-KOM-IPA', '93', '10', '', '1', 'Tahun Ajaran ke 3', '1', null, null, null, '2022-06-20 14:49:35',
        '35436', '0', '2', '1', '2020-11-16 11:35:35', '466', '2022-06-20 14:49:35', '562', '605');
INSERT INTO `kelas`
VALUES ('1188', 'X-A-DL-IPS', '93', '35', '', '1', 'Tahun Ajaran ke 3', '1', null, null, null, '2021-11-02 13:24:40',
        '2881', '0', '1', '2', '2020-11-16 11:37:02', '466', '2021-11-02 13:24:40', '466', '582');
INSERT INTO `kelas`
VALUES ('1189', 'X-A-KOM-IPS', '93', '10', '', '1', 'Tahun Ajaran ke 3', '1', null, null, null, '2021-11-02 13:25:55',
        '31231', '0', '2', '2', '2020-11-16 11:40:47', '466', '2021-11-02 13:25:55', '466', '582');
INSERT INTO `kelas`
VALUES ('1190', 'XI-A-DL-IPS', '93', '35', '', '1', 'Tahun Ajaran ke 3', '2', null, null, null, '2021-11-02 13:26:29',
        '3665', '0', '1', '2', '2020-11-16 11:44:13', '466', '2021-11-02 13:26:29', '466', '582');
INSERT INTO `kelas`
VALUES ('1191', 'XI-A-KOM-IPS', '93', '10', '', '1', 'Tahun Ajaran ke 3', '2', null, null, null, '2021-11-02 13:26:49',
        '35973', '0', '2', '2', '2020-11-16 11:45:53', '466', '2021-11-02 13:26:49', '466', '582');
INSERT INTO `kelas`
VALUES ('1192', 'XI-A-KOM-IPA', '93', '10', '', '1', 'Tahun Ajaran ke 3', '2', null, null, null, '2022-06-20 14:48:37',
        '55751', '0', '2', '1', '2020-11-16 11:47:23', '466', '2022-06-20 14:48:37', '562', '605');
INSERT INTO `kelas`
VALUES ('1193', 'XI-A-DL-IPA', '93', '35', '', '1', 'Tahun Ajaran ke 3', '2', null, null, null, '2022-06-20 14:48:22',
        '11641', '0', '1', '1', '2020-11-16 11:48:08', '466', '2022-06-20 14:48:22', '562', '605');
INSERT INTO `kelas`
VALUES ('1194', 'XII-A-DL-IPA', '93', '35', '', '1', 'Tahun Ajaran ke 3', '3', null, null, null, '2022-06-20 14:47:40',
        '57747', '0', '1', '1', '2020-11-16 11:55:06', '466', '2022-06-20 14:47:40', '562', '605');
INSERT INTO `kelas`
VALUES ('1195', 'XII-A-KOM-IPA', '93', '10', '', '1', 'Tahun Ajaran ke 3', '3', null, null, null, '2022-06-20 14:48:01',
        '47062', '0', '2', '1', '2020-11-16 11:56:00', '466', '2022-06-20 14:48:01', '562', '605');
INSERT INTO `kelas`
VALUES ('1196', 'XII-A-DL-IPS', '93', '35', '', '1', 'Tahun Ajaran ke 3', '3', null, null, null, '2021-11-02 13:28:50',
        '21617', '0', '1', '2', '2020-11-16 12:01:08', '466', '2021-11-02 13:28:50', '466', '582');
INSERT INTO `kelas`
VALUES ('1197', 'XII-A-KOM-IPS', '93', '10', '', '1', 'Tahun Ajaran ke 3', '3', null, null, null, '2021-11-02 13:29:20',
        '56014', '0', '2', '2', '2020-11-16 12:03:03', '466', '2021-11-02 13:29:20', '466', '582');
INSERT INTO `kelas`
VALUES ('1198', 'VII B - DL', '61', '40', '', '1', '', '4', null, null, null, '2021-02-02 14:23:24', '39615', '0', '3',
        '0', '2021-02-02 14:23:24', '452', '2021-02-02 14:23:24', '452', '368');
INSERT INTO `kelas`
VALUES ('1199', 'VII B - DLT', '61', '40', '', '1', '', '4', null, null, null, '2021-02-02 14:24:22', '4880', '0', '28',
        '0', '2021-02-02 14:24:22', '452', '2021-02-02 14:24:22', '452', '368');
INSERT INTO `kelas`
VALUES ('1200', 'VII A - DL', '94', '30', '', '1', '', '4', null, null, null, '2021-06-03 09:37:46', '51264', '0', '3',
        '0', '2021-06-03 09:37:46', '538', '2021-06-03 09:37:46', '538', '544');
INSERT INTO `kelas`
VALUES ('1201', 'VII A - KOM', '94', '10', '', '1', '', '4', null, null, null, '2021-06-03 09:39:07', '16443', '0', '4',
        '0', '2021-06-03 09:39:07', '538', '2021-06-03 09:39:07', '538', '544');
INSERT INTO `kelas`
VALUES ('1202', 'I - A - KOM', '97', '10', '', '1', '', '7', null, null, null, '2021-06-10 08:26:07', '62005', '0', '6',
        '0', '2021-06-09 22:20:17', '538', '2021-06-10 08:26:07', '538', '548');
INSERT INTO `kelas`
VALUES ('1205', 'I - A -  DL', '102', '30', '', '1', '', '7', null, null, null, '2021-08-24 11:15:31', '18346', '0',
        '5', '0', '2021-06-09 22:39:20', '538', '2021-08-24 11:15:31', '538', '547');
INSERT INTO `kelas`
VALUES ('1206', 'II - A - KOM', '102', '10', '', '1', '', '8', null, null, null, '2021-08-24 11:15:12', '44924', '0',
        '6', '0', '2021-06-09 22:40:22', '538', '2021-08-24 11:15:12', '538', '547');
INSERT INTO `kelas`
VALUES ('1207', 'II - A - DL', '102', '30', '', '1', '', '8', null, null, null, '2021-08-24 11:14:54', '31329', '0',
        '5', '0', '2021-06-09 22:42:32', '538', '2021-08-24 11:14:54', '538', '547');
INSERT INTO `kelas`
VALUES ('1208', 'III - A - KOM', '102', '10', '', '1', '', '9', null, null, null, '2021-06-10 08:36:47', '56054', '0',
        '29', '0', '2021-06-09 22:43:26', '538', '2021-06-10 08:36:47', '538', '548');
INSERT INTO `kelas`
VALUES ('1209', 'III - A - DL', '102', '30', '', '1', '', '9', null, null, null, '2021-06-10 08:36:40', '51954', '0',
        '5', '0', '2021-06-09 22:44:20', '538', '2021-06-10 08:36:40', '538', '548');
INSERT INTO `kelas`
VALUES ('1211', 'IV - A - DL', '102', '30', '', '1', '', '10', null, null, null, '2022-01-11 10:38:57', '26673', '0',
        '5', '0', '2021-06-09 22:47:16', '538', '2022-01-11 10:38:57', '538', '536');
INSERT INTO `kelas`
VALUES ('1212', 'V - A - KOM', '102', '10', '', '1', '', '11', null, null, null, '2021-07-30 09:54:05', '58584', '0',
        '6', '0', '2021-06-09 22:48:03', '538', '2021-07-30 09:54:05', '538', '558');
INSERT INTO `kelas`
VALUES ('1213', 'V - A - DL', '102', '30', '', '1', '', '11', null, null, null, '2022-01-11 10:39:18', '41883', '0',
        '5', '0', '2021-06-09 22:48:58', '538', '2022-01-11 10:39:18', '538', '536');
INSERT INTO `kelas`
VALUES ('1214', 'VI - A - KOM', '102', '10', '', '1', '', '12', null, null, null, '2021-07-30 09:53:40', '49896', '0',
        '6', '0', '2021-06-09 22:49:54', '538', '2021-07-30 09:53:40', '538', '550');
INSERT INTO `kelas`
VALUES ('1215', 'VI - A - DL', '102', '30', '', '1', '', '12', null, null, null, '2021-07-30 09:53:15', '10739', '0',
        '5', '0', '2021-06-09 22:50:48', '538', '2021-07-30 09:53:15', '538', '550');
INSERT INTO `kelas`
VALUES ('1216', 'VIII - A - KOM', '101', '10', '', '1', '', '5', null, null, null, '2021-07-30 09:50:15', '18053', '0',
        '4', '0', '2021-06-09 22:51:41', '538', '2021-07-30 09:50:15', '538', '552');
INSERT INTO `kelas`
VALUES ('1217', 'VIII - A - DL', '101', '30', '', '1', '', '5', null, null, null, '2022-06-08 09:00:38', '58302', '0',
        '3', '0', '2021-06-09 22:52:30', '538', '2022-06-08 09:00:38', '538', '552');
INSERT INTO `kelas`
VALUES ('1218', 'IX - A - KOM', '101', '10', '', '1', '', '6', null, null, null, '2021-07-30 09:49:55', '10761', '0',
        '4', '0', '2021-06-09 22:53:11', '538', '2021-07-30 09:49:55', '538', '544');
INSERT INTO `kelas`
VALUES ('1219', 'IX - A - DL', '101', '30', '', '1', '', '6', null, null, null, '2021-07-30 09:49:39', '9959', '0', '3',
        '0', '2021-06-09 22:54:00', '538', '2021-07-30 09:49:39', '538', '544');
INSERT INTO `kelas`
VALUES ('1222', 'XI - IPA - A - KOM', '99', '10', '', '1', '', '2', null, null, null, '2022-06-20 09:39:27', '39276',
        '0', '2', '1', '2021-06-09 22:57:27', '538', '2022-06-20 09:39:27', '538', '539');
INSERT INTO `kelas`
VALUES ('1223', 'XI - IPA - A - DL', '99', '30', '', '1', '', '2', null, null, null, '2021-06-10 09:27:37', '23339',
        '0', '1', '1', '2021-06-09 22:58:43', '538', '2021-06-10 09:27:37', '538', '539');
INSERT INTO `kelas`
VALUES ('1224', 'XI - IPS - A - KOM', '99', '10', '', '1', '', '2', null, null, null, '2021-06-10 09:28:42', '35456',
        '0', '2', '2', '2021-06-09 22:59:42', '538', '2021-06-10 09:28:42', '538', '539');
INSERT INTO `kelas`
VALUES ('1225', 'XI - IPS - A - DL', '99', '30', '', '1', '', '2', null, null, null, '2021-06-10 09:28:32', '38520',
        '0', '1', '2', '2021-06-09 23:00:24', '538', '2021-06-10 09:28:32', '538', '539');
INSERT INTO `kelas`
VALUES ('1226', 'XII - IPA - A - KOM', '99', '10', '', '1', '', '3', null, null, null, '2021-07-30 09:48:44', '52668',
        '0', '2', '1', '2021-06-09 23:01:23', '538', '2021-07-30 09:48:44', '538', '543');
INSERT INTO `kelas`
VALUES ('1227', 'XII -  IPA - A - DL', '99', '30', '', '1', '', '3', null, null, null, '2021-07-30 09:47:50', '12589',
        '0', '1', '1', '2021-06-09 23:02:30', '538', '2021-07-30 09:47:50', '538', '543');
INSERT INTO `kelas`
VALUES ('1228', 'XII - IPS - A - KOM', '99', '10', '', '1', '', '3', null, null, null, '2021-07-30 09:49:03', '35999',
        '0', '2', '2', '2021-06-09 23:03:24', '538', '2021-07-30 09:49:03', '538', '543');
INSERT INTO `kelas`
VALUES ('1229', 'XII - IPS - A - DL', '99', '30', '', '1', '', '3', null, null, null, '2021-07-30 09:48:08', '11170',
        '0', '1', '2', '2021-06-09 23:04:12', '538', '2021-07-30 09:48:08', '538', '543');
INSERT INTO `kelas`
VALUES ('1230', 'I - A - KOM', '102', '10', '', '1', '', '7', null, null, null, '2021-08-24 11:15:41', '40679', '0',
        '6', '0', '2021-06-10 05:39:58', '538', '2021-08-24 11:15:41', '538', '547');
INSERT INTO `kelas`
VALUES ('1231', 'X - IPA -  A - DL', '99', '30', '', '1', '', '1', null, null, null, '2021-07-30 09:46:25', '30265',
        '0', '1', '1', '2021-06-10 05:42:02', '538', '2021-07-30 09:46:25', '538', '555');
INSERT INTO `kelas`
VALUES ('1232', 'X - IPA - A - KOM', '99', '10', '', '1', '', '1', null, null, null, '2021-07-30 09:46:44', '14939',
        '0', '2', '1', '2021-06-10 05:48:13', '538', '2021-07-30 09:46:44', '538', '555');
INSERT INTO `kelas`
VALUES ('1234', 'II - A - KOM', '97', '10', '', '1', '', '8', null, null, null, '2021-06-10 08:27:52', '11020', '0',
        '6', '0', '2021-06-10 05:52:40', '538', '2021-06-10 08:27:52', '538', '548');
INSERT INTO `kelas`
VALUES ('1235', 'II - A - DL', '97', '30', '', '1', '', '8', null, null, null, '2021-06-10 08:27:41', '25025', '0', '5',
        '0', '2021-06-10 05:53:20', '538', '2021-06-10 08:27:41', '538', '548');
INSERT INTO `kelas`
VALUES ('1236', 'III - A - KOM', '97', '10', '', '1', '', '9', null, null, null, '2021-06-10 08:28:17', '11255', '0',
        '6', '0', '2021-06-10 05:54:35', '538', '2021-06-10 08:28:17', '538', '548');
INSERT INTO `kelas`
VALUES ('1237', 'III - A - DL', '97', '30', '', '1', '', '9', null, null, null, '2021-06-10 08:28:09', '2616', '0', '5',
        '0', '2021-06-10 05:55:09', '538', '2021-06-10 08:28:09', '538', '548');
INSERT INTO `kelas`
VALUES ('1238', 'IV - A - KOM', '97', '10', '', '1', '', '10', null, null, null, '2021-06-10 08:28:37', '55889', '0',
        '6', '0', '2021-06-10 05:55:50', '538', '2021-06-10 08:28:37', '538', '546');
INSERT INTO `kelas`
VALUES ('1239', 'IV - A - DL', '97', '30', '', '1', '', '10', null, null, null, '2021-07-30 09:32:44', '7780', '0', '5',
        '0', '2021-06-10 05:56:43', '538', '2021-07-30 09:32:44', '538', '558');
INSERT INTO `kelas`
VALUES ('1240', 'V - A - KOM', '97', '10', '', '1', '', '11', null, null, null, '2021-06-10 08:29:05', '11456', '0',
        '6', '0', '2021-06-10 05:57:14', '538', '2021-06-10 08:29:05', '538', '546');
INSERT INTO `kelas`
VALUES ('1241', 'V - A - DL', '97', '30', '', '1', '', '11', null, null, null, '2021-06-10 08:28:51', '45549', '0', '5',
        '0', '2021-06-10 05:57:47', '538', '2021-06-10 08:28:51', '538', '546');
INSERT INTO `kelas`
VALUES ('1242', 'VI -  A - KOM', '97', '10', '', '1', '', '12', null, null, null, '2021-06-10 08:29:25', '23306', '0',
        '6', '0', '2021-06-10 05:58:23', '538', '2021-06-10 08:29:25', '538', '557');
INSERT INTO `kelas`
VALUES ('1243', 'VI - A - DL', '97', '30', '', '1', '', '12', null, null, null, '2021-06-10 08:29:16', '2292', '0', '5',
        '0', '2021-06-10 05:58:54', '538', '2021-06-10 08:29:16', '538', '557');
INSERT INTO `kelas`
VALUES ('1244', 'VII - A - KOM', '95', '10', '', '1', '', '4', null, null, null, '2021-06-10 08:29:56', '45414', '0',
        '4', '0', '2021-06-10 05:59:48', '538', '2021-06-10 08:29:56', '538', '544');
INSERT INTO `kelas`
VALUES ('1245', 'VII - A - DL', '95', '30', '', '1', '', '4', null, null, null, '2021-06-10 08:29:47', '20004', '0',
        '3', '0', '2021-06-10 06:07:14', '538', '2021-06-10 08:29:47', '538', '544');
INSERT INTO `kelas`
VALUES ('1246', 'VIII - A - KOM', '95', '10', '', '1', '', '5', null, null, null, '2021-07-06 10:34:05', '48195', '0',
        '4', '0', '2021-06-10 06:07:59', '538', '2021-07-06 10:34:05', '538', '543');
INSERT INTO `kelas`
VALUES ('1247', 'VIII - A - DL', '95', '30', '', '1', '', '5', null, null, null, '2021-06-10 08:30:15', '18747', '0',
        '3', '0', '2021-06-10 06:08:39', '538', '2021-06-10 08:30:15', '538', '543');
INSERT INTO `kelas`
VALUES ('1248', 'IX - A - KOM', '95', '10', '', '1', '', '6', null, null, null, '2021-06-10 08:30:35', '23994', '0',
        '4', '0', '2021-06-10 06:09:58', '538', '2021-06-10 08:30:35', '538', '552');
INSERT INTO `kelas`
VALUES ('1249', 'IX -  A - DL', '95', '30', '', '1', '', '6', null, null, null, '2021-06-10 08:30:27', '33722', '0',
        '3', '0', '2021-06-10 06:10:47', '538', '2021-06-10 08:30:27', '538', '552');
INSERT INTO `kelas`
VALUES ('1250', 'X - IPA - A - KOM', '100', '10', '', '1', '', '1', null, null, null, '2021-06-10 09:22:23', '46837',
        '0', '2', '1', '2021-06-10 06:20:17', '538', '2021-06-10 09:22:23', '538', '540');
INSERT INTO `kelas`
VALUES ('1252', 'X - IPS - A - KOM', '99', '10', '', '1', '', '1', null, null, null, '2021-07-30 09:46:57', '10379',
        '0', '2', '2', '2021-06-10 06:21:56', '538', '2021-07-30 09:46:57', '538', '555');
INSERT INTO `kelas`
VALUES ('1255', 'XI -  IPA -  A - DL', '100', '30', '', '1', '', '2', null, null, null, '2021-06-10 09:21:32', '338',
        '0', '1', '1', '2021-06-10 06:24:08', '538', '2021-06-10 09:21:32', '538', '539');
INSERT INTO `kelas`
VALUES ('1257', 'XI - IPS - A - DL', '100', '30', '', '1', '', '2', null, null, null, '2021-06-10 09:21:54', '59955',
        '0', '1', '2', '2021-06-10 06:25:24', '538', '2021-06-10 09:21:54', '538', '539');
INSERT INTO `kelas`
VALUES ('1258', 'XII - IPA - A - KOM', '100', '10', '', '1', '', '3', null, null, null, '2021-06-10 09:21:06', '15168',
        '0', '2', '1', '2021-06-10 06:25:59', '538', '2021-06-10 09:21:06', '538', '558');
INSERT INTO `kelas`
VALUES ('1260', 'XII -  IPS - A - KOM', '100', '10', '', '1', '', '3', null, null, null, '2021-06-10 09:20:53', '15743',
        '0', '2', '2', '2021-06-10 06:27:48', '538', '2021-06-10 09:20:53', '538', '558');
INSERT INTO `kelas`
VALUES ('1261', 'XII - IPS - A - DL', '100', '30', '', '1', '', '3', null, null, null, '2021-06-10 09:21:15', '31203',
        '0', '1', '2', '2021-06-10 06:28:22', '538', '2021-06-10 09:21:15', '538', '558');
INSERT INTO `kelas`
VALUES ('1262', 'I - A - DL', '97', '30', '', '1', '', '7', null, null, null, '2021-06-10 08:27:21', '30025', '0', '5',
        '0', '2021-06-10 08:27:21', '538', '2021-06-10 08:27:21', '538', '548');
INSERT INTO `kelas`
VALUES ('1263', 'VII - A - KOM', '101', '10', '', '1', '', '4', null, null, null, '2021-07-30 09:51:39', '31683', '0',
        '4', '0', '2021-06-10 08:39:36', '538', '2021-07-30 09:51:39', '538', '540');
INSERT INTO `kelas`
VALUES ('1264', 'VII - A - DL', '101', '30', '', '1', '', '4', null, null, null, '2021-07-30 09:52:00', '13368', '0',
        '3', '0', '2021-06-10 08:40:10', '538', '2021-07-30 09:52:00', '538', '540');
INSERT INTO `kelas`
VALUES ('1265', 'X - IPA - A - DL', '100', '30', '', '1', '', '1', null, null, null, '2021-06-10 09:22:14', '609', '0',
        '1', '1', '2021-06-10 08:45:36', '538', '2021-06-10 09:22:14', '538', '540');
INSERT INTO `kelas`
VALUES ('1266', 'X - IPS - A - KOM', '100', '10', '', '1', '', '1', null, null, null, '2021-06-10 09:22:43', '56816',
        '0', '2', '2', '2021-06-10 08:48:07', '538', '2021-06-10 09:22:43', '538', '540');
INSERT INTO `kelas`
VALUES ('1267', 'X - IPS - A - DL', '99', '30', '', '1', '', '1', null, null, null, '2021-07-30 09:34:04', '10217', '0',
        '1', '2', '2021-06-10 08:50:57', '538', '2021-07-30 09:34:04', '538', '555');
INSERT INTO `kelas`
VALUES ('1269', 'X - IPS - A - DL', '100', '30', '', '1', '', '1', null, null, null, '2021-06-10 09:22:34', '40864',
        '0', '1', '2', '2021-06-10 09:09:02', '538', '2021-06-10 09:22:34', '538', '540');
INSERT INTO `kelas`
VALUES ('1270', 'XI - IPA - A - KOM', '100', '10', '', '1', '', '2', null, null, null, '2021-06-10 09:21:43', '9087',
        '0', '2', '1', '2021-06-10 09:11:01', '538', '2021-06-10 09:21:43', '538', '540');
INSERT INTO `kelas`
VALUES ('1271', 'XI - IPS - A - KOM', '100', '10', '', '1', '', '2', null, null, null, '2021-06-10 09:22:03', '50743',
        '0', '2', '2', '2021-06-10 09:11:55', '538', '2021-06-10 09:22:03', '538', '539');
INSERT INTO `kelas`
VALUES ('1272', 'XII -  IPA-  A - DL', '100', '30', '', '1', '', '3', null, null, null, '2021-06-10 09:20:44', '21235',
        '0', '1', '1', '2021-06-10 09:17:19', '538', '2021-06-10 09:20:44', '538', '558');
INSERT INTO `kelas`
VALUES ('1273', 'VIII B - DL', '91', '40', '', '1', '', '5', null, null, null, '2021-06-25 09:08:38', '24988', '0', '3',
        '0', '2021-06-25 09:08:38', '452', '2021-06-25 09:08:38', '452', '368');
INSERT INTO `kelas`
VALUES ('1274', 'VIII B - DLT', '91', '40', '', '1', '', '5', null, null, null, '2021-06-25 09:09:38', '57247', '0',
        '28', '0', '2021-06-25 09:09:38', '452', '2021-06-25 09:09:38', '452', '368');
INSERT INTO `kelas`
VALUES ('1275', 'VIII B - KOMO', '91', '30', '', '1', '', '5', null, null, null, '2021-06-25 09:10:25', '30659', '0',
        '30', '0', '2021-06-25 09:10:25', '452', '2021-06-25 09:10:25', '452', '368');
INSERT INTO `kelas`
VALUES ('1276', 'VII - RA', '91', '2', '', '1', '', '4', null, null, null, '2021-12-02 11:02:18', '64039', '0', '34',
        '0', '2021-07-13 15:51:43', '452', '2021-12-02 11:02:18', '117', '405');
INSERT INTO `kelas`
VALUES ('1277', 'VIII A - RA', '91', '2', '', '1', '', '5', null, null, null, '2021-12-02 11:04:15', '44562', '0', '34',
        '0', '2021-07-13 15:52:51', '452', '2021-12-02 11:04:15', '117', '324');
INSERT INTO `kelas`
VALUES ('1278', 'VIII B - RA', '91', '2', '', '1', '', '5', null, null, null, '2021-12-02 11:04:35', '32175', '0', '34',
        '0', '2021-07-13 15:53:33', '452', '2021-12-02 11:04:35', '117', '368');
INSERT INTO `kelas`
VALUES ('1279', 'IX A - RA', '91', '2', '', '1', '', '6', null, null, null, '2021-12-02 11:04:53', '52184', '0', '34',
        '0', '2021-07-13 15:54:28', '452', '2021-12-02 11:04:53', '117', '132');
INSERT INTO `kelas`
VALUES ('1280', 'IX B - RA', '91', '2', '', '1', '', '6', null, null, null, '2021-12-02 11:05:03', '36998', '0', '34',
        '0', '2021-07-13 15:54:59', '452', '2021-12-02 11:05:03', '117', '269');
INSERT INTO `kelas`
VALUES ('1281', 'IV - A - KOM', '102', '10', '', '1', '', '10', null, null, null, '2021-07-30 10:00:47', '56443', '0',
        '6', '0', '2021-07-30 10:00:15', '538', '2021-07-30 10:00:47', '538', '558');
INSERT INTO `kelas`
VALUES ('1282', 'III - A - DL', '102', '30', '', '1', '', '7', null, null, null, '2021-07-30 10:02:09', '26686', '0',
        '5', '0', '2021-07-30 10:02:09', '538', '2021-07-30 10:02:09', '538', '547');
INSERT INTO `kelas`
VALUES ('1283', 'III - A - KOM', '102', '10', '', '1', '', '9', null, null, null, '2021-07-30 10:03:36', '41826', '0',
        '5', '0', '2021-07-30 10:03:36', '538', '2021-07-30 10:03:36', '538', '547');
INSERT INTO `kelas`
VALUES ('1284', 'V - C - II', '90', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '1256', '0', '36',
        '5', '2021-08-23 17:07:26', '117', '2021-08-23 17:07:26', '117', '519');
INSERT INTO `kelas`
VALUES ('1285', 'I - C - II', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '25716', '0', '36',
        '5', '2021-09-15 10:13:08', '117', '2021-09-15 10:13:08', '117', '574');
INSERT INTO `kelas`
VALUES ('1286', 'I - C1 - II', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '42539', '0', '36',
        '8', '2021-09-15 14:56:24', '117', '2021-09-15 14:56:24', '117', '574');
INSERT INTO `kelas`
VALUES ('1287', 'I - Q - II', '90', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '38021', '0', '36',
        '7', '2021-09-15 14:59:01', '117', '2021-09-15 14:59:01', '117', '574');
INSERT INTO `kelas`
VALUES ('1288', 'I - DL', '103', '40', '', '1', '', '7', null, null, null, '2022-07-21 09:01:40', '18050', '0', '5',
        '0', '2021-10-26 09:07:33', '320', '2022-07-21 09:01:40', '320', '612');
INSERT INTO `kelas`
VALUES ('1289', 'X -  B - DL', '104', '40', '', '1', '', '1', null, null, null, '2022-07-11 16:36:26', '30872', '0',
        '1', '0', '2021-10-26 09:07:37', '120', '2022-07-11 16:36:26', '120', '515');
INSERT INTO `kelas`
VALUES ('1290', 'VII - DL', '105', '40', '', '1', '', '4', null, null, null, '2022-07-07 10:05:16', '17455', '0', '3',
        '0', '2021-10-26 09:12:25', '452', '2022-07-07 10:05:16', '452', '518');
INSERT INTO `kelas`
VALUES ('1291', 'I - DLT', '103', '40', '', '1', '', '7', null, null, null, '2022-07-21 09:01:54', '47114', '0', '26',
        '0', '2021-10-26 09:19:28', '320', '2022-07-21 09:01:54', '320', '612');
INSERT INTO `kelas`
VALUES ('1292', 'I - KOM', '103', '9', '', '1', '', '7', null, null, null, '2022-07-21 09:02:21', '46760', '0', '6',
        '0', '2021-10-26 09:20:54', '320', '2022-07-21 09:02:21', '320', '612');
INSERT INTO `kelas`
VALUES ('1293', 'X - A - DLT', '104', '40', '', '1', '', '1', null, null, null, '2022-07-11 16:39:18', '39837', '0',
        '27', '0', '2021-10-26 09:22:05', '120', '2022-07-11 16:39:18', '120', '486');
INSERT INTO `kelas`
VALUES ('1295', 'I - KOMO', '103', '25', '', '1', '', '7', null, null, null, '2022-07-21 09:02:31', '63648', '0', '29',
        '0', '2021-10-26 09:22:39', '320', '2022-07-21 09:02:31', '320', '612');
INSERT INTO `kelas`
VALUES ('1296', 'I - INK', '103', '3', '', '1', '', '7', null, null, null, '2022-07-21 09:02:08', '4698', '0', '37',
        '0', '2021-10-26 09:23:42', '320', '2022-07-21 09:02:08', '320', '612');
INSERT INTO `kelas`
VALUES ('1297', 'II - DL', '103', '40', '', '1', '', '8', null, null, null, '2022-07-21 09:00:14', '54015', '0', '5',
        '0', '2021-10-26 09:26:03', '320', '2022-07-21 09:00:14', '320', '611');
INSERT INTO `kelas`
VALUES ('1298', 'II - DLT', '103', '40', '', '1', '', '8', null, null, null, '2022-07-21 09:00:28', '42792', '0', '26',
        '0', '2021-10-26 09:26:48', '320', '2022-07-21 09:00:28', '320', '611');
INSERT INTO `kelas`
VALUES ('1299', 'X - B - KOM', '104', '11', '', '1', '', '1', null, null, null, '2022-08-15 11:21:37', '22655', '0',
        '2', '0', '2021-10-26 09:26:49', '120', '2022-08-15 11:21:37', '120', '515');
INSERT INTO `kelas`
VALUES ('1300', 'X - A - KOMO', '104', '30', '', '1', '', '1', null, null, null, '2022-07-11 16:38:24', '49691', '0',
        '31', '0', '2021-10-26 09:29:38', '120', '2022-07-11 16:38:24', '120', '486');
INSERT INTO `kelas`
VALUES ('1301', 'II - KOM', '103', '9', '', '1', '', '8', null, null, null, '2022-07-21 09:00:56', '56961', '0', '6',
        '0', '2021-10-26 09:32:42', '320', '2022-07-21 09:00:56', '320', '611');
INSERT INTO `kelas`
VALUES ('1302', 'II - KOMO', '103', '25', '', '1', '', '8', null, null, null, '2022-07-21 09:01:11', '53115', '0', '29',
        '0', '2021-10-26 09:33:43', '320', '2022-07-21 09:01:11', '320', '611');
INSERT INTO `kelas`
VALUES ('1303', 'II - INK', '103', '3', '', '1', '', '8', null, null, null, '2022-07-21 09:00:40', '1566', '0', '37',
        '0', '2021-10-26 09:34:34', '320', '2022-07-21 09:00:40', '320', '611');
INSERT INTO `kelas`
VALUES ('1304', 'X - A - DL', '104', '40', '', '1', '', '1', null, null, null, '2022-07-11 16:35:05', '44994', '0', '1',
        '0', '2021-10-26 09:36:05', '120', '2022-07-11 16:35:05', '120', '486');
INSERT INTO `kelas`
VALUES ('1305', 'III - DL', '103', '40', '', '1', '', '9', null, null, null, '2021-10-26 16:00:05', '47730', '0', '5',
        '0', '2021-10-26 09:36:10', '320', '2021-10-26 16:00:05', '117', '217');
INSERT INTO `kelas`
VALUES ('1306', 'III - DLT', '103', '40', '', '1', '', '9', null, null, null, '2021-10-26 16:00:05', '64850', '0', '26',
        '0', '2021-10-26 09:36:48', '320', '2021-10-26 16:00:05', '117', '217');
INSERT INTO `kelas`
VALUES ('1307', 'X - A - KOM', '104', '6', '', '1', '', '1', null, null, null, '2022-07-26 14:15:49', '61517', '0', '2',
        '0', '2021-10-26 09:37:05', '120', '2022-07-26 14:15:49', '120', '486');
INSERT INTO `kelas`
VALUES ('1308', 'III - KOM', '103', '9', '', '1', '', '9', null, null, null, '2021-10-27 14:50:14', '5888', '0', '6',
        '0', '2021-10-26 09:37:35', '320', '2021-10-27 14:50:14', '320', '217');
INSERT INTO `kelas`
VALUES ('1309', 'III - KOMO', '103', '25', '', '1', '', '9', null, null, null, '2021-10-26 16:00:07', '22231', '0',
        '29', '0', '2021-10-26 09:39:03', '320', '2021-10-26 16:00:07', '117', '217');
INSERT INTO `kelas`
VALUES ('1311', 'III - INK', '103', '3', '', '1', '', '9', null, null, null, '2022-07-11 13:58:58', '37719', '0', '37',
        '0', '2021-10-26 09:39:45', '320', '2022-07-11 13:58:58', '320', '217');
INSERT INTO `kelas`
VALUES ('1313', 'IV - DL', '103', '40', '', '1', '', '10', null, null, null, '2022-07-21 09:02:55', '37421', '0', '5',
        '0', '2021-10-26 09:40:52', '320', '2022-07-21 09:02:55', '320', '522');
INSERT INTO `kelas`
VALUES ('1314', 'IV - DLT', '103', '40', '', '1', '', '10', null, null, null, '2022-07-21 09:03:11', '64079', '0', '26',
        '0', '2021-10-26 09:41:38', '320', '2022-07-21 09:03:11', '320', '522');
INSERT INTO `kelas`
VALUES ('1315', 'IV - KOM', '103', '9', '', '1', '', '10', null, null, null, '2022-07-21 09:03:39', '64475', '0', '6',
        '0', '2021-10-26 09:42:33', '320', '2022-07-21 09:03:39', '320', '522');
INSERT INTO `kelas`
VALUES ('1316', 'X - B - DLT', '104', '40', '', '1', '', '1', null, null, null, '2022-07-11 16:39:53', '35037', '0',
        '27', '0', '2021-10-26 09:43:00', '120', '2022-07-11 16:39:53', '120', '515');
INSERT INTO `kelas`
VALUES ('1317', 'IV - KOMO', '103', '25', '', '1', '', '10', null, null, null, '2022-07-21 09:03:50', '54970', '0',
        '29', '0', '2021-10-26 09:43:39', '320', '2022-07-21 09:03:50', '320', '522');
INSERT INTO `kelas`
VALUES ('1318', 'IV - INK', '103', '3', '', '1', '', '10', null, null, null, '2022-07-21 09:03:24', '2586', '0', '37',
        '0', '2021-10-26 09:44:27', '320', '2022-07-21 09:03:24', '320', '522');
INSERT INTO `kelas`
VALUES ('1319', 'X - B - KOMO', '104', '30', '', '1', '', '1', null, null, null, '2022-07-11 16:38:50', '40738', '0',
        '31', '0', '2021-10-26 09:44:39', '120', '2022-07-11 16:38:50', '120', '515');
INSERT INTO `kelas`
VALUES ('1320', 'V - DL', '103', '40', '', '1', '', '11', null, null, null, '2022-07-21 09:04:22', '64140', '0', '5',
        '0', '2021-10-26 09:45:27', '320', '2022-07-21 09:04:22', '320', '560');
INSERT INTO `kelas`
VALUES ('1321', 'V - DLT', '103', '40', '', '1', '', '11', null, null, null, '2022-07-21 09:04:37', '49069', '0', '26',
        '0', '2021-10-26 09:47:44', '320', '2022-07-21 09:04:37', '320', '560');
INSERT INTO `kelas`
VALUES ('1322', 'V - KOM', '103', '9', '', '1', '', '11', null, null, null, '2022-07-21 09:04:59', '30629', '0', '6',
        '0', '2021-10-26 09:48:32', '320', '2022-07-21 09:04:59', '320', '560');
INSERT INTO `kelas`
VALUES ('1323', 'V - KOMO', '103', '25', '', '1', '', '11', null, null, null, '2022-07-21 09:05:11', '41475', '0', '29',
        '0', '2021-10-26 09:49:15', '320', '2022-07-21 09:05:11', '320', '560');
INSERT INTO `kelas`
VALUES ('1324', 'V - INK', '103', '3', '', '1', '', '11', null, null, null, '2022-07-21 09:04:47', '34735', '0', '37',
        '0', '2021-10-26 09:50:21', '320', '2022-07-21 09:04:47', '320', '560');
INSERT INTO `kelas`
VALUES ('1325', 'VI - DL', '103', '40', '', '1', '', '12', null, null, null, '2022-07-21 09:05:28', '15045', '0', '5',
        '0', '2021-10-26 09:51:14', '320', '2022-07-21 09:05:28', '320', '108');
INSERT INTO `kelas`
VALUES ('1326', 'VI - DLT', '103', '40', '', '1', '', '12', null, null, null, '2022-07-21 09:05:40', '58652', '0', '26',
        '0', '2021-10-26 09:52:11', '320', '2022-07-21 09:05:40', '320', '108');
INSERT INTO `kelas`
VALUES ('1327', 'XI - IPA - DL', '104', '40', '', '1', '', '2', null, null, null, '2022-07-20 10:39:43', '16313', '0',
        '1', '1', '2021-10-26 09:52:53', '120', '2022-07-20 10:39:43', '120', '469');
INSERT INTO `kelas`
VALUES ('1328', 'VI - KOM', '103', '9', '', '1', '', '12', null, null, null, '2022-07-21 09:05:58', '13079', '0', '6',
        '0', '2021-10-26 09:52:54', '320', '2022-07-21 09:05:58', '320', '108');
INSERT INTO `kelas`
VALUES ('1329', 'VI - KOMO', '103', '25', '', '1', '', '12', null, null, null, '2022-07-21 09:06:08', '30029', '0',
        '29', '0', '2021-10-26 09:53:46', '320', '2022-07-21 09:06:08', '320', '108');
INSERT INTO `kelas`
VALUES ('1330', 'VI - INK', '103', '3', '', '1', '', '12', null, null, null, '2022-07-21 09:05:50', '48125', '0', '37',
        '0', '2021-10-26 09:54:29', '320', '2022-07-21 09:05:50', '320', '108');
INSERT INTO `kelas`
VALUES ('1331', 'XI - IPA - DLT', '104', '40', '', '1', '', '2', null, null, null, '2021-10-26 14:55:43', '63919', '0',
        '27', '1', '2021-10-26 10:08:11', '120', '2021-10-26 14:55:43', '120', '469');
INSERT INTO `kelas`
VALUES ('1332', 'I', '107', '20', '', '1', '', '7', null, null, null, '2022-08-08 10:30:12', '40681', '0', '36', '0',
        '2021-10-26 10:52:12', '320', '2022-08-08 10:30:12', '320', '612');
INSERT INTO `kelas`
VALUES ('1333', 'II', '107', '20', '', '1', '', '8', null, null, null, '2022-08-08 10:30:31', '1902', '0', '36', '0',
        '2021-10-26 10:52:59', '320', '2022-08-08 10:30:31', '320', '611');
INSERT INTO `kelas`
VALUES ('1334', 'III', '107', '20', '', '1', '', '9', null, null, null, '2022-01-11 11:39:38', '10541', '0', '36', '0',
        '2021-10-26 10:53:44', '320', '2021-10-27 10:03:22', '320', '217');
INSERT INTO `kelas`
VALUES ('1335', 'VII - DLT	', '105', '40', '', '1', '', '4', null, null, null, '2022-07-07 10:05:39', '45580', '0',
        '28', '0', '2021-10-26 11:16:07', '452', '2022-07-07 10:05:39', '452', '518');
INSERT INTO `kelas`
VALUES ('1336', 'VII - KOM', '105', '8', '', '1', '', '4', null, null, null, '2022-09-13 10:57:31', '13021', '0', '4',
        '0', '2021-10-26 11:16:47', '452', '2022-09-13 10:57:31', '117', '518');
INSERT INTO `kelas`
VALUES ('1337', 'VII - KOMO', '105', '30', '', '1', '', '4', null, null, null, '2022-07-07 10:07:17', '35803', '0',
        '30', '0', '2021-10-26 11:17:40', '452', '2022-07-07 10:07:17', '452', '518');
INSERT INTO `kelas`
VALUES ('1338', 'VII - INK', '105', '4', '', '1', '', '4', null, null, null, '2022-09-13 10:57:21', '25613', '0', '41',
        '0', '2021-10-26 11:18:43', '452', '2022-09-13 10:57:21', '117', '518');
INSERT INTO `kelas`
VALUES ('1339', 'VIII - A - DL	', '105', '40', '', '1', '', '5', null, null, null, '2022-07-07 10:12:48', '37775',
        '0', '3', '0', '2021-10-26 11:19:39', '452', '2022-07-07 10:12:48', '452', '368');
INSERT INTO `kelas`
VALUES ('1340', 'VIII - A - DLT', '105', '40', '', '1', '', '5', null, null, null, '2022-07-07 10:13:11', '52810', '0',
        '28', '0', '2021-10-26 11:20:19', '452', '2022-07-07 10:13:11', '452', '368');
INSERT INTO `kelas`
VALUES ('1341', 'VIII - A - KOM', '105', '8', '', '1', '', '5', null, null, null, '2022-09-13 10:59:45', '48210', '0',
        '4', '0', '2021-10-26 11:20:53', '452', '2022-09-13 10:59:45', '117', '368');
INSERT INTO `kelas`
VALUES ('1342', 'VIII - A - KOMO', '105', '30', '', '1', '', '5', null, null, null, '2022-07-07 10:13:59', '61778', '0',
        '30', '0', '2021-10-26 11:21:34', '452', '2022-07-07 10:13:59', '452', '368');
INSERT INTO `kelas`
VALUES ('1343', 'VIII - A - INK', '105', '4', '', '1', '', '5', null, null, null, '2022-09-13 10:59:36', '19400', '0',
        '41', '0', '2021-10-26 11:22:01', '452', '2022-09-13 10:59:36', '117', '368');
INSERT INTO `kelas`
VALUES ('1344', 'VIII - B - DL', '105', '40', '', '1', '', '5', null, null, null, '2022-07-07 10:16:19', '39337', '0',
        '3', '0', '2021-10-26 11:22:27', '452', '2022-07-07 10:16:19', '452', '405');
INSERT INTO `kelas`
VALUES ('1345', 'VIII - B - DLT', '105', '40', '', '1', '', '5', null, null, null, '2022-07-07 10:16:38', '7617', '0',
        '28', '0', '2021-10-26 11:22:53', '452', '2022-07-07 10:16:38', '452', '405');
INSERT INTO `kelas`
VALUES ('1346', 'VIII - B - KOM	', '105', '8', '', '1', '', '5', null, null, null, '2022-09-13 11:00:01', '5396',
        '0', '4', '0', '2021-10-26 11:23:24', '452', '2022-09-13 11:00:01', '117', '405');
INSERT INTO `kelas`
VALUES ('1347', 'VIII - B - KOMO', '105', '30', '', '1', '', '5', null, null, null, '2022-07-07 10:17:30', '53765', '0',
        '30', '0', '2021-10-26 11:23:55', '452', '2022-07-07 10:17:30', '452', '405');
INSERT INTO `kelas`
VALUES ('1348', 'VIII - B - INK', '105', '4', '', '1', '', '5', null, null, null, '2022-09-13 10:59:55', '6021', '0',
        '41', '0', '2021-10-26 11:24:27', '452', '2022-09-13 10:59:55', '117', '405');
INSERT INTO `kelas`
VALUES ('1349', 'IX - A - DL', '105', '40', '', '1', '', '6', null, null, null, '2022-07-07 10:18:56', '52075', '0',
        '3', '0', '2021-10-26 11:25:20', '452', '2022-07-07 10:18:56', '452', '269');
INSERT INTO `kelas`
VALUES ('1350', 'IX - A - DLT', '105', '40', '', '1', '', '6', null, null, null, '2022-07-07 10:19:06', '2688', '0',
        '28', '0', '2021-10-26 11:25:51', '452', '2022-07-07 10:19:06', '452', '269');
INSERT INTO `kelas`
VALUES ('1351', 'IX - A - KOM	', '105', '8', '', '1', '', '6', null, null, null, '2022-09-13 11:00:38', '18797', '0',
        '4', '0', '2021-10-26 11:26:19', '452', '2022-09-13 11:00:38', '117', '269');
INSERT INTO `kelas`
VALUES ('1352', 'IX - A - KOMO	', '105', '30', '', '1', '', '6', null, null, null, '2022-07-07 10:19:34', '58529',
        '0', '30', '0', '2021-10-26 11:26:57', '452', '2022-07-07 10:19:34', '452', '269');
INSERT INTO `kelas`
VALUES ('1353', 'IX - A - INK', '105', '4', '', '1', '', '6', null, null, null, '2022-09-13 11:00:32', '22461', '0',
        '41', '0', '2021-10-26 11:27:32', '452', '2022-09-13 11:00:32', '117', '269');
INSERT INTO `kelas`
VALUES ('1354', 'IX - B - DL	', '105', '12', '', '1', '', '6', null, null, null, '2022-07-07 10:20:47', '26468', '0',
        '3', '0', '2021-10-26 11:28:15', '452', '2022-07-07 10:20:47', '452', '324');
INSERT INTO `kelas`
VALUES ('1355', 'IX - B - DLT	', '105', '40', '', '1', '', '6', null, null, null, '2022-07-07 10:21:06', '30141',
        '0', '28', '0', '2021-10-26 11:28:49', '452', '2022-07-07 10:21:06', '452', '324');
INSERT INTO `kelas`
VALUES ('1356', 'IX - B - KOM', '105', '8', '', '1', '', '6', null, null, null, '2022-09-13 11:01:11', '8340', '0', '4',
        '0', '2021-10-26 11:29:16', '452', '2022-09-13 11:01:11', '117', '324');
INSERT INTO `kelas`
VALUES ('1357', 'IX - B - KOMO', '105', '30', '', '1', '', '6', null, null, null, '2022-07-07 10:21:56', '12917', '0',
        '30', '0', '2021-10-26 11:31:46', '452', '2022-07-07 10:21:56', '452', '324');
INSERT INTO `kelas`
VALUES ('1358', 'IX - B - INK', '105', '4', '', '1', '', '6', null, null, null, '2022-09-13 11:00:53', '16789', '0',
        '41', '0', '2021-10-26 11:32:12', '452', '2022-09-13 11:00:53', '117', '324');
INSERT INTO `kelas`
VALUES ('1359', 'XI - IPA - KOM', '104', '10', '', '1', '', '2', null, null, null, '2022-09-12 15:16:50', '45978', '0',
        '2', '1', '2021-10-26 11:39:37', '120', '2022-09-12 15:16:50', '120', '469');
INSERT INTO `kelas`
VALUES ('1360', 'XI - IPA - KOMO', '104', '30', '', '1', '', '2', null, null, null, '2022-09-12 15:17:09', '65147', '0',
        '31', '1', '2021-10-26 11:42:08', '120', '2022-09-12 15:17:09', '120', '469');
INSERT INTO `kelas`
VALUES ('1361', 'XI - IPS - A - DL', '104', '40', '', '1', '', '2', null, null, null, '2022-07-14 10:35:51', '62585',
        '0', '1', '2', '2021-10-26 11:47:14', '120', '2022-07-14 10:35:51', '120', '381');
INSERT INTO `kelas`
VALUES ('1362', 'XI - IPS - A - KOM', '104', '10', '', '1', '', '2', null, null, null, '2022-09-07 10:40:51', '61829',
        '0', '2', '2', '2021-10-26 11:48:17', '120', '2022-09-07 10:40:51', '120', '428');
INSERT INTO `kelas`
VALUES ('1363', 'XI - IPS - B - DL', '104', '40', '', '1', '', '2', null, null, null, '2022-07-14 10:36:53', '26065',
        '0', '1', '2', '2021-10-26 11:49:39', '120', '2022-07-14 10:36:53', '120', '428');
INSERT INTO `kelas`
VALUES ('1364', 'XI - IPS - B - KOM', '104', '10', '', '1', '', '2', null, null, null, '2022-07-14 10:37:08', '11944',
        '0', '2', '2', '2021-10-26 11:50:37', '120', '2022-07-14 10:37:08', '120', '428');
INSERT INTO `kelas`
VALUES ('1365', 'XI - IPS - A - DLT', '104', '40', '', '1', '', '2', null, null, null, '2022-07-14 10:38:32', '13411',
        '0', '27', '2', '2021-10-26 11:52:31', '120', '2022-07-14 10:38:32', '120', '381');
INSERT INTO `kelas`
VALUES ('1366', 'XI - IPS - A - KOMO', '104', '30', '', '1', '', '2', null, null, null, '2022-07-14 10:39:14', '21232',
        '0', '31', '2', '2021-10-26 11:54:46', '120', '2022-07-14 10:39:14', '120', '381');
INSERT INTO `kelas`
VALUES ('1367', 'XII - IPA - DL', '104', '40', '', '1', '', '3', null, null, null, '2022-07-14 10:39:56', '42851', '0',
        '1', '1', '2021-10-26 11:56:20', '120', '2022-07-14 10:39:56', '120', '130');
INSERT INTO `kelas`
VALUES ('1368', 'XII - IPA - DLT	', '104', '40', '', '1', '', '3', null, null, null, '2022-07-14 10:40:06', '42728',
        '0', '27', '1', '2021-10-26 11:57:51', '120', '2022-07-14 10:40:06', '120', '130');
INSERT INTO `kelas`
VALUES ('1369', 'XII - IPA - KOM', '104', '10', '', '1', '', '3', null, null, null, '2022-07-14 10:40:14', '50864', '0',
        '2', '1', '2021-10-26 11:59:10', '120', '2022-07-14 10:40:14', '120', '130');
INSERT INTO `kelas`
VALUES ('1370', 'XII - IPA - KOMO', '104', '30', '', '1', '', '3', null, null, null, '2022-07-14 10:40:25', '39775',
        '0', '31', '1', '2021-10-26 12:00:07', '120', '2022-07-14 10:40:25', '120', '130');
INSERT INTO `kelas`
VALUES ('1371', 'XII - IPS - A - DL', '104', '40', '', '1', '', '3', null, null, null, '2022-07-14 10:40:47', '1294',
        '0', '1', '2', '2021-10-26 12:01:16', '120', '2022-07-14 10:40:47', '120', '153');
INSERT INTO `kelas`
VALUES ('1372', 'XII - IPS - A - DLT', '104', '40', '', '1', '', '3', null, null, null, '2022-09-08 09:48:38', '17498',
        '0', '27', '2', '2021-10-26 12:02:16', '120', '2022-09-08 09:48:38', '120', '406');
INSERT INTO `kelas`
VALUES ('1373', 'XII - IPS - A - KOM', '104', '10', '', '1', '', '3', null, null, null, '2022-07-14 10:41:10', '43834',
        '0', '2', '2', '2021-10-26 12:03:11', '120', '2022-07-14 10:41:10', '120', '153');
INSERT INTO `kelas`
VALUES ('1374', 'XII - IPS - B - DL', '104', '40', '', '1', '', '3', null, null, null, '2022-07-14 10:42:11', '42251',
        '0', '1', '2', '2021-10-26 12:03:58', '120', '2022-07-14 10:42:11', '120', '406');
INSERT INTO `kelas`
VALUES ('1375', 'XII - IPS - B - DLT', '104', '40', '', '1', '', '3', null, null, null, '2022-07-14 10:42:23', '14743',
        '0', '27', '2', '2021-10-26 12:04:47', '120', '2022-07-14 10:42:23', '120', '406');
INSERT INTO `kelas`
VALUES ('1376', 'XII - IPS - B - KOM', '104', '10', '', '1', '', '3', null, null, null, '2022-07-14 10:42:35', '60009',
        '0', '2', '2', '2021-10-26 12:05:47', '120', '2022-07-14 10:42:35', '120', '406');
INSERT INTO `kelas`
VALUES ('1377', 'XII - IPS - KOMO', '104', '30', '', '1', '', '3', null, null, null, '2022-09-05 10:56:53', '51858',
        '0', '31', '2', '2021-10-26 12:06:37', '120', '2022-09-05 10:56:53', '120', '153');
INSERT INTO `kelas`
VALUES ('1378', 'X - A - INK', '104', '4', '', '1', '', '1', null, null, null, '2022-07-26 14:15:42', '55147', '0',
        '42', '0', '2021-10-26 12:08:36', '120', '2022-07-26 14:15:42', '120', '486');
INSERT INTO `kelas`
VALUES ('1379', 'X - B - INK', '104', '0', '', '1', '', '1', null, null, null, '2022-08-02 15:34:01', '63852', '0',
        '42', '0', '2021-10-26 12:10:16', '120', '2022-08-02 15:34:01', '120', '515');
INSERT INTO `kelas`
VALUES ('1380', 'I - A', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '47825', '0', '36', '3',
        '2021-10-26 14:44:48', '117', '2021-10-26 14:48:19', '117', '574');
INSERT INTO `kelas`
VALUES ('1381', 'I - B', '106', '3', '', '1', '', '7', null, null, null, '2022-09-19 14:04:35', '27959', '0', '36', '4',
        '2021-10-26 14:54:24', '117', '2022-09-19 14:04:35', '117', '627');
INSERT INTO `kelas`
VALUES ('1382', 'I - C', '106', '3', '', '1', '', '7', null, null, null, '2022-09-19 14:02:53', '32160', '0', '36', '5',
        '2021-10-26 14:55:05', '117', '2022-09-19 14:02:53', '117', '627');
INSERT INTO `kelas`
VALUES ('1383', 'I - C1', '106', '3', '', '1', '', '7', null, null, null, '2022-09-19 14:00:49', '29521', '0', '36',
        '8', '2021-10-26 14:56:19', '117', '2022-09-19 14:00:49', '117', '387');
INSERT INTO `kelas`
VALUES ('1384', 'I - D', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '29458', '0', '36', '6',
        '2021-10-26 14:56:53', '117', '2021-10-26 14:56:53', '117', '574');
INSERT INTO `kelas`
VALUES ('1385', 'I - D1', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '50921', '0', '36',
        '9', '2021-10-26 14:57:32', '117', '2021-10-26 14:57:32', '117', '574');
INSERT INTO `kelas`
VALUES ('1386', 'I - E', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '8326', '0', '36', '10',
        '2021-10-26 15:02:13', '117', '2021-10-26 15:02:13', '117', '574');
INSERT INTO `kelas`
VALUES ('1387', 'I - F', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '18655', '0', '36',
        '11', '2021-10-26 15:04:02', '117', '2021-10-26 15:04:02', '117', '574');
INSERT INTO `kelas`
VALUES ('1388', 'I - H', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '29767', '0', '36',
        '12', '2021-10-26 15:04:41', '117', '2021-10-26 15:04:41', '117', '574');
INSERT INTO `kelas`
VALUES ('1389', 'I - I', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '33698', '0', '36',
        '13', '2021-10-26 15:06:18', '117', '2021-10-26 15:06:18', '117', '574');
INSERT INTO `kelas`
VALUES ('1390', 'I - J', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '17847', '0', '36',
        '14', '2021-10-26 15:07:01', '117', '2021-10-26 15:07:01', '117', '574');
INSERT INTO `kelas`
VALUES ('1391', 'I - K', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '5063', '0', '36', '15',
        '2021-10-26 15:07:31', '117', '2021-10-26 15:07:31', '117', '574');
INSERT INTO `kelas`
VALUES ('1392', 'I - N', '106', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:06', '34682', '0', '36',
        '16', '2021-10-26 15:08:00', '117', '2021-10-26 16:40:28', '117', '574');
INSERT INTO `kelas`
VALUES ('1393', 'I - O', '106', '3', '', '0', '', '7', null, null, null, '2022-01-11 12:01:06', '860', '0', '36', '17',
        '2021-10-26 15:08:51', '117', '2021-10-26 16:40:24', '117', '574');
INSERT INTO `kelas`
VALUES ('1394', 'I - P', '106', '3', '', '1', '', '7', null, null, null, '2022-01-11 12:01:06', '21463', '0', '36',
        '18', '2021-10-26 15:09:20', '117', '2021-10-26 15:09:20', '117', '574');
INSERT INTO `kelas`
VALUES ('1395', 'I - Q', '106', '3', '', '1', '', '7', null, null, null, '2022-09-19 14:03:24', '23281', '0', '36', '7',
        '2021-10-26 15:09:59', '117', '2022-09-19 14:03:24', '117', '627');
INSERT INTO `kelas`
VALUES ('1396', 'II - A', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '25899', '0', '36',
        '3', '2021-10-26 15:14:07', '117', '2021-10-26 15:14:07', '117', '480');
INSERT INTO `kelas`
VALUES ('1397', 'II - B', '106', '3', '', '1', '', '8', null, null, null, '2022-09-19 14:08:05', '27786', '0', '36',
        '4', '2021-10-26 15:14:24', '117', '2022-09-19 14:08:05', '117', '387');
INSERT INTO `kelas`
VALUES ('1398', 'II - C - I', '106', '3', '', '1', '', '8', null, null, null, '2022-09-19 14:07:20', '16288', '0', '36',
        '5', '2021-10-26 15:14:41', '117', '2022-09-19 14:07:20', '117', '574');
INSERT INTO `kelas`
VALUES ('1399', 'II - C1', '106', '3', '', '1', '', '8', null, null, null, '2022-09-19 14:07:09', '9011', '0', '36',
        '8', '2021-10-26 15:14:58', '117', '2022-09-19 14:07:09', '117', '574');
INSERT INTO `kelas`
VALUES ('1400', 'II - D', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '55280', '0', '36',
        '6', '2021-10-26 15:15:13', '117', '2021-10-26 15:15:13', '117', '480');
INSERT INTO `kelas`
VALUES ('1401', 'II - D1', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '13331', '0', '36',
        '9', '2021-10-26 15:15:29', '117', '2021-10-26 15:15:29', '117', '480');
INSERT INTO `kelas`
VALUES ('1402', 'II - E', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '23889', '0', '36',
        '10', '2021-10-26 15:15:43', '117', '2021-10-26 15:15:43', '117', '480');
INSERT INTO `kelas`
VALUES ('1403', 'II - F', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '62325', '0', '36',
        '11', '2021-10-26 15:15:58', '117', '2021-10-26 15:15:58', '117', '480');
INSERT INTO `kelas`
VALUES ('1404', 'II - H', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '2781', '0', '36',
        '12', '2021-10-26 15:16:13', '117', '2021-10-26 15:16:13', '117', '480');
INSERT INTO `kelas`
VALUES ('1405', 'II - I', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '35176', '0', '36',
        '13', '2021-10-26 15:16:27', '117', '2021-10-26 15:16:27', '117', '480');
INSERT INTO `kelas`
VALUES ('1406', 'II - J', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '59651', '0', '36',
        '14', '2021-10-26 15:16:43', '117', '2021-10-26 15:16:43', '117', '480');
INSERT INTO `kelas`
VALUES ('1407', 'II - K', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '64622', '0', '36',
        '15', '2021-10-26 15:16:58', '117', '2021-10-26 15:16:58', '117', '480');
INSERT INTO `kelas`
VALUES ('1408', 'II - N', '106', '3', '', '0', '', '8', null, null, null, '2022-01-11 12:01:06', '55664', '0', '36',
        '16', '2021-10-26 15:17:13', '117', '2021-10-26 16:43:33', '117', '480');
INSERT INTO `kelas`
VALUES ('1409', 'II - O', '106', '3', '', '0', '', '8', null, null, null, '2022-01-11 12:01:06', '34982', '0', '36',
        '17', '2021-10-26 15:17:30', '117', '2021-10-26 16:43:27', '117', '480');
INSERT INTO `kelas`
VALUES ('1410', 'II - P', '106', '3', '', '1', '', '8', null, null, null, '2022-01-11 12:01:06', '15401', '0', '36',
        '18', '2021-10-26 15:17:44', '117', '2021-10-26 15:17:44', '117', '480');
INSERT INTO `kelas`
VALUES ('1411', 'II - Q', '106', '3', '', '1', '', '8', null, null, null, '2022-09-19 14:05:21', '27227', '0', '36',
        '7', '2021-10-26 15:18:00', '117', '2022-09-19 14:05:21', '117', '574');
INSERT INTO `kelas`
VALUES ('1412', 'III - A', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:36:43', '26209', '0', '36',
        '3', '2021-10-26 15:23:11', '117', '2022-07-18 15:36:43', '117', '248');
INSERT INTO `kelas`
VALUES ('1413', 'III - B', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:37:19', '48799', '0', '36',
        '4', '2021-10-26 15:23:29', '117', '2022-07-18 15:37:19', '117', '248');
INSERT INTO `kelas`
VALUES ('1414', 'III - C', '106', '3', '', '1', '', '9', null, null, null, '2022-09-19 14:08:44', '2709', '0', '36',
        '5', '2021-10-26 15:23:43', '117', '2022-09-19 14:08:44', '117', '480');
INSERT INTO `kelas`
VALUES ('1415', 'III - C1', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:37:47', '448', '0', '36',
        '8', '2021-10-26 15:24:05', '117', '2022-07-18 15:37:47', '117', '248');
INSERT INTO `kelas`
VALUES ('1416', 'III - D', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:37:58', '59644', '0', '36',
        '6', '2021-10-26 15:24:23', '117', '2022-07-18 15:37:58', '117', '248');
INSERT INTO `kelas`
VALUES ('1417', 'III - D1', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:38:05', '34754', '0', '36',
        '9', '2021-10-26 15:24:39', '117', '2022-07-18 15:38:05', '117', '248');
INSERT INTO `kelas`
VALUES ('1418', 'III - E', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:38:14', '7856', '0', '36',
        '10', '2021-10-26 15:24:56', '117', '2022-07-18 15:38:14', '117', '248');
INSERT INTO `kelas`
VALUES ('1419', 'III - F', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:38:21', '59068', '0', '36',
        '11', '2021-10-26 15:25:14', '117', '2022-07-18 15:38:21', '117', '248');
INSERT INTO `kelas`
VALUES ('1420', 'III - H', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:38:30', '5336', '0', '36',
        '12', '2021-10-26 15:25:32', '117', '2022-07-18 15:38:30', '117', '248');
INSERT INTO `kelas`
VALUES ('1421', 'III - I', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:39:49', '3347', '0', '36',
        '13', '2021-10-26 15:25:49', '117', '2022-07-18 15:39:49', '117', '248');
INSERT INTO `kelas`
VALUES ('1422', 'III - J', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:39:26', '43571', '0', '36',
        '14', '2021-10-26 15:26:06', '117', '2022-07-18 15:39:26', '117', '248');
INSERT INTO `kelas`
VALUES ('1423', 'III - K', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:39:18', '60366', '0', '36',
        '15', '2021-10-26 15:26:22', '117', '2022-07-18 15:39:18', '117', '248');
INSERT INTO `kelas`
VALUES ('1424', 'III - N', '106', '3', '', '0', '', '9', null, null, null, '2022-07-18 15:39:10', '42836', '0', '36',
        '16', '2021-10-26 15:26:39', '117', '2022-07-18 15:39:10', '117', '248');
INSERT INTO `kelas`
VALUES ('1425', 'III - O', '106', '3', '', '0', '', '9', null, null, null, '2022-07-18 15:38:59', '7232', '0', '36',
        '17', '2021-10-26 15:26:55', '117', '2022-07-18 15:38:59', '117', '248');
INSERT INTO `kelas`
VALUES ('1426', 'III - P', '106', '3', '', '1', '', '9', null, null, null, '2022-07-18 15:38:51', '20821', '0', '36',
        '18', '2021-10-26 15:27:10', '117', '2022-07-18 15:38:51', '117', '248');
INSERT INTO `kelas`
VALUES ('1427', 'III - Q', '106', '3', '', '1', '', '9', null, null, null, '2022-09-19 14:08:58', '23968', '0', '36',
        '7', '2021-10-26 15:27:25', '117', '2022-09-19 14:08:58', '117', '480');
INSERT INTO `kelas`
VALUES ('1428', 'IV - A', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '22146', '0', '36',
        '3', '2021-10-26 15:35:42', '117', '2021-10-26 15:35:42', '117', '481');
INSERT INTO `kelas`
VALUES ('1429', 'IV - B', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '58696', '0', '36',
        '4', '2021-10-26 15:35:58', '117', '2021-10-26 15:35:58', '117', '481');
INSERT INTO `kelas`
VALUES ('1430', 'IV - C', '106', '3', '', '1', '', '10', null, null, null, '2022-09-19 14:10:15', '36973', '0', '36',
        '5', '2021-10-26 15:36:15', '117', '2022-09-19 14:10:15', '117', '526');
INSERT INTO `kelas`
VALUES ('1431', 'IV - C1', '106', '3', '', '1', '', '10', null, null, null, '2022-09-19 14:30:27', '16879', '0', '36',
        '8', '2021-10-26 15:36:31', '117', '2022-09-19 14:30:27', '117', '480');
INSERT INTO `kelas`
VALUES ('1432', 'IV - D', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '21934', '0', '36',
        '6', '2021-10-26 15:36:49', '117', '2021-10-26 15:36:49', '117', '481');
INSERT INTO `kelas`
VALUES ('1433', 'IV - D1', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '5783', '0', '36',
        '9', '2021-10-26 15:37:05', '117', '2021-10-26 15:37:05', '117', '481');
INSERT INTO `kelas`
VALUES ('1434', 'IV - E', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '56359', '0', '36',
        '10', '2021-10-26 15:37:42', '117', '2021-10-26 15:37:42', '117', '481');
INSERT INTO `kelas`
VALUES ('1435', 'IV - F', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '39813', '0', '36',
        '11', '2021-10-26 15:37:56', '117', '2021-10-26 15:37:56', '117', '481');
INSERT INTO `kelas`
VALUES ('1436', 'IV - H', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '28008', '0', '36',
        '12', '2021-10-26 15:38:11', '117', '2021-10-26 15:38:11', '117', '481');
INSERT INTO `kelas`
VALUES ('1437', 'IV - I', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '29989', '0', '36',
        '13', '2021-10-26 15:38:30', '117', '2021-10-26 15:38:30', '117', '481');
INSERT INTO `kelas`
VALUES ('1438', 'IV - J', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '30506', '0', '36',
        '14', '2021-10-26 15:38:46', '117', '2021-10-26 15:38:46', '117', '481');
INSERT INTO `kelas`
VALUES ('1439', 'IV - K', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '59030', '0', '36',
        '15', '2021-10-26 15:39:05', '117', '2021-10-26 15:39:05', '117', '481');
INSERT INTO `kelas`
VALUES ('1440', 'IV - N', '106', '3', '', '0', '', '10', null, null, null, '2022-01-11 12:01:06', '21319', '0', '36',
        '16', '2021-10-26 15:39:19', '117', '2021-10-26 16:43:07', '117', '481');
INSERT INTO `kelas`
VALUES ('1441', 'IV - O', '106', '3', '', '0', '', '10', null, null, null, '2022-01-11 12:01:06', '5114', '0', '36',
        '17', '2021-10-26 15:39:36', '117', '2021-10-26 16:43:03', '117', '481');
INSERT INTO `kelas`
VALUES ('1442', 'IV - P', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '25917', '0', '36',
        '18', '2021-10-26 15:39:53', '117', '2021-10-26 15:39:53', '117', '481');
INSERT INTO `kelas`
VALUES ('1443', 'IV - Q', '106', '3', '', '1', '', '10', null, null, null, '2022-01-11 12:01:06', '62563', '0', '36',
        '7', '2021-10-26 15:40:07', '117', '2021-10-26 15:40:07', '117', '481');
INSERT INTO `kelas`
VALUES ('1444', 'V - A', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '48711', '0', '36',
        '3', '2021-10-26 15:45:30', '117', '2021-10-26 15:45:30', '117', '387');
INSERT INTO `kelas`
VALUES ('1445', 'V - B', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '6415', '0', '36', '4',
        '2021-10-26 15:45:45', '117', '2021-10-26 15:45:45', '117', '387');
INSERT INTO `kelas`
VALUES ('1446', 'V - C', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '32757', '0', '36',
        '5', '2021-10-26 15:46:01', '117', '2021-10-26 15:46:01', '117', '387');
INSERT INTO `kelas`
VALUES ('1447', 'V - C1', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '52223', '0', '36',
        '8', '2021-10-26 15:46:19', '117', '2021-10-26 15:46:19', '117', '387');
INSERT INTO `kelas`
VALUES ('1448', 'V - D', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '57160', '0', '36',
        '6', '2021-10-26 15:46:34', '117', '2021-10-26 15:46:34', '117', '387');
INSERT INTO `kelas`
VALUES ('1449', 'V - D1', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '5187', '0', '36',
        '9', '2021-10-26 15:46:49', '117', '2021-10-26 15:46:49', '117', '387');
INSERT INTO `kelas`
VALUES ('1450', 'V - E', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '61567', '0', '36',
        '10', '2021-10-26 15:47:04', '117', '2021-10-26 15:47:04', '117', '387');
INSERT INTO `kelas`
VALUES ('1451', 'V - F', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '46008', '0', '36',
        '11', '2021-10-26 15:47:22', '117', '2021-10-26 15:47:22', '117', '387');
INSERT INTO `kelas`
VALUES ('1452', 'V - H', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '47287', '0', '36',
        '12', '2021-10-26 15:47:37', '117', '2021-10-26 15:47:37', '117', '387');
INSERT INTO `kelas`
VALUES ('1453', 'V - I', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '25701', '0', '36',
        '13', '2021-10-26 15:47:53', '117', '2021-10-26 15:47:53', '117', '387');
INSERT INTO `kelas`
VALUES ('1454', 'V - J', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '43731', '0', '36',
        '14', '2021-10-26 15:48:14', '117', '2021-10-26 15:48:14', '117', '387');
INSERT INTO `kelas`
VALUES ('1455', 'V - K', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '10491', '0', '36',
        '15', '2021-10-26 15:48:29', '117', '2021-10-26 15:48:29', '117', '387');
INSERT INTO `kelas`
VALUES ('1456', 'V - N', '106', '3', '', '0', '', '11', null, null, null, '2022-01-11 12:01:06', '31787', '0', '36',
        '16', '2021-10-26 15:48:45', '117', '2021-10-26 16:42:48', '117', '387');
INSERT INTO `kelas`
VALUES ('1457', 'V - O', '106', '3', '', '0', '', '11', null, null, null, '2022-01-11 12:01:06', '52319', '0', '36',
        '17', '2021-10-26 15:48:58', '117', '2021-10-26 16:42:45', '117', '387');
INSERT INTO `kelas`
VALUES ('1458', 'V - P', '106', '3', '', '1', '', '11', null, null, null, '2022-01-11 12:01:06', '33534', '0', '36',
        '18', '2021-10-26 15:49:11', '117', '2021-10-26 15:49:11', '117', '387');
INSERT INTO `kelas`
VALUES ('1459', 'V - Q', '106', '3', '', '1', '', '11', null, null, null, '2022-09-19 14:11:08', '2264', '0', '36', '7',
        '2021-10-26 15:49:28', '117', '2022-09-19 14:11:08', '117', '481');
INSERT INTO `kelas`
VALUES ('1460', 'VI - A', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '24707', '0', '36',
        '3', '2021-10-26 15:52:57', '117', '2021-10-26 15:52:57', '117', '519');
INSERT INTO `kelas`
VALUES ('1461', 'VI - B', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '17439', '0', '36',
        '4', '2021-10-26 15:53:11', '117', '2021-10-26 15:53:11', '117', '519');
INSERT INTO `kelas`
VALUES ('1462', 'VI - C - I', '106', '3', '', '1', '', '12', null, null, null, '2022-07-14 16:10:42', '36892', '0',
        '36', '5', '2021-10-26 15:53:27', '117', '2022-07-14 16:10:42', '117', '519');
INSERT INTO `kelas`
VALUES ('1463', 'VI - C1', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '10713', '0', '36',
        '8', '2021-10-26 15:53:42', '117', '2021-10-26 15:53:42', '117', '519');
INSERT INTO `kelas`
VALUES ('1464', 'VI - D', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '18490', '0', '36',
        '6', '2021-10-26 15:53:57', '117', '2021-10-26 15:53:57', '117', '519');
INSERT INTO `kelas`
VALUES ('1465', 'VI - D1', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '34742', '0', '36',
        '9', '2021-10-26 15:54:12', '117', '2021-10-26 15:54:12', '117', '519');
INSERT INTO `kelas`
VALUES ('1466', 'VI - E', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '1375', '0', '36',
        '10', '2021-10-26 15:54:26', '117', '2021-10-26 15:54:26', '117', '519');
INSERT INTO `kelas`
VALUES ('1467', 'VI - F', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '14703', '0', '36',
        '11', '2021-10-26 15:54:43', '117', '2021-10-26 15:54:43', '117', '519');
INSERT INTO `kelas`
VALUES ('1468', 'VI - H', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '27579', '0', '36',
        '12', '2021-10-26 15:54:58', '117', '2021-10-26 15:54:58', '117', '519');
INSERT INTO `kelas`
VALUES ('1469', 'VI - I', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '63812', '0', '36',
        '13', '2021-10-26 15:55:11', '117', '2021-10-26 15:55:11', '117', '519');
INSERT INTO `kelas`
VALUES ('1470', 'VI - J', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '60313', '0', '36',
        '14', '2021-10-26 15:55:26', '117', '2021-10-26 15:55:26', '117', '519');
INSERT INTO `kelas`
VALUES ('1471', 'VI - K', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '52817', '0', '36',
        '15', '2021-10-26 15:55:44', '117', '2021-10-26 15:55:44', '117', '519');
INSERT INTO `kelas`
VALUES ('1472', 'VI - N', '106', '3', '', '0', '', '12', null, null, null, '2022-01-11 12:01:06', '7116', '0', '36',
        '16', '2021-10-26 15:55:59', '117', '2021-10-26 16:42:01', '117', '519');
INSERT INTO `kelas`
VALUES ('1473', 'VI - O', '106', '3', '', '0', '', '12', null, null, null, '2022-01-11 12:01:06', '21198', '0', '36',
        '17', '2021-10-26 15:56:29', '117', '2021-10-26 16:41:58', '117', '519');
INSERT INTO `kelas`
VALUES ('1474', 'VI - P', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '33667', '0', '36',
        '18', '2021-10-26 15:56:45', '117', '2021-10-26 16:41:54', '117', '519');
INSERT INTO `kelas`
VALUES ('1475', 'VI - Q', '106', '3', '', '1', '', '12', null, null, null, '2022-01-11 12:01:06', '49506', '0', '36',
        '7', '2021-10-26 15:57:00', '117', '2021-10-26 15:57:00', '117', '519');
INSERT INTO `kelas`
VALUES ('1476', 'I-A-DL', '108', '35', '', '1', 'Tahun Pelajaran ke 4', '7', null, null, null, '2021-11-12 07:56:45',
        '40665', '0', '5', '0', '2021-10-27 11:08:24', '562', '2021-11-12 07:56:45', '466', '514');
INSERT INTO `kelas`
VALUES ('1477', 'I-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '7', null, null, null, '2021-11-12 07:56:54',
        '9951', '0', '6', '0', '2021-10-27 11:09:29', '562', '2021-11-12 07:56:54', '466', '514');
INSERT INTO `kelas`
VALUES ('1478', 'II-A-DL', '108', '35', '', '1', 'Tahun Ajaran ke 4', '8', null, null, null, '2021-11-12 07:57:11',
        '46464', '0', '5', '0', '2021-10-27 11:10:59', '562', '2021-11-12 07:57:11', '466', '470');
INSERT INTO `kelas`
VALUES ('1479', 'II-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '8', null, null, null, '2021-11-12 07:57:19',
        '58768', '0', '6', '0', '2021-10-27 11:11:53', '562', '2021-11-12 07:57:19', '466', '514');
INSERT INTO `kelas`
VALUES ('1480', 'III-A-DL', '108', '35', '', '1', 'Tahun Ajaran ke 4', '9', null, null, null, '2021-11-12 07:58:01',
        '20070', '0', '5', '0', '2021-10-27 11:12:36', '562', '2021-11-12 07:58:01', '466', '514');
INSERT INTO `kelas`
VALUES ('1481', 'III-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '9', null, null, null, '2021-11-12 07:58:43',
        '25457', '0', '6', '0', '2021-10-27 11:13:35', '562', '2021-11-12 07:58:43', '466', '514');
INSERT INTO `kelas`
VALUES ('1482', 'IV-A-DL', '108', '35', '', '1', 'Tahun Ajaran ke 4', '10', null, null, null, '2022-07-08 10:03:48',
        '30125', '0', '5', '0', '2021-10-27 11:14:26', '562', '2022-07-08 10:03:48', '466', '477');
INSERT INTO `kelas`
VALUES ('1483', 'IV-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '10', null, null, null, '2022-07-08 10:03:59',
        '54833', '0', '6', '0', '2021-10-27 11:15:09', '562', '2022-07-08 10:03:59', '466', '477');
INSERT INTO `kelas`
VALUES ('1484', 'V-A-DL', '108', '35', '', '1', 'Tahun Ajaran ke 4', '11', null, null, null, '2022-07-08 10:10:23',
        '338', '0', '5', '0', '2021-10-27 11:15:47', '562', '2022-07-08 10:10:23', '466', '477');
INSERT INTO `kelas`
VALUES ('1485', 'V-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '11', null, null, null, '2022-07-08 10:10:34',
        '1363', '0', '6', '0', '2021-10-27 11:16:24', '562', '2022-07-08 10:10:34', '466', '477');
INSERT INTO `kelas`
VALUES ('1486', 'VI-A-DL', '108', '35', '', '1', 'Tahun Ajaran ke 4', '12', null, null, null, '2022-07-08 10:10:54',
        '58885', '0', '5', '0', '2021-10-27 11:16:57', '562', '2022-07-08 10:10:54', '466', '477');
INSERT INTO `kelas`
VALUES ('1487', 'VI-A-KOM', '108', '10', '', '1', 'Tahun Ajaran ke 4', '12', null, null, null, '2022-07-08 10:11:03',
        '63970', '0', '6', '0', '2021-10-27 11:17:44', '562', '2022-07-08 10:11:03', '466', '477');
INSERT INTO `kelas`
VALUES ('1488', 'VII-A-DL', '109', '35', '', '1', 'Tahun Ajaran ke 4', '4', null, null, null, '2022-07-08 10:02:26',
        '2362', '0', '3', '0', '2021-10-27 11:18:32', '562', '2022-07-08 10:02:26', '466', '605');
INSERT INTO `kelas`
VALUES ('1489', 'VII-A-KOM', '109', '10', '', '1', 'Tahun Ajaran ke 4', '4', null, null, null, '2022-07-08 10:02:36',
        '50673', '0', '4', '0', '2021-10-27 11:19:15', '562', '2022-07-08 10:02:36', '466', '605');
INSERT INTO `kelas`
VALUES ('1490', 'VIII-A-DL', '109', '35', '', '1', 'Tahun Ajaran ke 4', '5', null, null, null, '2022-07-08 10:02:51',
        '21817', '0', '3', '0', '2021-10-27 11:20:54', '562', '2022-07-08 10:02:51', '466', '605');
INSERT INTO `kelas`
VALUES ('1491', 'VIII-A-KOM', '109', '10', '', '1', 'Tahun Ajaran ke 4', '5', null, null, null, '2022-07-08 10:03:00',
        '36543', '0', '4', '0', '2021-10-27 11:21:32', '562', '2022-07-08 10:03:00', '466', '605');
INSERT INTO `kelas`
VALUES ('1492', 'IX-A-DL', '109', '35', '', '1', 'Tahun Ajaran ke 4', '6', null, null, null, '2022-07-08 10:03:18',
        '44571', '0', '3', '0', '2021-10-27 11:22:24', '562', '2022-07-08 10:03:18', '466', '605');
INSERT INTO `kelas`
VALUES ('1493', 'IX-A-KOM', '109', '10', '', '1', 'Tahun Ajaran ke 4', '6', null, null, null, '2022-07-08 10:03:27',
        '18006', '0', '4', '0', '2021-10-27 11:23:00', '562', '2022-07-08 10:03:27', '466', '605');
INSERT INTO `kelas`
VALUES ('1495', 'X-A-KOM-IPA', '110', '10', '', '1', 'Tahun Ajaran ke 4', '1', null, null, null, '2022-07-08 10:00:53',
        '47696', '0', '2', '2', '2021-10-27 11:25:33', '562', '2022-07-08 10:00:53', '466', '607');
INSERT INTO `kelas`
VALUES ('1496', 'X-A-DL-IPS', '110', '35', '', '1', 'Tahun Ajaran ke 4', '1', null, null, null, '2022-08-04 10:20:05',
        '53814', '0', '1', '2', '2021-10-27 11:26:50', '562', '2022-08-04 10:20:05', '617', '607');
INSERT INTO `kelas`
VALUES ('1497', 'X-A-KOM-IPS', '110', '10', '', '1', 'Tahun Ajaran ke 4', '1', null, null, null, '2022-08-04 10:17:26',
        '18462', '0', '2', '2', '2021-10-27 11:27:48', '562', '2022-08-04 10:17:26', '617', '607');
INSERT INTO `kelas`
VALUES ('1498', 'XI-A-DL-IPA', '110', '35', '', '1', 'Tahun Ajaran ke 4', '2', null, null, null, '2022-07-08 10:01:22',
        '38820', '0', '1', '1', '2021-10-27 11:29:10', '562', '2022-07-08 10:01:22', '466', '607');
INSERT INTO `kelas`
VALUES ('1499', 'XI-A-KOM-IPS', '110', '10', '', '1', 'Tahun Ajaran ke 4', '2', null, null, null, '2021-11-12 08:02:20',
        '32712', '0', '2', '2', '2021-10-27 11:30:11', '562', '2021-11-12 08:02:20', '466', '582');
INSERT INTO `kelas`
VALUES ('1500', 'XI-A-KOM-IPA', '110', '10', '', '1', 'Tahun Ajaran ke 4', '2', null, null, null, '2022-07-08 10:01:33',
        '1865', '0', '2', '1', '2021-10-27 11:32:46', '562', '2022-07-08 10:01:33', '466', '607');
INSERT INTO `kelas`
VALUES ('1501', 'XI-A-DL-IPS', '110', '35', '', '1', 'Tahun Ajaran ke 4', '2', null, null, null, '2021-11-12 08:02:05',
        '31291', '0', '1', '2', '2021-10-27 11:33:42', '562', '2021-11-12 08:02:05', '466', '582');
INSERT INTO `kelas`
VALUES ('1502', 'XII-A-DL-IPA', '110', '35', '', '1', 'Tahun Ajaran ke 4', '3', null, null, null, '2022-07-08 10:01:48',
        '61925', '0', '1', '1', '2021-10-27 11:34:46', '562', '2022-07-08 10:01:48', '466', '607');
INSERT INTO `kelas`
VALUES ('1503', 'XII-A-KOM-IPA', '110', '10', '', '1', 'Tahun Ajaran ke 4', '3', null, null, null,
        '2022-07-08 10:02:01', '24290', '0', '2', '1', '2021-10-27 11:35:27', '562', '2022-07-08 10:02:01', '466',
        '607');
INSERT INTO `kelas`
VALUES ('1504', 'XII-A-DL-IPS', '110', '35', '', '1', 'Tahun Ajaran ke 4', '3', null, null, null, '2021-11-12 08:02:38',
        '45332', '0', '1', '2', '2021-10-27 11:36:01', '562', '2021-11-12 08:02:38', '466', '582');
INSERT INTO `kelas`
VALUES ('1505', 'XII-A-KOM-IPS', '110', '10', '', '1', 'Tahun Ajaran ke 4', '3', null, null, null,
        '2021-11-12 08:02:53', '29609', '0', '2', '2', '2021-10-27 11:36:42', '562', '2021-11-12 08:02:53', '466',
        '582');
INSERT INTO `kelas`
VALUES ('1506', 'Kelas Pre Akademik Q', '87', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:40:00', '9695',
        '0', '36', '7', '2022-02-03 11:17:55', '117', '2022-02-07 09:40:00', '117', '526');
INSERT INTO `kelas`
VALUES ('1507', 'Kelas Pre Akademik \"P\"', '87', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:42:29',
        '45675', '0', '36', '18', '2022-02-03 11:18:43', '117', '2022-02-07 09:42:29', '117', '526');
INSERT INTO `kelas`
VALUES ('1508', 'Kelas Pre Akademik K', '87', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:41:48', '57142',
        '0', '36', '15', '2022-02-03 11:19:12', '117', '2022-02-07 09:41:48', '117', '526');
INSERT INTO `kelas`
VALUES ('1509', 'Kelas Pre Akademik \"K\" - I', '106', '3', '', '1', '', '14', null, null, null, '2022-09-12 11:06:56',
        '64352', '0', '36', '15', '2022-02-03 11:21:20', '117', '2022-09-12 11:06:56', '117', '622');
INSERT INTO `kelas`
VALUES ('1510', 'Kelas Pre Akademik \"P\" - I', '106', '3', '', '1', '', '14', null, null, null, '2022-09-12 11:07:15',
        '47270', '0', '36', '18', '2022-02-03 11:21:43', '117', '2022-09-12 11:07:15', '117', '622');
INSERT INTO `kelas`
VALUES ('1511', 'Kelas Pre Akademik \"Q\" - I', '106', '3', '', '1', '', '14', null, null, null, '2022-09-12 11:07:25',
        '19274', '0', '36', '7', '2022-02-03 11:22:14', '117', '2022-09-12 11:07:25', '117', '622');
INSERT INTO `kelas`
VALUES ('1512', 'Kelas Pre Akademik \"K\"', '90', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:45:16',
        '35308', '0', '36', '15', '2022-02-03 11:21:20', '117', '2022-02-07 09:45:16', '117', '526');
INSERT INTO `kelas`
VALUES ('1513', 'Kelas Pre Akademik \"P\"', '90', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:45:41',
        '16174', '0', '36', '18', '2022-02-03 11:21:43', '117', '2022-02-07 09:45:41', '117', '526');
INSERT INTO `kelas`
VALUES ('1514', 'Kelas Pre Akademik \"Q\"', '90', '3', '', '1', '', '14', null, null, null, '2022-02-07 09:45:29',
        '40475', '0', '36', '7', '2022-02-03 11:22:14', '117', '2022-02-07 09:45:29', '117', '526');
INSERT INTO `kelas`
VALUES ('1515', 'I-KOM', '114', '10', '', '1', '', '7', null, null, null, '2022-04-14 13:45:09', '43239', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2022-03-05 20:03:49', '503', '491');
INSERT INTO `kelas`
VALUES ('1516', 'II-KOM', '114', '10', '', '1', '', '8', null, null, null, '2022-04-14 13:45:09', '44832', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2022-03-05 20:04:36', '503', '491');
INSERT INTO `kelas`
VALUES ('1517', 'III-KOM', '114', '10', '', '1', '', '9', null, null, null, '2022-04-14 13:45:09', '28913', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2022-03-05 20:05:11', '503', '491');
INSERT INTO `kelas`
VALUES ('1518', 'IV-KOM', '114', '10', '', '1', '', '10', null, null, null, '2022-04-14 13:45:09', '10068', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2020-08-18 19:50:30', '503', null);
INSERT INTO `kelas`
VALUES ('1519', 'V-KOM', '114', '10', '', '1', '', '11', null, null, null, '2022-07-06 08:10:07', '29133', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2022-07-06 08:10:07', '503', '376');
INSERT INTO `kelas`
VALUES ('1520', 'VI-KOM', '114', '10', '', '1', '', '12', null, null, null, '2022-07-06 08:14:41', '49931', '0', '38',
        '0', '2020-08-18 19:50:30', '503', '2022-07-06 08:14:41', '503', '376');
INSERT INTO `kelas`
VALUES ('1521', 'VII-KOM', '115', '13', '', '1', '', '4', null, null, null, '2022-04-14 13:44:49', '31193', '0', '39',
        '0', '2020-08-18 19:50:30', '503', '2022-03-05 20:07:10', '503', '428');
INSERT INTO `kelas`
VALUES ('1522', 'VIII-KOM', '115', '13', '', '1', '', '5', null, null, null, '2022-04-14 13:44:50', '6171', '0', '39',
        '0', '2020-08-18 19:50:30', '503', '2022-03-05 20:07:55', '503', '492');
INSERT INTO `kelas`
VALUES ('1523', 'IX-KOM', '115', '13', '', '1', '', '6', null, null, null, '2022-07-07 08:33:55', '2806', '0', '39',
        '0', '2020-08-18 19:50:30', '503', '2022-07-07 08:33:55', '503', '482');
INSERT INTO `kelas`
VALUES ('1524', 'X-IPA-KOM', '116', '13', '', '1', '', '1', null, null, null, '2022-06-27 13:50:12', '61047', '0', '40',
        '1', '2020-08-18 19:50:30', '503', '2022-06-27 13:50:12', '503', '481');
INSERT INTO `kelas`
VALUES ('1525', 'XI-IPA-KOM', '116', '13', '', '1', '', '2', null, null, null, '2022-04-14 13:44:08', '34696', '0',
        '40', '1', '2020-08-18 19:50:30', '503', '2022-03-05 20:10:03', '503', '515');
INSERT INTO `kelas`
VALUES ('1526', 'XII-IPA-KOM', '116', '10', '', '1', '', '3', null, null, null, '2022-07-07 09:14:10', '55870', '0',
        '40', '1', '2020-08-18 19:50:30', '503', '2022-07-07 09:14:10', '503', '406');
INSERT INTO `kelas`
VALUES ('1527', 'XII-IPS-KOM', '116', '13', '', '1', '', '3', null, null, null, '2022-04-14 13:44:08', '44201', '0',
        '40', '2', '2020-08-18 19:50:30', '503', '2022-03-05 20:12:07', '503', '406');
INSERT INTO `kelas`
VALUES ('1528', 'XI-IPS-KOM', '116', '10', '', '1', '', '2', null, null, null, '2022-07-06 10:55:13', '53396', '0',
        '40', '2', '2020-08-18 19:50:30', '503', '2022-07-06 10:55:13', '503', '515');
INSERT INTO `kelas`
VALUES ('1529', 'X-IPS-KOM', '116', '13', '', '1', '', '1', null, null, null, '2022-04-14 13:44:08', '3317', '0', '40',
        '2', '2020-08-18 19:50:30', '503', '2022-03-05 20:09:25', '503', '481');
INSERT INTO `kelas`
VALUES ('1530', 'XI IPS-KOM', '116', '13', '', '1', '', '2', null, null, null, '2022-04-14 13:44:08', '38337', '0',
        '40', '2', '2022-03-05 20:10:59', '503', '2022-03-05 20:11:21', '503', '515');
INSERT INTO `kelas`
VALUES ('1531', 'XII IPA-KOM', '116', '10', '', '1', '', '3', null, null, null, '2022-07-07 09:13:26', '35144', '0',
        '40', '1', '2022-03-05 20:13:06', '503', '2022-07-07 09:13:26', '503', '406');
INSERT INTO `kelas`
VALUES ('1532', 'III-Inklusi', '89', '3', '', '1', '', '9', null, null, null, '2022-06-06 10:44:16', '26621', '0', '37',
        '0', '2022-05-18 10:17:05', '320', '2022-06-06 10:44:16', '320', '217');
INSERT INTO `kelas`
VALUES ('1535', 'VIII - A - KOM', '112', '10', '', '1', 'Komunitas', '5', null, null, null, '2022-08-03 09:59:11',
        '40423', '0', '39', '0', '2022-06-02 10:15:57', '538', '2022-08-03 09:59:11', '538', '540');
INSERT INTO `kelas`
VALUES ('1536', 'VII - A - KOM', '112', '10', '', '1', 'Kelas Komunitas', '4', null, null, null, '2022-08-31 09:33:49',
        '29472', '0', '4', '0', '2022-06-02 10:16:44', '538', '2022-08-31 09:33:49', '538', '543');
INSERT INTO `kelas`
VALUES ('1537', 'VII - A - DL', '112', '20', '', '1', 'DL', '4', null, null, null, '2022-08-31 09:34:34', '12924', '0',
        '3', '0', '2022-06-02 10:17:46', '538', '2022-08-31 09:34:34', '538', '543');
INSERT INTO `kelas`
VALUES ('1545', 'I - A - KOM', '118', '10', '', '1', '', '7', null, null, null, '2022-09-26 13:46:18', '60544', '0',
        '6', '0', '2022-07-01 09:48:52', '538', '2022-09-26 13:46:18', '538', '625');
INSERT INTO `kelas`
VALUES ('1546', 'II - A - KOM', '118', '10', '', '1', '', '8', null, null, null, '2022-09-26 13:46:42', '15597', '0',
        '6', '0', '2022-07-01 09:57:48', '538', '2022-09-26 13:46:42', '538', '625');
INSERT INTO `kelas`
VALUES ('1547', 'III - A - KOM', '118', '10', '', '1', '', '9', null, null, null, '2022-09-26 13:47:24', '20763', '0',
        '6', '0', '2022-07-01 09:59:44', '538', '2022-09-26 13:47:24', '538', '625');
INSERT INTO `kelas`
VALUES ('1548', 'VI - A - DL', '118', '10', '', '1', '', '12', null, null, null, '2022-09-26 13:49:03', '65527', '0',
        '5', '0', '2022-07-01 10:33:30', '538', '2022-09-26 13:49:03', '538', '625');
INSERT INTO `kelas`
VALUES ('1556', 'X- A-DL-IPA', '110', '35', '', '1', 'Tahun Pelajaran ke 4', '1', null, null, null,
        '2022-07-08 12:08:38', '27898', '0', '1', '1', '2022-07-08 10:24:23', '466', '2022-07-08 12:08:38', '466',
        '607');
INSERT INTO `kelas`
VALUES ('1557', 'IV ', '107', '20', '', '1', '', '10', null, null, null, '2022-07-11 14:09:27', '49502', '0', '36', '0',
        '2022-07-11 14:09:27', '320', '2022-07-11 14:09:27', '320', '522');
INSERT INTO `kelas`
VALUES ('1558', '0', '0', '0', '', '0', '0', '0', null, null, null, '2022-07-11 14:10:07', '24315', '0', '0', '0',
        '2022-07-11 14:10:07', '320', '2022-07-11 14:10:07', '320', '0');
INSERT INTO `kelas`
VALUES ('1559', 'IV - INK', '107', '3', '', '1', '', '10', null, null, null, '2022-07-11 14:10:56', '46480', '0', '37',
        '0', '2022-07-11 14:10:56', '320', '2022-07-11 14:10:56', '320', '522');
INSERT INTO `kelas`
VALUES ('1560', 'X - DL', '113', '20', '', '1', '', '1', null, null, null, '2022-08-31 09:50:02', '10535', '0', '1',
        '2', '2022-07-12 11:36:07', '538', '2022-08-31 09:50:02', '538', '555');
INSERT INTO `kelas`
VALUES ('1561', 'II - C - II', '106', '3', '', '1', '', '8', null, null, null, '2022-09-19 14:07:44', '47722', '0',
        '36', '5', '2022-07-14 15:59:53', '117', '2022-09-19 14:07:44', '117', '387');
INSERT INTO `kelas`
VALUES ('1562', 'VI  - C - II', '106', '3', '', '1', '', '12', null, null, null, '2022-07-14 16:10:20', '58159', '0',
        '36', '5', '2022-07-14 16:10:20', '117', '2022-07-14 16:10:20', '117', '519');
INSERT INTO `kelas`
VALUES ('1563', '1-KOM', '119', '10', '', '1', '', '7', null, null, null, '2022-07-15 11:43:46', '20476', '0', '38',
        '0', '2022-07-15 11:43:46', '503', '2022-07-15 11:43:46', '503', '491');
INSERT INTO `kelas`
VALUES ('1564', 'II-KOM', '119', '10', '', '1', '', '8', null, null, null, '2022-07-15 14:25:41', '37309', '0', '38',
        '0', '2022-07-15 14:25:41', '503', '2022-07-15 14:25:41', '503', '491');
INSERT INTO `kelas`
VALUES ('1565', 'III-KOM', '119', '10', '', '1', '', '9', null, null, null, '2022-07-15 14:27:12', '53259', '0', '38',
        '0', '2022-07-15 14:27:12', '503', '2022-07-15 14:27:12', '503', '491');
INSERT INTO `kelas`
VALUES ('1566', 'IV-KOM', '119', '10', '', '1', '', '10', null, null, null, '2022-07-15 14:28:22', '34213', '0', '38',
        '0', '2022-07-15 14:28:22', '503', '2022-07-15 14:28:22', '503', '491');
INSERT INTO `kelas`
VALUES ('1567', 'VI-KOM', '119', '10', '', '1', '', '12', null, null, null, '2022-07-15 14:29:30', '32372', '0', '38',
        '0', '2022-07-15 14:29:30', '503', '2022-07-15 14:29:30', '503', '376');
INSERT INTO `kelas`
VALUES ('1568', 'VII-KOM', '120', '13', '', '1', '', '4', null, null, null, '2022-07-15 14:30:46', '1465', '0', '39',
        '0', '2022-07-15 14:30:46', '503', '2022-07-15 14:30:46', '503', '428');
INSERT INTO `kelas`
VALUES ('1569', 'VIII-KOM', '120', '13', '', '1', '', '5', null, null, null, '2022-07-15 14:32:45', '28730', '0', '39',
        '0', '2022-07-15 14:32:45', '503', '2022-07-15 14:32:45', '503', '492');
INSERT INTO `kelas`
VALUES ('1570', 'IX-KOM', '120', '14', '', '1', '', '6', null, null, null, '2022-07-15 14:34:02', '42924', '0', '39',
        '0', '2022-07-15 14:34:02', '503', '2022-07-15 14:34:02', '503', '498');
INSERT INTO `kelas`
VALUES ('1571', 'X-IPS-KOM', '121', '13', '', '1', '', '1', null, null, null, '2022-07-15 14:35:22', '62603', '0', '40',
        '2', '2022-07-15 14:35:22', '503', '2022-07-15 14:35:22', '503', '481');
INSERT INTO `kelas`
VALUES ('1573', 'XI-IPS-KOM', '121', '13', '', '1', '', '2', null, null, null, '2022-07-15 14:37:12', '37161', '0',
        '40', '2', '2022-07-15 14:37:12', '503', '2022-07-15 14:37:12', '503', '515');
INSERT INTO `kelas`
VALUES ('1574', 'XI-IPA-KOM', '121', '13', '', '1', '', '2', null, null, null, '2022-07-15 14:38:06', '49115', '0',
        '40', '1', '2022-07-15 14:38:06', '503', '2022-07-15 14:38:06', '503', '515');
INSERT INTO `kelas`
VALUES ('1575', 'XII-IPS-KOM', '121', '13', '', '1', '', '3', null, null, null, '2022-07-15 14:39:18', '57031', '0',
        '40', '2', '2022-07-15 14:39:18', '503', '2022-07-15 14:39:18', '503', '406');
INSERT INTO `kelas`
VALUES ('1576', 'XII-IPA-KOM', '121', '13', '', '1', '', '3', null, null, null, '2022-07-15 14:39:53', '59223', '0',
        '40', '1', '2022-07-15 14:39:53', '503', '2022-07-15 14:39:53', '503', '406');
INSERT INTO `kelas`
VALUES ('1577', 'V-KOM', '119', '10', '', '1', '', '11', null, null, null, '2022-07-21 09:24:58', '47529', '0', '38',
        '0', '2022-07-21 09:24:58', '503', '2022-07-21 09:24:58', '503', '376');
INSERT INTO `kelas`
VALUES ('1578', 'III - INK', '107', '3', '', '1', '', '9', null, null, null, '2022-07-27 10:48:56', '42081', '0', '37',
        '0', '2022-07-27 10:48:56', '320', '2022-07-27 10:48:56', '320', '217');
INSERT INTO `kelas`
VALUES ('1579', 'B', '110', '10', '', '1', '', '1', null, null, null, '2022-07-28 12:11:02', '25152', '0', '1', '0',
        '2022-07-28 12:11:02', '466', '2022-07-28 12:11:02', '466', '607');
INSERT INTO `kelas`
VALUES ('1582', 'III - A - DL', '118', '20', '', '1', '', '9', null, null, null, '2022-09-26 13:47:11', '49204', '0',
        '5', '0', '2022-08-03 08:49:34', '538', '2022-09-26 13:47:11', '538', '625');
INSERT INTO `kelas`
VALUES ('1583', 'IV - A - KOM', '118', '10', '', '1', '', '10', null, null, null, '2022-09-26 13:47:45', '23053', '0',
        '6', '0', '2022-08-03 08:52:27', '538', '2022-09-26 13:47:45', '538', '625');
INSERT INTO `kelas`
VALUES ('1584', 'V - A - DL', '118', '20', '', '1', '', '11', null, null, null, '2022-09-26 13:48:33', '18505', '0',
        '5', '0', '2022-08-03 09:05:03', '538', '2022-09-26 13:48:33', '538', '625');
INSERT INTO `kelas`
VALUES ('1585', 'V - A - KOM', '118', '10', '', '1', '', '11', null, null, null, '2022-09-26 13:48:45', '23364', '0',
        '6', '0', '2022-08-03 09:05:34', '538', '2022-09-26 13:48:45', '538', '625');
INSERT INTO `kelas`
VALUES ('1586', 'VI - A - KOM', '118', '20', '', '1', '', '12', null, null, null, '2022-09-26 13:49:25', '11318', '0',
        '5', '0', '2022-08-03 09:06:09', '538', '2022-09-26 13:49:25', '538', '625');
INSERT INTO `kelas`
VALUES ('1587', 'IX - A - KOM', '112', '10', '', '1', '', '6', null, null, null, '2022-08-03 09:15:25', '40037', '0',
        '4', '0', '2022-08-03 09:15:25', '538', '2022-08-03 09:15:25', '538', '543');
INSERT INTO `kelas`
VALUES ('1588', 'IX - A - DL', '112', '20', '', '1', '', '6', null, null, null, '2022-08-03 09:16:14', '50815', '0',
        '3', '0', '2022-08-03 09:16:14', '538', '2022-08-03 09:16:14', '538', '543');
INSERT INTO `kelas`
VALUES ('1589', 'VIII - A - DL', '112', '20', '', '1', '', '5', null, null, null, '2022-08-03 09:19:07', '63688', '0',
        '3', '0', '2022-08-03 09:19:07', '538', '2022-08-03 09:19:07', '538', '543');
INSERT INTO `kelas`
VALUES ('1590', 'XI - IPS - A - KOM', '113', '10', '', '1', '', '2', null, null, null, '2022-08-03 09:33:59', '21893',
        '0', '2', '2', '2022-08-03 09:33:59', '538', '2022-08-03 09:33:59', '538', '555');
INSERT INTO `kelas`
VALUES ('1591', 'X - IPA - A - KOM', '113', '10', '', '1', '', '2', null, null, null, '2022-08-31 09:41:23', '2320',
        '0', '2', '1', '2022-08-03 09:35:02', '538', '2022-08-31 09:41:23', '538', '555');
INSERT INTO `kelas`
VALUES ('1592', 'XI -  IPA - A - DL', '113', '20', '', '1', '', '2', null, null, null, '2022-08-03 09:35:59', '5113',
        '0', '1', '1', '2022-08-03 09:35:59', '538', '2022-08-03 09:35:59', '538', '555');
INSERT INTO `kelas`
VALUES ('1593', 'XI -  IPS - A - DL', '113', '20', '', '1', '', '2', null, null, null, '2022-09-07 15:48:59', '28785',
        '0', '1', '2', '2022-08-03 09:36:33', '538', '2022-09-07 15:48:59', '538', '555');
INSERT INTO `kelas`
VALUES ('1594', 'XII -  IPA - A - KOM', '113', '10', '', '1', '', '3', null, null, null, '2022-08-03 09:38:32', '55415',
        '0', '2', '1', '2022-08-03 09:38:32', '538', '2022-08-03 09:38:32', '538', '555');
INSERT INTO `kelas`
VALUES ('1595', 'XII -  IPA -  A - DL', '113', '20', '', '1', '', '3', null, null, null, '2022-08-03 09:39:21', '11895',
        '0', '1', '1', '2022-08-03 09:39:21', '538', '2022-08-03 09:39:21', '538', '555');
INSERT INTO `kelas`
VALUES ('1596', 'XII -  IPS - A - DL', '113', '20', '', '1', '', '3', null, null, null, '2022-08-03 09:40:13', '5996',
        '0', '1', '2', '2022-08-03 09:40:13', '538', '2022-08-03 09:40:13', '538', '555');
INSERT INTO `kelas`
VALUES ('1597', 'XII -  IPS - A - KOM', '113', '10', '', '1', '', '3', null, null, null, '2022-08-03 09:41:37', '35173',
        '0', '2', '2', '2022-08-03 09:41:37', '538', '2022-08-03 09:41:37', '538', '555');
INSERT INTO `kelas`
VALUES ('1598', 'I - INK', '107', '3', '', '1', '', '7', null, null, null, '2022-08-15 09:44:03', '47188', '0', '37',
        '0', '2022-08-15 09:44:03', '320', '2022-08-15 09:44:03', '320', '612');
INSERT INTO `kelas`
VALUES ('1600', 'X -  KOM', '113', '10', '', '1', '', '1', null, null, null, '2022-08-31 09:49:52', '31566', '0', '2',
        '1', '2022-08-22 11:06:15', '538', '2022-08-31 09:49:52', '538', '555');
INSERT INTO `kelas`
VALUES ('1602', 'II - INK', '107', '3', '', '1', '', '8', null, null, null, '2022-09-01 11:31:34', '3673', '0', '37',
        '0', '2022-09-01 11:31:34', '320', '2022-09-01 11:31:34', '320', '611');
INSERT INTO `kelas`
VALUES ('1603', 'PRE AKADEMIK', '122', '10', '', '1', '', '14', null, null, null, '2022-09-08 16:07:43', '3745', '0',
        '38', '0', '2022-09-08 15:33:13', '516', '2022-09-08 16:07:43', '516', '516');
INSERT INTO `kelas`
VALUES ('1604', 'Kelas Pre Akademik \"K\" - II', '106', '3', '', '1', '', '14', null, null, null, '2022-09-12 11:06:43',
        '17663', '0', '36', '15', '2022-09-12 11:06:20', '117', '2022-09-12 11:06:43', '117', '622');
INSERT INTO `kelas`
VALUES ('1605', 'Kelas Pre Akademik \"P\" - II', '106', '3', '', '1', '', '14', null, null, null, '2022-09-12 11:08:06',
        '12234', '0', '36', '18', '2022-09-12 11:08:06', '117', '2022-09-12 11:08:06', '117', '622');
INSERT INTO `kelas`
VALUES ('1606', 'Kelas Pre Akademik Q - II', '106', '3', '', '1', '', '14', null, null, null, '2022-09-19 14:23:37',
        '43753', '0', '36', '7', '2022-09-12 11:10:39', '117', '2022-09-19 14:23:37', '117', '485');
INSERT INTO `kelas`
VALUES ('1607', 'I - DL', '125', '40', '', '1', '', '7', null, null, null, '2022-09-12 14:43:45', '42995', '0', '5',
        '0', '2022-09-12 14:43:45', '320', '2022-09-12 14:43:45', '320', '612');
INSERT INTO `kelas`
VALUES ('1608', 'I - DLT', '125', '40', '', '1', '', '7', null, null, null, '2022-09-12 14:44:35', '34230', '0', '26',
        '0', '2022-09-12 14:44:35', '320', '2022-09-12 14:44:35', '320', '612');
INSERT INTO `kelas`
VALUES ('1609', 'I - INK', '125', '3', '', '1', '', '7', null, null, null, '2022-09-12 14:45:29', '13229', '0', '37',
        '0', '2022-09-12 14:45:29', '320', '2022-09-12 14:45:29', '320', '612');
INSERT INTO `kelas`
VALUES ('1610', 'I - KOM', '125', '9', '', '1', '', '7', null, null, null, '2022-09-12 14:46:29', '19657', '0', '6',
        '0', '2022-09-12 14:46:29', '320', '2022-09-12 14:46:29', '320', '612');
INSERT INTO `kelas`
VALUES ('1611', 'I - KOMO', '125', '25', '', '1', '', '7', null, null, null, '2022-09-14 13:10:18', '24686', '0', '29',
        '0', '2022-09-12 14:46:58', '320', '2022-09-14 13:10:18', '173', '612');
INSERT INTO `kelas`
VALUES ('1612', 'II - DL', '125', '40', '', '1', '', '8', null, null, null, '2022-09-12 14:49:16', '30409', '0', '5',
        '0', '2022-09-12 14:49:16', '320', '2022-09-12 14:49:16', '320', '611');
INSERT INTO `kelas`
VALUES ('1613', 'II - DLT', '125', '40', '', '1', '', '8', null, null, null, '2022-09-12 14:49:58', '7365', '0', '26',
        '0', '2022-09-12 14:49:58', '320', '2022-09-12 14:49:58', '320', '611');
INSERT INTO `kelas`
VALUES ('1614', '0', '0', '0', '', '0', '0', '0', null, null, null, '2022-09-12 14:50:05', '19846', '0', '0', '0',
        '2022-09-12 14:50:05', '320', '2022-09-12 14:50:05', '320', '0');
INSERT INTO `kelas`
VALUES ('1615', 'II - INK', '125', '3', '', '1', '', '8', null, null, null, '2022-09-12 14:52:17', '23060', '0', '37',
        '0', '2022-09-12 14:52:17', '320', '2022-09-12 14:52:17', '320', '611');
INSERT INTO `kelas`
VALUES ('1616', 'II - KOM', '125', '9', '', '1', '', '8', null, null, null, '2022-09-12 14:52:53', '24073', '0', '6',
        '0', '2022-09-12 14:52:53', '320', '2022-09-12 14:52:53', '320', '611');
INSERT INTO `kelas`
VALUES ('1617', 'II - KOMO', '125', '25', '', '1', '', '8', null, null, null, '2022-09-12 14:53:23', '14400', '0', '29',
        '0', '2022-09-12 14:53:23', '320', '2022-09-12 14:53:23', '320', '611');
INSERT INTO `kelas`
VALUES ('1618', 'III - DL', '125', '40', '', '1', '', '9', null, null, null, '2022-09-12 14:54:16', '51183', '0', '5',
        '0', '2022-09-12 14:54:16', '320', '2022-09-12 14:54:16', '320', '217');
INSERT INTO `kelas`
VALUES ('1619', 'III - DLT', '125', '40', '', '1', '', '9', null, null, null, '2022-09-12 14:55:17', '48423', '0', '26',
        '0', '2022-09-12 14:55:17', '320', '2022-09-12 14:55:17', '320', '217');
INSERT INTO `kelas`
VALUES ('1620', 'III - INK', '125', '3', '', '1', '', '9', null, null, null, '2022-09-12 14:55:58', '51641', '0', '37',
        '0', '2022-09-12 14:55:58', '320', '2022-09-12 14:55:58', '320', '217');
INSERT INTO `kelas`
VALUES ('1621', 'III - KOM', '125', '9', '', '1', '', '9', null, null, null, '2022-09-12 14:56:22', '4930', '0', '6',
        '0', '2022-09-12 14:56:22', '320', '2022-09-12 14:56:22', '320', '217');
INSERT INTO `kelas`
VALUES ('1622', 'III - KOMO', '125', '25', '', '1', '', '9', null, null, null, '2022-09-12 14:56:47', '32315', '0',
        '29', '0', '2022-09-12 14:56:47', '320', '2022-09-12 14:56:47', '320', '217');
INSERT INTO `kelas`
VALUES ('1623', 'IV - DL', '125', '40', '', '1', '', '10', null, null, null, '2022-09-12 14:57:39', '52841', '0', '5',
        '0', '2022-09-12 14:57:39', '320', '2022-09-12 14:57:39', '320', '522');
INSERT INTO `kelas`
VALUES ('1624', 'IV - DLT', '125', '40', '', '1', '', '10', null, null, null, '2022-09-12 14:58:09', '64830', '0', '26',
        '0', '2022-09-12 14:58:09', '320', '2022-09-12 14:58:09', '320', '522');
INSERT INTO `kelas`
VALUES ('1625', 'IV - INK', '125', '3', '', '1', '', '10', null, null, null, '2022-09-12 14:58:51', '38169', '0', '37',
        '0', '2022-09-12 14:58:51', '320', '2022-09-12 14:58:51', '320', '522');
INSERT INTO `kelas`
VALUES ('1626', 'IV - KOM', '125', '9', '', '1', '', '10', null, null, null, '2022-09-12 14:59:21', '62590', '0', '6',
        '0', '2022-09-12 14:59:21', '320', '2022-09-12 14:59:21', '320', '522');
INSERT INTO `kelas`
VALUES ('1627', 'IV - KOMO', '125', '25', '', '1', '', '10', null, null, null, '2022-09-12 14:59:48', '34976', '0',
        '29', '0', '2022-09-12 14:59:48', '320', '2022-09-12 14:59:48', '320', '522');
INSERT INTO `kelas`
VALUES ('1628', 'V - DL', '125', '40', '', '1', '', '11', null, null, null, '2022-09-12 15:01:20', '43390', '0', '5',
        '0', '2022-09-12 15:01:20', '320', '2022-09-12 15:01:20', '320', '560');
INSERT INTO `kelas`
VALUES ('1629', 'V - DLT', '125', '40', '', '1', '', '11', null, null, null, '2022-09-12 15:01:51', '29179', '0', '26',
        '0', '2022-09-12 15:01:51', '320', '2022-09-12 15:01:51', '320', '560');
INSERT INTO `kelas`
VALUES ('1630', 'V - INK', '125', '3', '', '1', '', '11', null, null, null, '2022-09-12 15:02:15', '10441', '0', '37',
        '0', '2022-09-12 15:02:15', '320', '2022-09-12 15:02:15', '320', '560');
INSERT INTO `kelas`
VALUES ('1631', 'X - B - DL', '127', '40', '', '1', '', '1', null, null, null, '2022-09-12 15:02:25', '52636', '0', '1',
        '0', '2022-09-12 15:02:25', '120', '2022-09-12 15:02:25', '120', '515');
INSERT INTO `kelas`
VALUES ('1632', 'V - KOM', '125', '9', '', '1', '', '11', null, null, null, '2022-09-12 15:02:45', '26583', '0', '6',
        '0', '2022-09-12 15:02:45', '320', '2022-09-12 15:02:45', '320', '560');
INSERT INTO `kelas`
VALUES ('1633', 'V - KOMO', '125', '25', '', '1', '', '11', null, null, null, '2022-09-12 15:03:09', '15724', '0', '29',
        '0', '2022-09-12 15:03:09', '320', '2022-09-12 15:03:09', '320', '560');
INSERT INTO `kelas`
VALUES ('1634', 'VI - DL', '125', '40', '', '1', '', '12', null, null, null, '2022-09-12 15:03:34', '57107', '0', '5',
        '0', '2022-09-12 15:03:34', '320', '2022-09-12 15:03:34', '320', '108');
INSERT INTO `kelas`
VALUES ('1635', 'X - A - DL', '127', '40', '', '1', '', '1', null, null, null, '2022-09-12 15:03:39', '56612', '0', '1',
        '0', '2022-09-12 15:03:39', '120', '2022-09-12 15:03:39', '120', '486');
INSERT INTO `kelas`
VALUES ('1636', 'VI - DLT', '125', '40', '', '1', '', '12', null, null, null, '2022-09-12 15:03:59', '32632', '0', '26',
        '0', '2022-09-12 15:03:59', '320', '2022-09-12 15:03:59', '320', '108');
INSERT INTO `kelas`
VALUES ('1637', 'VI - INK', '125', '3', '', '1', '', '12', null, null, null, '2022-09-12 15:04:22', '37413', '0', '37',
        '0', '2022-09-12 15:04:22', '320', '2022-09-12 15:04:22', '320', '108');
INSERT INTO `kelas`
VALUES ('1638', 'X - A - DLT', '127', '40', '', '1', '', '1', null, null, null, '2022-09-12 15:04:32', '44099', '0',
        '27', '0', '2022-09-12 15:04:32', '120', '2022-09-12 15:04:32', '120', '486');
INSERT INTO `kelas`
VALUES ('1639', 'VI - KOM', '125', '9', '', '1', '', '12', null, null, null, '2022-09-12 15:04:49', '39298', '0', '6',
        '0', '2022-09-12 15:04:49', '320', '2022-09-12 15:04:49', '320', '108');
INSERT INTO `kelas`
VALUES ('1640', 'VI - KOMO', '125', '25', '', '1', '', '12', null, null, null, '2022-09-12 15:05:12', '62587', '0',
        '29', '0', '2022-09-12 15:05:12', '320', '2022-09-12 15:05:12', '320', '108');
INSERT INTO `kelas`
VALUES ('1641', 'X - A - INK', '127', '3', '', '1', '', '1', null, null, null, '2022-09-12 15:05:38', '26654', '0',
        '42', '0', '2022-09-12 15:05:38', '120', '2022-09-12 15:05:38', '120', '486');
INSERT INTO `kelas`
VALUES ('1642', 'Kelas Pre Akademik \"K\"', '126', '3', '', '1', '', '14', null, null, null, '2022-09-12 15:06:57',
        '20251', '0', '36', '15', '2022-09-12 15:06:18', '117', '2022-09-12 15:06:57', '117', '622');
INSERT INTO `kelas`
VALUES ('1643', 'X - A - KOM', '127', '9', '', '1', '', '1', null, null, null, '2022-09-12 15:07:02', '3361', '0', '2',
        '0', '2022-09-12 15:07:02', '120', '2022-09-12 15:07:02', '120', '486');
INSERT INTO `kelas`
VALUES ('1644', 'X - A - KOMO', '127', '30', '', '1', '', '1', null, null, null, '2022-09-12 15:07:46', '24680', '0',
        '31', '0', '2022-09-12 15:07:46', '120', '2022-09-12 15:07:46', '120', '486');
INSERT INTO `kelas`
VALUES ('1645', 'Kelas Pre Akademik \"P\"', '126', '3', '', '1', '', '14', null, null, null, '2022-09-12 15:07:54',
        '15375', '0', '36', '18', '2022-09-12 15:07:54', '117', '2022-09-12 15:07:54', '117', '622');
INSERT INTO `kelas`
VALUES ('1646', 'I', '128', '20', '', '1', '', '7', null, null, null, '2022-09-12 15:08:18', '62611', '0', '36', '0',
        '2022-09-12 15:08:18', '320', '2022-09-12 15:08:18', '320', '612');
INSERT INTO `kelas`
VALUES ('1647', 'Kelas Pre Akademik Q', '126', '3', '', '1', '', '14', null, null, null, '2022-09-12 15:08:33', '33863',
        '0', '36', '7', '2022-09-12 15:08:33', '117', '2022-09-12 15:08:33', '117', '622');
INSERT INTO `kelas`
VALUES ('1648', 'X - B - DLT', '127', '40', '', '1', '', '1', null, null, null, '2022-09-12 15:08:44', '44248', '0',
        '27', '0', '2022-09-12 15:08:43', '120', '2022-09-12 15:08:43', '120', '515');
INSERT INTO `kelas`
VALUES ('1649', 'I - INK', '128', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:08:46', '54120', '0', '37',
        '0', '2022-09-12 15:08:46', '320', '2022-09-12 15:08:46', '320', '612');
INSERT INTO `kelas`
VALUES ('1650', 'II', '128', '20', '', '1', '', '8', null, null, null, '2022-09-12 15:09:08', '6797', '0', '36', '0',
        '2022-09-12 15:09:08', '320', '2022-09-12 15:09:08', '320', '611');
INSERT INTO `kelas`
VALUES ('1651', 'X - B - INK', '127', '3', '', '1', '', '1', null, null, null, '2022-09-12 15:09:24', '32289', '0',
        '42', '0', '2022-09-12 15:09:24', '120', '2022-09-12 15:09:24', '120', '515');
INSERT INTO `kelas`
VALUES ('1652', 'II - INK', '128', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:09:36', '31172', '0', '37',
        '0', '2022-09-12 15:09:36', '320', '2022-09-12 15:09:36', '320', '611');
INSERT INTO `kelas`
VALUES ('1653', 'III', '128', '20', '', '1', '', '9', null, null, null, '2022-09-12 15:09:58', '62441', '0', '36', '0',
        '2022-09-12 15:09:58', '320', '2022-09-12 15:09:58', '320', '217');
INSERT INTO `kelas`
VALUES ('1654', 'X - B - KOM', '127', '9', '', '1', '', '1', null, null, null, '2022-09-12 15:10:11', '2683', '0', '2',
        '0', '2022-09-12 15:10:11', '120', '2022-09-12 15:10:11', '120', '515');
INSERT INTO `kelas`
VALUES ('1655', 'III - INK', '128', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:10:21', '58553', '0', '37',
        '0', '2022-09-12 15:10:21', '320', '2022-09-12 15:10:21', '320', '217');
INSERT INTO `kelas`
VALUES ('1656', 'IV', '128', '20', '', '1', '', '10', null, null, null, '2022-09-12 15:10:47', '3959', '0', '36', '0',
        '2022-09-12 15:10:47', '320', '2022-09-12 15:10:47', '320', '522');
INSERT INTO `kelas`
VALUES ('1657', 'X - B - KOMO', '127', '30', '', '1', '', '1', null, null, null, '2022-09-12 15:11:02', '22595', '0',
        '31', '0', '2022-09-12 15:11:02', '120', '2022-09-12 15:11:02', '120', '515');
INSERT INTO `kelas`
VALUES ('1658', 'IV - INK', '128', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:11:14', '58994', '0', '37',
        '0', '2022-09-12 15:11:14', '320', '2022-09-12 15:11:14', '320', '522');
INSERT INTO `kelas`
VALUES ('1659', 'V', '128', '20', '', '1', '', '11', null, null, null, '2022-09-12 15:11:35', '29062', '0', '36', '0',
        '2022-09-12 15:11:35', '320', '2022-09-12 15:11:35', '320', '560');
INSERT INTO `kelas`
VALUES ('1660', 'V - INK', '128', '3', '', '1', '', '11', null, null, null, '2022-09-12 15:11:59', '2373', '0', '37',
        '0', '2022-09-12 15:11:59', '320', '2022-09-12 15:11:59', '320', '560');
INSERT INTO `kelas`
VALUES ('1661', 'XI - IPA - DL	', '127', '40', '', '1', '', '2', null, null, null, '2022-09-12 15:18:17', '4863',
        '0', '1', '1', '2022-09-12 15:18:17', '120', '2022-09-12 15:18:17', '120', '469');
INSERT INTO `kelas`
VALUES ('1662', 'XI - IPA - DLT', '127', '40', '', '1', '', '2', null, null, null, '2022-09-12 15:19:22', '10675', '0',
        '27', '1', '2022-09-12 15:19:22', '120', '2022-09-12 15:19:22', '120', '469');
INSERT INTO `kelas`
VALUES ('1663', 'XI - IPA - KOM', '127', '12', '', '1', '', '2', null, null, null, '2022-09-12 15:21:40', '43922', '0',
        '2', '1', '2022-09-12 15:21:40', '120', '2022-09-12 15:21:40', '120', '469');
INSERT INTO `kelas`
VALUES ('1664', 'XI - IPA - KOMO', '127', '30', '', '1', '', '2', null, null, null, '2022-09-12 15:22:24', '8430', '0',
        '31', '1', '2022-09-12 15:22:24', '120', '2022-09-12 15:22:24', '120', '469');
INSERT INTO `kelas`
VALUES ('1665', 'XI - IPS - A - DL', '127', '40', '', '1', '', '2', null, null, null, '2022-09-12 15:23:09', '2848',
        '0', '1', '2', '2022-09-12 15:23:09', '120', '2022-09-12 15:23:09', '120', '381');
INSERT INTO `kelas`
VALUES ('1666', 'XI - IPS - A - DLT', '127', '40', '', '1', '', '2', null, null, null, '2022-09-12 15:23:53', '45139',
        '0', '27', '1', '2022-09-12 15:23:53', '120', '2022-09-12 15:23:53', '120', '381');
INSERT INTO `kelas`
VALUES ('1667', 'I - A', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:24:33', '26588', '0', '36', '3',
        '2022-09-12 15:24:33', '117', '2022-09-12 15:24:33', '117', '574');
INSERT INTO `kelas`
VALUES ('1668', 'XI - IPS - A - KOM', '127', '12', '', '1', '', '2', null, null, null, '2022-09-12 15:25:06', '63053',
        '0', '2', '2', '2022-09-12 15:25:06', '120', '2022-09-12 15:25:06', '120', '428');
INSERT INTO `kelas`
VALUES ('1669', 'I - B', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:25:30', '62132', '0', '36', '4',
        '2022-09-12 15:25:30', '117', '2022-09-12 15:25:30', '117', '574');
INSERT INTO `kelas`
VALUES ('1670', 'XI - IPS - A - KOMO', '127', '30', '', '1', '', '2', null, null, null, '2022-09-12 15:25:46', '41442',
        '0', '31', '2', '2022-09-12 15:25:46', '120', '2022-09-12 15:25:46', '120', '381');
INSERT INTO `kelas`
VALUES ('1671', 'I - C', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:25:58', '50863', '0', '36', '5',
        '2022-09-12 15:25:58', '117', '2022-09-12 15:25:58', '117', '574');
INSERT INTO `kelas`
VALUES ('1672', 'I - C1', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:32:35', '64456', '0', '36',
        '8', '2022-09-12 15:26:23', '117', '2022-09-12 15:32:35', '117', '574');
INSERT INTO `kelas`
VALUES ('1673', 'I - D', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:26:48', '57464', '0', '36', '6',
        '2022-09-12 15:26:48', '117', '2022-09-12 15:26:48', '117', '574');
INSERT INTO `kelas`
VALUES ('1674', 'XI - IPS - B - DL', '127', '40', '', '1', '', '2', null, null, null, '2022-09-12 15:26:48', '62441',
        '0', '1', '2', '2022-09-12 15:26:48', '120', '2022-09-12 15:26:48', '120', '428');
INSERT INTO `kelas`
VALUES ('1675', 'I - D1', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:27:13', '16512', '0', '36',
        '9', '2022-09-12 15:27:13', '117', '2022-09-12 15:27:13', '117', '574');
INSERT INTO `kelas`
VALUES ('1676', 'I - E', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:27:36', '11981', '0', '36',
        '10', '2022-09-12 15:27:36', '117', '2022-09-12 15:27:36', '117', '574');
INSERT INTO `kelas`
VALUES ('1677', 'XI - IPS - B - KOM', '127', '12', '', '1', '', '2', null, null, null, '2022-09-12 15:27:42', '27223',
        '0', '2', '2', '2022-09-12 15:27:42', '120', '2022-09-12 15:27:42', '120', '428');
INSERT INTO `kelas`
VALUES ('1678', 'I - F', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:28:08', '21050', '0', '36',
        '11', '2022-09-12 15:28:08', '117', '2022-09-12 15:28:08', '117', '574');
INSERT INTO `kelas`
VALUES ('1679', 'I - H', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:29:19', '8755', '0', '36', '12',
        '2022-09-12 15:29:19', '117', '2022-09-12 15:29:19', '117', '574');
INSERT INTO `kelas`
VALUES ('1680', 'I - I', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:29:54', '38630', '0', '36',
        '13', '2022-09-12 15:29:54', '117', '2022-09-12 15:29:54', '117', '574');
INSERT INTO `kelas`
VALUES ('1681', 'I - J', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:30:17', '51363', '0', '36',
        '14', '2022-09-12 15:30:17', '117', '2022-09-12 15:30:17', '117', '574');
INSERT INTO `kelas`
VALUES ('1682', 'I - K', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:30:47', '24280', '0', '36',
        '15', '2022-09-12 15:30:47', '117', '2022-09-12 15:30:47', '117', '574');
INSERT INTO `kelas`
VALUES ('1683', 'I - P', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:31:14', '65310', '0', '36',
        '18', '2022-09-12 15:31:14', '117', '2022-09-12 15:31:14', '117', '574');
INSERT INTO `kelas`
VALUES ('1684', 'I - Q', '126', '3', '', '1', '', '7', null, null, null, '2022-09-12 15:31:37', '53041', '0', '36', '7',
        '2022-09-12 15:31:37', '117', '2022-09-12 15:31:37', '117', '574');
INSERT INTO `kelas`
VALUES ('1685', 'II - A', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:36:49', '23581', '0', '36',
        '3', '2022-09-12 15:36:49', '117', '2022-09-12 15:36:49', '117', '480');
INSERT INTO `kelas`
VALUES ('1686', 'II - B', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:37:10', '14072', '0', '36',
        '4', '2022-09-12 15:37:10', '117', '2022-09-12 15:37:10', '117', '480');
INSERT INTO `kelas`
VALUES ('1687', 'II - C', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:37:39', '38912', '0', '36',
        '5', '2022-09-12 15:37:39', '117', '2022-09-12 15:37:39', '117', '480');
INSERT INTO `kelas`
VALUES ('1688', 'II - C1', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:38:02', '5401', '0', '36',
        '8', '2022-09-12 15:38:02', '117', '2022-09-12 15:38:02', '117', '480');
INSERT INTO `kelas`
VALUES ('1689', 'II - D', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:38:28', '32839', '0', '36',
        '6', '2022-09-12 15:38:28', '117', '2022-09-12 15:38:28', '117', '480');
INSERT INTO `kelas`
VALUES ('1690', 'II - D1', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:38:53', '54754', '0', '36',
        '9', '2022-09-12 15:38:53', '117', '2022-09-12 15:38:53', '117', '480');
INSERT INTO `kelas`
VALUES ('1691', 'II - E', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:39:15', '6435', '0', '36',
        '10', '2022-09-12 15:39:15', '117', '2022-09-12 15:39:15', '117', '480');
INSERT INTO `kelas`
VALUES ('1692', 'II - F', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:39:39', '42350', '0', '36',
        '11', '2022-09-12 15:39:39', '117', '2022-09-12 15:39:39', '117', '480');
INSERT INTO `kelas`
VALUES ('1693', 'II - H', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:40:00', '64505', '0', '36',
        '12', '2022-09-12 15:40:00', '117', '2022-09-12 15:40:00', '117', '480');
INSERT INTO `kelas`
VALUES ('1694', 'II - I', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:40:24', '25826', '0', '36',
        '13', '2022-09-12 15:40:24', '117', '2022-09-12 15:40:24', '117', '480');
INSERT INTO `kelas`
VALUES ('1695', 'XII - IPA - DL', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:40:34', '5490', '0',
        '1', '1', '2022-09-12 15:40:34', '120', '2022-09-12 15:40:34', '120', '130');
INSERT INTO `kelas`
VALUES ('1696', 'II - J', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:40:47', '41099', '0', '36',
        '14', '2022-09-12 15:40:47', '117', '2022-09-12 15:40:47', '117', '480');
INSERT INTO `kelas`
VALUES ('1697', 'II - K', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:41:07', '50765', '0', '36',
        '15', '2022-09-12 15:41:07', '117', '2022-09-12 15:41:07', '117', '480');
INSERT INTO `kelas`
VALUES ('1698', 'XII - IPA - DLT', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:41:18', '30612', '0',
        '27', '1', '2022-09-12 15:41:18', '120', '2022-09-12 15:41:18', '120', '130');
INSERT INTO `kelas`
VALUES ('1699', 'II - P', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:41:30', '40762', '0', '36',
        '18', '2022-09-12 15:41:30', '117', '2022-09-12 15:41:30', '117', '480');
INSERT INTO `kelas`
VALUES ('1700', 'II - Q', '126', '3', '', '1', '', '8', null, null, null, '2022-09-12 15:41:51', '41326', '0', '36',
        '7', '2022-09-12 15:41:51', '117', '2022-09-12 15:41:51', '117', '480');
INSERT INTO `kelas`
VALUES ('1701', 'XII - IPA - KOM', '127', '12', '', '1', '', '3', null, null, null, '2022-09-12 15:42:03', '10050', '0',
        '2', '1', '2022-09-12 15:42:03', '120', '2022-09-12 15:42:03', '120', '130');
INSERT INTO `kelas`
VALUES ('1702', 'XII - IPA - KOMO', '127', '30', '', '1', '', '3', null, null, null, '2022-09-12 15:42:44', '23945',
        '0', '31', '1', '2022-09-12 15:42:44', '120', '2022-09-12 15:42:44', '120', '130');
INSERT INTO `kelas`
VALUES ('1703', 'XII - IPS - A - DL', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:43:25', '51513',
        '0', '1', '2', '2022-09-12 15:43:25', '120', '2022-09-12 15:43:25', '120', '153');
INSERT INTO `kelas`
VALUES ('1704', 'XII - IPS - A - DLT', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:43:57', '24042',
        '0', '27', '2', '2022-09-12 15:43:57', '120', '2022-09-12 15:43:57', '120', '406');
INSERT INTO `kelas`
VALUES ('1705', 'XII - IPS - A - KOM', '127', '12', '', '1', '', '3', null, null, null, '2022-09-12 15:44:33', '48378',
        '0', '2', '2', '2022-09-12 15:44:33', '120', '2022-09-12 15:44:33', '120', '153');
INSERT INTO `kelas`
VALUES ('1706', 'XII - IPS - B - DL', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:45:03', '4222',
        '0', '1', '2', '2022-09-12 15:45:03', '120', '2022-09-12 15:45:03', '120', '406');
INSERT INTO `kelas`
VALUES ('1707', 'XII - IPS - B - DLT', '127', '40', '', '1', '', '3', null, null, null, '2022-09-12 15:45:34', '59365',
        '0', '27', '2', '2022-09-12 15:45:34', '120', '2022-09-12 15:45:34', '120', '406');
INSERT INTO `kelas`
VALUES ('1708', 'III - A', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:45:44', '41790', '0', '36',
        '3', '2022-09-12 15:45:44', '117', '2022-09-12 15:45:44', '117', '248');
INSERT INTO `kelas`
VALUES ('1709', 'XII - IPS - B - KOM', '127', '12', '', '1', '', '3', null, null, null, '2022-09-12 15:46:04', '30853',
        '0', '2', '2', '2022-09-12 15:46:04', '120', '2022-09-12 15:46:04', '120', '406');
INSERT INTO `kelas`
VALUES ('1710', 'III - B', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:46:41', '58570', '0', '36',
        '4', '2022-09-12 15:46:41', '117', '2022-09-12 15:46:41', '117', '248');
INSERT INTO `kelas`
VALUES ('1711', 'XII - IPS - KOMO', '127', '30', '', '1', '', '3', null, null, null, '2022-09-12 15:46:41', '1583', '0',
        '31', '2', '2022-09-12 15:46:41', '120', '2022-09-12 15:46:41', '120', '153');
INSERT INTO `kelas`
VALUES ('1712', 'III - C', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:47:09', '22663', '0', '36',
        '5', '2022-09-12 15:47:09', '117', '2022-09-12 15:47:09', '117', '248');
INSERT INTO `kelas`
VALUES ('1713', 'III - C1', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:47:36', '28894', '0', '36',
        '8', '2022-09-12 15:47:36', '117', '2022-09-12 15:47:36', '117', '248');
INSERT INTO `kelas`
VALUES ('1714', 'III - D', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:48:02', '52625', '0', '36',
        '6', '2022-09-12 15:48:02', '117', '2022-09-12 15:48:02', '117', '248');
INSERT INTO `kelas`
VALUES ('1715', 'III - D1', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:48:27', '51910', '0', '36',
        '9', '2022-09-12 15:48:27', '117', '2022-09-12 15:48:27', '117', '248');
INSERT INTO `kelas`
VALUES ('1716', 'III - E', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:48:50', '63106', '0', '36',
        '10', '2022-09-12 15:48:50', '117', '2022-09-12 15:48:50', '117', '248');
INSERT INTO `kelas`
VALUES ('1717', 'III - F', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:49:14', '50953', '0', '36',
        '11', '2022-09-12 15:49:14', '117', '2022-09-12 15:49:14', '117', '248');
INSERT INTO `kelas`
VALUES ('1718', 'III - H', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:49:38', '5014', '0', '36',
        '12', '2022-09-12 15:49:38', '117', '2022-09-12 15:49:38', '117', '248');
INSERT INTO `kelas`
VALUES ('1719', 'III - I', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:51:03', '63785', '0', '36',
        '13', '2022-09-12 15:51:03', '117', '2022-09-12 15:51:03', '117', '248');
INSERT INTO `kelas`
VALUES ('1720', 'III - J', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:51:24', '32157', '0', '36',
        '14', '2022-09-12 15:51:24', '117', '2022-09-12 15:51:24', '117', '248');
INSERT INTO `kelas`
VALUES ('1721', 'III - K', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:51:46', '39601', '0', '36',
        '15', '2022-09-12 15:51:46', '117', '2022-09-12 15:51:46', '117', '248');
INSERT INTO `kelas`
VALUES ('1722', 'III - P', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:52:10', '41763', '0', '36',
        '18', '2022-09-12 15:52:10', '117', '2022-09-12 15:52:10', '117', '248');
INSERT INTO `kelas`
VALUES ('1723', 'III - Q', '126', '3', '', '1', '', '9', null, null, null, '2022-09-12 15:52:35', '63158', '0', '36',
        '7', '2022-09-12 15:52:35', '117', '2022-09-12 15:52:35', '117', '248');
INSERT INTO `kelas`
VALUES ('1724', 'IV - A', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:55:39', '60168', '0', '36',
        '3', '2022-09-12 15:55:39', '117', '2022-09-12 15:55:39', '117', '481');
INSERT INTO `kelas`
VALUES ('1725', 'IV - B', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:56:00', '41808', '0', '36',
        '4', '2022-09-12 15:56:00', '117', '2022-09-12 15:56:00', '117', '481');
INSERT INTO `kelas`
VALUES ('1726', 'IV - C', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:56:18', '53312', '0', '36',
        '5', '2022-09-12 15:56:18', '117', '2022-09-12 15:56:18', '117', '481');
INSERT INTO `kelas`
VALUES ('1727', 'IV - C1', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:56:37', '41002', '0', '36',
        '8', '2022-09-12 15:56:37', '117', '2022-09-12 15:56:37', '117', '481');
INSERT INTO `kelas`
VALUES ('1728', 'IV - D', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:56:56', '17459', '0', '36',
        '6', '2022-09-12 15:56:56', '117', '2022-09-12 15:56:56', '117', '481');
INSERT INTO `kelas`
VALUES ('1729', 'IV - D1', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:57:19', '16850', '0', '36',
        '9', '2022-09-12 15:57:19', '117', '2022-09-12 15:57:19', '117', '481');
INSERT INTO `kelas`
VALUES ('1730', 'IV - E', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:57:43', '15538', '0', '36',
        '10', '2022-09-12 15:57:43', '117', '2022-09-12 15:57:43', '117', '481');
INSERT INTO `kelas`
VALUES ('1731', 'IV - F', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:58:04', '20213', '0', '36',
        '11', '2022-09-12 15:58:04', '117', '2022-09-12 15:58:04', '117', '481');
INSERT INTO `kelas`
VALUES ('1732', 'IV - H', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:58:28', '38701', '0', '36',
        '12', '2022-09-12 15:58:28', '117', '2022-09-12 15:58:28', '117', '481');
INSERT INTO `kelas`
VALUES ('1733', 'IV - I', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:58:49', '34804', '0', '36',
        '13', '2022-09-12 15:58:49', '117', '2022-09-12 15:58:49', '117', '481');
INSERT INTO `kelas`
VALUES ('1734', 'IV - J', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 16:00:44', '48371', '0', '36',
        '14', '2022-09-12 15:59:13', '117', '2022-09-12 16:00:44', '117', '481');
INSERT INTO `kelas`
VALUES ('1735', 'IV - K', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 16:02:36', '57941', '0', '36',
        '15', '2022-09-12 15:59:30', '117', '2022-09-12 16:02:36', '117', '481');
INSERT INTO `kelas`
VALUES ('1736', 'IV - P', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 15:59:52', '10072', '0', '36',
        '18', '2022-09-12 15:59:52', '117', '2022-09-12 15:59:52', '117', '481');
INSERT INTO `kelas`
VALUES ('1737', 'IV - Q', '126', '3', '', '1', '', '10', null, null, null, '2022-09-12 16:00:11', '65444', '0', '36',
        '7', '2022-09-12 16:00:11', '117', '2022-09-12 16:00:11', '117', '481');
INSERT INTO `kelas`
VALUES ('1738', 'V - A', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:06:59', '43303', '0', '36',
        '3', '2022-09-12 16:06:59', '117', '2022-09-12 16:06:59', '117', '387');
INSERT INTO `kelas`
VALUES ('1739', 'V - B', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:07:22', '54232', '0', '36',
        '4', '2022-09-12 16:07:22', '117', '2022-09-12 16:07:22', '117', '387');
INSERT INTO `kelas`
VALUES ('1740', 'V - C', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:07:45', '60223', '0', '36',
        '5', '2022-09-12 16:07:45', '117', '2022-09-12 16:07:45', '117', '387');
INSERT INTO `kelas`
VALUES ('1741', 'V - C1', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:08:09', '20183', '0', '36',
        '8', '2022-09-12 16:08:09', '117', '2022-09-12 16:08:09', '117', '387');
INSERT INTO `kelas`
VALUES ('1742', 'V - D', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:08:38', '21485', '0', '36',
        '6', '2022-09-12 16:08:38', '117', '2022-09-12 16:08:38', '117', '387');
INSERT INTO `kelas`
VALUES ('1743', 'V - D1', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:08:59', '31804', '0', '36',
        '9', '2022-09-12 16:08:59', '117', '2022-09-12 16:08:59', '117', '387');
INSERT INTO `kelas`
VALUES ('1744', 'V - E', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:09:19', '53244', '0', '36',
        '10', '2022-09-12 16:09:19', '117', '2022-09-12 16:09:19', '117', '387');
INSERT INTO `kelas`
VALUES ('1745', 'V - F', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:09:41', '16608', '0', '36',
        '11', '2022-09-12 16:09:41', '117', '2022-09-12 16:09:41', '117', '387');
INSERT INTO `kelas`
VALUES ('1746', 'V - H', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:10:04', '56358', '0', '36',
        '12', '2022-09-12 16:10:04', '117', '2022-09-12 16:10:04', '117', '387');
INSERT INTO `kelas`
VALUES ('1747', 'V - I', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:10:26', '36533', '0', '36',
        '13', '2022-09-12 16:10:26', '117', '2022-09-12 16:10:26', '117', '387');
INSERT INTO `kelas`
VALUES ('1748', 'V - J', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:10:51', '61856', '0', '36',
        '14', '2022-09-12 16:10:51', '117', '2022-09-12 16:10:51', '117', '387');
INSERT INTO `kelas`
VALUES ('1749', 'V - K', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:11:12', '11679', '0', '36',
        '15', '2022-09-12 16:11:12', '117', '2022-09-12 16:11:12', '117', '387');
INSERT INTO `kelas`
VALUES ('1750', 'V - P', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:11:30', '35374', '0', '36',
        '18', '2022-09-12 16:11:30', '117', '2022-09-12 16:11:30', '117', '387');
INSERT INTO `kelas`
VALUES ('1751', 'V - Q', '126', '3', '', '1', '', '11', null, null, null, '2022-09-12 16:11:53', '58619', '0', '36',
        '7', '2022-09-12 16:11:53', '117', '2022-09-12 16:11:53', '117', '387');
INSERT INTO `kelas`
VALUES ('1752', 'VI - A', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:15:44', '7799', '0', '36',
        '3', '2022-09-12 16:15:44', '117', '2022-09-12 16:15:44', '117', '519');
INSERT INTO `kelas`
VALUES ('1753', 'VI - B', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:16:07', '2300', '0', '36',
        '4', '2022-09-12 16:16:07', '117', '2022-09-12 16:16:07', '117', '519');
INSERT INTO `kelas`
VALUES ('1754', 'VI - C', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:16:28', '63929', '0', '36',
        '5', '2022-09-12 16:16:28', '117', '2022-09-12 16:16:28', '117', '519');
INSERT INTO `kelas`
VALUES ('1755', 'VI - C1', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:16:50', '17275', '0', '36',
        '8', '2022-09-12 16:16:50', '117', '2022-09-12 16:16:50', '117', '519');
INSERT INTO `kelas`
VALUES ('1756', 'VI - D', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:17:15', '34130', '0', '36',
        '6', '2022-09-12 16:17:15', '117', '2022-09-12 16:17:15', '117', '519');
INSERT INTO `kelas`
VALUES ('1757', 'VI - D1', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:17:35', '59033', '0', '36',
        '9', '2022-09-12 16:17:35', '117', '2022-09-12 16:17:35', '117', '519');
INSERT INTO `kelas`
VALUES ('1758', 'VI - E', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:17:59', '31869', '0', '36',
        '10', '2022-09-12 16:17:59', '117', '2022-09-12 16:17:59', '117', '519');
INSERT INTO `kelas`
VALUES ('1759', 'VI - F', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:18:18', '44390', '0', '36',
        '11', '2022-09-12 16:18:18', '117', '2022-09-12 16:18:18', '117', '519');
INSERT INTO `kelas`
VALUES ('1760', 'VI - H', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:18:41', '54030', '0', '36',
        '12', '2022-09-12 16:18:41', '117', '2022-09-12 16:18:41', '117', '519');
INSERT INTO `kelas`
VALUES ('1761', 'VI - I', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:19:02', '5918', '0', '36',
        '13', '2022-09-12 16:19:02', '117', '2022-09-12 16:19:02', '117', '519');
INSERT INTO `kelas`
VALUES ('1762', 'VI - J', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:19:26', '32234', '0', '36',
        '14', '2022-09-12 16:19:26', '117', '2022-09-12 16:19:26', '117', '519');
INSERT INTO `kelas`
VALUES ('1763', 'VI - K', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:19:48', '23210', '0', '36',
        '15', '2022-09-12 16:19:48', '117', '2022-09-12 16:19:48', '117', '519');
INSERT INTO `kelas`
VALUES ('1764', 'VI - P', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:20:08', '41185', '0', '36',
        '18', '2022-09-12 16:20:08', '117', '2022-09-12 16:20:08', '117', '519');
INSERT INTO `kelas`
VALUES ('1765', 'VI - Q', '126', '3', '', '1', '', '12', null, null, null, '2022-09-12 16:20:29', '28823', '0', '36',
        '7', '2022-09-12 16:20:29', '117', '2022-09-12 16:20:29', '117', '519');
INSERT INTO `kelas`
VALUES ('1766', 'VII - DL', '129', '40', '', '1', '', '4', null, null, null, '2022-09-12 16:43:17', '48079', '0', '3',
        '0', '2022-09-12 16:43:17', '117', '2022-09-12 16:43:17', '117', '518');
INSERT INTO `kelas`
VALUES ('1767', 'VII - DLT', '129', '40', '', '1', '', '4', null, null, null, '2022-09-12 16:43:38', '59116', '0', '28',
        '0', '2022-09-12 16:43:38', '117', '2022-09-12 16:43:38', '117', '518');
INSERT INTO `kelas`
VALUES ('1768', 'VII - KOMO', '129', '30', '', '1', '', '4', null, null, null, '2022-09-12 16:44:10', '1321', '0', '30',
        '0', '2022-09-12 16:44:10', '117', '2022-09-12 16:44:10', '117', '518');
INSERT INTO `kelas`
VALUES ('1769', 'VII - KOM', '129', '8', '', '1', '', '4', null, null, null, '2022-09-13 11:02:14', '20284', '0', '4',
        '0', '2022-09-12 16:44:32', '117', '2022-09-13 11:02:14', '117', '518');
INSERT INTO `kelas`
VALUES ('1770', 'VII - INK', '129', '4', '', '1', '', '4', null, null, null, '2022-09-13 11:02:20', '55389', '0', '41',
        '0', '2022-09-12 16:44:55', '117', '2022-09-13 11:02:20', '117', '518');
INSERT INTO `kelas`
VALUES ('1771', 'VIII - A - DL', '129', '40', '', '1', '', '5', null, null, null, '2022-09-12 16:48:18', '38291', '0',
        '3', '0', '2022-09-12 16:48:18', '117', '2022-09-12 16:48:18', '117', '368');
INSERT INTO `kelas`
VALUES ('1772', 'VIII - A - DLT', '129', '40', '', '1', '', '5', null, null, null, '2022-09-12 16:48:37', '39668', '0',
        '28', '0', '2022-09-12 16:48:37', '117', '2022-09-12 16:48:37', '117', '368');
INSERT INTO `kelas`
VALUES ('1773', 'VIII - A - KOMO', '129', '30', '', '1', '', '5', null, null, null, '2022-09-12 16:49:12', '55132', '0',
        '30', '0', '2022-09-12 16:49:12', '117', '2022-09-12 16:49:12', '117', '368');
INSERT INTO `kelas`
VALUES ('1774', 'VIII - A - KOM', '129', '8', '', '1', '', '5', null, null, null, '2022-09-13 11:02:41', '18218', '0',
        '4', '0', '2022-09-12 16:49:38', '117', '2022-09-13 11:02:41', '117', '368');
INSERT INTO `kelas`
VALUES ('1775', 'VIII - A - INK', '129', '4', '', '1', '', '5', null, null, null, '2022-09-13 11:02:33', '56752', '0',
        '41', '0', '2022-09-12 16:49:59', '117', '2022-09-13 11:02:33', '117', '368');
INSERT INTO `kelas`
VALUES ('1776', 'VIII - B - DL', '129', '40', '', '1', '', '5', null, null, null, '2022-09-12 16:51:00', '55377', '0',
        '3', '0', '2022-09-12 16:51:00', '117', '2022-09-12 16:51:00', '117', '405');
INSERT INTO `kelas`
VALUES ('1777', 'VIII - B - DLT', '129', '40', '', '1', '', '5', null, null, null, '2022-09-12 16:51:18', '56429', '0',
        '28', '0', '2022-09-12 16:51:18', '117', '2022-09-12 16:51:18', '117', '405');
INSERT INTO `kelas`
VALUES ('1778', 'VIII - B - KOMO', '129', '30', '', '1', '', '5', null, null, null, '2022-09-12 16:51:39', '36214', '0',
        '30', '0', '2022-09-12 16:51:39', '117', '2022-09-12 16:51:39', '117', '405');
INSERT INTO `kelas`
VALUES ('1779', 'VIII - B - KOM', '129', '8', '', '1', '', '5', null, null, null, '2022-09-13 11:02:55', '41593', '0',
        '4', '0', '2022-09-12 16:51:59', '117', '2022-09-13 11:02:55', '117', '405');
INSERT INTO `kelas`
VALUES ('1780', 'VIII - B - INK', '129', '4', '', '1', '', '5', null, null, null, '2022-09-13 11:02:49', '8358', '0',
        '41', '0', '2022-09-12 16:52:32', '117', '2022-09-13 11:02:49', '117', '405');
INSERT INTO `kelas`
VALUES ('1781', 'IX - A - DL', '129', '40', '', '1', '', '6', null, null, null, '2022-09-12 16:56:02', '32515', '0',
        '3', '0', '2022-09-12 16:56:02', '117', '2022-09-12 16:56:02', '117', '269');
INSERT INTO `kelas`
VALUES ('1782', 'IX - A - DLT', '129', '40', '', '1', '', '6', null, null, null, '2022-09-12 16:56:21', '11782', '0',
        '28', '0', '2022-09-12 16:56:21', '117', '2022-09-12 16:56:21', '117', '269');
INSERT INTO `kelas`
VALUES ('1783', 'IX - A - KOMO', '129', '30', '', '1', '', '6', null, null, null, '2022-09-12 16:56:43', '53843', '0',
        '30', '0', '2022-09-12 16:56:43', '117', '2022-09-12 16:56:43', '117', '269');
INSERT INTO `kelas`
VALUES ('1784', 'IX - A - KOM', '129', '8', '', '1', '', '6', null, null, null, '2022-09-13 11:03:11', '18035', '0',
        '4', '0', '2022-09-12 16:57:01', '117', '2022-09-13 11:03:11', '117', '269');
INSERT INTO `kelas`
VALUES ('1785', 'IX - A - INK', '129', '4', '', '1', '', '6', null, null, null, '2022-09-13 11:03:04', '47553', '0',
        '41', '0', '2022-09-12 16:57:22', '117', '2022-09-13 11:03:04', '117', '269');
INSERT INTO `kelas`
VALUES ('1786', 'IX - B - DL', '129', '40', '', '1', '', '6', null, null, null, '2022-09-12 16:57:53', '57851', '0',
        '3', '0', '2022-09-12 16:57:53', '117', '2022-09-12 16:57:53', '117', '324');
INSERT INTO `kelas`
VALUES ('1787', 'IX - B - DLT', '129', '40', '', '1', '', '6', null, null, null, '2022-09-12 16:58:09', '30928', '0',
        '28', '0', '2022-09-12 16:58:09', '117', '2022-09-12 16:58:09', '117', '324');
INSERT INTO `kelas`
VALUES ('1788', 'IX - B - KOMO', '129', '30', '', '1', '', '6', null, null, null, '2022-09-12 16:58:27', '10703', '0',
        '30', '0', '2022-09-12 16:58:27', '117', '2022-09-12 16:58:27', '117', '324');
INSERT INTO `kelas`
VALUES ('1789', 'IX - B - KOM', '129', '8', '', '1', '', '6', null, null, null, '2022-09-13 11:03:25', '41918', '0',
        '4', '0', '2022-09-12 16:58:52', '117', '2022-09-13 11:03:25', '117', '324');
INSERT INTO `kelas`
VALUES ('1790', 'IX - B - INK', '129', '4', '', '1', '', '6', null, null, null, '2022-09-13 11:03:19', '46418', '0',
        '41', '0', '2022-09-12 16:59:13', '117', '2022-09-13 11:03:19', '117', '324');

-- ----------------------------
-- Table structure for kelompokcalonsiswa
-- ----------------------------
DROP TABLE IF EXISTS `kelompokcalonsiswa`;
CREATE TABLE `kelompokcalonsiswa`
(
    `replid`         int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `kelompok`       varchar(100)         NOT NULL,
    `idproses`       int(10) unsigned     NOT NULL,
    `kapasitas`      int(10) unsigned     NOT NULL,
    `keterangan`     varchar(255)                  DEFAULT NULL,
    `info1`          varchar(255)                  DEFAULT NULL,
    `info2`          varchar(255)                  DEFAULT NULL,
    `info3`          varchar(255)                  DEFAULT NULL,
    `ts`             timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`          smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`         tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `periode`        char(2)              NOT NULL,
    `kelompok_siswa` int(11)              NOT NULL,
    `aktif`          int(1)                        DEFAULT NULL,
    `lamaproses`     int(11)                       DEFAULT NULL,
    `created_date`   datetime                      DEFAULT NULL,
    `created_by`     varchar(200)                  DEFAULT NULL,
    `modified_date`  datetime                      DEFAULT NULL,
    `modified_by`    varchar(200)                  DEFAULT NULL,
    PRIMARY KEY (`replid`),
    KEY `FK_kelompokcalonsiswa_prosespenerimaansiswa` (`idproses`) USING BTREE,
    KEY `IX_kelompokcalonsiswa_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 105
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of kelompokcalonsiswa
-- ----------------------------
INSERT INTO `kelompokcalonsiswa`
VALUES ('1', 'KOMUNITAS', '1', '60', '', null, null, null, '2017-08-29 09:54:21', '60348', '0', '1', '2', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('2', 'DISTANCE LEARNING', '1', '60', '', null, null, null, '2017-08-15 11:05:58', '62527', '0', '1', '1', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('3', 'KOMUNITAS', '2', '60', '', '', '', '', '2017-08-29 09:54:21', '50762', '0', '3', '2', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('4', 'DISTANCE LEARNING', '2', '60', '', '', '', '', '2017-08-15 11:05:58', '22483', '0', '3', '1', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('5', 'KOMUNITAS', '3', '60', '', '', '', '', '2017-08-29 09:54:21', '25661', '0', '2', '2', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('6', 'DISTANCE LEARNING', '3', '60', '', '', '', '', '2017-08-15 11:05:58', '60854', '0', '2', '1', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('7', 'KOMUNITAS', '4', '60', '', '', '', '', '2017-08-29 09:54:21', '30698', '0', '4', '2', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('8', 'DISTANCE LEARNING', '4', '60', '', '', '', '', '2017-08-15 11:05:58', '36459', '0', '4', '1', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('9', 'KOMUNITAS', '5', '60', '', '', '', '', '2017-08-29 09:54:21', '24669', '0', '1', '4', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('10', 'DISTANCE LEARNING', '5', '60', '', '', '', '', '2017-08-15 11:05:58', '13966', '0', '1', '3', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('11', 'KOMUNITAS', '6', '60', '', '', '', '', '2017-08-29 09:54:21', '61355', '0', '3', '4', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('12', 'DISTANCE LEARNING', '6', '60', '', '', '', '', '2017-08-15 11:05:58', '2757', '0', '3', '3', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('13', 'KOMUNITAS', '7', '60', '', '', '', '', '2017-08-29 09:54:21', '26310', '0', '2', '4', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('14', 'DISTANCE LEARNING', '7', '60', '', '', '', '', '2017-08-15 11:05:58', '57747', '0', '2', '3', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('15', 'KOMUNITAS', '8', '60', '', '', '', '', '2017-08-29 09:54:21', '13216', '0', '4', '4', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('16', 'DISTANCE LEARNING', '8', '60', '', '', '', '', '2017-08-15 11:05:58', '23899', '0', '4', '3', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('17', 'KOMUNITAS', '9', '60', '', '', '', '', '2017-08-29 09:54:21', '14317', '0', '1', '6', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('18', 'DISTANCE LEARNING', '9', '60', '', '', '', '', '2017-08-15 11:05:58', '65416', '0', '1', '5', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('19', 'KOMUNITAS', '10', '60', '', '', '', '', '2017-08-29 09:54:21', '22010', '0', '3', '6', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('20', 'DISTANCE LEARNING', '10', '60', '', '', '', '', '2017-08-15 11:05:58', '44862', '0', '3', '5', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('21', 'KOMUNITAS', '11', '60', '', '', '', '', '2017-08-29 09:54:21', '27217', '0', '2', '6', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('22', 'DISTANCE LEARNING', '11', '60', '', '', '', '', '2017-08-15 11:05:58', '1500', '0', '2', '5', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('23', 'KOMUNITAS', '12', '60', '', '', '', '', '2017-08-29 09:54:21', '56909', '0', '4', '6', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('24', 'DISTANCE LEARNING', '12', '60', '', '', '', '', '2017-08-15 11:05:58', '17925', '0', '4', '5', '1', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('25', 'KELAS KHUSUS', '9', '10', '', null, null, null, '2017-08-15 11:11:06', '58397', '0', '', '13', '0', null,
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('27', 'REMEDIAL AKADEMIK', '9', '10', '', null, null, null, '2017-08-15 11:19:55', '4414', '0', '', '21', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('28', 'REMEDIAL AKADEMIK', '10', '10', '', null, null, null, '2017-08-15 11:19:37', '59349', '0', '', '21', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('29', 'REMEDIAL AKADEMIK', '11', '10', '', null, null, null, '2017-08-15 11:19:39', '21384', '0', '', '21', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('30', 'REMEDIAL AKADEMIK', '12', '10', '', null, null, null, '2017-08-15 11:19:40', '59930', '0', '', '21', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('31', '<i>DEVELOPMENTAL CLASS</i>', '9', '10', '', null, null, null, '2020-07-09 13:10:58', '38908', '0', '',
        '22', '0', null, null, null, '2020-07-09 13:10:58', '31');
INSERT INTO `kelompokcalonsiswa`
VALUES ('32', '<i>DEVELOPMENTAL CLASS</i>', '10', '10', '', null, null, null, '2020-07-09 13:11:16', '14750', '0', '',
        '22', '0', null, null, null, '2020-07-09 13:11:16', '31');
INSERT INTO `kelompokcalonsiswa`
VALUES ('33', '<i>DEVELOPMENTAL CLASS</i>', '11', '10', '', null, null, null, '2020-07-09 13:11:36', '22555', '0', '',
        '22', '0', null, null, null, '2020-07-09 13:11:36', '31');
INSERT INTO `kelompokcalonsiswa`
VALUES ('34', '<i>DEVELOPMENTAL CLASS</i>', '12', '10', '', null, null, null, '2020-07-09 13:11:42', '2995', '0', '',
        '22', '0', null, null, null, '2020-07-09 13:11:42', '31');
INSERT INTO `kelompokcalonsiswa`
VALUES ('35', '<i>DEVELOPMENTAL CLASS</i>', '13', '0', '', null, null, null, '2020-07-20 11:03:37', '64351', '0', '',
        '25', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('36', '<i>DEVELOPMENTAL CLASS</i>', '14', '0', '', null, null, null, '2020-07-20 11:03:37', '7239', '0', '',
        '25', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('37', '<i>DEVELOPMENTAL CLASS</i>', '15', '0', '', null, null, null, '2020-07-20 11:03:38', '42880', '0', '',
        '25', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('38', '<i>DEVELOPMENTAL CLASS</i>', '16', '0', '', null, null, null, '2020-07-20 11:03:38', '61623', '0', '',
        '25', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('39', 'DISTANCE LEARNING TUNGGAL', '9', '0', null, '', null, null, '2020-07-20 11:03:15', '6181', '0', '', '26',
        '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('40', 'DISTANCE LEARNING TUNGGAL', '10', '0', null, '', null, null, '2020-07-20 11:03:15', '8253', '0', '',
        '26', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('41', 'DISTANCE LEARNING TUNGGAL', '11', '0', null, '', null, null, '2020-07-20 11:03:15', '22722', '0', '',
        '26', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('42', 'DISTANCE LEARNING TUNGGAL', '12', '0', null, '', null, null, '2020-07-20 11:03:15', '23320', '0', '',
        '26', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('46', 'DISTANCE LEARNING TUNGGAL', '1', '0', null, null, null, null, '2020-07-20 11:03:15', '48435', '0', '',
        '27', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('47', 'DISTANCE LEARNING TUNGGAL', '2', '0', null, null, null, null, '2020-07-20 11:03:15', '41152', '0', '',
        '27', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('48', 'DISTANCE LEARNING TUNGGAL', '3', '0', null, null, null, null, '2020-07-20 11:03:15', '60454', '0', '',
        '27', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('49', 'DISTANCE LEARNING TUNGGAL', '4', '0', null, null, null, null, '2020-07-20 11:03:15', '47755', '0', '',
        '27', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('53', 'DISTANCE LEARNING TUNGGAL', '5', '0', null, null, null, null, '2020-07-20 11:03:15', '57414', '0', '',
        '28', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('54', 'DISTANCE LEARNING TUNGGAL', '6', '0', null, null, null, null, '2020-07-20 11:03:15', '12744', '0', '',
        '28', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('55', 'DISTANCE LEARNING TUNGGAL', '7', '0', null, null, null, null, '2020-07-20 11:03:15', '22538', '0', '',
        '28', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('56', 'DISTANCE LEARNING TUNGGAL', '8', '0', null, null, null, null, '2020-07-20 11:03:10', '8928', '0', '',
        '28', '1', '14', null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('57', 'KOMUNITAS ONLINE', '9', '0', null, null, null, null, '2020-07-20 11:03:04', '522', '0', '', '29', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('58', 'KOMUNITAS ONLINE', '10', '0', null, null, null, null, '2020-07-20 11:03:04', '28766', '0', '', '29', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('59', 'KOMUNITAS ONLINE', '11', '0', null, null, null, null, '2020-07-20 11:03:04', '13078', '0', '', '29', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('60', 'KOMUNITAS ONLINE', '12', '0', null, null, null, null, '2020-07-20 11:03:04', '44622', '0', '', '29', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('61', 'KOMUNITAS ONLINE', '5', '0', null, null, null, null, '2020-07-20 11:03:04', '52814', '0', '', '30', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('62', 'KOMUNITAS ONLINE', '6', '0', null, null, null, null, '2020-07-20 11:03:04', '64674', '0', '', '30', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('63', 'KOMUNITAS ONLINE', '7', '0', null, null, null, null, '2020-07-20 11:03:04', '33868', '0', '', '30', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('64', 'KOMUNITAS ONLINE', '8', '0', null, null, null, null, '2020-07-20 11:03:04', '40849', '0', '', '30', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('65', 'KOMUNITAS ONLINE', '1', '0', null, null, null, null, '2020-07-20 11:03:04', '37111', '0', '', '31', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('66', 'KOMUNITAS ONLINE', '2', '0', null, null, null, null, '2020-07-20 11:03:04', '63006', '0', '', '31', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('67', 'KOMUNITAS ONLINE', '3', '0', null, null, null, null, '2020-07-20 11:03:04', '7106', '0', '', '31', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('68', 'KOMUNITAS ONLINE', '4', '0', null, null, null, null, '2020-07-20 11:03:01', '43100', '0', '', '31', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('69', 'REMEDIAL AKADEMIK', '5', '10', '', null, null, null, '2021-12-02 10:59:46', '1336', '0', '', '34', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('70', 'REMEDIAL AKADEMIK', '6', '10', '', null, null, null, '2021-12-02 10:59:46', '22459', '0', '', '34', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('71', 'REMEDIAL AKADEMIK', '7', '10', '', null, null, null, '2021-12-02 10:59:46', '42759', '0', '', '34', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('72', 'REMEDIAL AKADEMIK', '8', '10', '', null, null, null, '2021-12-02 10:59:46', '15359', '0', '', '34', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('73', 'REMEDIAL AKADEMIK', '1', '10', '', null, null, null, '2021-12-02 11:00:04', '14044', '0', '', '35', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('74', 'REMEDIAL AKADEMIK', '3', '10', '', null, null, null, '2021-12-02 11:00:04', '24145', '0', '', '35', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('75', 'REMEDIAL AKADEMIK', '2', '10', '', null, null, null, '2021-12-02 11:00:04', '13062', '0', '', '35', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('76', 'REMEDIAL AKADEMIK', '4', '10', '', null, null, null, '2021-12-02 11:00:04', '58404', '0', '', '35', '1',
        null, null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('77', 'REGULER', '10', '60', '', '', '', '', '2022-01-11 11:34:48', '63754', '0', '3', '36', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('78', 'REGULER', '11', '60', '', '', '', '', '2022-01-11 11:34:48', '54318', '0', '2', '36', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('79', 'REGULER', '12', '60', '', '', '', '', '2022-01-11 11:34:48', '14800', '0', '4', '36', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('80', 'REGULER', '9', '60', '', '', '', '', '2022-01-11 11:34:45', '42107', '0', '1', '36', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('81', 'INKLUSI', '9', '60', '', '', '', '', '2017-08-29 09:54:21', '35073', '0', '1', '37', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('82', 'INKLUSI', '10', '60', '', '', '', '', '2017-08-29 09:54:21', '49041', '0', '3', '37', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('83', 'INKLUSI', '11', '60', '', '', '', '', '2017-08-29 09:54:21', '8929', '0', '2', '37', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('84', 'INKLUSI', '12', '60', '', '', '', '', '2017-08-29 09:54:21', '28581', '0', '4', '37', '1', '14', null,
        null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('85', 'KELAS KOMUNITAS', '2', '38', '', '', '', '', '2022-05-31 14:07:49', '30665', '0', '3', '38', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('86', 'KELAS KOMUNITAS', '3', '38', '', '', '', '', '2022-05-31 14:07:49', '6741', '0', '2', '38', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('87', 'KELAS KOMUNITAS', '4', '38', '', '', '', '', '2022-05-31 14:07:49', '7241', '0', '4', '38', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('88', 'KELAS KOMUNITAS', '1', '38', '', '', '', '', '2022-05-31 14:07:49', '15982', '0', '1', '38', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('89', 'KELAS KOMUNITAS', '5', '39', '', '', '', '', '2022-05-31 14:07:49', '58186', '0', '1', '39', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('90', 'KELAS KOMUNITAS', '6', '39', '', '', '', '', '2022-05-31 14:07:49', '46391', '0', '3', '39', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('91', 'KELAS KOMUNITAS', '7', '39', '', '', '', '', '2022-05-31 14:07:49', '57398', '0', '2', '39', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('92', 'KELAS KOMUNITAS', '8', '39', '', '', '', '', '2022-05-31 14:07:49', '16757', '0', '4', '39', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('93', 'KELAS KOMUNITAS', '9', '40', '', '', '', '', '2022-05-31 14:07:49', '42649', '0', '1', '40', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('94', 'KELAS KOMUNITAS', '10', '40', '', '', '', '', '2022-05-31 14:07:49', '31914', '0', '3', '40', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('95', 'KELAS KOMUNITAS', '11', '40', '', '', '', '', '2022-05-31 14:07:49', '31624', '0', '2', '40', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('96', 'KELAS KOMUNITAS', '12', '40', '', '', '', '', '2022-05-31 14:07:49', '62378', '0', '4', '40', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('97', 'INKLUSI', '5', '40', null, null, null, null, '2022-06-22 08:53:47', '62353', '0', '1', '41', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('98', 'INKLUSI', '6', '40', null, null, null, null, '2022-06-22 08:53:48', '63235', '0', '2', '41', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('99', 'INKLUSI', '7', '40', null, null, null, null, '2022-06-22 08:53:48', '63589', '0', '3', '41', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('100', 'INKLUSI', '8', '40', null, null, null, null, '2022-06-22 08:53:48', '62707', '0', '4', '41', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('101', 'INKLUSI', '1', '40', null, null, null, null, '2022-06-22 08:54:44', '57237', '0', '1', '42', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('102', 'INKLUSI', '2', '40', null, null, null, null, '2022-06-22 08:54:44', '32533', '0', '2', '42', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('103', 'INKLUSI', '3', '40', null, null, null, null, '2022-06-22 08:54:44', '56485', '0', '3', '42', '1', '14',
        null, null, null, null);
INSERT INTO `kelompokcalonsiswa`
VALUES ('104', 'INKLUSI', '4', '40', null, null, null, null, '2022-06-22 08:54:44', '53763', '0', '4', '42', '1', '14',
        null, null, null, null);

-- ----------------------------
-- Table structure for kelompoksiswa
-- ----------------------------
DROP TABLE IF EXISTS `kelompoksiswa`;
CREATE TABLE `kelompoksiswa`
(
    `replid`               int(10)   NOT NULL AUTO_INCREMENT,
    `kelompok`             varchar(200)                    DEFAULT NULL,
    `departemen`           varchar(10)                     DEFAULT NULL,
    `keterangan`           varchar(200)                    DEFAULT NULL,
    `ts`                   timestamp NULL                  DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `token`                smallint(5) unsigned            DEFAULT '0',
    `issync`               tinyint(1) unsigned             DEFAULT '0',
    `aktif`                int(1)                          DEFAULT NULL,
    `no_urut`              int(11)                         DEFAULT NULL,
    `created_date`         datetime                        DEFAULT NULL,
    `created_by`           varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `modified_date`        datetime                        DEFAULT NULL,
    `modified_by`          varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `syarat_interview`     tinyint(4)                      DEFAULT NULL,
    `syarat_asesmen`       tinyint(4)                      DEFAULT NULL,
    `syarat_placementtest` tinyint(4)                      DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 43
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of kelompoksiswa
-- ----------------------------
INSERT INTO `kelompoksiswa`
VALUES ('1', '<i>Distance Learning</i>', 'SMA', '', '2020-08-26 11:53:41', '0', '0', '1', '5', null, null, null, null,
        null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('2', 'Komunitas', 'SMA', '', '2020-08-26 10:04:07', '0', '0', '1', '1', null, null, null, null, '1', '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('3', '<i>Distance Learning</i>', 'SMP', '', '2020-08-26 11:53:41', '0', '0', '1', '5', null, null, null, null,
        null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('4', 'Komunitas', 'SMP', '', '2020-08-26 10:04:07', '0', '0', '1', '1', null, null, null, null, '1', '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('5', '<i>Distance Learning</i>', 'SD', '', '2020-08-26 11:53:41', '0', '0', '1', '5', null, null, null, null,
        null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('6', 'Komunitas', 'SD', '', '2020-09-09 14:31:13', '0', '0', '1', '1', null, null, null, null, '1', '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('13', 'Kelas Khusus', 'SD', '', '2020-08-26 11:53:41', '0', '0', '0', '7', null, null, null, null, null, '1',
        '1');
INSERT INTO `kelompoksiswa`
VALUES ('16', 'TRP', 'SD', '', '2020-08-26 11:53:41', '0', '0', '0', '3', null, null, null, null, null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('17', 'TRP', 'SMP', '', '2020-08-26 11:53:41', '0', '0', '0', '3', null, null, null, null, null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('18', 'TRP', 'SMA', '', '2020-08-26 11:53:41', '0', '0', '0', '3', null, null, null, null, null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('20', 'DL Khusus', 'SD', '', '2020-08-26 11:53:41', '0', '0', '0', '6', null, null, null, null, null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('21', 'Remedial Akademik', 'SD', '', '2020-08-26 11:53:41', '0', '0', '1', '4', null, null, null, null, null,
        '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('22', '<i>Developmental Class</i>', 'SD', '', '2020-08-26 11:53:41', '0', '0', '0', '2', null, null, null, null,
        null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('25', 'Developmental Class', 'PENSUS', '', '2020-08-26 11:53:41', '0', '0', '1', null, null, null, null, null,
        null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('26', 'Distance Learning Tunggal', 'SD', '', '2020-08-26 11:53:41', '0', '0', '1', '5', '2020-03-19 09:34:33',
        '31', '2020-03-19 09:34:33', '31', null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('27', 'Distance Learning Tunggal', 'SMA', '', '2020-08-26 11:53:41', '0', '0', '1', '5', '2020-03-19 09:34:47',
        '31', '2020-03-19 09:34:47', '31', null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('28', 'Distance Learning Tunggal', 'SMP', '', '2020-08-26 11:53:41', '0', '0', '1', '5', '2020-03-19 09:35:00',
        '31', '2020-03-19 09:35:00', '31', null, '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('29', 'Komunitas Online', 'SD', null, '2020-08-26 10:04:41', '0', '0', '1', null, null, null, null, null, '1',
        '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('30', 'Komunitas Online', 'SMP', null, '2020-08-26 10:04:42', '0', '0', '1', null, null, null, null, null, '1',
        '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('31', 'Komunitas Online', 'SMA', null, '2020-08-26 10:04:42', '0', '0', '1', null, null, null, null, null, '1',
        '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('34', 'Remedial Akademik', 'SMP', '', '2020-08-26 11:53:41', '0', '0', '1', '4', null, null, null, null, null,
        '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('35', 'Remedial Akademik', 'SMA', '', '2020-08-26 11:53:41', '0', '0', '1', '4', null, null, null, null, null,
        '1', '1');
INSERT INTO `kelompoksiswa`
VALUES ('36', 'Reguler', 'SD', '', '2020-09-09 14:31:13', '0', '0', '1', '1', null, null, null, null, '1', '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('37', 'Inklusi', 'SD', '', '2020-09-09 14:31:13', '0', '0', '1', '1', null, null, null, null, '1', '1', null);
INSERT INTO `kelompoksiswa`
VALUES ('38', 'Kelas Komunitas', 'SD', null, '2022-04-14 13:38:00', '0', '0', '1', '1', null, null, null, null, '0',
        '0', '0');
INSERT INTO `kelompoksiswa`
VALUES ('39', 'Kelas Komunitas', 'SMP', null, '2022-04-14 13:38:12', '0', '0', '1', '1', null, null, null, null, '0',
        '0', '0');
INSERT INTO `kelompoksiswa`
VALUES ('40', 'Kelas Komunitas', 'SMA', null, '2022-04-14 13:38:14', '0', '0', '1', '1', null, null, null, null, '0',
        '0', '0');
INSERT INTO `kelompoksiswa`
VALUES ('41', 'Inklusi', 'SMP', null, '2022-06-22 08:49:24', '0', '0', '1', null, null, null, null, null, '0', '1',
        '1');
INSERT INTO `kelompoksiswa`
VALUES ('42', 'Inklusi', 'SMA', null, '2022-06-22 08:49:07', '0', '0', '1', null, null, null, null, null, '0', '1',
        '1');

-- ----------------------------
-- Table structure for kota
-- ----------------------------
DROP TABLE IF EXISTS `kota`;
CREATE TABLE `kota`
(
    `replid`        int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `kota`          varchar(100)         NOT NULL,
    `id_propinsi`   int(11)                       DEFAULT NULL,
    `urutan`        tinyint(2) unsigned  NOT NULL,
    `info1`         varchar(255)                  DEFAULT NULL,
    `info2`         varchar(255)                  DEFAULT NULL,
    `info3`         varchar(255)                  DEFAULT NULL,
    `ts`            timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`         smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`        tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `aktif`         tinyint(4)                    DEFAULT NULL,
    `created_date`  datetime                      DEFAULT NULL,
    `created_by`    varchar(200)                  DEFAULT NULL,
    `modified_date` datetime                      DEFAULT NULL,
    `modified_by`   varchar(200)                  DEFAULT NULL,
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_kota` (`replid`) USING BTREE,
    KEY `IX_kota_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 634
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of kota
-- ----------------------------
INSERT INTO `kota`
VALUES ('1', 'Bogor', '12', '0', null, null, null, '2013-01-09 04:38:22', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('2', 'TANGERANG', '14', '1', null, null, null, '2013-01-09 04:44:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('3', 'TANGERANG SELATAN', '14', '2', null, null, null, '2013-07-25 11:19:52', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('4', 'JAKARTA PUSAT', '11', '3', null, null, null, '2013-07-25 11:20:34', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('5', 'JAKARTA BARAT', '11', '4', null, null, null, '2013-07-25 11:20:59', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('6', 'JAKARTA  SELATAN', '11', '5', null, null, null, '2013-07-25 11:21:13', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('7', 'JAKARTA TIMUR', '11', '6', null, null, null, '2013-07-25 11:21:21', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('8', 'JAKARTA UTARA', '11', '7', null, null, null, '2013-07-25 11:21:38', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('9', 'Palangka Raya', '21', '8', null, null, null, '2013-07-25 11:23:28', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('10', 'Medan', '2', '9', null, null, null, '2013-07-25 11:24:20', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('11', 'Serang', '14', '10', null, null, null, '2013-07-25 11:30:20', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('12', 'Cilegon', '14', '11', null, null, null, '2013-07-25 11:30:35', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('13', 'Sharjah', '34', '1', null, null, null, '2013-07-25 11:33:15', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('14', 'Bekasi', '12', '12', null, null, null, '2013-07-25 11:54:10', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('15', 'Depok', '12', '13', null, null, null, '2013-07-25 11:55:26', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('16', 'Karawang', '12', '14', null, null, null, '2013-07-25 11:57:14', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('18', 'Pangkajene Sidrap', null, '20', null, null, null, '2013-09-04 14:31:20', '0', '0', null, null, null,
        null, null);
INSERT INTO `kota`
VALUES ('21', 'Bandung', '12', '27', null, null, null, '2013-09-05 16:09:29', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('23', 'Purworejo', null, '0', null, null, null, '2013-09-23 16:23:40', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('24', 'China', null, '0', null, null, null, '2013-09-24 10:30:58', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('25', 'Kuala Lumpur', null, '0', null, null, null, '2013-09-24 11:08:09', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('28', 'SURABAYA', '15', '0', null, null, null, '2013-09-26 11:08:59', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('29', 'BANJAR BARU', '22', '0', null, null, null, '2013-09-30 13:23:33', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('30', 'PALEMBANG', '6', '0', null, null, null, '2013-10-01 09:39:04', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('31', 'SOLO', null, '0', null, null, null, '2013-10-01 09:42:54', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('33', 'MARTAPURA', null, '0', null, null, null, '2013-10-01 15:47:20', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('34', 'Sukabumi', '12', '0', null, null, null, '2013-10-02 11:48:37', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('35', 'MINAHASA', null, '0', null, null, null, '2013-10-02 14:38:26', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('36', 'Ruwais', null, '0', null, null, null, '2013-10-02 14:40:28', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('38', 'PADANG', '3', '0', null, null, null, '2013-10-02 15:25:27', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('39', 'JUBAIL CITY', null, '0', null, null, null, '2013-10-02 15:47:08', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('40', 'JEPARA', null, '0', null, null, null, '2013-10-02 16:10:41', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('41', 'BANJARMASIN', '22', '0', null, null, null, '2013-10-03 14:55:26', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('42', 'Banjar', '12', '0', null, null, null, '2013-10-04 10:29:12', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('43', 'Luang Prabang', null, '0', null, null, null, '2013-10-04 11:45:44', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('44', 'ABU DHABI', '62', '0', null, null, null, '2013-10-04 13:29:28', '0', '0', '0', null, null, null, null);
INSERT INTO `kota`
VALUES ('45', 'NARITA', null, '0', null, null, null, '2013-10-04 13:32:11', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('46', 'MADRID', null, '0', null, null, null, '2013-10-04 13:36:24', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('47', 'PARIS', null, '0', null, null, null, '2013-10-04 13:38:02', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('48', 'AICHI', null, '0', null, null, null, '2013-10-08 13:35:03', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('49', 'Denhaag', null, '0', null, null, null, '2013-10-09 09:08:10', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('50', 'BALIKPAPAN', '23', '0', null, null, null, '2013-10-16 11:06:41', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('51', 'TARAKAN', '46', '0', null, null, null, '2013-10-16 13:43:04', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('52', 'DENPASAR', '17', '0', null, null, null, '2013-10-17 09:48:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('53', 'SAMARINDA', '23', '0', null, null, null, '2013-10-18 14:18:23', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('55', 'MANADO', '24', '0', null, null, null, '2013-11-08 15:45:32', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('56', 'Bandar Lampung', '8', '0', null, null, null, '2013-11-12 13:52:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('57', 'BANDA ACEH', '42', '0', null, null, null, '2013-11-12 14:40:08', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('58', 'Metro', '8', '0', null, null, null, '2013-11-12 16:13:28', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('61', 'LAMPUNG', null, '0', null, null, null, '2013-11-25 13:54:07', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('62', 'CHIBA-JAPAN', null, '0', null, null, null, '2013-12-02 16:34:30', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('64', 'GUANG-ZHOU', null, '0', null, null, null, '2014-02-10 10:15:51', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('66', 'LEBAK', null, '0', null, null, null, '2014-02-19 13:41:34', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('67', 'SLEMAN', null, '0', null, null, null, '2014-02-19 13:52:03', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('69', 'SAMOSIR', null, '0', null, null, null, '2014-03-17 11:41:47', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('71', 'Sydney', null, '0', null, null, null, '2014-03-20 09:03:57', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('73', 'NGAWI', null, '0', null, null, null, '2014-05-21 13:44:27', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('74', 'DOHA', null, '0', null, null, null, '2014-06-12 15:29:50', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('76', 'SEMARANG', '13', '0', null, null, null, '2014-06-23 15:37:27', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('77', 'TUGARA', null, '0', null, null, null, '2014-07-10 10:26:50', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('78', 'NEGARA', null, '0', null, null, null, '2014-07-10 10:36:48', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('80', 'UBE-SHI', null, '0', null, null, null, '2014-09-03 10:16:49', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('82', 'SORONG', '33', '0', null, null, null, '2014-09-09 10:08:27', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('83', 'CAUSEWAY BAY', null, '0', null, null, null, '2014-09-11 11:53:04', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('84', 'MINAHASA UTARA', null, '0', null, null, null, '2014-09-17 14:08:52', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('85', 'NARITA CITY', null, '0', null, null, null, '2014-09-18 15:03:35', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('89', 'NEW DELHI', null, '0', null, null, null, '2014-10-27 15:15:24', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('90', 'Tasikmalaya', '12', '0', null, null, null, '2014-10-30 09:55:07', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('91', 'PROBOLINGGO', '15', '0', null, null, null, '2014-10-30 15:54:54', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('92', 'TAIPEI', null, '0', null, null, null, '2014-12-16 16:30:35', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('93', 'PONTIANAK', '20', '0', null, null, null, '2015-01-14 09:23:06', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('94', 'AL-RUWAIS', null, '0', null, null, null, '2015-01-16 15:44:08', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('96', 'Pekanbaru', '4', '0', null, null, null, '2015-02-11 13:39:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('98', 'PASURUAN', '15', '0', null, null, null, '2015-03-09 10:55:03', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('99', 'TANJUNG SELOR-BULUNGAN', null, '0', null, null, null, '2015-07-29 09:53:58', '0', '0', null, null, null,
        null, null);
INSERT INTO `kota`
VALUES ('101', 'MADIUN', '15', '0', null, null, null, '2015-09-01 12:12:36', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('102', 'TANJUNG PANDAN', null, '0', null, null, null, '2015-12-02 14:09:07', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('103', 'NUSA DUA', null, '0', null, null, null, '2016-01-12 15:31:10', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('104', 'PEKALONGAN', '13', '0', null, null, null, '2016-01-25 16:11:34', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('105', 'BATAM', '10', '0', null, null, null, '2016-01-27 09:30:50', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('106', 'ABQAIQ', '34', '0', null, null, null, '2016-02-04 14:36:21', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('107', 'SINGKAWANG', '20', '0', null, null, null, '2016-02-11 08:43:34', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('108', 'MALANG', '15', '0', null, null, null, '2016-03-02 09:17:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('112', 'LUMAJANG', null, '0', null, null, null, '2016-08-02 10:26:03', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('114', 'WAY HALIM', null, '0', null, null, null, '2016-08-08 09:05:35', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('115', 'SOEST', null, '0', null, null, null, '2016-08-12 10:46:06', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('116', 'GORONTALO', '28', '0', null, null, null, '2016-10-17 10:12:35', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('117', 'Yogyakarta', '16', '0', null, null, null, '2016-10-22 16:32:11', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('118', 'BENGKULU', '7', '0', null, null, null, '2016-10-26 15:26:39', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('119', 'KAIRO', null, '0', null, null, null, '2017-03-07 12:27:17', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('120', 'KARACHI', null, '0', null, null, null, '2017-03-15 16:00:35', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('121', 'SIDOARJO', null, '0', null, null, null, '2017-07-27 09:35:59', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('122', 'SUNGAI LIAT', null, '0', null, null, null, '2017-08-31 09:08:24', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('123', 'PAYAKUMBUH', '3', '0', null, null, null, '2017-09-12 15:27:06', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('124', 'TEGAL', '13', '0', null, null, null, '2017-10-10 08:53:13', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('125', 'AMSTERDAM', null, '0', null, null, null, '2017-11-23 15:03:16', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('127', 'LONDON', null, '0', null, null, null, '2018-01-30 04:42:54', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('128', 'Kabupaten Bekasi', '14', '0', null, null, null, '2018-03-06 09:39:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('129', 'AMBON', '30', '0', null, null, null, '2018-06-26 10:14:59', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('131', 'SILLA', null, '0', null, null, null, '2018-07-14 14:13:41', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('132', 'CANBERRA', null, '0', null, null, null, '2018-07-23 10:36:42', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('134', 'AD DAHRAAN', null, '0', null, null, null, '2018-08-09 09:27:47', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('136', 'Kabupaten Wonosobo', '13', '0', null, null, null, '2018-09-04 09:10:01', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('137', 'NGAGLIK', null, '0', null, null, null, '2018-10-25 14:44:21', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('138', 'KOLAKA', null, '0', null, null, null, '2018-12-20 08:43:03', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('139', 'MAGETAN', null, '0', null, null, null, '2019-01-11 11:37:03', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('140', 'MAKASSAR', '26', '0', null, null, null, '2019-03-14 10:01:07', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('142', 'KREO', null, '0', null, null, null, '2019-05-27 00:03:17', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('143', 'FUKUOKA', null, '0', null, null, null, '2019-06-20 12:03:58', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('144', 'KABANJAHE', null, '0', null, null, null, '2019-06-24 15:58:07', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('145', 'AL-MANGAF', null, '0', null, null, null, '2019-06-26 08:39:39', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('146', 'FUKUOKA-SHI', null, '0', null, null, null, '2019-06-26 08:56:25', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('147', 'PASANGKAYU', null, '0', null, null, null, '2019-07-04 15:04:28', '0', '0', null, null, null, null,
        null);
INSERT INTO `kota`
VALUES ('148', 'KARO', null, '0', null, null, null, '2019-07-15 11:17:55', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('149', 'LIMA', null, '0', null, null, null, '2019-07-19 13:38:59', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('150', 'MUNA', null, '0', null, null, null, '2019-07-23 09:06:19', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('151', 'Tasik', null, '0', null, null, null, '2020-02-17 16:22:02', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('152', 'Bangkok', null, '0', null, null, null, '2020-07-08 12:43:55', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('153', 'Langsa', '42', '0', null, null, null, '2020-07-08 11:53:41', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('154', 'Lhokseumawe', '42', '0', null, null, null, '2020-07-08 11:53:41', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('155', 'Meulaboh', '42', '0', null, null, null, '2020-07-08 11:53:42', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('156', 'Sabang', '42', '0', null, null, null, '2020-07-08 11:53:42', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('157', 'Subulussalam', '42', '0', null, null, null, '2020-07-08 11:53:42', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('158', 'Pangkalpinang', '9', '0', null, null, null, '2020-07-08 11:53:42', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('164', 'Sungai Penuh', '5', '0', null, null, null, '2020-07-08 11:53:43', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('165', 'Kota Jambi', '5', '0', null, null, null, '2020-07-08 11:53:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('166', 'Cimahi', '12', '0', null, null, null, '2020-07-08 11:53:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('167', 'Cirebon', '12', '0', null, null, null, '2020-07-08 11:53:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('168', 'Magelang', '13', '0', null, null, null, '2020-07-08 11:53:43', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('169', 'Purwokerto', '13', '0', null, null, null, '2020-07-08 11:53:44', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('170', 'Salatiga', '13', '0', null, null, null, '2020-07-08 11:53:44', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('171', 'Surakarta', '13', '0', null, null, null, '2020-07-08 11:53:44', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('172', 'Batu', '15', '0', null, null, null, '2020-07-08 11:53:44', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('173', 'Blitar', '15', '0', null, null, null, '2020-07-08 11:53:45', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('174', 'Kediri', '15', '0', null, null, null, '2020-07-08 11:53:45', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('175', 'Mojokerto', '15', '0', null, null, null, '2020-07-08 11:53:45', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('176', 'Palangkaraya', '21', '0', null, null, null, '2020-07-08 11:53:45', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('177', 'Bontang', '23', '0', null, null, null, '2020-07-08 11:53:45', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('178', 'Tanjungpinang', '10', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('179', 'Ternate', '31', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('180', 'Tidore Kepulauan', '31', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('181', 'Tual', '30', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('182', 'Bima', '18', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('183', 'Mataram', '18', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('184', 'Kupang', '19', '0', null, null, null, '2020-07-08 11:53:46', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('185', 'Jayapura', '32', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('186', 'Dumai', '4', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('187', 'Palopo', '26', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('188', 'Parepare', '26', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('189', 'Palu', '25', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('190', 'Bau-Bau', '27', '0', null, null, null, '2020-07-08 11:53:47', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('191', 'Kendari', '27', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('192', 'Bitung', '24', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('193', 'Kotamobagu', '24', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('194', 'Tomohon', '24', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('195', 'Bukittinggi', '3', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('196', 'Padangpanjang', '3', '0', null, null, null, '2020-07-08 11:53:48', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('197', 'Pariaman', '3', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('198', 'Sawahlunto', '3', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('199', 'Solok', '3', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('200', 'Lubuklinggau', '6', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('201', 'Pagaralam', '6', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('202', 'Prabumulih', '6', '0', null, null, null, '2020-07-08 11:53:49', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('203', 'Binjai', '2', '0', null, null, null, '2020-07-08 11:53:50', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('204', 'Padang Sidempuan', '2', '0', null, null, null, '2020-07-08 11:53:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('205', 'Pematangsiantar', '2', '0', null, null, null, '2020-07-08 11:53:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('206', 'Sibolga', '2', '0', null, null, null, '2020-07-08 11:53:51', '0', '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('207', 'Tanjungbalai', '2', '0', null, null, null, '2020-07-08 11:53:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('208', 'Tebingtinggi', '2', '0', null, null, null, '2020-07-08 11:53:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('210', 'Kabupaten Aceh Barat Daya', '42', '0', null, null, null, '2020-07-08 12:48:20', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('211', 'Kabupaten Aceh Barat', '42', '0', null, null, null, '2020-07-08 12:48:20', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('212', 'Kabupaten Aceh Besar', '42', '0', null, null, null, '2020-07-08 12:48:20', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('213', 'Kabupaten Aceh Jaya', '42', '0', null, null, null, '2020-07-08 12:48:20', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('214', 'Kabupaten Aceh Selatan', '42', '0', null, null, null, '2020-07-08 12:48:21', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('215', 'Kabupaten Aceh Singkil', '42', '0', null, null, null, '2020-07-08 12:48:21', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('216', 'Kabupaten Aceh Tamiang', '42', '0', null, null, null, '2020-07-08 12:48:21', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('217', 'Kabupaten Aceh Tengah', '42', '0', null, null, null, '2020-07-08 12:48:21', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('218', 'Kabupaten Aceh Tenggara', '42', '0', null, null, null, '2020-07-08 12:48:21', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('219', 'Kabupaten Aceh Timur', '42', '0', null, null, null, '2020-07-08 12:48:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('220', 'Kabupaten Aceh Utara', '42', '0', null, null, null, '2020-07-08 12:48:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('221', 'Kabupaten Bener Meriah', '42', '0', null, null, null, '2020-07-08 12:48:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('222', 'Kabupaten Bireuen', '42', '0', null, null, null, '2020-07-08 12:48:22', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('223', 'Kabupaten Gayo Lues', '42', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('224', 'Kabupaten Nagan Raya', '42', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('225', 'Kabupaten Pidie Jaya', '42', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('226', 'Kabupaten Pidie', '42', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('227', 'Kabupaten Simeulue', '42', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('228', 'Kabupaten Badung', '17', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('229', 'Kabupaten Bangli', '17', '0', null, null, null, '2020-07-08 12:48:23', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('230', 'Kabupaten Buleleng', '17', '0', null, null, null, '2020-07-08 12:48:24', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('231', 'Kabupaten Gianyar', '17', '0', null, null, null, '2020-07-08 12:48:24', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('232', 'Kabupaten Jembrana', '17', '0', null, null, null, '2020-07-08 12:48:24', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('233', 'Kabupaten Karangasem', '17', '0', null, null, null, '2020-07-08 12:48:24', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('234', 'Kabupaten Klungkung', '17', '0', null, null, null, '2020-07-08 12:48:24', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('235', 'Kabupaten Tabanan', '17', '0', null, null, null, '2020-07-08 12:48:25', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('236', 'Kabupaten Lebak', '14', '0', null, null, null, '2020-07-08 12:48:25', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('237', 'Kabupaten Pandeglang', '14', '0', null, null, null, '2020-07-08 12:48:25', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('238', 'Kabupaten Serang', '14', '0', null, null, null, '2020-07-08 12:48:25', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('239', 'Kabupaten Tangerang', '14', '0', null, null, null, '2020-07-08 12:48:25', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('240', 'Kabupaten Bengkulu Selatan', '7', '0', null, null, null, '2020-07-08 12:48:26', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('241', 'Kabupaten Bengkulu Tengah', '7', '0', null, null, null, '2020-07-08 12:48:26', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('242', 'Kabupaten Bengkulu Utara', '7', '0', null, null, null, '2020-07-08 12:48:26', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('243', 'Kabupaten Kaur', '7', '0', null, null, null, '2020-07-08 12:48:27', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('244', 'Kabupaten Kepahiang', '7', '0', null, null, null, '2020-07-08 12:48:27', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('245', 'Kabupaten Lebong', '7', '0', null, null, null, '2020-07-08 12:48:28', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('246', 'Kabupaten Mukomuko', '7', '0', null, null, null, '2020-07-08 12:48:28', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('247', 'Kabupaten Rejang Lebong', '7', '0', null, null, null, '2020-07-08 12:48:28', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('248', 'Kabupaten Seluma', '7', '0', null, null, null, '2020-07-08 12:48:29', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('249', 'Kabupaten Boalemo', '28', '0', null, null, null, '2020-07-08 12:48:30', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('250', 'Kabupaten Bone Bolango', '28', '0', null, null, null, '2020-07-08 12:48:30', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('251', 'Kabupaten Gorontalo Utara', '28', '0', null, null, null, '2020-07-08 12:48:30', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('252', 'Kabupaten Gorontalo', '28', '0', null, null, null, '2020-07-08 12:48:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('253', 'Kabupaten Pohuwato', '28', '0', null, null, null, '2020-07-08 12:48:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('254', 'Kabupaten Administrasi Kepulauan Seribu', '11', '0', null, null, null, '2020-07-08 12:48:31', '0', '0',
        '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('255', 'Kabupaten Batanghari', '5', '0', null, null, null, '2020-07-08 12:48:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('256', 'Kabupaten Bungo', '5', '0', null, null, null, '2020-07-08 12:48:31', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('257', 'Kabupaten Kerinci', '5', '0', null, null, null, '2020-07-08 12:48:31', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('258', 'Kabupaten Merangin', '5', '0', null, null, null, '2020-07-08 12:48:32', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('259', 'Kabupaten Muaro Jambi', '5', '0', null, null, null, '2020-07-08 12:48:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('260', 'Kabupaten Sarolangun', '5', '0', null, null, null, '2020-07-08 12:48:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('261', 'Kabupaten Tanjung Jabung Barat', '5', '0', null, null, null, '2020-07-08 12:48:32', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('262', 'Kabupaten Tanjung Jabung Timur', '5', '0', null, null, null, '2020-07-08 12:48:32', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('263', 'Kabupaten Tebo', '5', '0', null, null, null, '2020-07-08 12:48:33', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('264', 'Kabupaten Bandung Barat', '12', '0', null, null, null, '2020-07-08 12:48:33', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('265', 'Kabupaten Bandung', '12', '0', null, null, null, '2020-07-08 12:48:33', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('267', 'Kabupaten Bogor', '12', '0', null, null, null, '2020-07-08 12:48:47', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('268', 'Kabupaten Ciamis', '12', '0', null, null, null, '2020-07-08 12:48:47', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('269', 'Kabupaten Cianjur', '12', '0', null, null, null, '2020-07-08 12:48:47', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('270', 'Kabupaten Cirebon', '12', '0', null, null, null, '2020-07-08 12:48:47', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('271', 'Kabupaten Garut', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('272', 'Kabupaten Indramayu', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('273', 'Kabupaten Karawang', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('274', 'Kabupaten Kuningan', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('275', 'Kabupaten Majalengka', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('276', 'Kabupaten Pangandaran', '12', '0', null, null, null, '2020-07-08 12:48:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('277', 'Kabupaten Purwakarta', '12', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('278', 'Kabupaten Subang', '12', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('279', 'Kabupaten Sukabumi', '12', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('280', 'Kabupaten Sumedang', '12', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('281', 'Kabupaten Tasikmalaya', '12', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('282', 'Kabupaten Banjarnegara', '13', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('283', 'Kabupaten Banyumas', '13', '0', null, null, null, '2020-07-08 12:48:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('284', 'Kabupaten Batang', '13', '0', null, null, null, '2020-07-08 12:48:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('285', 'Kabupaten Blora', '13', '0', null, null, null, '2020-07-08 12:48:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('286', 'Kabupaten Boyolali', '13', '0', null, null, null, '2020-07-08 12:48:50', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('287', 'Kabupaten Brebes', '13', '0', null, null, null, '2020-07-08 12:48:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('288', 'Kabupaten Cilacap', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('289', 'Kabupaten Demak', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('290', 'Kabupaten Grobogan', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('291', 'Kabupaten Jepara', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('292', 'Kabupaten Karanganyar', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('293', 'Kabupaten Kebumen', '13', '0', null, null, null, '2020-07-08 12:48:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('294', 'Kabupaten Kendal', '13', '0', null, null, null, '2020-07-08 12:48:52', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('295', 'Kabupaten Klaten', '13', '0', null, null, null, '2020-07-08 12:48:52', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('296', 'Kabupaten Kudus', '13', '0', null, null, null, '2020-07-08 12:48:53', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('297', 'Kabupaten Magelang', '13', '0', null, null, null, '2020-07-08 12:48:54', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('298', 'Kabupaten Pati', '13', '0', null, null, null, '2020-07-08 12:48:54', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('299', 'Kabupaten Pekalongan', '13', '0', null, null, null, '2020-07-08 12:48:54', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('300', 'Kabupaten Pemalang', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('301', 'Kabupaten Purbalingga', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('302', 'Kabupaten Purworejo', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('303', 'Kabupaten Rembang', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('304', 'Kabupaten Semarang', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('305', 'Kabupaten Sragen', '13', '0', null, null, null, '2020-07-08 12:48:55', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('306', 'Kabupaten Sukoharjo', '13', '0', null, null, null, '2020-07-08 12:48:56', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('307', 'Kabupaten Tegal', '13', '0', null, null, null, '2020-07-08 12:48:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('308', 'Kabupaten Temanggung', '13', '0', null, null, null, '2020-07-08 12:48:56', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('309', 'Kabupaten Wonogiri', '13', '0', null, null, null, '2020-07-08 12:48:56', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('311', 'Kabupaten Bangkalan', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('312', 'Kabupaten Banyuwangi', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('313', 'Kabupaten Blitar', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('314', 'Kabupaten Bojonegoro', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('315', 'Kabupaten Bondowoso', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('316', 'Kabupaten Gresik', '15', '0', null, null, null, '2020-07-08 12:49:04', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('317', 'Kabupaten Jember', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('318', 'Kabupaten Jombang', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('319', 'Kabupaten Kediri', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('320', 'Kabupaten Lamongan', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('321', 'Kabupaten Lumajang', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('322', 'Kabupaten Madiun', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('323', 'Kabupaten Magetan', '15', '0', null, null, null, '2020-07-08 12:49:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('324', 'Kabupaten Malang', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('325', 'Kabupaten Mojokerto', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('326', 'Kabupaten Nganjuk', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('327', 'Kabupaten Ngawi', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('328', 'Kabupaten Pacitan', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('329', 'Kabupaten Pamekasan', '15', '0', null, null, null, '2020-07-08 12:49:06', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('330', 'Kabupaten Pasuruan', '15', '0', null, null, null, '2020-07-08 12:49:07', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('331', 'Kabupaten Ponorogo', '15', '0', null, null, null, '2020-07-08 12:49:07', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('332', 'Kabupaten Probolinggo', '15', '0', null, null, null, '2020-07-08 12:49:07', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('333', 'Kabupaten Sampang', '15', '0', null, null, null, '2020-07-08 12:49:07', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('334', 'Kabupaten Sidoarjo', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('335', 'Kabupaten Situbondo', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('336', 'Kabupaten Sumenep', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('337', 'Kabupaten Trenggalek', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('338', 'Kabupaten Tuban', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('339', 'Kabupaten Tulungagung', '15', '0', null, null, null, '2020-07-08 12:49:08', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('340', 'Kabupaten Bengkayang', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('341', 'Kabupaten Kapuas Hulu', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('342', 'Kabupaten Kayong Utara', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('343', 'Kabupaten Ketapang', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('344', 'Kabupaten Kubu Raya', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('345', 'Kabupaten Landak', '20', '0', null, null, null, '2020-07-08 12:49:09', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('346', 'Kabupaten Melawi', '20', '0', null, null, null, '2020-07-08 12:49:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('347', 'Kabupaten Mempawah', '20', '0', null, null, null, '2020-07-08 12:49:10', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('348', 'Kabupaten Sambas', '20', '0', null, null, null, '2020-07-08 12:49:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('349', 'Kabupaten Sanggau', '20', '0', null, null, null, '2020-07-08 12:49:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('350', 'Kabupaten Sekadau', '20', '0', null, null, null, '2020-07-08 12:49:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('351', 'Kabupaten Sintang', '20', '0', null, null, null, '2020-07-08 12:49:11', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('352', 'Kabupaten Balangan', '22', '0', null, null, null, '2020-07-08 12:49:11', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('353', 'Kabupaten Banjar', '22', '0', null, null, null, '2020-07-08 12:49:11', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('354', 'Kabupaten Barito Kuala', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('355', 'Kabupaten Hulu Sungai Selatan', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('356', 'Kabupaten Hulu Sungai Tengah', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('357', 'Kabupaten Hulu Sungai Utara', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('358', 'Kabupaten Kotabaru', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('359', 'Kabupaten Tabalong', '22', '0', null, null, null, '2020-07-08 12:49:12', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('360', 'Kabupaten Tanah Bumbu', '22', '0', null, null, null, '2020-07-08 12:49:13', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('361', 'Kabupaten Tanah Laut', '22', '0', null, null, null, '2020-07-08 12:49:13', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('362', 'Kabupaten Tapin', '22', '0', null, null, null, '2020-07-08 12:49:13', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('363', 'Kabupaten Barito Selatan', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('364', 'Kabupaten Barito Timur', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('365', 'Kabupaten Barito Utara', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('366', 'Kabupaten Gunung Mas', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('367', 'Kabupaten Kapuas', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('368', 'Kabupaten Katingan', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('369', 'Kabupaten Kotawaringin Barat', '21', '0', null, null, null, '2020-07-08 12:49:14', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('370', 'Kabupaten Kotawaringin Timur', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('371', 'Kabupaten Lamandau', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('372', 'Kabupaten Murung Raya', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('373', 'Kabupaten Pulang Pisau', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('374', 'Kabupaten Seruyan', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('375', 'Kabupaten Sukamara', '21', '0', null, null, null, '2020-07-08 12:49:15', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('376', 'Kabupaten Berau', '23', '0', null, null, null, '2020-07-08 12:49:16', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('377', 'Kabupaten Kutai Barat', '23', '0', null, null, null, '2020-07-08 12:49:16', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('378', 'Kabupaten Kutai Kartanegara', '23', '0', null, null, null, '2020-07-08 12:49:16', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('379', 'Kabupaten Kutai Timur', '23', '0', null, null, null, '2020-07-08 12:49:17', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('380', 'Kabupaten Mahakam Ulu', '23', '0', null, null, null, '2020-07-08 12:49:17', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('381', 'Kabupaten Paser', '23', '0', null, null, null, '2020-07-08 12:49:18', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('382', 'Kabupaten Penajam Paser Utara', '23', '0', null, null, null, '2020-07-08 12:49:18', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('383', 'Kabupaten Bulungan', '46', '0', null, null, null, '2020-07-08 12:49:20', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('384', 'Kabupaten Malinau', '46', '0', null, null, null, '2020-07-08 12:49:20', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('385', 'Kabupaten Nunukan', '46', '0', null, null, null, '2020-07-08 12:49:21', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('386', 'Kabupaten Tana Tidung', '46', '0', null, null, null, '2020-07-08 12:49:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('387', 'Kabupaten Bangka Barat', '9', '0', null, null, null, '2020-07-08 12:49:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('388', 'Kabupaten Bangka Selatan', '9', '0', null, null, null, '2020-07-08 12:49:22', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('389', 'Kabupaten Bangka Tengah', '9', '0', null, null, null, '2020-07-08 12:49:23', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('390', 'Kabupaten Bangka', '9', '0', null, null, null, '2020-07-08 12:49:25', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('391', 'Kabupaten Belitung Timur', '9', '0', null, null, null, '2020-07-08 12:49:26', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('392', 'Kabupaten Belitung', '9', '0', null, null, null, '2020-07-08 12:49:26', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('393', 'Kabupaten Bintan', '10', '0', null, null, null, '2020-07-08 12:49:27', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('394', 'Kabupaten Karimun', '10', '0', null, null, null, '2020-07-08 12:49:27', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('395', 'Kabupaten Kepulauan Anambas', '10', '0', null, null, null, '2020-07-08 12:49:27', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('396', 'Kabupaten Lingga', '10', '0', null, null, null, '2020-07-08 12:49:28', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('397', 'Kabupaten Natuna', '10', '0', null, null, null, '2020-07-08 12:49:28', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('398', 'Kabupaten Lampung Barat', '8', '0', null, null, null, '2020-07-08 12:49:28', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('399', 'Kabupaten Lampung Selatan', '8', '0', null, null, null, '2020-07-08 12:49:29', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('400', 'Kabupaten Lampung Tengah', '8', '0', null, null, null, '2020-07-08 12:49:30', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('401', 'Kabupaten Lampung Timur', '8', '0', null, null, null, '2020-07-08 12:49:30', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('402', 'Kabupaten Lampung Utara', '8', '0', null, null, null, '2020-07-08 12:49:30', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('403', 'Kabupaten Mesuji', '8', '0', null, null, null, '2020-07-08 12:49:31', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('404', 'Kabupaten Pesawaran', '8', '0', null, null, null, '2020-07-08 12:49:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('405', 'Kabupaten Pesisir Barat', '8', '0', null, null, null, '2020-07-08 12:49:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('406', 'Kabupaten Pringsewu', '8', '0', null, null, null, '2020-07-08 12:49:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('407', 'Kabupaten Tanggamus', '8', '0', null, null, null, '2020-07-08 12:49:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('408', 'Kabupaten Tulang Bawang Barat', '8', '0', null, null, null, '2020-07-08 12:49:32', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('409', 'Kabupaten Tulang Bawang', '8', '0', null, null, null, '2020-07-08 12:49:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('410', 'Kabupaten Way Kanan', '8', '0', null, null, null, '2020-07-08 12:49:33', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('411', 'Kabupaten Buru Selatan', '30', '0', null, null, null, '2020-07-08 12:49:33', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('412', 'Kabupaten Buru', '30', '0', null, null, null, '2020-07-08 12:49:34', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('413', 'Kabupaten Kepulauan Aru', '30', '0', null, null, null, '2020-07-08 12:49:34', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('414', 'Kabupaten Maluku Barat Daya', '30', '0', null, null, null, '2020-07-08 12:49:34', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('415', 'Kabupaten Maluku Tengah', '30', '0', null, null, null, '2020-07-08 12:49:34', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('416', 'Kabupaten Maluku Tenggara Barat', '30', '0', null, null, null, '2020-07-08 12:49:35', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('417', 'Kabupaten Maluku Tenggara', '30', '0', null, null, null, '2020-07-08 12:49:35', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('418', 'Kabupaten Seram Bagian Barat', '30', '0', null, null, null, '2020-07-08 12:49:35', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('419', 'Kabupaten Seram Bagian Timur', '30', '0', null, null, null, '2020-07-08 12:49:35', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('420', 'Kabupaten Halmahera Barat', '31', '0', null, null, null, '2020-07-08 12:49:36', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('421', 'Kabupaten Halmahera Selatan', '31', '0', null, null, null, '2020-07-08 12:49:36', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('422', 'Kabupaten Halmahera Tengah', '31', '0', null, null, null, '2020-07-08 12:49:36', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('423', 'Kabupaten Halmahera Timur', '31', '0', null, null, null, '2020-07-08 12:49:36', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('424', 'Kabupaten Halmahera Utara', '31', '0', null, null, null, '2020-07-08 12:49:37', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('425', 'Kabupaten Kepulauan Sula', '31', '0', null, null, null, '2020-07-08 12:49:37', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('426', 'Kabupaten Pulau Morotai', '31', '0', null, null, null, '2020-07-08 12:49:37', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('427', 'Kabupaten Pulau Taliabu', '31', '0', null, null, null, '2020-07-08 12:49:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('428', 'Kabupaten Bima', '18', '0', null, null, null, '2020-07-08 12:49:38', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('429', 'Kabupaten Dompu', '18', '0', null, null, null, '2020-07-08 12:49:38', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('430', 'Kabupaten Lombok Barat', '18', '0', null, null, null, '2020-07-08 12:49:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('431', 'Kabupaten Lombok Tengah', '18', '0', null, null, null, '2020-07-08 12:49:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('432', 'Kabupaten Lombok Timur', '18', '0', null, null, null, '2020-07-08 12:49:39', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('433', 'Kabupaten Lombok Utara', '18', '0', null, null, null, '2020-07-08 12:49:39', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('434', 'Kabupaten Sumbawa Barat', '18', '0', null, null, null, '2020-07-08 12:49:40', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('435', 'Kabupaten Sumbawa', '18', '0', null, null, null, '2020-07-08 12:49:41', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('436', 'Kabupaten Alor', '19', '0', null, null, null, '2020-07-08 12:49:41', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('437', 'Kabupaten Belu', '19', '0', null, null, null, '2020-07-08 12:49:41', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('438', 'Kabupaten Ende', '19', '0', null, null, null, '2020-07-08 12:49:42', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('439', 'Kabupaten Flores Timur', '19', '0', null, null, null, '2020-07-08 12:49:42', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('440', 'Kabupaten Kupang', '19', '0', null, null, null, '2020-07-08 12:49:43', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('441', 'Kabupaten Lembata', '19', '0', null, null, null, '2020-07-08 12:49:43', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('442', 'Kabupaten Malaka', '19', '0', null, null, null, '2020-07-08 12:49:43', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('443', 'Kabupaten Manggarai Barat', '19', '0', null, null, null, '2020-07-08 12:49:44', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('444', 'Kabupaten Manggarai Timur', '19', '0', null, null, null, '2020-07-08 12:49:44', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('445', 'Kabupaten Manggarai', '19', '0', null, null, null, '2020-07-08 12:49:44', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('446', 'Kabupaten Nagekeo', '19', '0', null, null, null, '2020-07-08 12:49:45', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('447', 'Kabupaten Ngada', '19', '0', null, null, null, '2020-07-08 12:49:45', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('448', 'Kabupaten Rote Ndao', '19', '0', null, null, null, '2020-07-08 12:49:45', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('449', 'Kabupaten Sabu Raijua', '19', '0', null, null, null, '2020-07-08 12:49:45', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('450', 'Kabupaten Sikka', '19', '0', null, null, null, '2020-07-08 12:49:46', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('451', 'Kabupaten Sumba Barat Daya', '19', '0', null, null, null, '2020-07-08 12:49:46', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('452', 'Kabupaten Sumba Barat', '19', '0', null, null, null, '2020-07-08 12:49:46', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('453', 'Kabupaten Sumba Tengah', '19', '0', null, null, null, '2020-07-08 12:49:46', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('454', 'Kabupaten Sumba Timur', '19', '0', null, null, null, '2020-07-08 12:49:47', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('455', 'Kabupaten Timor Tengah Selatan', '19', '0', null, null, null, '2020-07-08 12:49:47', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('456', 'Kabupaten Timor Tengah Utara', '19', '0', null, null, null, '2020-07-08 12:49:47', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('457', 'Kabupaten Asmat', '32', '0', null, null, null, '2020-07-08 12:49:47', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('458', 'Kabupaten Biak Numfor', '32', '0', null, null, null, '2020-07-08 12:49:47', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('459', 'Kabupaten Boven Digoel', '32', '0', null, null, null, '2020-07-08 12:49:48', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('460', 'Kabupaten Deiyai', '32', '0', null, null, null, '2020-07-08 12:49:48', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('461', 'Kabupaten Dogiyai', '32', '0', null, null, null, '2020-07-08 12:49:48', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('462', 'Kabupaten Intan Jaya', '32', '0', null, null, null, '2020-07-08 12:49:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('463', 'Kabupaten Jayapura', '32', '0', null, null, null, '2020-07-08 12:49:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('464', 'Kabupaten Jayawijaya', '32', '0', null, null, null, '2020-07-08 12:49:49', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('465', 'Kabupaten Keerom', '32', '0', null, null, null, '2020-07-08 12:49:50', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('466', 'Kabupaten Kepulauan Yapen', '32', '0', null, null, null, '2020-07-08 12:49:50', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('467', 'Kabupaten Lanny Jaya', '32', '0', null, null, null, '2020-07-08 12:49:50', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('468', 'Kabupaten Mamberamo Raya', '32', '0', null, null, null, '2020-07-08 12:49:50', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('469', 'Kabupaten Mamberamo Tengah', '32', '0', null, null, null, '2020-07-08 12:49:51', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('470', 'Kabupaten Mappi', '32', '0', null, null, null, '2020-07-08 12:49:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('471', 'Kabupaten Merauke', '32', '0', null, null, null, '2020-07-08 12:49:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('472', 'Kabupaten Mimika', '32', '0', null, null, null, '2020-07-08 12:49:51', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('473', 'Kabupaten Nabire', '32', '0', null, null, null, '2020-07-08 12:49:52', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('474', 'Kabupaten Nduga', '32', '0', null, null, null, '2020-07-08 12:49:52', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('475', 'Kabupaten Paniai', '32', '0', null, null, null, '2020-07-08 12:49:53', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('476', 'Kabupaten Pegunungan Bintang', '32', '0', null, null, null, '2020-07-08 12:49:53', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('477', 'Kabupaten Puncak Jaya', '32', '0', null, null, null, '2020-07-08 12:49:53', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('478', 'Kabupaten Puncak', '32', '0', null, null, null, '2020-07-08 12:49:54', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('479', 'Kabupaten Sarmi', '32', '0', null, null, null, '2020-07-08 12:49:54', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('480', 'Kabupaten Supiori', '32', '0', null, null, null, '2020-07-08 12:49:54', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('481', 'Kabupaten Tolikara', '32', '0', null, null, null, '2020-07-08 12:49:55', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('482', 'Kabupaten Waropen', '32', '0', null, null, null, '2020-07-08 12:49:55', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('483', 'Kabupaten Yahukimo', '32', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('484', 'Kabupaten Yalimo', '32', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('485', 'Kabupaten Fakfak', '33', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('486', 'Kabupaten Kaimana', '33', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('487', 'Kabupaten Manokwari', '33', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('488', 'Kabupaten Manokwari Selatan', '33', '0', null, null, null, '2020-07-08 12:49:56', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('489', 'Kabupaten Maybrat', '33', '0', null, null, null, '2020-07-08 12:49:57', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('490', 'Kabupaten Pegunungan Arfak', '33', '0', null, null, null, '2020-07-08 12:49:57', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('491', 'Kabupaten Raja Ampat', '33', '0', null, null, null, '2020-07-08 12:49:57', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('492', 'Kabupaten Sorong', '33', '0', null, null, null, '2020-07-08 12:49:57', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('493', 'Kabupaten Sorong Selatan', '33', '0', null, null, null, '2020-07-08 12:49:57', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('494', 'Kabupaten Tambrauw', '33', '0', null, null, null, '2020-07-08 12:49:58', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('495', 'Kabupaten Teluk Bintuni', '33', '0', null, null, null, '2020-07-08 12:49:58', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('496', 'Kabupaten Teluk Wondama', '33', '0', null, null, null, '2020-07-08 12:49:58', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('497', 'Kabupaten Bengkalis', '4', '0', null, null, null, '2020-07-08 12:49:58', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('498', 'Kabupaten Indragiri Hilir', '4', '0', null, null, null, '2020-07-08 12:49:59', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('499', 'Kabupaten Indragiri Hulu', '4', '0', null, null, null, '2020-07-08 12:49:59', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('500', 'Kabupaten Kampar', '4', '0', null, null, null, '2020-07-08 12:49:59', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('501', 'Kabupaten Kepulauan Meranti', '4', '0', null, null, null, '2020-07-08 12:49:59', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('502', 'Kabupaten Kuantan Singingi', '4', '0', null, null, null, '2020-07-08 12:50:00', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('503', 'Kabupaten Pelalawan', '4', '0', null, null, null, '2020-07-08 12:50:00', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('504', 'Kabupaten Rokan Hilir', '4', '0', null, null, null, '2020-07-08 12:50:00', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('505', 'Kabupaten Rokan Hulu', '4', '0', null, null, null, '2020-07-08 12:50:00', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('506', 'Kabupaten Siak', '4', '0', null, null, null, '2020-07-08 12:50:01', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('507', 'Kabupaten Majene', '29', '0', null, null, null, '2020-07-08 12:50:01', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('508', 'Kabupaten Mamasa', '29', '0', null, null, null, '2020-07-08 12:50:02', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('509', 'Kabupaten Mamuju', '29', '0', null, null, null, '2020-07-08 12:50:02', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('510', 'Kabupaten Mamuju Tengah', '29', '0', null, null, null, '2020-07-08 12:50:03', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('511', 'Kabupaten Mamuju Utara', '29', '0', null, null, null, '2020-07-08 12:50:03', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('512', 'Kabupaten Polewali Mandar', '29', '0', null, null, null, '2020-07-08 12:50:04', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('513', 'Kabupaten Bantaeng', '26', '0', null, null, null, '2020-07-08 12:50:04', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('514', 'Kabupaten Barru', '26', '0', null, null, null, '2020-07-08 12:50:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('515', 'Kabupaten Bone', '26', '0', null, null, null, '2020-07-08 12:50:05', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('516', 'Kabupaten Bulukumba', '26', '0', null, null, null, '2020-07-08 12:50:05', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('517', 'Kabupaten Enrekang', '26', '0', null, null, null, '2020-07-08 12:50:05', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('518', 'Kabupaten Gowa', '26', '0', null, null, null, '2020-07-08 12:50:06', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('519', 'Kabupaten Jeneponto', '26', '0', null, null, null, '2020-07-08 12:50:06', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('520', 'Kabupaten Kepulauan Selayar', '26', '0', null, null, null, '2020-07-08 12:50:06', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('521', 'Kabupaten Luwu', '26', '0', null, null, null, '2020-07-08 12:50:07', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('522', 'Kabupaten Luwu Timur', '26', '0', null, null, null, '2020-07-08 12:50:07', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('523', 'Kabupaten Luwu Utara', '26', '0', null, null, null, '2020-07-08 12:50:08', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('524', 'Kabupaten Maros', '26', '0', null, null, null, '2020-07-08 12:50:08', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('525', 'Kabupaten Pangkajene dan Kepulauan', '26', '0', null, null, null, '2020-07-08 12:50:08', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('526', 'Kabupaten Pinrang', '26', '0', null, null, null, '2020-07-08 12:50:08', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('527', 'Kabupaten Sidenreng Rappang', '26', '0', null, null, null, '2020-07-08 12:50:09', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('528', 'Kabupaten Sinjai', '26', '0', null, null, null, '2020-07-08 12:50:09', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('529', 'Kabupaten Soppeng', '26', '0', null, null, null, '2020-07-08 12:50:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('530', 'Kabupaten Takalar', '26', '0', null, null, null, '2020-07-08 12:50:10', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('531', 'Kabupaten Tana Toraja', '26', '0', null, null, null, '2020-07-08 12:50:10', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('532', 'Kabupaten Toraja Utara', '26', '0', null, null, null, '2020-07-08 12:50:10', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('533', 'Kabupaten Wajo', '26', '0', null, null, null, '2020-07-08 12:50:11', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('534', 'Kabupaten Banggai', '25', '0', null, null, null, '2020-07-08 12:50:11', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('535', 'Kabupaten Banggai Kepulauan', '25', '0', null, null, null, '2020-07-08 12:50:11', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('536', 'Kabupaten Banggai Laut', '25', '0', null, null, null, '2020-07-08 12:50:11', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('537', 'Kabupaten Buol', '25', '0', null, null, null, '2020-07-08 12:50:12', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('538', 'Kabupaten Donggala', '25', '0', null, null, null, '2020-07-08 12:50:12', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('539', 'Kabupaten Morowali', '25', '0', null, null, null, '2020-07-08 12:50:12', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('540', 'Kabupaten Morowali Utara', '25', '0', null, null, null, '2020-07-08 12:50:13', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('541', 'Kabupaten Parigi Moutong', '25', '0', null, null, null, '2020-07-08 12:50:13', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('542', 'Kabupaten Poso', '25', '0', null, null, null, '2020-07-08 12:50:13', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('543', 'Kabupaten Sigi', '25', '0', null, null, null, '2020-07-08 12:50:14', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('544', 'Kabupaten Tojo Una-Una', '25', '0', null, null, null, '2020-07-08 12:50:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('545', 'Kabupaten Toli-Toli', '25', '0', null, null, null, '2020-07-08 12:50:14', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('546', 'Kabupaten Bombana', '27', '0', null, null, null, '2020-07-08 12:50:15', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('547', 'Kabupaten Buton', '27', '0', null, null, null, '2020-07-08 12:50:15', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('548', 'Kabupaten Buton Selatan', '27', '0', null, null, null, '2020-07-08 12:50:15', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('549', 'Kabupaten Buton Tengah', '27', '0', null, null, null, '2020-07-08 12:50:16', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('550', 'Kabupaten Buton Utara', '27', '0', null, null, null, '2020-07-08 12:50:16', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('551', 'Kabupaten Kolaka', '27', '0', null, null, null, '2020-07-08 12:50:16', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('552', 'Kabupaten Kolaka Timur', '27', '0', null, null, null, '2020-07-08 12:50:16', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('553', 'Kabupaten Kolaka Utara', '27', '0', null, null, null, '2020-07-08 12:50:17', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('554', 'Kabupaten Konawe Kepulauan', '27', '0', null, null, null, '2020-07-08 12:50:17', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('555', 'Kabupaten Konawe Selatan', '27', '0', null, null, null, '2020-07-08 12:50:18', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('556', 'Kabupaten Konawe Utara', '27', '0', null, null, null, '2020-07-08 12:50:18', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('557', 'Kabupaten Konawe', '27', '0', null, null, null, '2020-07-08 12:50:18', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('558', 'Kabupaten Muna', '27', '0', null, null, null, '2020-07-08 12:50:19', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('559', 'Kabupaten Muna Barat', '27', '0', null, null, null, '2020-07-08 12:50:19', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('560', 'Kabupaten Wakatobi', '27', '0', null, null, null, '2020-07-08 12:50:20', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('561', 'Kabupaten Bolaang Mongondow', '24', '0', null, null, null, '2020-07-08 12:50:20', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('562', 'Kabupaten Bolaang Mongondow Selatan', '24', '0', null, null, null, '2020-07-08 12:50:21', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('563', 'Kabupaten Bolaang Mongondow Timur', '24', '0', null, null, null, '2020-07-08 12:50:22', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('564', 'Kabupaten Bolaang Mongondow Utara', '24', '0', null, null, null, '2020-07-08 12:50:23', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('565', 'Kabupaten Kepulauan Sangihe', '24', '0', null, null, null, '2020-07-08 12:50:23', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('566', 'Kabupaten Kepulauan Siau Tagulandang Biaro', '24', '0', null, null, null, '2020-07-08 12:50:23', '0',
        '0', '1', null, null, null, null);
INSERT INTO `kota`
VALUES ('567', 'Kabupaten Kepulauan Talaud', '24', '0', null, null, null, '2020-07-08 12:50:24', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('568', 'Kabupaten Minahasa', '24', '0', null, null, null, '2020-07-08 12:50:24', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('569', 'Kabupaten Minahasa Selatan', '24', '0', null, null, null, '2020-07-08 12:50:24', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('570', 'Kabupaten Minahasa Tenggara', '24', '0', null, null, null, '2020-07-08 12:50:25', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('571', 'Kabupaten Minahasa Utara', '24', '0', null, null, null, '2020-07-08 12:50:26', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('572', 'Kabupaten Agam', '3', '0', null, null, null, '2020-07-08 12:50:26', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('573', 'Kabupaten Dharmasraya', '3', '0', null, null, null, '2020-07-08 12:50:27', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('574', 'Kabupaten Kepulauan Mentawai', '3', '0', null, null, null, '2020-07-08 12:50:27', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('575', 'Kabupaten Lima Puluh Kota', '3', '0', null, null, null, '2020-07-08 12:50:27', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('576', 'Kabupaten Padang Pariaman', '3', '0', null, null, null, '2020-07-08 12:50:28', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('577', 'Kabupaten Pasaman Barat', '3', '0', null, null, null, '2020-07-08 12:50:28', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('578', 'Kabupaten Pasaman', '3', '0', null, null, null, '2020-07-08 12:50:29', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('579', 'Kabupaten Pesisir Selatan', '3', '0', null, null, null, '2020-07-08 12:50:29', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('580', 'Kabupaten Sijunjung', '3', '0', null, null, null, '2020-07-08 12:50:29', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('581', 'Kabupaten Solok Selatan', '3', '0', null, null, null, '2020-07-08 12:50:29', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('582', 'Kabupaten Solok', '3', '0', null, null, null, '2020-07-08 12:50:30', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('583', 'Kabupaten Tanah Datar', '3', '0', null, null, null, '2020-07-08 12:50:30', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('584', 'Kabupaten Banyuasin', '6', '0', null, null, null, '2020-07-08 12:50:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('585', 'Kabupaten Empat Lawang', '6', '0', null, null, null, '2020-07-08 12:50:31', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('586', 'Kabupaten Lahat', '6', '0', null, null, null, '2020-07-08 12:50:32', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('587', 'Kabupaten Muara Enim', '6', '0', null, null, null, '2020-07-08 12:50:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('588', 'Kabupaten Musi Banyuasin', '6', '0', null, null, null, '2020-07-08 12:50:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('589', 'Kabupaten Musi Rawas', '6', '0', null, null, null, '2020-07-08 12:50:32', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('590', 'Kabupaten Musi Rawas Utara', '6', '0', null, null, null, '2020-07-08 12:50:33', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('591', 'Kabupaten Ogan Ilir', '6', '0', null, null, null, '2020-07-08 12:50:33', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('592', 'Kabupaten Ogan Komering Ilir', '6', '0', null, null, null, '2020-07-08 12:50:33', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('593', 'Kabupaten Ogan Komering Ulu Selatan', '6', '0', null, null, null, '2020-07-08 12:50:33', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('594', 'Kabupaten Ogan Komering Ulu Timur', '6', '0', null, null, null, '2020-07-08 12:50:34', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('595', 'Kabupaten Ogan Komering Ulu', '6', '0', null, null, null, '2020-07-08 12:50:34', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('596', 'Kabupaten Penukal Abab Lematang Ilir', '6', '0', null, null, null, '2020-07-08 12:50:35', '0', '0', '1',
        null, null, null, null);
INSERT INTO `kota`
VALUES ('597', 'Kabupaten Asahan', '2', '0', null, null, null, '2020-07-08 12:50:36', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('598', 'Kabupaten Batubara', '2', '0', null, null, null, '2020-07-08 12:50:36', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('599', 'Kabupaten Dairi', '2', '0', null, null, null, '2020-07-08 12:50:36', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('600', 'Kabupaten Deli Serdang', '2', '0', null, null, null, '2020-07-08 12:50:37', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('601', 'Kabupaten Humbang Hasundutan', '2', '0', null, null, null, '2020-07-08 12:50:37', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('602', 'Kabupaten Karo', '2', '0', null, null, null, '2020-07-08 12:50:37', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('603', 'Kabupaten Labuhanbatu Selatan', '2', '0', null, null, null, '2020-07-08 12:50:37', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('604', 'Kabupaten Labuhanbatu Utara', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('605', 'Kabupaten Labuhanbatu', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('606', 'Kabupaten Langkat', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('607', 'Kabupaten Mandailing Natal', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('608', 'Kabupaten Nias Barat', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('609', 'Kabupaten Nias Selatan', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('610', 'Kabupaten Nias Utara', '2', '0', null, null, null, '2020-07-08 12:50:38', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('611', 'Kabupaten Nias', '2', '0', null, null, null, '2020-07-08 12:50:39', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('612', 'Kabupaten Padang Lawas Utara', '2', '0', null, null, null, '2020-07-08 12:50:39', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('613', 'Kabupaten Padang Lawas', '2', '0', null, null, null, '2020-07-08 12:50:39', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('614', 'Kabupaten Pakpak Bharat', '2', '0', null, null, null, '2020-07-08 12:50:39', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('615', 'Kabupaten Samosir', '2', '0', null, null, null, '2020-07-08 12:50:39', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('616', 'Kabupaten Serdang Bedagai', '2', '0', null, null, null, '2020-07-08 12:50:40', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('617', 'Kabupaten Simalungun', '2', '0', null, null, null, '2020-07-08 12:50:40', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('618', 'Kabupaten Tapanuli Selatan', '2', '0', null, null, null, '2020-07-08 12:50:40', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('619', 'Kabupaten Tapanuli Tengah', '2', '0', null, null, null, '2020-07-08 12:50:41', '0', '0', '1', null,
        null, null, null);
INSERT INTO `kota`
VALUES ('620', 'Kabupaten Tapanuli Utara', '2', '0', null, null, null, '2020-07-08 12:50:41', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('621', 'Kabupaten Toba Samosir', '2', '0', null, null, null, '2020-07-08 12:50:41', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('622', 'Kabupaten Bantul', '16', '0', null, null, null, '2020-07-08 12:50:41', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('623', 'Kabupaten Gunung Kidul', '16', '0', null, null, null, '2020-07-08 12:50:41', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('624', 'Kabupaten Kulon Progo', '16', '0', null, null, null, '2020-07-08 12:50:42', '0', '0', '1', null, null,
        null, null);
INSERT INTO `kota`
VALUES ('625', 'Kabupaten Sleman', '16', '0', null, null, null, '2020-07-08 12:50:42', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('626', 'CIANJUR', null, '0', null, null, null, '2020-07-14 17:02:16', '0', '0', null, null, null, null, null);
INSERT INTO `kota`
VALUES ('628', '00', '80', '0', null, null, null, '2022-07-13 13:23:19', '0', '0', '1', '2022-07-13 13:23:19', '120',
        '2022-07-13 13:23:19', '120');
INSERT INTO `kota`
VALUES ('629', '00', '80', '0', null, null, null, '2022-07-13 13:24:18', '0', '0', '1', '2022-07-13 13:24:18', '120',
        '2022-07-13 13:24:18', '120');
INSERT INTO `kota`
VALUES ('630', '-', '80', '0', null, null, null, '2022-07-13 13:28:21', '0', '0', '1', '2022-07-13 13:28:21', '120',
        '2022-07-13 13:28:21', '120');
INSERT INTO `kota`
VALUES ('631', 'Aguascalientes', '190', '0', null, null, null, '2022-07-21 15:46:57', '0', '0', '1', null, null, null,
        null);
INSERT INTO `kota`
VALUES ('632', 'Abu Dhabi', '37', '0', null, null, null, '2022-08-08 10:49:59', '0', '0', '1', '2022-08-08 10:49:59',
        '120', '2022-08-08 10:49:59', '120');
INSERT INTO `kota`
VALUES ('633', 'Shanghai', '43', '0', null, null, null, '2022-08-30 11:25:24', '0', '0', '1', null, null, null, null);

-- ----------------------------
-- Table structure for media
-- ----------------------------
DROP TABLE IF EXISTS `media`;
CREATE TABLE `media`
(
    `replid` int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `media`  varchar(100)         NOT NULL,
    `urutan` tinyint(2) unsigned  NOT NULL,
    `ts`     timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`  smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync` tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `aktif`  tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of media
-- ----------------------------
INSERT INTO `media`
VALUES ('1', 'Email', '1', '2013-02-05 01:18:33', '0', '0', '1');
INSERT INTO `media`
VALUES ('2', 'SMS', '2', '2013-02-05 01:29:20', '0', '0', '1');
INSERT INTO `media`
VALUES ('3', 'Surat', '3', '2013-02-05 04:20:51', '0', '0', '1');
INSERT INTO `media`
VALUES ('4', 'BBM', '4', '2013-09-06 10:53:35', '0', '0', '0');
INSERT INTO `media`
VALUES ('5', 'Telepon', '5', '2013-09-06 10:53:43', '0', '0', '1');
INSERT INTO `media`
VALUES ('6', 'Whatsapp', '6', '2020-07-23 14:09:00', '0', '0', '1');

-- ----------------------------
-- Table structure for negara
-- ----------------------------
DROP TABLE IF EXISTS `negara`;
CREATE TABLE `negara`
(
    `replid` int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `negara` varchar(100)         NOT NULL,
    `urutan` tinyint(2) unsigned  NOT NULL,
    `info1`  varchar(255)                  DEFAULT NULL,
    `info2`  varchar(255)                  DEFAULT NULL,
    `info3`  varchar(255)                  DEFAULT NULL,
    `ts`     timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`  smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync` tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`negara`),
    UNIQUE KEY `UX_negara` (`replid`) USING BTREE,
    KEY `IX_negara_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 109
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of negara
-- ----------------------------
INSERT INTO `negara`
VALUES ('36', 'Afghanistan', '0', null, null, null, '2020-07-08 10:31:17', '0', '0');
INSERT INTO `negara`
VALUES ('37', 'Albania', '0', null, null, null, '2020-07-08 10:31:18', '0', '0');
INSERT INTO `negara`
VALUES ('38', 'Algeria', '0', null, null, null, '2020-07-08 10:31:18', '0', '0');
INSERT INTO `negara`
VALUES ('39', 'Andorra', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('40', 'Angola', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('41', 'Antigua & Barbuda', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('42', 'Argentina', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('43', 'Armenia', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('14', 'Australia', '0', null, null, null, '2014-01-06 08:48:05', '0', '0');
INSERT INTO `negara`
VALUES ('44', 'Austria', '0', null, null, null, '2020-07-08 10:31:19', '0', '0');
INSERT INTO `negara`
VALUES ('45', 'Azerbaijan', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('46', 'Bahrain', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('24', 'Bangladesh', '0', null, null, null, '2016-08-12 14:53:08', '0', '0');
INSERT INTO `negara`
VALUES ('47', 'Barbados', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('48', 'Belarus', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('49', 'Belgium', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('50', 'Belize', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('51', 'Benin', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('52', 'Bhutan', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('53', 'Bolivia', '0', null, null, null, '2020-07-08 10:31:20', '0', '0');
INSERT INTO `negara`
VALUES ('54', 'Bosnia & Herzegovina', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('55', 'Botswana', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('56', 'Brazil', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('57', 'Brunei', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('58', 'Bulgaria', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('59', 'Burkina Faso', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('60', 'Burundi', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('61', 'Cambodia', '0', null, null, null, '2020-07-08 10:31:21', '0', '0');
INSERT INTO `negara`
VALUES ('62', 'Cameroon', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('63', 'Canada', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('64', 'Cape Verde', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('65', 'Central African Republic', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('66', 'Chad', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('67', 'Chile', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('5', 'China', '0', null, null, null, '2013-09-24 13:34:40', '0', '0');
INSERT INTO `negara`
VALUES ('68', 'Colombia', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('69', 'Comoros', '0', null, null, null, '2020-07-08 10:31:22', '0', '0');
INSERT INTO `negara`
VALUES ('70', 'Costa Rica', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('71', 'Croatia', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('72', 'Cuba', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('73', 'Cyprus', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('74', 'Czech Republic', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('75', 'Denmark', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('76', 'Djibouti', '0', null, null, null, '2020-07-08 10:31:23', '0', '0');
INSERT INTO `negara`
VALUES ('77', 'Dominica', '0', null, null, null, '2020-07-08 10:31:24', '0', '0');
INSERT INTO `negara`
VALUES ('78', 'Dominican Republic', '0', null, null, null, '2020-07-08 10:31:24', '0', '0');
INSERT INTO `negara`
VALUES ('79', 'East Timor', '0', null, null, null, '2020-07-08 10:31:24', '0', '0');
INSERT INTO `negara`
VALUES ('80', 'Ecuador', '0', null, null, null, '2020-07-08 10:31:24', '0', '0');
INSERT INTO `negara`
VALUES ('26', 'Egypt', '0', null, null, null, '2017-03-07 12:27:32', '0', '0');
INSERT INTO `negara`
VALUES ('81', 'El Salvador', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('82', 'Equatorial Guinea', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('83', 'Eritrea', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('84', 'Estonia', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('85', 'Ethiopia', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('86', 'Fiji', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('87', 'Finland', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('11', 'France', '0', null, null, null, '2013-10-04 13:37:41', '0', '0');
INSERT INTO `negara`
VALUES ('88', 'Gabon', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('89', 'Georgia', '0', null, null, null, '2020-07-08 10:31:25', '0', '0');
INSERT INTO `negara`
VALUES ('90', 'Germany', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('91', 'Ghana', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('92', 'Greece', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('93', 'Grenada', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('94', 'Guatemala', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('95', 'Guinea', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('96', 'Guinea Bissau', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('97', 'Guyana', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('98', 'Haiti', '0', null, null, null, '2020-07-08 10:31:26', '0', '0');
INSERT INTO `negara`
VALUES ('99', 'Honduras', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('18', 'Hongkong', '0', null, null, null, '2014-06-04 10:13:43', '0', '0');
INSERT INTO `negara`
VALUES ('100', 'Hungary', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('101', 'Iceland', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('19', 'India', '0', null, null, null, '2014-06-10 13:18:53', '0', '0');
INSERT INTO `negara`
VALUES ('1', 'Indonesia', '0', null, null, null, '2013-01-09 05:34:21', '0', '0');
INSERT INTO `negara`
VALUES ('107', 'Iraq', '0', null, null, null, '2022-07-12 14:08:43', '0', '0');
INSERT INTO `negara`
VALUES ('102', 'Ivory Coast', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('3', 'Japan', '3', null, null, null, '2013-09-04 13:32:59', '0', '0');
INSERT INTO `negara`
VALUES ('15', 'Kuwait', '0', null, null, null, '2014-01-30 16:24:48', '0', '0');
INSERT INTO `negara`
VALUES ('9', 'Laos', '0', null, null, null, '2013-10-04 11:44:54', '0', '0');
INSERT INTO `negara`
VALUES ('4', 'Malaysia', '0', null, null, null, '2013-09-24 11:08:25', '0', '0');
INSERT INTO `negara`
VALUES ('108', 'Mexico', '0', null, null, null, '2022-07-18 09:05:40', '0', '0');
INSERT INTO `negara`
VALUES ('28', 'Netherlands\r\n\r\n', '0', null, null, null, '2018-01-08 12:34:28', '0', '0');
INSERT INTO `negara`
VALUES ('33', 'Oman', '0', null, null, null, '2019-07-24 08:45:17', '0', '0');
INSERT INTO `negara`
VALUES ('27', 'Pakistan', '0', null, null, null, '2017-03-15 16:00:52', '0', '0');
INSERT INTO `negara`
VALUES ('32', 'Peru', '0', null, null, null, '2019-07-19 13:37:59', '0', '0');
INSERT INTO `negara`
VALUES ('23', 'Philippines', '0', null, null, null, '2016-08-05 12:43:20', '0', '0');
INSERT INTO `negara`
VALUES ('106', 'POLANDIA', '0', null, null, null, '2020-07-10 09:32:39', '0', '0');
INSERT INTO `negara`
VALUES ('22', 'Qatar', '0', null, null, null, '2015-07-07 15:05:39', '0', '0');
INSERT INTO `negara`
VALUES ('21', 'R.O.C Taiwan', '0', null, null, null, '2014-12-16 16:30:04', '0', '0');
INSERT INTO `negara`
VALUES ('103', 'Republic of the Congo', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('34', 'Russia', '0', null, null, null, '2019-07-30 11:41:55', '0', '0');
INSERT INTO `negara`
VALUES ('2', 'Saudi Arabia', '2', null, null, null, '2013-07-25 10:41:51', '0', '0');
INSERT INTO `negara`
VALUES ('17', 'Singapore', '0', null, null, null, '2014-04-04 08:37:22', '0', '0');
INSERT INTO `negara`
VALUES ('29', 'South Korea', '0', null, null, null, '2018-01-09 10:45:00', '0', '0');
INSERT INTO `negara`
VALUES ('10', 'Spain', '0', null, null, null, '2013-10-04 13:34:42', '0', '0');
INSERT INTO `negara`
VALUES ('35', 'Switzerland', '0', null, null, null, '2020-04-23 12:10:54', '0', '0');
INSERT INTO `negara`
VALUES ('8', 'Thailand', '0', null, null, null, '2013-09-30 14:16:21', '0', '0');
INSERT INTO `negara`
VALUES ('104', 'The Bahamas', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('105', 'The Gambia', '0', null, null, null, '2020-07-08 10:31:27', '0', '0');
INSERT INTO `negara`
VALUES ('25', 'Turkey', '0', null, null, null, '2016-09-06 10:36:19', '0', '0');
INSERT INTO `negara`
VALUES ('16', 'United Arab Emirates', '0', null, null, null, '2014-04-03 10:53:49', '0', '0');
INSERT INTO `negara`
VALUES ('31', 'United Kingdom', '0', null, null, null, '2018-01-30 04:42:33', '0', '0');
INSERT INTO `negara`
VALUES ('20', 'United States Of America', '0', null, null, null, '2014-09-08 10:41:22', '0', '0');

-- ----------------------------
-- Table structure for online_kronologis
-- ----------------------------
DROP TABLE IF EXISTS `online_kronologis`;
CREATE TABLE `online_kronologis`
(
    `replid`               int(11) NOT NULL AUTO_INCREMENT,
    `ortu`                 varchar(100)                    DEFAULT NULL,
    `namaortu`             varchar(200)                    DEFAULT NULL,
    `noidentitas`          varchar(16)                     DEFAULT NULL,
    `tahunlahirortu`       int(4)                          DEFAULT NULL,
    `teleponortu`          varchar(100)                    DEFAULT NULL,
    `handphoneortu`        varchar(100)                    DEFAULT NULL,
    `emailortu`            varchar(500)                    DEFAULT NULL,
    `whatsapportu`         varchar(100)                    DEFAULT NULL,
    `namacalon`            varchar(255)                    DEFAULT NULL,
    `jeniskelamin`         char(1)                         DEFAULT NULL,
    `tempatlahir`          varchar(255)                    DEFAULT NULL,
    `tanggallahir`         datetime                        DEFAULT NULL,
    `negara`               int(11)                         DEFAULT NULL,
    `propinsi`             int(11)                         DEFAULT NULL,
    `kota`                 int(11)                         DEFAULT NULL,
    `kecamatan`            int(255)                        DEFAULT NULL,
    `jenjangasal`          char(10)                        DEFAULT NULL,
    `asalsekolah`          varchar(255)                    DEFAULT NULL,
    `idtingkatasal`        int(11)                         DEFAULT NULL,
    `idjurusanasal`        int(11)                         DEFAULT NULL,
    `jenjang`              char(10)                        DEFAULT NULL,
    `idtingkat`            int(11)                         DEFAULT NULL,
    `idjurusan`            int(11)                         DEFAULT NULL,
    `idkelompokcalon`      int(11)                         DEFAULT NULL,
    `idtahunajaran`        int(11)                         DEFAULT NULL,
    `idproses`             int(11)                         DEFAULT NULL,
    `idkelompok`           int(11)                         DEFAULT NULL,
    `idkondisi`            int(11)                         DEFAULT NULL,
    `idregion`             int(11)                         DEFAULT NULL,
    `abk`                  tinyint(4)                      DEFAULT NULL,
    `tanggaldaftar`        date                            DEFAULT NULL,
    `idcalon`              int(11)                         DEFAULT NULL,
    `created_date`         datetime                        DEFAULT NULL,
    `created_by`           varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `modified_date`        datetime                        DEFAULT NULL,
    `modified_by`          varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `proses_by`            varchar(255)                    DEFAULT NULL,
    `status`               char(4)                         DEFAULT NULL,
    `token`                varchar(255)                    DEFAULT NULL,
    `fileidentitas`        varchar(255)                    DEFAULT NULL,
    `fileencrypt`          varchar(255)                    DEFAULT NULL,
    `idunitbisnis`         int(11)                         DEFAULT NULL,
    `tokenonline`          varchar(255) CHARACTER SET utf8 DEFAULT NULL,
    `voting`               int(11)                         DEFAULT NULL,
    `pemeriksaan_psikolog` tinyint(4)                      DEFAULT NULL,
    `remedialperilaku`     tinyint(4)                      DEFAULT NULL,
    `keterangan`           varchar(255)                    DEFAULT '',
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 5351
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of online_kronologis
-- ----------------------------
INSERT INTO `online_kronologis`
VALUES ('5348', 'Ibu', 'test', '0', '0', '0', 'test', 'adriankalalo654@gmail.com', 'test', 'test', 'l', '0',
        '2022-08-02 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', 'SD', '7', '0', '5', '108', null, null, null,
        null, '0', null, null, '2023-08-23 13:41:13', null, '2023-08-23 13:42:03', null, null, '1', null, null, null,
        '7', 'LEhvW@Ql', '52', '0', null, '');
INSERT INTO `online_kronologis`
VALUES ('5349', 'Ayah', 'Kenny', '0', '0', '0', '085945141528', 'arkmeasure23@gmail.com', '085945141528', 'test', 'l',
        '0', '2000-05-18 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', 'SD', '7', '0', '37', '107', null, null,
        null, null, '0', null, null, '2023-08-23 13:58:06', null, '2023-08-23 13:59:12', null, null, '1', null, null,
        null, '8', '62ag59dq', '52', '1', null, '');
INSERT INTO `online_kronologis`
VALUES ('5350', 'Ibu', 'asd', '0', '0', '0', '081212341234', 'kennylinardy23@gmail.com', '081212341234', 'Agus', 'l',
        '0', '2010-07-23 00:00:00', '0', '0', '0', '0', '0', '0', '0', '0', 'SMP', '5', '0', '41', '105', null, null,
        null, null, '0', null, null, '2023-08-24 10:21:29', null, '2023-08-24 10:49:15', null, null, '1', null, null,
        null, '1', '#S0GlBGM', '52', '1', null, '');

-- ----------------------------
-- Table structure for online_kronologis_alasan
-- ----------------------------
DROP TABLE IF EXISTS `online_kronologis_alasan`;
CREATE TABLE `online_kronologis_alasan`
(
    `replid`       int(11) NOT NULL AUTO_INCREMENT,
    `idkronologis` int(11) DEFAULT NULL,
    `idalasan`     int(11) DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1707
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of online_kronologis_alasan
-- ----------------------------
INSERT INTO `online_kronologis_alasan`
VALUES ('1698', '5348', '47');
INSERT INTO `online_kronologis_alasan`
VALUES ('1699', '5349', '47');
INSERT INTO `online_kronologis_alasan`
VALUES ('1700', '5349', '48');
INSERT INTO `online_kronologis_alasan`
VALUES ('1701', '5349', '50');
INSERT INTO `online_kronologis_alasan`
VALUES ('1702', '5349', '51');
INSERT INTO `online_kronologis_alasan`
VALUES ('1703', '5350', '47');
INSERT INTO `online_kronologis_alasan`
VALUES ('1704', '5350', '48');
INSERT INTO `online_kronologis_alasan`
VALUES ('1705', '5350', '50');
INSERT INTO `online_kronologis_alasan`
VALUES ('1706', '5350', '51');

-- ----------------------------
-- Table structure for online_kronologis_media
-- ----------------------------
DROP TABLE IF EXISTS `online_kronologis_media`;
CREATE TABLE `online_kronologis_media`
(
    `replid`       int(11) NOT NULL AUTO_INCREMENT,
    `idkronologis` int(11) DEFAULT NULL,
    `idmedia`      int(11) DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 1880
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of online_kronologis_media
-- ----------------------------
INSERT INTO `online_kronologis_media`
VALUES ('1830', '5348', '43');
INSERT INTO `online_kronologis_media`
VALUES ('1831', '5348', '12');
INSERT INTO `online_kronologis_media`
VALUES ('1832', '5348', '11');
INSERT INTO `online_kronologis_media`
VALUES ('1833', '5349', '43');
INSERT INTO `online_kronologis_media`
VALUES ('1834', '5349', '46');
INSERT INTO `online_kronologis_media`
VALUES ('1835', '5349', '44');
INSERT INTO `online_kronologis_media`
VALUES ('1836', '5350', '43');
INSERT INTO `online_kronologis_media`
VALUES ('1837', '5350', '46');
INSERT INTO `online_kronologis_media`
VALUES ('1838', '5350', '44');
INSERT INTO `online_kronologis_media`
VALUES ('1839', '5350', '45');
INSERT INTO `online_kronologis_media`
VALUES ('1840', '5350', '17');
INSERT INTO `online_kronologis_media`
VALUES ('1841', '5350', '41');
INSERT INTO `online_kronologis_media`
VALUES ('1842', '5350', '42');
INSERT INTO `online_kronologis_media`
VALUES ('1843', '5350', '12');
INSERT INTO `online_kronologis_media`
VALUES ('1844', '5350', '13');
INSERT INTO `online_kronologis_media`
VALUES ('1845', '5350', '14');
INSERT INTO `online_kronologis_media`
VALUES ('1846', '5350', '11');
INSERT INTO `online_kronologis_media`
VALUES ('1847', '5350', '10');
INSERT INTO `online_kronologis_media`
VALUES ('1848', '5350', '9');
INSERT INTO `online_kronologis_media`
VALUES ('1849', '5350', '8');
INSERT INTO `online_kronologis_media`
VALUES ('1850', '5350', '28');
INSERT INTO `online_kronologis_media`
VALUES ('1851', '5350', '32');
INSERT INTO `online_kronologis_media`
VALUES ('1852', '5350', '35');
INSERT INTO `online_kronologis_media`
VALUES ('1853', '5350', '36');
INSERT INTO `online_kronologis_media`
VALUES ('1854', '5350', '30');
INSERT INTO `online_kronologis_media`
VALUES ('1855', '5350', '31');
INSERT INTO `online_kronologis_media`
VALUES ('1856', '5350', '29');
INSERT INTO `online_kronologis_media`
VALUES ('1857', '5350', '38');
INSERT INTO `online_kronologis_media`
VALUES ('1858', '5350', '33');
INSERT INTO `online_kronologis_media`
VALUES ('1859', '5350', '34');
INSERT INTO `online_kronologis_media`
VALUES ('1860', '5350', '27');
INSERT INTO `online_kronologis_media`
VALUES ('1861', '5350', '39');
INSERT INTO `online_kronologis_media`
VALUES ('1862', '5350', '40');
INSERT INTO `online_kronologis_media`
VALUES ('1863', '5350', '37');
INSERT INTO `online_kronologis_media`
VALUES ('1864', '5350', '23');
INSERT INTO `online_kronologis_media`
VALUES ('1865', '5350', '5');
INSERT INTO `online_kronologis_media`
VALUES ('1866', '5350', '25');
INSERT INTO `online_kronologis_media`
VALUES ('1867', '5350', '24');
INSERT INTO `online_kronologis_media`
VALUES ('1868', '5350', '26');
INSERT INTO `online_kronologis_media`
VALUES ('1869', '5350', '7');
INSERT INTO `online_kronologis_media`
VALUES ('1870', '5350', '20');
INSERT INTO `online_kronologis_media`
VALUES ('1871', '5350', '21');
INSERT INTO `online_kronologis_media`
VALUES ('1872', '5350', '22');
INSERT INTO `online_kronologis_media`
VALUES ('1873', '5350', '4');
INSERT INTO `online_kronologis_media`
VALUES ('1874', '5350', '3');
INSERT INTO `online_kronologis_media`
VALUES ('1875', '5350', '1');
INSERT INTO `online_kronologis_media`
VALUES ('1876', '5350', '6');
INSERT INTO `online_kronologis_media`
VALUES ('1877', '5350', '2');
INSERT INTO `online_kronologis_media`
VALUES ('1878', '5350', '19');
INSERT INTO `online_kronologis_media`
VALUES ('1879', '5350', '18');

-- ----------------------------
-- Table structure for online_kronologis_reff
-- ----------------------------
DROP TABLE IF EXISTS `online_kronologis_reff`;
CREATE TABLE `online_kronologis_reff`
(
    `replid`              int(10) unsigned    NOT NULL AUTO_INCREMENT,
    `head`                varchar(255)                 DEFAULT NULL,
    `reff_kronologis`     varchar(255)        NOT NULL DEFAULT '',
    `reff_kronologis_sub` varchar(255)                 DEFAULT NULL,
    `aktif`               tinyint(1) unsigned NOT NULL DEFAULT '0',
    `keterangan`          varchar(255)                 DEFAULT NULL,
    `created_date`        datetime                     DEFAULT NULL,
    `created_by`          varchar(200)                 DEFAULT NULL,
    `modified_date`       datetime                     DEFAULT NULL,
    `modified_by`         varchar(200)                 DEFAULT NULL,
    `no_urut`             int(11)                      DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 55
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of online_kronologis_reff
-- ----------------------------
INSERT INTO `online_kronologis_reff`
VALUES ('1', 'Media', 'Media Sosial', 'Facebook', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('2', 'Media', 'Media Sosial', 'Twitter', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('3', 'Media', 'Media Sosial', 'BBM', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('4', 'Media', 'Media Sosial', 'ask. fm', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('5', 'Media', 'Media Online', 'Pencarian Google', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('6', 'Media', 'Media Sosial', 'Instagram', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('7', 'Media', 'Media Online', 'Website', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('8', 'Media', 'Media Offline', 'Brosur', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('9', 'Media', 'Media Elektronik', 'Televisi', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('10', 'Media', 'Media Elektronik', 'Radio', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('11', 'Media', 'Media Elektronik', 'Handphone', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('12', 'Media', 'Media Cetak', 'Koran', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('13', 'Media', 'Media Cetak', 'Majalah', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('14', 'Media', 'Media Cetak', 'Tabloid', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('17', 'Media', 'Event', 'Seminar', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('18', 'Media', 'Media Sosial', 'Youtube', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('19', 'Media', 'Media Sosial', 'Whatsapp', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('20', 'Media', 'Media Online', 'Website Berita', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('21', 'Media', 'Media Online', 'Website Iklan', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('22', 'Media', 'Media Online', 'Website Parenting', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('23', 'Media', 'Media Online', 'Email Marketing', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('24', 'Media', 'Media Online', 'Telepon', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('25', 'Media', 'Media Online', 'Radio', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('26', 'Media', 'Media Online', 'Televisi', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('27', 'Media', 'Media Offline', 'Spanduk', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('28', 'Media', 'Media Offline', 'Flyer', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('29', 'Media', 'Media Offline', 'Poster', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('30', 'Media', 'Media Offline', 'Koran', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('31', 'Media', 'Media Offline', 'Majalah', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('32', 'Media', 'Media Offline', 'Kantor', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('33', 'Media', 'Media Offline', 'Sekolah Bakat', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('34', 'Media', 'Media Offline', 'Sekolah Sebelumnya', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('35', 'Media', 'Media Offline', 'Kerabat yang bersekolah di Kami', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('36', 'Media', 'Media Offline', 'Kerabat yang tidak bersekolah di Kami', '1', null, null, null, null, null,
        null);
INSERT INTO `online_kronologis_reff`
VALUES ('37', 'Media', 'Media Offline', 'Tutor Kami', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('38', 'Media', 'Media Offline', 'Psikolog Kami', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('39', 'Media', 'Media Offline', 'Staff Kami', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('40', 'Media', 'Media Offline', 'TK/Preschool', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('41', 'Media', 'Event', 'Sharing Session', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('42', 'Media', 'Event', 'Sparkling', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('43', 'Media', 'Event', 'Booth Kami', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('44', 'Media', 'Event', 'In House', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('45', 'Media', 'Event', 'Parenting Kak Seto', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('46', 'Media', 'Event', 'Edu Fair', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('47', 'Alasan', '', 'Brand Name Kak Seto', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('48', 'Alasan', '', 'Jarak dekat dengan rumah', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('49', 'Alasan', '', 'Pembelajaran berbasis TIK', '0', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('50', 'Alasan', '', 'Pendekatan Individual terhadap anak', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('51', 'Alasan', '', 'Pengajarnya yang Profesional', '1', null, null, null, null, null, null);
INSERT INTO `online_kronologis_reff`
VALUES ('52', 'voting', '', 'Baik', '1', null, null, null, null, null, '1');
INSERT INTO `online_kronologis_reff`
VALUES ('53', 'voting', '', 'Cukup', '1', null, null, null, null, null, '2');
INSERT INTO `online_kronologis_reff`
VALUES ('54', 'voting', '', 'Buruk', '1', null, null, null, null, null, '3');

-- ----------------------------
-- Table structure for penanggung_jawab
-- ----------------------------
DROP TABLE IF EXISTS `penanggung_jawab`;
CREATE TABLE `penanggung_jawab`
(
    `replid`           int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `penanggung_jawab` varchar(100)         NOT NULL,
    `urutan`           tinyint(2) unsigned  NOT NULL,
    `ts`               timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`            smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`           tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 8
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of penanggung_jawab
-- ----------------------------
INSERT INTO `penanggung_jawab`
VALUES ('1', 'Ayah', '1', '2013-02-05 01:18:33', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('2', 'Ibu', '2', '2013-02-05 01:29:20', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('3', 'Wali', '3', '2013-02-05 04:20:51', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('4', 'Ayah dan Ibu', '0', '2013-09-03 01:42:10', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('5', 'Ayah dan Wali', '0', '2013-09-03 01:42:17', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('6', 'Ibu dan Wali', '0', '2013-09-03 01:42:34', '0', '0');
INSERT INTO `penanggung_jawab`
VALUES ('7', 'Ayah, Ibu dan Wali', '0', '2013-09-03 01:43:25', '0', '0');

-- ----------------------------
-- Table structure for penghasilan
-- ----------------------------
DROP TABLE IF EXISTS `penghasilan`;
CREATE TABLE `penghasilan`
(
    `replid`      int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `penghasilan` varchar(100)         NOT NULL,
    `urutan`      tinyint(2) unsigned  NOT NULL,
    `ts`          timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`       smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`      tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_jurusan` (`replid`) USING BTREE,
    KEY `IX_jurusan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 7
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of penghasilan
-- ----------------------------
INSERT INTO `penghasilan`
VALUES ('1', '< 5 jta', '1', '2013-02-05 01:18:33', '0', '0');
INSERT INTO `penghasilan`
VALUES ('2', '5 - 10 jta', '2', '2013-02-05 01:29:20', '0', '0');
INSERT INTO `penghasilan`
VALUES ('3', '10.5 - 30 jta', '3', '2013-02-07 02:10:11', '0', '0');
INSERT INTO `penghasilan`
VALUES ('4', '30.5 - 50 jta', '4', '2013-02-07 02:22:27', '0', '0');
INSERT INTO `penghasilan`
VALUES ('5', '>50 jta', '5', '2013-02-07 02:22:37', '0', '0');
INSERT INTO `penghasilan`
VALUES ('6', 'TIDAK ADA DATA', '20', '2013-10-30 10:22:45', '0', '0');

-- ----------------------------
-- Table structure for propinsi
-- ----------------------------
DROP TABLE IF EXISTS `propinsi`;
CREATE TABLE `propinsi`
(
    `replid`    int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `propinsi`  varchar(100)         NOT NULL,
    `id_negara` int(11)                       DEFAULT NULL,
    `urutan`    tinyint(2) unsigned  NOT NULL,
    `info1`     varchar(255)                  DEFAULT NULL,
    `info2`     varchar(255)                  DEFAULT NULL,
    `info3`     varchar(255)                  DEFAULT NULL,
    `ts`        timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`     smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`    tinyint(1) unsigned  NOT NULL DEFAULT '0',
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_propinsi` (`replid`) USING BTREE,
    KEY `IX_propinsi_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 191
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of propinsi
-- ----------------------------
INSERT INTO `propinsi`
VALUES ('2', 'Sumatera Utara', '1', '2', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('3', 'Sumatera Barat', '1', '3', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('4', 'Riau', '1', '4', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('5', 'Jambi', '1', '5', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('6', 'Sumatera Selatan', '1', '6', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('7', 'Bengkulu', '1', '7', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('8', 'Lampung', '1', '8', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('9', 'Kepulauan Bangka Belitung', '1', '9', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('10', 'Kepulauan Riau', '1', '10', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('11', 'DKI Jakarta', '1', '11', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('12', 'Jawa Barat', '1', '12', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('13', 'Jawa Tengah', '1', '13', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('14', 'Banten', '1', '14', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('15', 'Jawa Timur', '1', '15', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('16', 'DI Yogyakarta', '1', '16', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('17', 'Bali', '1', '17', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('18', 'Nusa Tenggara Barat', '1', '18', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('19', 'Nusa Tenggara Timur', '1', '19', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('20', 'Kalimantan Barat', '1', '20', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('21', 'Kalimantan Tengah', '1', '21', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('22', 'Kalimantan Selatan', '1', '22', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('23', 'Kalimantan Timur', '1', '23', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('24', 'Sulawesi Utara', '1', '24', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('25', 'Sulawesi Tengah', '1', '25', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('26', 'Sulawesi Selatan', '1', '26', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('27', 'Sulawesi Tenggara', '1', '27', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('28', 'Gorontalo', '1', '28', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('29', 'Sulawesi Barat', '1', '29', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('30', 'Maluku', '1', '30', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('31', 'Maluku Utara', '1', '31', '', '', '', '2013-07-25 11:00:26', '0', '0');
INSERT INTO `propinsi`
VALUES ('32', 'Papua', '1', '32', '', '', '', '2013-04-04 03:10:13', '0', '0');
INSERT INTO `propinsi`
VALUES ('33', 'Papua Barat', '1', '33', '', '', '', '2013-01-09 04:55:11', '0', '0');
INSERT INTO `propinsi`
VALUES ('34', 'Luar Negeri', '2', '1', null, null, null, '2013-07-25 11:32:47', '0', '0');
INSERT INTO `propinsi`
VALUES ('37', 'Luar Negeri', '16', '0', null, null, null, '2013-10-02 14:40:59', '0', '0');
INSERT INTO `propinsi`
VALUES ('38', 'Luar Negeri', '3', '0', null, null, null, '2013-10-04 13:32:38', '0', '0');
INSERT INTO `propinsi`
VALUES ('42', 'Aceh', '1', '0', null, null, null, '2013-11-12 14:40:43', '0', '0');
INSERT INTO `propinsi`
VALUES ('43', 'Luar Negeri', '5', '0', null, null, null, '2014-02-10 10:16:17', '0', '0');
INSERT INTO `propinsi`
VALUES ('44', 'Luar Negeri', '20', '0', null, null, null, '2014-09-08 10:40:19', '0', '0');
INSERT INTO `propinsi`
VALUES ('45', 'Luar Negeri', '19', '0', null, null, null, '2014-10-27 15:14:30', '0', '0');
INSERT INTO `propinsi`
VALUES ('46', 'Kalimantan Utara', '1', '0', null, null, null, '2015-07-29 09:55:03', '0', '0');
INSERT INTO `propinsi`
VALUES ('51', 'Luar Negeri', '25', '0', null, null, null, '2016-09-06 10:35:59', '0', '0');
INSERT INTO `propinsi`
VALUES ('53', 'Luar Negeri', '27', '0', null, null, null, '2017-03-15 16:01:39', '0', '0');
INSERT INTO `propinsi`
VALUES ('54', 'Luar Negeri', '10', '0', null, null, null, '2018-07-14 14:13:30', '0', '0');
INSERT INTO `propinsi`
VALUES ('58', 'Luar Negeri', '8', '0', null, null, null, '2019-07-29 15:38:34', '0', '0');
INSERT INTO `propinsi`
VALUES ('61', 'Luar Negeri', '87', '0', null, null, null, '2021-08-05 11:01:39', '0', '0');
INSERT INTO `propinsi`
VALUES ('63', 'Luar Negeri', '4', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('64', 'Luar Negeri', '9', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('65', 'Luar Negeri', '11', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('66', 'Luar Negeri', '14', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('67', 'Luar Negeri', '15', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('68', 'Luar Negeri', '17', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('69', 'Luar Negeri', '18', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('70', 'Luar Negeri', '21', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('71', 'Luar Negeri', '22', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('72', 'Luar Negeri', '23', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('73', 'Luar Negeri', '24', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('74', 'Luar Negeri', '26', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('75', 'Luar Negeri', '28', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('76', 'Luar Negeri', '29', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('77', 'Luar Negeri', '31', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('78', 'Luar Negeri', '32', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('79', 'Luar Negeri', '33', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('80', 'Luar Negeri', '34', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('81', 'Luar Negeri', '35', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('82', 'Luar Negeri', '36', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('83', 'Luar Negeri', '37', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('84', 'Luar Negeri', '38', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('85', 'Luar Negeri', '39', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('86', 'Luar Negeri', '40', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('87', 'Luar Negeri', '41', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('88', 'Luar Negeri', '42', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('89', 'Luar Negeri', '43', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('90', 'Luar Negeri', '44', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('91', 'Luar Negeri', '45', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('92', 'Luar Negeri', '46', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('93', 'Luar Negeri', '47', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('94', 'Luar Negeri', '48', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('95', 'Luar Negeri', '49', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('96', 'Luar Negeri', '50', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('97', 'Luar Negeri', '51', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('98', 'Luar Negeri', '52', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('99', 'Luar Negeri', '53', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('100', 'Luar Negeri', '54', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('101', 'Luar Negeri', '55', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('102', 'Luar Negeri', '56', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('103', 'Luar Negeri', '57', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('104', 'Luar Negeri', '58', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('105', 'Luar Negeri', '59', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('106', 'Luar Negeri', '60', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('107', 'Luar Negeri', '61', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('108', 'Luar Negeri', '62', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('109', 'Luar Negeri', '63', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('110', 'Luar Negeri', '64', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('111', 'Luar Negeri', '65', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('112', 'Luar Negeri', '66', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('113', 'Luar Negeri', '67', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('114', 'Luar Negeri', '68', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('115', 'Luar Negeri', '69', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('116', 'Luar Negeri', '70', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('117', 'Luar Negeri', '71', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('118', 'Luar Negeri', '72', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('119', 'Luar Negeri', '73', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('120', 'Luar Negeri', '74', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('121', 'Luar Negeri', '75', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('122', 'Luar Negeri', '76', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('123', 'Luar Negeri', '77', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('124', 'Luar Negeri', '78', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('125', 'Luar Negeri', '79', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('126', 'Luar Negeri', '80', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('127', 'Luar Negeri', '81', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('128', 'Luar Negeri', '82', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('129', 'Luar Negeri', '83', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('130', 'Luar Negeri', '84', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('131', 'Luar Negeri', '85', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('132', 'Luar Negeri', '86', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('133', 'Luar Negeri', '88', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('134', 'Luar Negeri', '89', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('135', 'Luar Negeri', '90', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('136', 'Luar Negeri', '91', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('137', 'Luar Negeri', '92', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('138', 'Luar Negeri', '93', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('139', 'Luar Negeri', '94', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('140', 'Luar Negeri', '95', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('141', 'Luar Negeri', '96', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('142', 'Luar Negeri', '97', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('143', 'Luar Negeri', '98', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('144', 'Luar Negeri', '99', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('145', 'Luar Negeri', '100', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('146', 'Luar Negeri', '101', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('147', 'Luar Negeri', '102', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('148', 'Luar Negeri', '103', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('149', 'Luar Negeri', '104', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('150', 'Luar Negeri', '105', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('151', 'Luar Negeri', '106', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('152', 'Luar Negeri', '107', '0', null, null, null, '2022-07-12 14:14:16', '0', '0');
INSERT INTO `propinsi`
VALUES ('190', 'Luar Negeri', '108', '0', null, null, null, '2022-07-18 09:06:07', '0', '0');

-- ----------------------------
-- Table structure for psb_calonsiswa_attachment
-- ----------------------------
DROP TABLE IF EXISTS `psb_calonsiswa_attachment`;
CREATE TABLE `psb_calonsiswa_attachment`
(
    `replid`        int(10) unsigned    NOT NULL AUTO_INCREMENT,
    `idcalonsiswa`  int(100)            NOT NULL,
    `file`          varchar(500) CHARACTER SET utf8 DEFAULT NULL,
    `newfile`       varchar(500) CHARACTER SET utf8 DEFAULT NULL,
    `aktif`         tinyint(1) unsigned NOT NULL,
    `created_date`  datetime                        DEFAULT NULL,
    `created_by`    varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `modified_date` datetime                        DEFAULT NULL,
    `modified_by`   varchar(200) CHARACTER SET utf8 DEFAULT NULL,
    `iddokumentipe` tinyint(4)                      DEFAULT NULL,
    PRIMARY KEY (`replid`)
) ENGINE = MyISAM
  AUTO_INCREMENT = 1975
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of psb_calonsiswa_attachment
-- ----------------------------

-- ----------------------------
-- Table structure for siswa_syarat
-- ----------------------------
DROP TABLE IF EXISTS `siswa_syarat`;
CREATE TABLE `siswa_syarat`
(
    `repid`      int(10)       NOT NULL AUTO_INCREMENT,
    `syarat_id`  int(10)       NOT NULL,
    `siswa_id`   int(10)       NOT NULL,
    `keterangan` varchar(1000) NOT NULL DEFAULT '',
    `jml_terima` int(3)                 DEFAULT NULL,
    PRIMARY KEY (`repid`)
) ENGINE = InnoDB
  AUTO_INCREMENT = 73545
  DEFAULT CHARSET = latin1;

-- ----------------------------
-- Records of siswa_syarat
-- ----------------------------

-- ----------------------------
-- Table structure for syarat
-- ----------------------------
DROP TABLE IF EXISTS `syarat`;
CREATE TABLE `syarat`
(
    `replid` int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `syarat` varchar(100)         NOT NULL,
    `ts`     timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`  smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync` tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `jumlah` tinyint(3)                    DEFAULT NULL,
    `uom`    char(100)                     DEFAULT NULL,
    `aktif`  tinyint(4)                    DEFAULT NULL,
    `allcpd` tinyint(4)                    DEFAULT '0',
    `upload` tinyint(4)                    DEFAULT '0',
    `urutan` tinyint(2) unsigned           DEFAULT NULL,
    PRIMARY KEY (`replid`),
    UNIQUE KEY `UX_minat` (`replid`) USING BTREE,
    KEY `IX_minat_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 25
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of syarat
-- ----------------------------
INSERT INTO `syarat`
VALUES ('1', 'Foto Copy Kartu Keluarga ', '2013-02-09 00:06:03', '0', '0', '3', 'Lembar', '1', '1', '1', '100');
INSERT INTO `syarat`
VALUES ('2', 'Legalisir Ijazah Terakhir', '2013-02-09 00:07:01', '0', '0', '3', 'Lembar', '1', '0', '1', '100');
INSERT INTO `syarat`
VALUES ('3', 'Legalisir SKHU Terakhir', '2013-02-09 00:07:22', '0', '0', '3', 'Lembar', '1', '0', '1', '100');
INSERT INTO `syarat`
VALUES ('4', 'Legalisir Raport Terakhir', '2013-02-09 00:07:41', '0', '0', '3', 'Lembar', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('5', 'Foto Copy Akte Kelahiran', '2013-02-09 00:08:10', '0', '0', '3', 'Lembar', '1', '1', '1', '100');
INSERT INTO `syarat`
VALUES ('6', 'Foto 2x3 ', '2013-02-09 00:08:52', '0', '0', '10', 'Lembar', '1', '1', '0', '100');
INSERT INTO `syarat`
VALUES ('7', 'Foto 3x4 ', '2013-02-09 00:09:45', '0', '0', '10', 'Lembar', '1', '1', '0', '100');
INSERT INTO `syarat`
VALUES ('8', 'Foto 4x6 ', '2013-02-09 00:10:39', '0', '0', '10', 'Lembar', '1', '1', '0', '100');
INSERT INTO `syarat`
VALUES ('9', 'Hasil MCU / Test Urin', '2013-05-29 07:15:28', '0', '0', '1', 'Lembar', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('10', 'Foto Copy KTP Orangtua', '2013-09-16 10:38:39', '0', '0', '3', 'Lembar', '1', '1', '1', '100');
INSERT INTO `syarat`
VALUES ('11', 'CD Foto', '2013-09-16 10:38:45', '0', '0', '1', 'Keping', '1', '1', '0', '100');
INSERT INTO `syarat`
VALUES ('12', 'Form Tutor Visit', '2013-09-16 10:38:54', '0', '0', '1', 'Berkas', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('13', 'Form Jalur Khusus', '2013-09-16 10:38:59', '0', '0', '1', 'Berkas', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('14', 'Form Persyaratan UNPK SD', '2013-09-16 10:39:27', '0', '0', '1', 'Berkas', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('15', 'Form Psikotes', '2013-09-16 10:39:56', '0', '0', '1', 'Berkas', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('16', 'Surat Pernyataan Orangtua', '2013-09-16 10:40:37', '0', '0', '1', 'Berkas', '0', '1', '1', '100');
INSERT INTO `syarat`
VALUES ('17', 'Form Konseling', '2013-09-16 10:40:49', '0', '0', '1', 'Berkas', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('18', 'Form Biografi', '2013-09-16 10:40:53', '0', '0', '1', 'Berkas', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('19', 'Form Kesehatan', '2013-09-16 10:40:57', '0', '0', '1', 'Berkas', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('20', 'Form Kepuasan Pelanggan', '2013-09-16 10:41:02', '0', '0', '1', 'Berkas', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('21', 'Form Akselerasi', '2013-09-16 10:41:28', '0', '0', '1', 'Berkas', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('22', 'Lain Lain', '2013-09-16 10:42:27', '0', '0', '0', 'Rangkap', '0', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('23', 'Form Double Semester', '2014-03-27 15:23:59', '0', '0', '1', 'Berkas', '1', '0', '0', '100');
INSERT INTO `syarat`
VALUES ('24', 'Bukti Pembayaran Formulir', '2020-05-19 09:08:43', '0', '0', '1', 'Lembar', '1', '1', '1', '1');

-- ----------------------------
-- Table structure for tahunajaran
-- ----------------------------
DROP TABLE IF EXISTS `tahunajaran`;
CREATE TABLE `tahunajaran`
(
    `replid`        int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `tahunajaran`   varchar(50)          NOT NULL,
    `departemen`    varchar(50)          NOT NULL,
    `tglmulai`      date                 NOT NULL,
    `tglakhir`      date                 NOT NULL,
    `aktif`         tinyint(1) unsigned  NOT NULL    DEFAULT '1',
    `keterangan`    varchar(255)                     DEFAULT NULL,
    `info1`         varchar(255)                     DEFAULT NULL,
    `info2`         varchar(255)                     DEFAULT NULL,
    `info3`         varchar(255)                     DEFAULT NULL,
    `ts`            timestamp            NOT NULL    DEFAULT CURRENT_TIMESTAMP,
    `token`         smallint(5) unsigned NOT NULL    DEFAULT '0',
    `issync`        tinyint(1) unsigned  NOT NULL    DEFAULT '0',
    `created_by`    varchar(12) CHARACTER SET latin1 DEFAULT NULL,
    `created_date`  datetime                         DEFAULT NULL,
    `modified_by`   varchar(12) CHARACTER SET latin1 DEFAULT NULL,
    `modified_date` datetime                         DEFAULT NULL,
    `iddepartemen`  int(11)                          DEFAULT NULL,
    `idkepsek`      varchar(30)          NOT NULL,
    `idkonselor`    varchar(30)          NOT NULL    DEFAULT '0',
    `idpsikolog`    varchar(30)                      DEFAULT NULL,
    `aktifdaftar`   tinyint(4)                       DEFAULT NULL,
    `idcompany`     int(11)                          DEFAULT NULL,
    PRIMARY KEY (`replid`),
    KEY `FK_tahunajaran_departemen` (`departemen`) USING BTREE,
    KEY `IX_tahunajaran_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 136
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of tahunajaran
-- ----------------------------
INSERT INTO `tahunajaran`
VALUES ('20', '2013/2014', 'SMA', '2013-07-01', '2014-06-30', '0', 'Tahun Ajaran Ke 7', null, null, null,
        '2022-09-20 14:40:53', '44390', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('21', '2012/2013', 'SMA', '2012-07-01', '2013-06-30', '0', 'Tahun Ajaran Ke 6', null, null, null,
        '2022-09-20 14:40:53', '47026', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('22', '2011/2012', 'SMA', '2011-07-01', '2012-06-30', '0', 'Tahun Ajaran Ke 5', null, null, null,
        '2022-09-20 14:40:53', '44476', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('23', '2010/2011', 'SMA', '2010-07-01', '2011-06-30', '0', 'Tahun Ajaran Ke 4', null, null, null,
        '2022-09-20 14:40:53', '28978', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('24', '2009/2010', 'SMA', '2009-07-01', '2010-06-30', '0', 'Tahun Ajaran Ke 3', null, null, null,
        '2022-09-20 14:40:53', '58252', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('25', '2008/2009', 'SMA', '2008-07-01', '2009-06-30', '0', 'Tahun Ajaran Ke 2', null, null, null,
        '2022-09-20 14:40:53', '14848', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('26', '2007/2008', 'SMA', '2007-07-01', '2008-06-30', '0', 'Tahun Ajaran Ke 1', null, null, null,
        '2022-09-20 14:40:53', '12433', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('27', '2013/2014', 'SMP', '2013-07-01', '2014-06-30', '0', 'Tahun Ajaran Ke 7', '', '', '',
        '2022-09-12 16:59:40', '11971', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('28', '2012/2013', 'SMP', '2012-07-01', '2013-06-30', '0', 'Tahun Ajaran Ke 6', '', '', '',
        '2022-09-12 16:59:40', '15656', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('29', '2011/2012', 'SMP', '2011-07-01', '2012-06-30', '0', 'Tahun Ajaran Ke 5', '', '', '',
        '2022-09-12 16:59:40', '42367', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('30', '2010/2011', 'SMP', '2010-07-01', '2011-06-30', '0', 'Tahun Ajaran Ke 4', '', '', '',
        '2022-09-12 16:59:40', '33805', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('31', '2009/2010', 'SMP', '2009-07-01', '2010-06-30', '0', 'Tahun Ajaran Ke 3', '', '', '',
        '2022-09-12 16:59:40', '41926', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('32', '2008/2009', 'SMP', '2008-07-01', '2009-06-30', '0', 'Tahun Ajaran Ke 2', '', '', '',
        '2022-09-12 16:59:40', '42682', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('33', '2007/2008', 'SMP', '2007-07-01', '2008-06-30', '0', 'Tahun Ajaran Ke 1', '', '', '',
        '2022-09-12 16:59:40', '22102', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('34', '2013/2014', 'SD', '2013-07-01', '2014-06-30', '0', 'Tahun Ajaran Ke 7', '', '', '',
        '2022-09-12 15:05:40', '47995', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('35', '2012/2013', 'SD', '2012-07-01', '2013-06-30', '0', 'Tahun Ajaran Ke 6', '', '', '',
        '2022-09-12 15:05:40', '42607', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('36', '2011/2012', 'SD', '2011-07-01', '2012-06-30', '0', 'Tahun Ajaran Ke 5', '', '', '',
        '2022-09-12 15:05:40', '3522', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('37', '2010/2011', 'SD', '2010-07-01', '2011-06-30', '0', 'Tahun Ajaran Ke 4', '', '', '',
        '2022-09-12 15:05:40', '20845', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('38', '2009/2010', 'SD', '2009-07-01', '2010-06-30', '0', 'Tahun Ajaran Ke 3', '', '', '',
        '2022-09-12 15:05:40', '28131', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('39', '2008/2009', 'SD', '2008-07-01', '2009-06-30', '0', 'Tahun Ajaran Ke 2', '', '', '',
        '2022-09-12 15:05:40', '12589', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('40', '2007/2008', 'SD', '2007-07-01', '2008-06-30', '0', 'Tahun Ajaran Ke 1', '', '', '',
        '2022-09-12 15:05:40', '44083', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('41', '2014/2015', 'SD', '2014-07-01', '2015-06-30', '0', 'Tahun Ajaran Ke 8', null, null, null,
        '2022-09-12 15:05:40', '10704', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('42', '2014/2015', 'SMP', '2014-07-01', '2015-06-30', '0', 'Tahun Ajaran Ke 8', null, null, null,
        '2022-09-12 16:59:40', '39325', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('43', '2014/2015', 'SMA', '2014-07-01', '2015-06-30', '0', 'Tahun Ajaran Ke 8', null, null, null,
        '2022-09-20 14:40:53', '20321', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('44', '2015/2016', 'SD', '2015-07-01', '2016-06-30', '0', 'Tahun Ajaran Ke 9', null, null, null,
        '2022-09-12 15:05:40', '64780', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('45', '2015/2016', 'SMP', '2015-07-01', '2016-06-30', '0', 'Tahun Ajaran Ke 9', null, null, null,
        '2022-09-12 16:59:40', '33767', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('46', '2015/2016', 'SMA', '2015-07-01', '2016-06-30', '0', 'Tahun Ajaran Ke 9', null, null, null,
        '2022-09-20 14:40:53', '64178', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('47', '2016/2017', 'SMA', '2016-07-01', '2017-06-30', '0', 'Tahun Ajaran Ke 10', null, null, null,
        '2022-09-20 14:40:53', '37843', '0', null, null, null, null, null, '101', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('48', '2016/2017', 'SD', '2016-07-01', '2017-06-30', '0', 'Tahun Ajaran Ke 10', null, null, null,
        '2022-09-12 15:05:40', '38051', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('49', '2016/2017', 'SMP', '2016-07-01', '2017-06-30', '0', 'Tahun Ajaran Ke 10', null, null, null,
        '2022-09-12 16:59:40', '52198', '0', null, null, '452', '2021-12-10 14:18:02', null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('50', '2017/2018', 'SMA', '2017-07-01', '2018-06-30', '0', 'Tahun Ajaran ke-11', null, null, null,
        '2022-09-20 14:40:53', '59619', '0', null, null, '453', '2020-10-21 22:41:09', null, '101', '0', '0', null,
        '1');
INSERT INTO `tahunajaran`
VALUES ('51', '2017/2018', 'SMP', '2017-07-01', '2018-06-30', '0', 'Tahun Ajaran ke 11', null, null, null,
        '2022-09-12 16:59:40', '1870', '0', null, null, '452', '2020-08-03 10:37:01', null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('52', '2017/2018', 'SD', '2017-07-01', '2018-06-30', '0', 'Tahun Ajaran Ke 11', null, null, null,
        '2022-09-12 15:05:40', '44134', '0', null, null, null, null, null, '94', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('53', '2017/2018', 'PENSUS', '2017-07-01', '2018-06-30', '0', '', null, null, null, '2020-08-26 16:33:22',
        '60322', '0', null, null, null, null, null, '', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('54', '2018/2019', 'SMP', '2018-07-01', '2019-06-30', '0', 'Tahun Ajaran Ke 12', null, null, null,
        '2022-09-12 16:59:40', '14629', '0', null, null, null, null, null, '42', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('55', '2018/2019', 'SMA', '2018-07-01', '2019-06-30', '0', 'Tahun Ajaran ke-12', null, null, null,
        '2022-09-20 14:40:53', '23240', '0', null, null, '120', '2021-12-10 13:08:38', null, '101', '0', '0', null,
        '1');
INSERT INTO `tahunajaran`
VALUES ('56', '2018/2019', 'SD', '2018-07-01', '2019-06-30', '0', 'Tahum Ajaran Ke 12', null, null, null,
        '2022-09-12 15:05:40', '41852', '0', null, null, '117', '2021-03-12 16:02:55', null, '117', '', '', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('57', '2019/2020', 'SMA', '2019-07-01', '2020-06-30', '0', 'Tahun Ajaran Ke-13', null, null, null,
        '2022-09-20 14:40:53', '4087', '0', null, null, '120', '2021-10-26 10:41:14', null, '101', '383', null, '0',
        '1');
INSERT INTO `tahunajaran`
VALUES ('58', '2019/2020', 'SMP', '2019-07-01', '2020-06-30', '0', 'Tahun Ajaran Ke 13', null, null, null,
        '2022-09-12 16:59:40', '63540', '0', null, null, '452', '2021-11-10 10:17:44', null, '42', '433', '', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('59', '2020/2021', 'SMA', '2020-07-13', '2021-06-30', '0', 'Tahun Ajaran Ke-14', null, null, null,
        '2022-09-20 14:40:53', '32196', '0', null, null, '120', '2022-09-20 14:40:49', null, '158', '383', '236', '0',
        '1');
INSERT INTO `tahunajaran`
VALUES ('60', '2019/2020', 'SD', '2019-07-01', '2020-06-30', '0', 'Tahun Ajaran Ke 13', null, null, null,
        '2022-09-12 15:05:40', '7202', '0', null, null, '31', '2020-08-26 14:27:03', null, '117', '448', '463', '0',
        '1');
INSERT INTO `tahunajaran`
VALUES ('61', '2020/2021', 'SMP', '2020-07-13', '2021-06-30', '0', 'Tahun Ajaran Ke 14', null, null, null,
        '2022-09-12 16:59:40', '44212', '0', null, null, '452', '2021-12-22 15:44:16', null, '134', '433', '475', '0',
        '1');
INSERT INTO `tahunajaran`
VALUES ('62', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', 'Tahun Ajaran Ke 14', null, null, null,
        '2022-09-12 15:05:40', '8874', '0', null, null, '117', '2021-07-27 11:11:25', null, '94', '505', '520', '0',
        '1');
INSERT INTO `tahunajaran`
VALUES ('64', '2018/2019', 'PENSUS', '2018-07-01', '2019-06-30', '0', '', null, null, null, '2020-08-26 16:33:22',
        '21423', '0', null, null, null, null, null, '', '0', '0', null, '1');
INSERT INTO `tahunajaran`
VALUES ('65', '2019/2020', 'PENSUS', '2019-07-01', '2020-06-30', '0', '', null, null, null, '2020-08-26 16:33:22',
        '26302', '0', null, null, '31', '2020-07-09 07:31:39', null, '426', '', '463', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('66', '2020/2021', 'PENSUS', '2020-07-01', '2021-06-30', '0', '', null, null, null, '2020-08-26 16:33:22',
        '22386', '0', '117', '2020-06-26 14:28:50', '117', '2020-08-26 16:33:22', null, '426', '', '463', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('68', '2019/2020', 'SMA', '2019-07-01', '2020-06-30', '0', 'Tahun Ajaran Ke 1', null, null, null,
        '2022-09-15 09:38:05', '50985', '0', null, null, '466', '2021-07-06 11:59:12', null, '470', '477', '', '0',
        '7');
INSERT INTO `tahunajaran`
VALUES ('73', '2019/2020', 'SD', '2019-07-01', '2020-06-30', '0', 'Tahun Ajaran ke 1', null, null, null,
        '2022-09-15 09:34:01', '35299', '0', '466', '2020-07-03 13:39:02', '466', '2020-07-15 15:02:05', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('74', '2019/2020', 'SMP', '2019-07-01', '2020-06-01', '0', 'Tahun Ajaran ke 1', null, null, null,
        '2022-09-15 09:34:28', '62183', '0', '466', '2020-07-03 13:47:48', '466', '2020-07-15 11:07:00', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('75', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', 'Tahun Ajaran ke 2', null, null, null,
        '2022-09-15 09:34:01', '34240', '0', '466', '2020-07-03 13:49:46', '466', '2021-10-12 13:06:49', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('76', '2020/2021', 'SMP', '2020-07-01', '2021-06-30', '0', 'Tahun Ajaran ke 2', null, null, null,
        '2022-09-15 09:34:28', '40537', '0', '466', '2020-07-03 13:50:29', '466', '2021-05-18 13:33:38', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('77', '2020/2021', 'SMA', '2020-07-01', '2021-06-30', '0', 'Tahun Ajaran ke 2', null, null, null,
        '2022-09-15 09:38:05', '17629', '0', '466', '2020-07-03 13:51:12', '31', '2021-05-24 12:53:43', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('79', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', 'Tahun Ajaran ke-1', null, null, null,
        '2022-09-12 16:21:04', '11785', '0', '117', '2020-07-28 12:01:26', '117', '2022-09-12 14:48:01', null, '426',
        '520', '520', '0', '13');
INSERT INTO `tahunajaran`
VALUES ('80', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', 'Tahun Pelajaran ke 17', null, null, null,
        '2022-07-15 10:14:18', '14042', '0', '503', '2020-08-18 19:42:52', '31', '2022-02-16 14:03:46', null, '489',
        '499', '498', '0', '5');
INSERT INTO `tahunajaran`
VALUES ('81', '2020/2021', 'SMP', '2020-07-01', '2021-06-30', '0', 'Tahun Pelajaran ke 17', null, null, null,
        '2022-07-15 10:20:48', '12071', '0', '503', '2020-08-18 19:42:52', '31', '2022-02-16 14:03:56', null, '489',
        '499', '498', '0', '5');
INSERT INTO `tahunajaran`
VALUES ('82', '2020/2021', 'SMA', '2020-07-01', '2021-06-30', '0', 'Tahun Pelajaran ke 17', null, null, null,
        '2022-07-15 10:22:25', '42356', '0', '503', '2020-08-18 19:42:52', '503', '2020-08-18 19:44:31', null, '489',
        '499', '498', '0', '5');
INSERT INTO `tahunajaran`
VALUES ('84', '2019/2020', 'SD', '2019-07-01', '2020-06-30', '0', 'Tahun Pelajaran ke-1', null, null, null,
        '2022-09-12 15:13:45', '27308', '0', null, null, '117', '2020-07-16 11:09:18', null, '', '0', null, '0', '8');
INSERT INTO `tahunajaran`
VALUES ('85', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', 'Tahun Pelajaran ke-2', null, null, null,
        '2022-09-12 15:13:45', '38848', '0', null, null, '117', '2021-02-11 10:46:26', null, '94', '505', '236', '0',
        '8');
INSERT INTO `tahunajaran`
VALUES ('86', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', 'TAHUN PELAJARAN KE-3', null, null, null,
        '2022-09-15 09:34:01', '54175', '0', '466', '2020-08-27 14:23:26', '466', '2022-07-18 11:48:20', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('87', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', 'Tahun Ajaran ke-15', null, null, null,
        '2022-09-12 16:23:23', '60692', '0', '117', '2020-09-15 13:48:30', '117', '2022-09-12 16:23:23', null, '94',
        '505', '236', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('88', '2021/2022', 'SMA', '2021-07-01', '2022-06-30', '0', 'Tahun Ajaran Ke-15', null, null, null,
        '2022-09-20 14:40:53', '27254', '0', '453', '2020-09-15 14:41:11', '120', '2022-09-08 15:44:51', null, '158',
        '597', '520', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('89', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', 'Tahun Pelajaran ke-3', null, null, null,
        '2022-09-12 15:13:45', '41461', '0', '117', '2020-10-01 10:13:43', '117', '2022-09-08 09:36:13', null, '94',
        '505', '236', '0', '8');
INSERT INTO `tahunajaran`
VALUES ('90', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', 'Tahun Ajaran ke-2', null, null, null,
        '2022-09-12 16:21:04', '61918', '0', '117', '2020-10-01 10:21:40', '117', '2022-09-12 14:47:52', null, '426',
        '520', '520', '0', '13');
INSERT INTO `tahunajaran`
VALUES ('91', '2021/2022', 'SMP', '2021-07-01', '2022-06-30', '0', 'Tahun ajaran ke 15', null, null, null,
        '2022-09-12 16:59:40', '15100', '0', '452', '2020-10-01 14:41:34', '117', '2022-09-12 16:24:19', null, '134',
        '433', '534', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('92', '2021/2022', 'SMP', '2021-07-01', '2022-06-01', '0', 'Tahun Pelajaran ke 3', null, null, null,
        '2022-09-15 09:34:28', '8439', '0', '466', '2020-11-02 09:29:02', '466', '2022-07-18 11:49:49', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('93', '2021/2022', 'SMA', '2021-07-01', '2022-06-30', '0', 'Tahun Ajaran ke 3', null, null, null,
        '2022-09-15 09:38:05', '46179', '0', '466', '2020-11-02 09:39:30', '617', '2022-09-13 11:21:46', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('95', '2020/2021', 'SMP', '2020-07-01', '2021-06-30', '0', '', null, null, null, '2022-08-03 09:13:40', '10489',
        '0', '538', '2021-06-03 09:25:36', '538', '2022-06-09 11:27:37', null, '537', '541', '541', '0', '4');
INSERT INTO `tahunajaran`
VALUES ('97', '2020/2021', 'SD', '2020-07-01', '2021-06-30', '0', '', null, null, null, '2022-07-01 09:40:28', '21434',
        '0', '538', '2021-06-09 21:26:57', '538', '2022-02-08 08:53:39', null, '537', '541', '541', '0', '4');
INSERT INTO `tahunajaran`
VALUES ('99', '2021/2022', 'SMA', '2021-07-01', '2022-06-30', '0', '', null, null, null, '2022-08-12 09:05:36', '36469',
        '0', '538', '2021-06-09 22:26:45', '538', '2022-08-12 09:04:06', null, '537', '541', '541', '1', '4');
INSERT INTO `tahunajaran`
VALUES ('100', '2020/2021', 'SMA', '2020-07-01', '2021-06-30', '0', '', null, null, null, '2022-08-12 09:05:36',
        '21571', '0', '538', '2021-06-09 22:28:16', '538', '2021-06-09 22:34:02', null, '537', '541', '541', '1', '4');
INSERT INTO `tahunajaran`
VALUES ('101', '2021/2022', 'SMP', '2021-07-01', '2022-06-30', '0', '', null, null, null, '2022-08-03 09:13:47', '1280',
        '0', '538', '2021-06-09 22:31:44', '538', '2022-08-03 09:13:47', null, '537', '541', '541', '0', '4');
INSERT INTO `tahunajaran`
VALUES ('102', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', '', null, null, null, '2022-08-03 08:42:53', '11979',
        '0', '538', '2021-06-09 22:36:04', '538', '2022-08-03 08:42:53', null, '537', '541', '541', '0', '4');
INSERT INTO `tahunajaran`
VALUES ('103', '2022/2023', 'SD', '2022-07-11', '2023-06-30', '1', 'Tahun Ajaran ke-16', null, null, null,
        '2022-09-12 15:05:40', '40807', '0', '320', '2021-10-26 08:49:59', '320', '2022-09-12 15:05:40', null, '94',
        '505', '564', '1', '1');
INSERT INTO `tahunajaran`
VALUES ('104', '2022/2023', 'SMA', '2022-07-11', '2023-06-30', '1', 'TAHUN AJARAN KE-16', null, null, null,
        '2022-09-20 14:40:53', '14612', '0', '120', '2021-10-26 08:50:30', '120', '2022-09-20 14:40:53', null, '158',
        '597', '520', '1', '1');
INSERT INTO `tahunajaran`
VALUES ('105', '2022/2023', 'SMP', '2022-07-11', '2023-06-30', '1', 'Tahun Ajaran Ke 16', null, null, null,
        '2022-09-22 17:49:09', '55568', '0', '452', '2021-10-26 09:10:57', '117', '2022-09-22 17:49:09', null, '132',
        '433', '534', '1', '1');
INSERT INTO `tahunajaran`
VALUES ('106', '2022/2023', 'SD', '2022-07-11', '2023-06-30', '1', 'Tahun Ajaran ke-3', null, null, null,
        '2022-09-12 16:21:04', '48761', '0', '117', '2021-10-26 09:33:44', '117', '2022-09-12 16:21:04', null, '426',
        '520', '564', '1', '13');
INSERT INTO `tahunajaran`
VALUES ('107', '2022/2023', 'SD', '2022-07-11', '2023-06-30', '1', 'Tahun Pelajaran ke-4', null, null, null,
        '2022-09-12 15:13:45', '45499', '0', '320', '2021-10-26 10:50:13', '320', '2022-09-12 15:13:45', null, '94',
        '505', '520', '1', '8');
INSERT INTO `tahunajaran`
VALUES ('108', '2022/2023', 'SD', '2022-07-01', '2023-06-30', '0', 'Tahun Pelajaran ke 4', null, null, null,
        '2022-09-15 09:36:34', '46043', '0', '562', '2021-10-27 11:00:18', '616', '2022-09-15 09:36:34', null, '470',
        '477', '', '1', '7');
INSERT INTO `tahunajaran`
VALUES ('109', '2022/2023', 'SMP', '2022-07-01', '2023-06-30', '0', 'Tahun Ajaran ke 4', null, null, null,
        '2022-09-15 09:36:28', '60246', '0', '562', '2021-10-27 11:03:03', '616', '2022-09-15 09:36:28', null, '470',
        '477', '', '1', '7');
INSERT INTO `tahunajaran`
VALUES ('110', '2022/2023', 'SMA', '2022-07-01', '2023-06-30', '0', 'Tahun Ajaran ke 4', null, null, null,
        '2022-09-15 09:38:05', '22084', '0', '562', '2021-10-27 11:04:49', '616', '2022-09-15 09:38:05', null, '470',
        '477', '', '1', '7');
INSERT INTO `tahunajaran`
VALUES ('112', '2022/2023', 'SMP', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-09-15 08:48:16',
        '38954', '0', '538', '2021-12-23 15:53:32', '538', '2022-09-15 08:48:16', null, '537', '593', '593', '1', '4');
INSERT INTO `tahunajaran`
VALUES ('113', '2022/2023', 'SMA', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-08-12 09:05:36',
        '60897', '0', '538', '2021-12-23 15:54:56', '538', '2022-08-12 09:05:36', null, '537', '541', '541', '1', '4');
INSERT INTO `tahunajaran`
VALUES ('114', '2021/2022', 'SD', '2021-07-01', '2022-06-30', '0', 'Tahun Pelajaran ke 18', null, null, null,
        '2022-07-15 10:14:18', '20951', '0', '503', '2020-08-18 19:42:52', '503', '2022-04-07 14:42:25', null, '158',
        '505', '564', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('115', '2021/2022', 'SMP', '2021-07-01', '2022-06-30', '0', 'Tahun Pelajaran ke 18', null, null, null,
        '2022-07-15 10:20:48', '37101', '0', '503', '2020-08-18 19:42:52', '503', '2022-04-07 14:42:40', null, '158',
        '433', '534', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('116', '2021/2022', 'SMA', '2021-07-01', '2022-06-30', '0', 'Tahun Pelajaran ke 18', null, null, null,
        '2022-07-15 10:22:25', '57120', '0', '503', '2020-08-18 19:42:52', '503', '2022-04-07 14:42:11', null, '158',
        '383', '534', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('118', '2022/2023', 'SD', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-08-09 09:17:17', '36134',
        '0', '538', '2022-07-01 09:40:28', '538', '2022-08-09 09:17:17', null, '537', '593', '541', '1', '4');
INSERT INTO `tahunajaran`
VALUES ('119', '2022/2023', 'SD', '2022-07-01', '2023-06-30', '1', 'Tahun Pelajaran ke-19', null, null, null,
        '2022-07-15 10:15:42', '22001', '0', '503', '2022-07-15 10:14:18', '503', '2022-07-15 10:15:42', null, '158',
        '505', '564', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('120', '2022/2023', 'SMP', '2022-07-01', '2023-06-30', '1', 'Tahun Pelajaran ke-19', null, null, null,
        '2022-07-15 10:20:48', '63442', '0', '503', '2022-07-15 10:20:48', '503', '2022-07-15 10:20:48', null, '158',
        '433', '534', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('121', '2022/2023', 'SMA', '2022-07-01', '2023-06-30', '1', 'Tahun Pelajaran ke-19', null, null, null,
        '2022-07-15 10:22:25', '39731', '0', '503', '2022-07-15 10:22:25', '503', '2022-07-15 10:22:25', null, '158',
        '383', '534', '1', '5');
INSERT INTO `tahunajaran`
VALUES ('122', '2022/2023', 'SD', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-09-08 15:25:53', '45455',
        '0', '516', '2022-09-08 15:24:53', '516', '2022-09-08 15:25:53', null, '173', '', '564', '1', '15');
INSERT INTO `tahunajaran`
VALUES ('123', '2022/2023', 'SMP', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-09-08 15:27:48',
        '44090', '0', '516', '2022-09-08 15:27:48', '516', '2022-09-08 15:27:48', null, '173', '', '534', '1', '15');
INSERT INTO `tahunajaran`
VALUES ('124', '2022/2023', 'SMA', '2022-07-01', '2023-06-30', '1', '', null, null, null, '2022-09-08 15:29:56',
        '14097', '0', '516', '2022-09-08 15:29:56', '516', '2022-09-08 15:29:56', null, '173', '', '520', '1', '15');
INSERT INTO `tahunajaran`
VALUES ('125', '2023/2024', 'SD', '2023-07-01', '2024-06-30', '0', 'Tahun Ajaran ke-17', null, null, null,
        '2022-09-12 16:23:13', '10087', '0', '320', '2022-09-12 14:07:11', '117', '2022-09-12 16:23:13', null, '94',
        '505', '564', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('126', '2023/2024', 'SD', '2023-07-01', '2024-06-30', '0', 'Tahun Ajaran ke-4', null, null, null,
        '2022-09-12 16:21:40', '65476', '0', '117', '2022-09-12 14:45:46', '117', '2022-09-12 16:21:40', null, '426',
        '520', '564', '0', '13');
INSERT INTO `tahunajaran`
VALUES ('127', '2023/2024', 'SMA', '2023-07-01', '2024-06-01', '0', 'TAHUN AJARAN KE-17', null, null, null,
        '2022-09-20 14:40:53', '64458', '0', '120', '2022-09-12 14:47:08', '120', '2022-09-12 15:46:48', null, '134',
        '597', '520', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('128', '2023/2024', 'SD', '2023-07-01', '2024-06-30', '0', '', null, null, null, '2022-09-12 15:13:45', '21580',
        '0', '320', '2022-09-12 15:07:04', '320', '2022-09-12 15:13:43', null, '94', '505', '564', '0', '8');
INSERT INTO `tahunajaran`
VALUES ('129', '2023/2024', 'SMP', '2023-07-01', '2024-06-30', '0', 'Tahun Ajaran Ke-17', null, null, null,
        '2022-09-22 17:50:31', '19345', '0', '117', '2022-09-12 16:26:59', '117', '2022-09-22 17:50:31', null, '132',
        '433', '534', '0', '1');
INSERT INTO `tahunajaran`
VALUES ('133', '2023/2024', 'SD', '2023-07-01', '2024-06-30', '1', 'TAHUN AJARAN KE - 5', null, null, null,
        '2022-09-15 09:36:38', '44436', '0', '617', '2022-09-13 11:35:00', '616', '2022-09-15 09:36:38', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('134', '2023/2024', 'SMP', '2023-07-01', '2024-06-30', '1', 'TAHUN AJARAN KE-5', null, null, null,
        '2022-09-15 09:36:26', '32974', '0', '617', '2022-09-13 11:40:41', '616', '2022-09-15 09:36:26', null, '470',
        '477', '', '0', '7');
INSERT INTO `tahunajaran`
VALUES ('135', '2023/2024', 'SMA', '2023-07-01', '2023-06-30', '0', 'TAHUN AJARAN KE-5', null, null, null,
        '2022-09-15 09:38:05', '31563', '0', '617', '2022-09-13 11:42:27', '616', '2022-09-15 09:36:53', null, '470',
        '477', '', '0', '7');

-- ----------------------------
-- Table structure for tempattinggal
-- ----------------------------
DROP TABLE IF EXISTS `tempattinggal`;
CREATE TABLE `tempattinggal`
(
    `replid` int(10) unsigned    NOT NULL AUTO_INCREMENT,
    `nama`   varchar(200)        NOT NULL,
    `urutan` tinyint(1) unsigned NOT NULL DEFAULT '0',
    `aktif`  tinyint(4)                   DEFAULT NULL,
    PRIMARY KEY (`replid`, `nama`),
    UNIQUE KEY `UX_agama` (`replid`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 10
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of tempattinggal
-- ----------------------------
INSERT INTO `tempattinggal`
VALUES ('1', 'Bersama Kedua Orangtua', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('2', 'Bersama Ayah', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('3', 'Bersama Ibu', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('4', 'Bersama Wali', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('5', 'Kost', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('6', 'Asrama', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('7', 'Panti Asuhan', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('8', 'Pesantren', '0', '1');
INSERT INTO `tempattinggal`
VALUES ('9', 'Lainnya', '0', '1');

-- ----------------------------
-- Table structure for tingkat
-- ----------------------------
DROP TABLE IF EXISTS `tingkat`;
CREATE TABLE `tingkat`
(
    `replid`        int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `tingkat`       varchar(50)          NOT NULL,
    `departemen`    varchar(50)          NOT NULL,
    `aktif`         tinyint(1) unsigned  NOT NULL DEFAULT '1',
    `keterangan`    varchar(255)                  DEFAULT NULL,
    `urutan`        tinyint(2) unsigned  NOT NULL DEFAULT '0',
    `info1`         varchar(255)                  DEFAULT NULL,
    `info2`         varchar(255)                  DEFAULT NULL,
    `info3`         varchar(255)                  DEFAULT NULL,
    `ts`            timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`         smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`        tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `created_date`  datetime                      DEFAULT NULL,
    `created_by`    varchar(200)                  DEFAULT NULL,
    `modified_date` datetime                      DEFAULT NULL,
    `modified_by`   varchar(200)                  DEFAULT NULL,
    `idkesetaraan`  tinyint(4)                    DEFAULT NULL,
    `fase`          char(1)                       DEFAULT NULL,
    PRIMARY KEY (`replid`),
    KEY `FK_tingkat_departemen` (`departemen`) USING BTREE,
    KEY `IX_tingkat_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 20
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of tingkat
-- ----------------------------
INSERT INTO `tingkat`
VALUES ('1', '10', 'SMA', '1', 'Kelas 10 SMA', '12', null, null, null, '2022-08-25 13:34:14', '46813', '0', null, null,
        null, null, '5', 'E');
INSERT INTO `tingkat`
VALUES ('2', '11', 'SMA', '1', 'Kelas 11 SMA', '13', null, null, null, '2022-08-25 13:34:16', '20445', '0', null, null,
        null, null, '5', 'F');
INSERT INTO `tingkat`
VALUES ('3', '12', 'SMA', '1', 'Kelas 12 SMA', '14', null, null, null, '2022-08-25 13:34:17', '2671', '0', null, null,
        null, null, '6', 'F');
INSERT INTO `tingkat`
VALUES ('4', '7', 'SMP', '1', 'Kelas 7 SMP', '8', '', '', '', '2022-08-25 13:34:26', '65141', '0', null, null, null,
        null, '3', 'D');
INSERT INTO `tingkat`
VALUES ('5', '8', 'SMP', '1', 'Kelas 8 SMP', '9', '', '', '', '2022-08-25 13:34:28', '26767', '0', null, null, null,
        null, '3', 'D');
INSERT INTO `tingkat`
VALUES ('6', '9', 'SMP', '1', 'Kelas 9 SMP', '10', '', '', '', '2022-08-25 13:34:29', '3943', '0', null, null, null,
        null, '4', 'D');
INSERT INTO `tingkat`
VALUES ('7', '1', 'SD', '1', 'Kelas 1 SD', '1', '', '', '', '2022-08-25 13:36:39', '4944', '0', null, null,
        '2022-01-20 14:41:25', '173', '1', 'A');
INSERT INTO `tingkat`
VALUES ('8', '2', 'SD', '1', 'Kelas 2 SD', '2', '', '', '', '2022-08-25 13:36:40', '12888', '0', null, null, null, null,
        '1', 'A');
INSERT INTO `tingkat`
VALUES ('9', '3', 'SD', '1', 'Kelas 3 SD', '3', '', '', '', '2022-08-25 13:36:41', '49608', '0', null, null, null, null,
        '1', 'B');
INSERT INTO `tingkat`
VALUES ('10', '4', 'SD', '1', 'Kelas 4 SD', '4', '', '', '', '2022-08-25 13:36:48', '12787', '0', null, null, null,
        null, '2', 'B');
INSERT INTO `tingkat`
VALUES ('11', '5', 'SD', '1', 'Kelas 5 SD', '5', '', '', '', '2022-08-25 13:36:51', '46172', '0', null, null, null,
        null, '2', 'C');
INSERT INTO `tingkat`
VALUES ('12', '6', 'SD', '1', 'Kelas 6 SD', '6', '', '', '', '2022-08-25 13:36:52', '61435', '0', null, null, null,
        null, '2', 'C');
INSERT INTO `tingkat`
VALUES ('14', '0', 'SD', '1', 'Kelas Preschool', '0', null, null, null, '2022-01-11 13:32:31', '45381', '0', null, null,
        '2020-07-20 10:47:14', '31', null, null);
INSERT INTO `tingkat`
VALUES ('15', '00', 'SMP', '0', 'Kelas Terapi SMP', '7', null, null, null, '2020-05-19 14:39:56', '5875', '0', null,
        null, null, null, null, null);
INSERT INTO `tingkat`
VALUES ('16', '000', 'SMA', '0', 'Kelas Terapi SMA', '11', null, null, null, '2020-05-19 14:40:11', '24293', '0', null,
        null, null, null, null, null);
INSERT INTO `tingkat`
VALUES ('17', '0', 'PENSUS', '0', 'Tingkat 0', '0', null, null, null, '2021-09-20 11:42:27', '58524', '0', null, null,
        null, null, null, null);
INSERT INTO `tingkat`
VALUES ('18', '0', 'TK', '1', 'Tingkat TK', '0', null, null, null, '2020-07-06 13:04:55', '861', '0', null, null, null,
        null, null, null);
INSERT INTO `tingkat`
VALUES ('19', '0', 'PAUD', '1', 'Tingkat PAUD', '0', null, null, null, '2020-08-11 15:25:02', '54330', '0', null, null,
        null, null, null, null);

-- ----------------------------
-- Table structure for tingkatpendidikan
-- ----------------------------
DROP TABLE IF EXISTS `tingkatpendidikan`;
CREATE TABLE `tingkatpendidikan`
(
    `replid`     int(10) unsigned     NOT NULL AUTO_INCREMENT,
    `pendidikan` varchar(20)          NOT NULL,
    `info1`      varchar(255)                  DEFAULT NULL,
    `info2`      varchar(255)                  DEFAULT NULL,
    `info3`      varchar(255)                  DEFAULT NULL,
    `ts`         timestamp            NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `token`      smallint(5) unsigned NOT NULL DEFAULT '0',
    `issync`     tinyint(1) unsigned  NOT NULL DEFAULT '0',
    `aktif`      tinyint(4)                    DEFAULT NULL,
    `urutan`     tinyint(4)                    DEFAULT NULL,
    PRIMARY KEY (`pendidikan`),
    UNIQUE KEY `UX_tingkatpendidikan` (`replid`) USING BTREE,
    KEY `IX_tingkatpendidikan_ts` (`ts`, `issync`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 55
  DEFAULT CHARSET = utf8;

-- ----------------------------
-- Records of tingkatpendidikan
-- ----------------------------
INSERT INTO `tingkatpendidikan`
VALUES ('39', 'AKABRI', null, null, null, '2021-03-30 12:53:48', '634', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('33', 'Akademi', null, null, null, '2021-03-30 12:54:08', '45949', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('40', 'Akademi Management', null, null, null, '2021-03-30 12:54:05', '22150', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('34', 'AKADEMI MILITER', null, null, null, '2021-03-30 12:54:03', '56659', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('25', 'D1', null, null, null, '2021-03-30 12:51:17', '26946', '0', '1', '6');
INSERT INTO `tingkatpendidikan`
VALUES ('29', 'D2', null, null, null, '2021-03-30 12:51:17', '46327', '0', '1', '6');
INSERT INTO `tingkatpendidikan`
VALUES ('24', 'D3', null, null, null, '2021-03-30 12:51:17', '50668', '0', '1', '6');
INSERT INTO `tingkatpendidikan`
VALUES ('30', 'D4', null, null, null, '2021-03-30 12:51:17', '59556', '0', '1', '6');
INSERT INTO `tingkatpendidikan`
VALUES ('38', 'Kindergarden', null, null, null, '2021-03-30 12:52:19', '8833', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('44', 'MBA', null, null, null, '2021-03-30 12:54:32', '27700', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('46', 'Paket A', null, null, null, '2021-03-30 12:52:09', '43764', '0', '0', '3');
INSERT INTO `tingkatpendidikan`
VALUES ('47', 'Paket B', null, null, null, '2021-03-30 12:52:10', '27065', '0', '0', '4');
INSERT INTO `tingkatpendidikan`
VALUES ('48', 'Paket C', null, null, null, '2021-03-30 12:52:11', '4033', '0', '0', '5');
INSERT INTO `tingkatpendidikan`
VALUES ('45', 'PAUD', null, null, null, '2021-03-30 12:51:24', '63918', '0', '0', '1');
INSERT INTO `tingkatpendidikan`
VALUES ('54', 'Profesi', null, null, null, '2021-03-30 12:51:17', '23568', '0', '1', '10');
INSERT INTO `tingkatpendidikan`
VALUES ('35', 'Profesi Dokter', null, null, null, '2021-03-30 12:51:17', '62687', '0', '1', null);
INSERT INTO `tingkatpendidikan`
VALUES ('43', 'Professor', null, null, null, '2021-03-30 12:51:17', '52121', '0', '1', null);
INSERT INTO `tingkatpendidikan`
VALUES ('23', 'S1', null, null, null, '2021-03-30 12:51:17', '41443', '0', '1', '7');
INSERT INTO `tingkatpendidikan`
VALUES ('22', 'S2', null, null, null, '2021-03-30 12:51:17', '55209', '0', '1', '8');
INSERT INTO `tingkatpendidikan`
VALUES ('49', 'S2 Terapan', null, null, null, '2021-03-30 12:51:17', '4501', '0', '1', '8');
INSERT INTO `tingkatpendidikan`
VALUES ('21', 'S3', null, null, null, '2021-03-30 12:51:17', '20656', '0', '1', '9');
INSERT INTO `tingkatpendidikan`
VALUES ('53', 'S3 Terapan', null, null, null, '2021-03-30 12:51:17', '36007', '0', '1', '9');
INSERT INTO `tingkatpendidikan`
VALUES ('42', 'Sarjana Muda', null, null, null, '2021-03-30 12:51:38', '1329', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('28', 'SD/Sederajat', null, null, null, '2021-03-30 12:52:02', '3183', '0', '1', '3');
INSERT INTO `tingkatpendidikan`
VALUES ('26', 'SMA/SMK/Sederajat', null, null, null, '2021-03-30 12:52:38', '19478', '0', '1', '5');
INSERT INTO `tingkatpendidikan`
VALUES ('32', 'SMK', null, null, null, '2021-03-30 12:52:41', '57443', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('27', 'SMP/Sederajat', null, null, null, '2021-03-30 12:51:59', '22307', '0', '1', '4');
INSERT INTO `tingkatpendidikan`
VALUES ('51', 'SP-1', null, null, null, '2021-03-30 12:52:47', '38517', '0', '0', '10');
INSERT INTO `tingkatpendidikan`
VALUES ('52', 'SP-2', null, null, null, '2021-03-30 12:52:48', '30312', '0', '0', '10');
INSERT INTO `tingkatpendidikan`
VALUES ('37', 'STBA', null, null, null, '2021-03-30 12:51:17', '21013', '0', '1', null);
INSERT INTO `tingkatpendidikan`
VALUES ('31', 'Tidak Ada Data', null, null, null, '2021-03-30 12:52:54', '3793', '0', '0', null);
INSERT INTO `tingkatpendidikan`
VALUES ('50', 'Tidak Sekolah', null, null, null, '2021-03-30 12:52:56', '10404', '0', '0', '0');
INSERT INTO `tingkatpendidikan`
VALUES ('36', 'TK', null, null, null, '2021-03-30 12:53:01', '23167', '0', '0', '2');
INSERT INTO `tingkatpendidikan`
VALUES ('41', 'Universitas', null, null, null, '2021-03-30 12:53:04', '53538', '0', '0', null);


CREATE TABLE users
(
    `replid`         int unsigned                NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `email`          varchar(255)                NOT NULL UNIQUE,
    `password` varchar(255)                NOT NULL,
    `role`           ENUM ('orang_tua', 'siswa') NOT NULL,
    `created_date`   datetime                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by`     varchar(200),
    `modified_date`  datetime                    NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `modified_by`    varchar(200)
);


ALTER TABLE hrm_company
    ADD COLUMN jenis_pendidikan VARCHAR(10);


ALTER TABLE hrm_company
    ADD COLUMN background_image VARCHAR(255);

ALTER TABLE online_kronologis
    ADD COLUMN iduser int unsigned;

ALTER TABLE online_kronologis
    ADD FOREIGN KEY (iduser) REFERENCES users (replid);

ALTER TABLE online_kronologies
    ADD CONSTRAINT unique_iduser UNIQUE (iduser);

ALTER TABLE calonsiswa
    ADD COLUMN lingkarkepala  decimal(4, 1) unsigned default 0.0 ;

DROP TRIGGER IF EXISTS `fsync_trins_20_agama`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_agama`
    BEFORE INSERT
    ON `agama`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_agama`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_agama`
    BEFORE UPDATE
    ON `agama`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_agama`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_agama`
    AFTER DELETE
    ON `agama`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsumum',
            tablename = 'agama',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_calonsiswa`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_calonsiswa`
    BEFORE INSERT
    ON `calonsiswa`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_calonsiswa`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_calonsiswa`
    BEFORE UPDATE
    ON `calonsiswa`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_departemen`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_departemen`
    BEFORE INSERT
    ON `departemen`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_departemen`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_departemen`
    BEFORE UPDATE
    ON `departemen`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_departemen`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_departemen`
    AFTER DELETE
    ON `departemen`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsakad',
            tablename = 'departemen',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_jenispekerjaan`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_jenispekerjaan`
    BEFORE INSERT
    ON `jenispekerjaan`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_jenispekerjaan`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_jenispekerjaan`
    BEFORE UPDATE
    ON `jenispekerjaan`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_jenispekerjaan`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_jenispekerjaan`
    AFTER DELETE
    ON `jenispekerjaan`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsumum',
            tablename = 'jenispekerjaan',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_kelas`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_kelas`
    BEFORE INSERT
    ON `kelas`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_kelas`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_kelas`
    BEFORE UPDATE
    ON `kelas`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_kelas`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_kelas`
    AFTER DELETE
    ON `kelas`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsakad',
            tablename = 'kelas',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_kelompokcalonsiswa`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_kelompokcalonsiswa`
    BEFORE INSERT
    ON `kelompokcalonsiswa`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_kelompokcalonsiswa`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_kelompokcalonsiswa`
    BEFORE UPDATE
    ON `kelompokcalonsiswa`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_kelompokcalonsiswa`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_kelompokcalonsiswa`
    AFTER DELETE
    ON `kelompokcalonsiswa`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsakad',
            tablename = 'kelompokcalonsiswa',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_tahunajaran`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_tahunajaran`
    BEFORE INSERT
    ON `tahunajaran`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_tahunajaran`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_tahunajaran`
    BEFORE UPDATE
    ON `tahunajaran`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_tahunajaran`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_tahunajaran`
    AFTER DELETE
    ON `tahunajaran`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsakad',
            tablename = 'tahunajaran',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_tingkat`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_tingkat`
    BEFORE INSERT
    ON `tingkat`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_tingkat`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_tingkat`
    BEFORE UPDATE
    ON `tingkat`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_tingkat`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_tingkat`
    AFTER DELETE
    ON `tingkat`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsakad',
            tablename = 'tingkat',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trins_20_tingkatpendidikan`;
DELIMITER;;
CREATE TRIGGER `fsync_trins_20_tingkatpendidikan`
    BEFORE INSERT
    ON `tingkatpendidikan`
    FOR EACH ROW SET NEW.token = FLOOR(1 + (RAND() * 65530))
;
;;
DELIMITER;
DROP TRIGGER IF EXISTS `fsync_trupd_20_tingkatpendidikan`;
DELIMITER;;
CREATE TRIGGER `fsync_trupd_20_tingkatpendidikan`
    BEFORE UPDATE
    ON `tingkatpendidikan`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        IF OLD.issync = 1 THEN
            SET NEW.issync = 0;
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
        IF
            OLD.issync = 0 AND NEW.issync = 0 THEN
            SET NEW.ts = CURRENT_TIMESTAMP;
        END IF;
    END IF;
END
;;
DELIMITER ;
DROP TRIGGER IF EXISTS `fsync_trdel_20_tingkatpendidikan`;
DELIMITER;;
CREATE TRIGGER `fsync_trdel_20_tingkatpendidikan`
    AFTER DELETE
    ON `tingkatpendidikan`
    FOR EACH ROW
BEGIN
    IF @DISABLE_TRIGER IS NULL THEN
        INSERT INTO jbsclient.deleteddata
        SET token     = FLOOR(1 + (RAND() * 65530)),
            dbname    = 'jbsumum',
            tablename = 'tingkatpendidikan',
            dataid    = OLD.replid,
            datatoken = OLD.token;
    END IF;
END
;;
DELIMITER ;
SET
    FOREIGN_KEY_CHECKS = 1;
