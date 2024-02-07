<?php
if ($id != "") {
    $del = $dbo->delete("petugas", "idpetugas=$id");
    if ($del) {
        echo "<script>alert('Hapus Berhasil');location.href='?hal=petugas';</script>";
    }
}
?>
<div class="judul">
    <a href="?hal=add_petugas" class="btn-add"><i class="fa fa-plus"></i> Tambah Data</a>
    <div class="keterangan">Data Petugas</div>
</div>
<div class="data">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <th>No</th>
            <th>Nama Petugas</th>
            <th>Alamat</th>
            <th>No. HP</th>
            <th>Username</th>
            <th>Role</th>
            <th>Edit</th>
            <th>Hapus</th>
        </tr>
        <?php
        $no = 1;
        $data = $dbo->select('petugas');
        foreach ($data as $row):
            ?>
            <tr>
                <td>
                    <?= $no++ ?>
                </td>
                <td>
                    <?= $row['nama_petugas'] ?>
                </td>
                <td>
                    <?= $row['alamat'] ?>
                </td>
                <td>
                    <?= $row['no_hp'] ?>
                </td>
                <td>
                    <?= $row['username'] ?>
                </td>
                <td>
                    <?= $row['role'] ?>
                </td>
                <td>
                    <a class="btn-edit" href="?hal=edit_petugas&id=<?= $row['idpetugas'] ?>"><i class="fa fa-edit"></i></a>
                </td>
                <td>
                    <a onclick="return confirm('Yakin Akan Dihapus?');" class="btn-hapus"
                        href="?hal=petugas&id=<?= $row['idpetugas'] ?>"><i class="fa fa-trash"></i></a>
                </td>
            </tr>
            <?php
        endforeach;
        ?>
    </table>
</div>