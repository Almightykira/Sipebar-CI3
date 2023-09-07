<div class="content-wrapper">
    <section class="content-header">
        <h1>
            <?= $title ?>
            <small><?= $subtitle ?></small>
        </h1>
        <ol class="breadcrumb">
            <li><a href="<?= base_url('index.php/admin/dashboard') ?>"><i class="fa fa-dashboard"></i> Dashboard</a></li>
            <li class="active"><?= $title ?></li>
        </ol>
    </section>
    <?php
    date_default_timezone_set('Asia/Jakarta');
    ?>
    <section class="content">
        <div class="box">
            <div class="box-body">
                <form method="get" action="<?php echo base_url('index.php/report/report_stock') ?>">
                    <div class="row">
                        <div class="col-sm-6 col-md-4">
                            <div class="form-group">
                                <label>Filter Tanggal</label>
                                <div class="input-group">
                                    <input type="date" name="tgl_awal" value="<?= @$_GET['tgl_awal'] ?>" class="form-control tgl_awal" placeholder="Tanggal Awal" autocomplete="off">
                                    <span class="input-group-addon">s/d</span>
                                    <input type="date" name="tgl_akhir" value="<?= @$_GET['tgl_akhir'] ?>" class="form-control tgl_akhir" placeholder="Tanggal Akhir" autocomplete="off">
                                </div>
                            </div>
                        </div>
                    </div>

                    <button type="submit" name="filter" value="true" class="btn btn-primary">TAMPILKAN</button>

                    <a href="<?php echo $url_cetak ?>" target="_blank" class="btn btn-info">
                        <div class="fa fa-print"></div> Print
                    </a>
                    <?php
                    if (isset($_GET['filter'])) // Jika user mengisi filter tanggal, maka munculkan tombol untuk reset filter
                        echo '<a href="' . base_url('index.php/report/report_stock') . '" class="btn btn-default">RESET</a>';
                    ?>
                </form>

                <!-- Belum Ketemu Solusinya untuk tabel
                <div class="box-body">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover" id="dataTable">
                            <thead>
                                <tr>
                                    <th width="10px">#</th>
                                    <th>Tahun Ajaran</th>
                                    <th>Status</th>
                                    <th>Aksi</th>
                                </tr>
                            </thead>
                            <tbody>


                            </tbody>
                        </table>
                    </div>
                </div>
                -->

                <div class="table-responsive" style="margin-top: 10px;">
                    <div class="table-responsive">
                        <table class="table table-bordered table-striped table-hover" id="dataTable">
                            <thead>
                                <tr>
                                    <th>Tanggal</th>
                                    <th>Part Number</th>
                                    <th>Description</th>
                                    <th>Kategori</th>
                                    <th>Brand</th>
                                    <th>Uom</th>
                                    <th>Move Type</th>
                                    <th>Price</th>
                                    <th>Remarks</th>
                                    <th>Stock</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php
                                if (empty($transaksi)) { // Jika data tidak ada
                                    echo "<tr><td colspan='5'>Data tidak ada</td></tr>";
                                } else { // Jika jumlah data lebih dari 0 (Berarti jika data ada)
                                    foreach ($transaksi as $data) { // Looping hasil data transaksi
                                        $tgl = date('d-m-Y', strtotime($data->date)); // Ubah format tanggal jadi dd-mm-yyyy

                                        echo "<tr>";
                                        echo "<td>" . $tgl . "</td>";
                                        echo "<td>" . $data->part_number . "</td>";
                                        echo "<td>" . $data->description . "</td>";
                                        $this->db->where('id', $data->id_category);
                                        foreach ($this->db->get('tb_category')->result() as $a) {
                                            echo "<td>" . $a->category . "</td>";
                                        }
                                        $this->db->where('id', $data->id_brand);
                                        foreach ($this->db->get('tb_brand')->result() as $a) {
                                            echo "<td>" . $a->brand . "</td>";
                                        }
                                        $this->db->where('id', $data->id_uom);
                                        foreach ($this->db->get('tb_uom')->result() as $a) {
                                            echo "<td>" . $a->nama_satuan . "</td>";
                                        }
                                        echo "<td>" . $data->move_type . "</td>";
                                        echo "<td>" . $data->price . "</td>";
                                        echo "<td>" . $data->remarks . "</td>";
                                        echo "<td>" . $data->stock . "</td>";
                                        echo "</tr>";
                                    }
                                }
                                ?>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </section>
</div>