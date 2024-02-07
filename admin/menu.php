<?php
if ($id != "") {
    $del = $dbo->delete("menu", "idmenu=$id");
    if ($del) {
        echo "<script>alert('Hapus Berhasil');location.href='?hal=menu';</script>";
    }
}
?>
<div class="judul">
    <a href="?hal=add_menu" class="btn-add"><i class="fa fa-plus"></i> Tambah Data</a>
    <div class="keterangan">Data Menu</div>
</div>
<div class="data">
    <table cellpadding="0" cellspacing="0">
        <tr>
            <th>No</th>
            <th>Kategori</th>
            <th>Nama Menu</th>
            <th>Deskripsi</th>
            <th>Harga</th>
            <th>Foto</th>
            <th>Edit</th>
            <th>Hapus</th>
        </tr>
        <?php
        $no = 1;
        $data = $dbo->select('menu a, kategori b where a.idkategori=b.idkategori', 'a.*, b.kategori');
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
                    <?= $row['nama_menu'] ?>
                </td>
                <td>
                    <?= $row['deskripsi'] ?>
                </td>
                <td>
                    <?= $row['harga'] ?>
                </td>
                <td>
                    <img src="../img/<?= $row['foto'] ?>" alt="" width="100" height="100">
                </td>
                <td>
                    <a class="btn-edit" href="?hal=edit_menu&id=<?= $row['idmenu'] ?>"><i class="fa fa-edit"></i></a>
                </td>
                <td>
                    <a onclick="return confirm('Yakin Akan Dihapus?');" class="btn-hapus"
                        href="?hal=menu&id=<?= $row['idmenu'] ?>"><i class="fa fa-trash"></i></a>
                </td>
            </tr>
            <?php
        endforeach;
        ?>
    </table>
</div>