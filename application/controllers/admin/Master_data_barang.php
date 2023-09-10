<?php

defined('BASEPATH') or exit('No Direct script access Allowed');

class Master_data_barang extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata('level')) {
            $this->session->set_flashdata('pesan', 'Anda harus masuk terlebih dahulu!');
            redirect('home');
        } elseif ($this->session->userdata('level') != 'Administrator') {
            redirect('home');
        }
    }

    public function index()
    {
        $data['title']      = 'Master Data Barang';
        $data['subtitle']   = 'Semua master data barang akan muncul disini';

        $data['master_data_barang']   = $this->m_model->get_desc('tb_master_data_barang');
        $data['category']   = $this->m_model->get_desc('tb_category');
        $data['brand']   = $this->m_model->get_desc('tb_brand');
        $data['uom']   = $this->m_model->get_desc('tb_uom');

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('admin/master_data_barang');
        $this->load->view('templates/footer');
    }

    public function detailmasterdata($idmasterdatabarang)
    {
        $data['title']      = 'Detail Master Data Barang';
        $data['subtitle']   = 'Detail Semua master data barang akan muncul disini';

        $data['masterdatabarang']    = $idmasterdatabarang;
        $this->db->where('id', $idmasterdatabarang);
        $data['masterdatabarang']   = $this->m_model->get_desc('tb_master_data_barang');

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('admin/detailmasterdatabarang');
        $this->load->view('templates/footer');
    }

    public function insert()
    {
        date_default_timezone_set("Asia/Jakarta");
        $now = date('H:i:s');

        $partnumber        = $_POST['part_number'];
        $date               = $_POST['date'];
        $description       = $_POST['description'];
        $id_category       = $_POST['id_category'];
        $id_brand          = $_POST['id_brand'];
        $id_uom            = $_POST['id_uom'];
        $move_type         = $_POST['move_type'];
        $price             = $_POST['price'];
        $img               = $_FILES['img'];
        $remark            = $_POST['remark'];
        $stock            = $_POST['stock'];

        if ($img != '') {
            $config['upload_path'] = './assets/imgproduct/';
            $config['allowed_types'] = '*';
            $config['file_name'] = 'Imgproduct-' . time();

            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('img')) {
                $img = '';
            } else {
                $img = $this->upload->data('file_name');
            }

            $data = array(
                'part_number'       => $partnumber,
                'date'              => $date,
                'description'       => $description,
                'id_category'       => $id_category,
                'id_brand'          => $id_brand,
                'id_uom'            => $id_uom,
                'move_type'         => $move_type,
                'price'             => $price,
                'img'               => $img,
                'remarks'           => $remark,
                'stock'            => $stock,
            );
        }


        $this->m_model->insert($data, 'tb_master_data_barang');
        $this->session->set_flashdata('pesan', 'Data Barang Berhasil Ditambahkan!');
        redirect('admin/master_data_barang');
    }

    public function delete($id)
    {
        $where  = array('id' => $id);
        $this->m_model->delete($where, 'tb_master_data_barang');
        $this->session->set_flashdata('pesan', 'Data Master Barang Berhasil dihapus!');
        redirect('admin/master_data_barang');
    }

    public function update($id)
    {
        $part_number    = $_POST['part_number'];
        $description    = $_POST['description'];
        $id_category    = $_POST['id_category'];
        $id_brand       = $_POST['id_brand'];
        $id_uom       = $_POST['id_uom'];
        $move_type     = $_POST['move_type'];
        $price     = $_POST['price'];
        $remarks     = $_POST['remarks'];
        $img               = $_FILES['img'];
        $stock            = $_POST['stock'];

        if ($img != '') {
            $config['upload_path'] = './assets/imgproduct/';
            $config['allowed_types'] = '*';
            $config['file_name'] = 'Imgproduct-' . time();

            $this->load->library('upload', $config);

            if (!$this->upload->do_upload('img')) {
                $img = '';
            } else {
                $img = $this->upload->data('file_name');
            }
        }

        $data = array(
            'part_number'   => $part_number,
            'description'   => $description,
            'id_category'   => $id_category,
            'id_brand'      => $id_brand,
            'id_uom'        => $id_uom,
            'move_type'     => $move_type,
            'price'         => $price,
            'remarks'        => $remarks,
            'img'               => $img,
            'stock'           => $stock,

        );

        $where = array('id' => $id);
        $this->m_model->update($where, $data, 'tb_master_data_barang');
        $this->session->set_flashdata('pesan', 'Data Master Berhasil Diubah!');
        redirect('admin/master_data_barang');
    }

    public function detailmasterdatabarang($id)
    {
    }
}
