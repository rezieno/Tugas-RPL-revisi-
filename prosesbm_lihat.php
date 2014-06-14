<?php 
include_once 'include/class.php';
include_once 'include/lib.php';

// instansiasi objek user
$user = new User();
// instansiasi objek nsb
$pbm = new ProsesBm();
$bmd = new Barangmasukdetail();

$iduser = $_SESSION['id'];
if (!$user->get_sesi())
{
header("location:index.php");
}
$no_faktur = $_GET['no_faktur'];
$id_sup=$pbm->bacaDataProsesBm('kode_sup', $no_faktur);

// proses hapus data
if (isset($_GET['aksi']))
{
	
	 if ($_GET['aksi'] == 'lihat')
	{
		// baca id_detail nasabah yang akan diedit
		$no_faktur = $_GET['no_faktur'];
		// menampilkan form edit data
		// untuk menampilkan data detil data, gunakan method bacaDataProsesBm()
?>

<link rel="stylesheet" href="kalender/calendar.css" type="text/css">
<script type="text/javascript" src="kalender/calendar.js"></script>
<script type="text/javascript" src="kalender/calendar2.js"></script>



<table width="100%"  border="0" cellspacing="0" cellpadding="3">
	<form name="prosesbm" action="?page=prosesbm_lihat&aksi=update" method="post" onsubmit="return checkForm(this)">
		<input type="hidden" value="<?php echo $pbm->Tampilinfosup('kode_sup',$id_sup); ?>" name="id_sup"/>
        <input type="hidden" value="<?php echo $pbm->bacaDataProsesBm('no_faktur',$no_faktur); ?>" name="no_faktur"/>
		<tr>
			<td width="15%"><div class="tabtxt">No faktur</div></td>
			<td width="2%"><div class="tabtxt">:</div></td>
			<td width="83%">
		   <input name="no_faktur" style="width:100px" type="textfield" class="tfield"  value="<?php echo $pbm->bacaDataProsesBm('no_faktur', $no_faktur); ?>" readonly>
			</td>
    </tr>        
      <tr>
			<td width="15%"><div class="tabtxt">Kode Suplier</div></td>
			<td width="2%"><div class="tabtxt">:</div></td>
			<td width="83%">
				<input name="kode_sup" style="width:200px" type="textfield" class="tfield" value="<?php echo $pbm->bacaDataProsesBm('kode_sup', $no_faktur); ?>"readonly>
			</td>
		</tr>
		  <tr>
			<td><div class="tabtxt">Nama Supplier</div></td>
			<td><div class="tabtxt">:</div></td>
			<td><input style="width:200px" name="nama_sup" type="textfield" class="tfield" readonly="readonly" value="<?php echo $pbm->Tampilinfosup('nama_sup',$id_sup);?>"/></td>
			
		</tr>
		  <tr>
			<td><div class="tabtxt">Alamat Supplier</div></td>
			<td><div class="tabtxt">:</div></td>
			<td><input style="width:200px" name="alamat_sup" type="textfield" class="tfield" readonly="readonly" value="<?php echo $pbm->Tampilinfosup('alamat_sup',$id_sup);?>"/></td>
			
		</tr>
		<tr>
			<td valign="top"><div class="tabtxt">Tanggal Transver</div></td>
			<td valign="top"><div class="tabtxt">:</div></td>
			<td>
				<input name="tg_trans" style="width:200px" type="date" class="tfield" value="<?php echo $pbm->bacaDataProsesBm('tg_trans', $no_faktur); ?>"readonly>
			</td>
		</tr>
	</form>
</table>


<table class="tabholder" border="0" cellspacing="1" cellpadding="0">
	<tr class="tabhead">
		<td align="left" width="30" class="tabtxt">No</td>
		<td align="left" width="30" class="tabtxt">Kode Barang</td>
		<td align="left" width="30" class="tabtxt">Nama Barang</td>
        <td align="left" width="30" class="tabtxt">Jumlah Barang</td>
	</tr>
<?php

$arrayBarangmasukdetail=$bmd->tampilBmdetailSemua();
if($_POST['do']=='lihat'){
$arrayBarangmasukdetail=$bmd->tampilBmdetailSemua();
}


if (count($arrayBarangmasukdetail)) {
	$bmd->tampilBmdetailSemua($_POST['no_faktur']);
  foreach($arrayBarangmasukdetail as $data) {
  
?>
	<tr class="tabcont" >
		<td class="tabtxt" width="30%" align="left"><?php echo $c=$c+1;?>.</td>
		<td class="tabtxt" width="30%" align="left"><?php echo $data['kode_brg'];?></td>
		<td class="tabtxt" width="30%" align="left"><?php echo $data['nama_brg'];?></td>
        <td class="tabtxt" width="30%" align="left"><?php echo $data['jum_brg'];?></td>
	</tr>
<?php 
  } 
} 
else {
  echo 'Barang masuk Tidak Ada!';
}
?>
</table>

<?php
	}
	else if ($_GET['aksi'] == 'update') {
		// update data Proses Barang Masuk via method
		$pbm->updateDataProsesBm($_POST['no_faktur'], $_POST['kode_sup'], $_POST['tg_trans'], $_POST['kode_brg'], $_POST['jum_brg']);
		echo '<META HTTP-EQUIV="Refresh" Content="0; URL=?page=prosesbm">'; 
	}

	

}
?>