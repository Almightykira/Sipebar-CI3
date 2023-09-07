<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <?= $title ?>
        </h1>
    <section class="content">
        <div class="box">
            <div class="box-header">
                <!--
                <a href="<?= base_url('index.php/operator/receiving/form_receiving/') ?>" class="btn btn-primary">
                    <div class="fa fa-plus"></div> Add Receiving
                </a>
                -->

                <button class="btn btn-primary" data-toggle="modal" data-target="#tambahData">
                    <div class="fa fa-plus"></div> Add Issuing
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
                                <th>Picker</th>
                                <th>Remarks</th>
                                <th>Aksi</th>
                            </tr>
                        </thead>
                        <tbody>
                            <?php
                            $no = 1;
                            foreach ($issuing->result_array() as $is) {
                            ?>
                                <tr>
                                    <td><?= $no++ ?></td>
                                    <td><?= $is['date'] ?></td>
                                    <td><?= $is['no_issuing'] ?></td>
                                    <td><?= $is['picker'] ?></td>
                                    <td>
                                        <?= $is['remarks'] ?>
                                        <!--
                                        <?php
                                        $this->db->where('id', $is['id_remarks']);
                                        foreach ($this->db->get('tb_master_data_barang')->result() as $dMdb) {
                                            echo $dMdb->remarks;
                                        }
                                        ?>
                                        -->
                                    </td>

                                    <td>
                                        <a href="<?= base_url('index.php/operator/issuing/detail_issuing/') . $is['id'] ?>" class="btn btn-info btn-xs">
                                            <div class="fa fa-eye"></div>Add Product
                                        </a>
                                        <button class="btn btn-warning btn-xs" data-toggle="modal" data-target="#editData<?= $is['id'] ?>">
                                            <div class="fa fa-edit"></div>Edit
                                        </button>
                                        <a href="<?= base_url('index.php/operator/issuing/delete/') . $is['id'] ?>" class="btn btn-danger btn-xs tombol-yakin" data-isidata="Data yang berhubungan akan terhapus juga!">
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
                <h4 class="modal-title" id="myModalLabel">Tambah <?= $title  ?></h4>
            </div>
            <form action="<?= base_url('index.php/operator/issuing/insert_issuing') ?>" method="POST">
                <div class="modal-body">
                    <div class="row">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Faktur</label>
                                <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" style="display: none">
                                <input type="text" name="no_issuing" class="form-control" placeholder="Masukkan No Faktur" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Tanggal</label>
                                <input type="date" name="date" class="form-control" placeholder="Date" required>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label>Picker</label>
                                <input type="text" name="picker" class="form-control" placeholder="Input Picker" required>
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
<?php foreach ($issuing->result() as $is) { ?>
    <div class="modal fade" id="editData<?= $is->id ?>" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title" id="myModalLabel">Edit <?= $title ?></h4>
                </div>
                <form action="<?= base_url('index.php/operator/issuing/updateIssuing/') . $is->id ?>" method="POST">
                    <div class="modal-body">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Date</label>
                                    <input type="hidden" name="<?= $this->security->get_csrf_token_name(); ?>" value="<?= $this->security->get_csrf_hash(); ?>" style="display: none">
                                    <input type="date" name="date" class="form-control" placeholder="Date" value="<?= $is->date ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Faktur</label>
                                    <input type="text" name="no_receiving" class="form-control" placeholder="Masukkan No Faktur" value="<?= $is->no_issuing ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Picker</label>
                                    <input type="text" name="supplier" class="form-control" placeholder="Masukkan Nama Picker" value="<?= $is->picker ?>" required>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <label>Remarks</label>
                                    <input type="text" name="remarks" class="form-control" placeholder="Note Remarks" value="<?= $is->remarks ?>" required>
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