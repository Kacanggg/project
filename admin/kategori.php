<?php
if ($id != "") {
    $del = $dbo->delete('kategori', 'idkategori=' . $id);
    if ($del) {
        echo "<script>alert('Hapus Berhasil');location.href='?hal=kategori';</script>";
    }
}
?>
<div class="judul">
    <a href="?hal=add_kategori" class="btn-add"><i class="fa fa-plus"></i> Tambah Data</a>
    <div class="keterangan">Data Kategori</div>
</div>
<div class="data">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <td>No</td>
            <td>Nama Kategori</td>
            <td>Edit</td>
            <td>Hapus</td>
        </tr>
        <?php
        $no = 1;
        $data = $dbo->select('kategori');
        foreach ($data as $row):
            ?>
            <tr>
                <td>
                    <?= $no++ ?>
                </td>
                <td>
                    <?= $row['kategori'] ?>
                </td>
                <td>
                    <a class="btn-edit" href="?hal=edit_kategori&id=<?= $row['idkategori'] ?>"><i
                            class="fa fa-edit"></i></a>
                </td>
                <td>
                    <a onclick="return confirm('Yakin Akan Dihapus?');" class="btn-hapus"
                        href="?hal=kategori&id=<?= $row['idkategori'] ?>"><i class="fa fa-trash"></i></a>
                </td>
            </tr>
            <?php
        endforeach;
        ?>
    </table>
</div>