<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <?= $title ?>
            <small><?= $subtitle ?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?= base_url('index.php/admin/o_dashboard') ?>"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active"><?= $title ?></li>
        </ol>
    </section>
    <?php
    date_default_timezone_set('Asia/Jakarta');
    ?>
    <section class="content">
        <div class="box">
            <div class="box-header">
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover" id="dataTable">
                        <thead>
                            <tr>
                                <th width="10px">#</th>
                                <th>Kode Barang</th>
                                <th>Deskripsi Obat</th>
                                <th>Nama Obat</th>
                                <th>Satuan</th>
                                <th>Harga Obat</th>
                                <th>Stok</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($master_data_barang->result_array() as $m) {
                            ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $m['part_number'] ?></td>
                                    <td><?= $m['description'] ?></td>
                                    <td>
                                        <?php
                                        $this->db->where('id', $m['id_brand']);
                                        foreach ($this->db->get('tb_brand')->result() as $dBrand) {
                                            echo $dBrand->brand;
                                        }
                                        ?>
                                    </td>
                                    <td>
                                        <?php
                                        $this->db->where('id', $m['id_uom']);
                                        foreach ($this->db->get('tb_uom')->result() as $dUom) {
                                            echo $dUom->nama_satuan . ' _' . $dUom->keterangan;
                                        }
                                        ?>
                                    </td>
                                    <td><?= 'Rp. ' . number_format((float)$m['price'], 0, ',', '.'); ?></td>
                                    <td><?= $m['stock'] ?></td>
                                    <td>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editData<?= $m['id'] ?>">
                                            <div class="fa fa-edit"></div> Edit
                                        </button>
                                        <a href="<?= base_url('index.php/admin/master_data_barang/delete/') . $m['id'] ?>" class="btn btn-danger btn-xs tombol-yakin" data-isidata="Data yang berhubungan akan terhapus juga!">
                                            <div class="fa fa-trash"></div> Delete
                                        </a>
                                    </td>
                                </tr>
                            <?php } ?>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </section>
</div>

<!-- Modal Edit Data -->
<?php foreach ($master_data_barang->result() as $m) { ?>
    <div class="modal fade" id="editData<?= $m->id ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Edit <?= $title ?></h4>
                </div>
                <form action="<?= base_url('index.php/admin/master_data_barang/update/') . $m->id ?>" method="POST" enctype="multipart/form-data">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-12">
                                <div class="form-group">
                                    <label>Kode Barang</label>
                                    <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <input type="text" name="part_number" class="form-control" placeholder="Masukkan kode barang" value="<?= $m->part_number ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Deskripsi</label>
                                    <input type="text" name="description" class="form-control" placeholder="Masukkan deskripsi obat" value="<?= $m->description ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Kategori</label>
                                    <select name="id_category" class="form-control" required>
                                        <?php foreach ($category->result() as $ctg) { ?>
                                            <option value="<?= $ctg->id ?>" selected><?= $ctg->category ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Nama Barang</label>
                                    <select name="id_brand" class="form-control" required>
                                        <?php foreach ($brand->result() as $dBrand) { ?>
                                            <option value="<?= $dBrand->id ?>" selected><?= $dBrand->brand ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Satuan</label>
                                    <select name="id_uom" class="form-control" required>
                                        <?php foreach ($uom->result() as $dUom) { ?>
                                            <option value="<?= $dUom->id ?>" selected><?= $dUom->keterangan ?></option>
                                        <?php } ?>
                                    </select>
                                </div>
                                <div class="form-group">
                                    <label>Move Type</label>
                                    <input type="text" name="move_type" class="form-control" placeholder="Move Type" value="<?= $m->move_type ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="text" name="price" class="form-control" placeholder="Price" value="<?= $m->price ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <input type="text" name="remarks" class="form-control" placeholder="Remarks" value="<?= $m->remarks ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Stok</label>
                                    <input type="text" name="stock" class="form-control" placeholder="Stock" value="<?= $m->stock ?>" required>
                                </div>
                                <div class="form-group">
                                    <label>Gambar</label>
                                    <input type="file" name="img" class="form-control-file"> <br>
                                    <img src="<?= base_url('assets/imgproduct/') . $m->img ?> ?>" width="200px">
                                </div>
                            </div>
                            <div class="modal-footer">
                                <button type="reset" class="btn btn-danger">
                                    <div class="fa fa-trash"></div> Reset
                                </button>
                                <button type="submit" class="btn btn-primary">
                                    <div class="fa fa-save"></div> Update
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
<?php } ?>