<?php

defined('BASEPATH') or exit('No Direct script access Allowed');

class Receiving extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        if (!$this->session->userdata('level')) {
            $this->session->set_flashdata('pesan', 'Anda harus masuk terlebih dahulu!');
            redirect('home');
        } elseif ($this->session->userdata('level') != 'Operator') {
            redirect('home');
        }
    }

    public function index()
    {
        $data['title']      = 'Transaksi Barang Masuk';

        $data['master_data_barang']     = $this->m_model->get_desc('tb_master_data_barang');
        $data['category']               = $this->m_model->get_desc('tb_category');
        $data['brand']                  = $this->m_model->get_desc('tb_brand');
        $data['uom']                    = $this->m_model->get_desc('tb_uom');
        $data['receiving']              = $this->m_model->get_desc('tb_receiving');


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('operator/receiving');
        $this->load->view('templates/footer');
    }

    public function form_receiving()
    {
        $data['title']      = 'Receiving';
        $data['subtitle']   = 'Insert receiving transaction';

        $data['master_data_barang']     = $this->m_model->get_desc('tb_master_data_barang');
        $data['category']               = $this->m_model->get_desc('tb_category');
        $data['brand']                  = $this->m_model->get_desc('tb_brand');
        $data['uom']                    = $this->m_model->get_desc('tb_uom');
        $data['receiving']              = $this->m_model->get_desc('tb_receiving');


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('operator/form_receiving');
        $this->load->view('templates/footer');
    }

    public function detail_receiving($idReceiving)
    {
        $data['title']      = 'Detail Barang Masuk';

        $data['idReceiving']        = $idReceiving;
        $this->db->where('id', $idReceiving);
        $data['receiving']          = $this->m_model->get_desc('tb_receiving');
        $this->db->where('idReceiving', $idReceiving);
        $data['productreceiving']        = $this->m_model->get_desc('tb_productreceiving');
        $data['masterDatabarang']        = $this->m_model->get_desc('tb_master_data_barang');
        $data['Uom']                    = $this->m_model->get_desc('tb_uom');

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('operator/detailreceiving');
        $this->load->view('templates/footer');
    }

    public function insert_receiving()
    {
        // $idReceiving    = $_POST['idReceiving'];
        $no_receiving   = $_POST['no_receiving'];
        $date           = $_POST['date'];
        $supplier       = $_POST['supplier'];
        $remarks        = $_POST['remarks'];

        $data = array(
            //'id_receiving'  => $idReceiving,
            'no_receiving'  => $no_receiving,
            'date'          => $date,
            'supplier'      => $supplier,
            'remarks'       => $remarks
        );

        $this->m_model->insert($data, 'tb_receiving');
        $this->session->set_flashdata('pesan', 'Data Receiving Berhasil Ditambahkan!');
        redirect('operator/receiving');
    }

    public function updateReceiving($id)
    {
        $no_receiving  = $_POST['no_receiving'];
        $date           = $_POST['date'];
        $supplier       = $_POST['supplier'];
        $remarks        = $_POST['remarks'];

        $data = array(
            'no_receiving'  => $no_receiving,
            'date'          => $date,
            'supplier'      => $supplier,
            'remarks'       => $remarks
        );
        $where = array('id' => $id);
        $this->m_model->update($where, $data, 'tb_receiving');
        $this->session->set_flashdata('pesan', 'Data receiving Berhasil Diubah!');
        redirect('operator/receiving');
    }

    public function insertDetailreceiving($idReceiving)
    {
        $idReceiving                  = $idReceiving;
        $id_master_data_barang        = $_POST['id_master_data_barang'];
        $id_uom                        = $_POST['id_uom'];
        $jumlah                       = $_POST['jumlah'];

        $data = array(
            'idReceiving'                => $idReceiving,
            'id_master_data_barang'      => $id_master_data_barang,
            'id_uom'                    => $id_uom,
            'jumlah'                    => $jumlah,
        );
        $this->m_model->insert($data, 'tb_productreceiving');
        $this->session->set_flashdata('pesan', 'Data Product Berhasil Ditambahkan!');

        redirect("operator/receiving/detail_receiving/$idReceiving");
    }

    public function updateDetailReceiving($id, $idReceiving)
    {
    }
    public function deleteDetailReceiving($id, $idReceiving)
    {
        $where = array('id' => $id);
        $this->m_model->delete($where, 'tb_productreceiving');
        $this->session->set_flashdata('pesan', 'Data Product Berhasil dihapus!');
        redirect("operator/receiving/detail_receiving/$idReceiving");
    }


    public function edit($id)
    {
    }

    public function delete($id)
    {
        $where = array('id' => $id);
        $this->m_model->delete($where, 'tb_receiving');
        $this->session->set_flashdata('pesan', 'Data barang masuk Berhasil dihapus!');
        redirect('operator/receiving');
    }
}
