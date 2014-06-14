-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jun 14, 2014 at 10:25 AM
-- Server version: 5.5.27
-- PHP Version: 5.4.7

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `kkcosmetic`
--

-- --------------------------------------------------------

--
-- Table structure for table `barang`
--

CREATE TABLE IF NOT EXISTS `barang` (
  `kode_brg` int(5) NOT NULL,
  `nama_brg` varchar(50) NOT NULL,
  `harga_satuan` int(11) NOT NULL,
  `stok_brg` int(11) NOT NULL,
  PRIMARY KEY (`kode_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `barang`
--

INSERT INTO `barang` (`kode_brg`, `nama_brg`, `harga_satuan`, `stok_brg`) VALUES
(1, 'Bedak', 23000, 10),
(2, 'sabun', 2000, 10),
(3, 'shampo', 2000, 10);

-- --------------------------------------------------------

--
-- Table structure for table `brgkeluar_detail`
--

CREATE TABLE IF NOT EXISTS `brgkeluar_detail` (
  `id_bk` int(5) NOT NULL,
  `no_faktur` int(50) NOT NULL,
  `kode_brg` int(5) NOT NULL,
  `jum_brg` int(5) NOT NULL,
  PRIMARY KEY (`id_bk`),
  KEY `kode_brg` (`kode_brg`),
  KEY `kode_brg_2` (`kode_brg`),
  KEY `no_faktur` (`no_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brgmasuk_detail`
--

CREATE TABLE IF NOT EXISTS `brgmasuk_detail` (
  `id_bm` int(5) NOT NULL AUTO_INCREMENT,
  `no_faktur` int(50) NOT NULL,
  `kode_brg` int(5) NOT NULL,
  `jum_brg` int(11) NOT NULL,
  PRIMARY KEY (`id_bm`),
  KEY `kode_brg` (`kode_brg`),
  KEY `no_faktur` (`no_faktur`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Table structure for table `brg_keluar`
--

CREATE TABLE IF NOT EXISTS `brg_keluar` (
  `no_faktur` int(5) NOT NULL,
  `kode_pembeli` int(11) NOT NULL,
  `tgl_trans` date NOT NULL,
  PRIMARY KEY (`no_faktur`),
  KEY `kode_pembeli` (`kode_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `brg_masuk`
--

CREATE TABLE IF NOT EXISTS `brg_masuk` (
  `no_faktur` int(5) NOT NULL,
  `kode_sup` int(11) NOT NULL,
  `tg_trans` date NOT NULL,
  PRIMARY KEY (`no_faktur`),
  KEY `kode_sup` (`kode_sup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `brg_masuk`
--

INSERT INTO `brg_masuk` (`no_faktur`, `kode_sup`, `tg_trans`) VALUES
(1, 1, '2014-06-01');

-- --------------------------------------------------------

--
-- Table structure for table `pembeli`
--

CREATE TABLE IF NOT EXISTS `pembeli` (
  `kode_pembeli` int(5) NOT NULL,
  `nama_pembeli` varchar(50) NOT NULL,
  `alamat` varchar(50) NOT NULL,
  `telp` int(11) NOT NULL,
  PRIMARY KEY (`kode_pembeli`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `pembeli`
--

INSERT INTO `pembeli` (`kode_pembeli`, `nama_pembeli`, `alamat`, `telp`) VALUES
(1, 'Rusdi', 'Padang', 4),
(2, 'Nisa', 'Padang', 751345678);

-- --------------------------------------------------------

--
-- Table structure for table `supplier`
--

CREATE TABLE IF NOT EXISTS `supplier` (
  `kode_sup` int(5) NOT NULL,
  `nama_sup` varchar(50) NOT NULL,
  `alamat_sup` varchar(50) NOT NULL,
  `telp_sup` double NOT NULL,
  PRIMARY KEY (`kode_sup`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `supplier`
--

INSERT INTO `supplier` (`kode_sup`, `nama_sup`, `alamat_sup`, `telp_sup`) VALUES
(1, 'Pak Hardi', 'Padang', 98765),
(2, 'Pak Dudi', 'Padang', 234567);

-- --------------------------------------------------------

--
-- Table structure for table `temp_brgkeluar`
--

CREATE TABLE IF NOT EXISTS `temp_brgkeluar` (
  `kode_brg` int(5) NOT NULL,
  `jum_brg` int(5) NOT NULL,
  PRIMARY KEY (`kode_brg`),
  KEY `kode_brg` (`kode_brg`),
  KEY `kode_brg_2` (`kode_brg`),
  KEY `kode_brg_3` (`kode_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `temp_brgmasuk`
--

CREATE TABLE IF NOT EXISTS `temp_brgmasuk` (
  `kode_brg` int(5) NOT NULL,
  `jum_brg` int(11) NOT NULL,
  PRIMARY KEY (`kode_brg`),
  KEY `kode_brg` (`kode_brg`),
  KEY `kode_brg_2` (`kode_brg`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `temp_brgmasuk`
--

INSERT INTO `temp_brgmasuk` (`kode_brg`, `jum_brg`) VALUES
(1, 1),
(2, 1),
(3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id_user` int(50) NOT NULL,
  `nama_user` varchar(50) NOT NULL,
  `pass` varchar(50) NOT NULL,
  PRIMARY KEY (`id_user`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `nama_user`, `pass`) VALUES
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `brgkeluar_detail`
--
ALTER TABLE `brgkeluar_detail`
  ADD CONSTRAINT `brgkeluar_detail_ibfk_2` FOREIGN KEY (`no_faktur`) REFERENCES `brg_keluar` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brgkeluar_detail_ibfk_3` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brgmasuk_detail`
--
ALTER TABLE `brgmasuk_detail`
  ADD CONSTRAINT `brgmasuk_detail_ibfk_2` FOREIGN KEY (`no_faktur`) REFERENCES `brg_masuk` (`no_faktur`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `brgmasuk_detail_ibfk_3` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brg_keluar`
--
ALTER TABLE `brg_keluar`
  ADD CONSTRAINT `brg_keluar_ibfk_2` FOREIGN KEY (`kode_pembeli`) REFERENCES `pembeli` (`kode_pembeli`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `brg_masuk`
--
ALTER TABLE `brg_masuk`
  ADD CONSTRAINT `brg_masuk_ibfk_2` FOREIGN KEY (`kode_sup`) REFERENCES `supplier` (`kode_sup`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_brgkeluar`
--
ALTER TABLE `temp_brgkeluar`
  ADD CONSTRAINT `temp_brgkeluar_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `temp_brgmasuk`
--
ALTER TABLE `temp_brgmasuk`
  ADD CONSTRAINT `temp_brgmasuk_ibfk_1` FOREIGN KEY (`kode_brg`) REFERENCES `barang` (`kode_brg`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
