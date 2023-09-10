<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <?= $title ?>
        </h1>
    </section>
    <section class="content">
        <div class="box">
            <div class="box-header">
                <button class="btn btn-primary" data-toggle="modal" data-target="#tambahData">
                    <div class="fa fa-plus"></div> Tambah Barang Masuk
                </button>
            </div>
            <div class="box-body">
                <div class="table-responsive">
                    <table class="table table-bordered table-striped table-hover" id="dataTable">
                        <thead>
                            <tr>
                                <th width="10px">No</th>
                                <th>Tanggal</th>
                                <th>Faktur</th>
                                <th>Supplier</th>
                                <th>Remarks</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($receiving->result_array() as $rv) {
                            ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $rv['date'] ?></td>
                                    <td><?= $rv['no_receiving'] ?></td>
                                    <td><?= $rv['supplier'] ?></td>
                                    <td>
                                        <?= $rv['remarks'] ?>
                                        <!--
                                        <?php
                                        $this->db->where('id', $rv['id_remarks']);
                                        foreach ($this->db->get('tb_master_data_barang')->result() as $dMdb) {
                                            echo $dMdb->remarks;
                                        }
                                        ?>
                                        -->
                                    </td>

                                    <td>
                                        <a href="<?= base_url('index.php/operator/receiving/detail_receiving/') . $rv['id'] ?>" class="btn btn-info btn-xs">
                                            <div class="fa fa-eye"></div>Add Product
                                        </a>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editData<?= $rv['id'] ?>">
                                            <div class="fa fa-edit"></div>Edit
                                        </button>
                                        <a href="<?= base_url('index.php/operator/receiving/delete/') . $rv['id'] ?>" class="btn btn-danger btn-xs tombol-yakin" data-isidata="Data yang berhubungan akan terhapus juga!">
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
<!-- Modal Tambah Data -->
<div class="modal fade" id="tambahData" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title" id="myModalLabel">Tambah <?= $title ?></h4>
            </div>
            <form action="<?= base_url('index.php/operator/receiving/insert_receiving') ?>" method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Faktur</label>
                                <input id="idf" value="1" type="hidden" />
                                <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" style="display: none">
                                <input type="text" name="no_receiving" class="form-control" placeholder="Masukkan No Faktur" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Date</label>
                                <input type="date" name="date" class="form-control" placeholder="Date" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Supplier</label>
                                <input type="text" name="supplier" class="form-control" placeholder="Input Suplier" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Remarks</label>
                                <input type="text" name="remarks" class="form-control" placeholder="Input Remarks" required>
                            </div>
                        </div>
                        <!--
                        <button type="button" class="btn btn-success" onclick="tambahHobi(); return false;">Tambah Rincian Hobi</button>
                        <div id="divHobi"></div>
                                    -->
                    </div>
                    <div class="modal-footer">
                        <button type="reset" class="btn btn-danger">
                            <div class="fa fa-trash"></div> Reset
                        </button>
                        <button type="submit" class="btn btn-primary">
                            <div class="fa fa-save"></div> Save
                        </button>
                    </div>

                </div>
            </form>
        </div>
    </div>
</div>


<!-- Modal Edit Data -->
<?php foreach ($receiving->result() as $re) { ?>
    <div class="modal fade" id="editData<?= $re->id ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Edit <?= $title ?></h4>
                </div>
                <form action="<?= base_url('index.php/operator/receiving/updateReceiving/') . $re->id ?>" method="POST">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Date</label>
                                    <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <input type="date" name="date" class="form-control" placeholder="Date" value="<?= $re->date ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>No Receiving</label>
                                    <input type="text" name="no_receiving" class="form-control" placeholder="No Receiving" value="<?= $re->no_receiving ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Supplier</label>
                                    <input type="text" name="supplier" class="form-control" placeholder="Supplier" value="<?= $re->supplier ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <input type="text" name="remarks" class="form-control" placeholder="Note Remarks" value="<?= $re->remarks ?>" required>
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