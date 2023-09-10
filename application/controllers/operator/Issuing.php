<?php

defined('BASEPATH') or exit('No Direct script access Allowed');

class Issuing extends CI_Controller
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
        $data['title']      = 'Transaksi Barang Keluar';
        $data['master_data_barang']     = $this->m_model->get_desc('tb_master_data_barang');
        $data['category']               = $this->m_model->get_desc('tb_category');
        $data['brand']                  = $this->m_model->get_desc('tb_brand');
        $data['uom']                    = $this->m_model->get_desc('tb_uom');
        $data['issuing']                = $this->m_model->get_desc('tb_issuing');


        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('operator/issuing');
        $this->load->view('templates/footer');
    }

    public function insert_issuing()
    {
        // $idReceiving    = $_POST['idReceiving'];
        $date           = $_POST['date'];
        $no_issuing     = $_POST['no_issuing'];
        $picker         = $_POST['picker'];
        $remarks        = $_POST['remarks'];

        $data = array(
            //'id_receiving'  => $idReceiving,
            'date'          => $date,
            'no_issuing'    => $no_issuing,
            'picker'        => $picker,
            'remarks'       => $remarks
        );

        $this->m_model->insert($data, 'tb_issuing');
        $this->session->set_flashdata('pesan', 'Data Issuing Berhasil Ditambahkan!');
        redirect('operator/issuing');
    }

    public function detail_issuing($idIssuing)
    {
        $data['title']      = 'Detail Barang Keluar';
        $data['subtitle']   = 'Insert Issuing transaction';

        $data['idIssuing']        = $idIssuing;
        $this->db->where('id', $idIssuing);
        $data['issuing']          = $this->m_model->get_desc('tb_issuing');
        $this->db->where('idIssuing', $idIssuing);
        $data['productissuing']        = $this->m_model->get_desc('tb_productissuing');
        $data['masterDatabarang']        = $this->m_model->get_desc('tb_master_data_barang');
        $data['Uom']                    = $this->m_model->get_desc('tb_uom');

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('operator/detailissuing');
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

    public function insertDetailissuing($idissuing)
    {
        $idissuing                  = $idissuing;
        $id_master_data_barang        = $_POST['id_master_data_barang'];
        $id_uom                        = $_POST['id_uom'];
        $jumlah                       = $_POST['jumlah'];

        $data = array(
            'idissuing'                => $idissuing,
            'id_master_data_barang'      => $id_master_data_barang,
            'id_uom'                     => $id_uom,
            'jumlah'                    => $jumlah,
        );
        $this->m_model->insert($data, 'tb_productissuing');
        $this->session->set_flashdata('pesan', 'Data Product Issuing Berhasil Ditambahkan!');

        redirect("operator/issuing/detail_issuing/$idissuing");
    }

    public function updateDetailReceiving($id, $idReceiving)
    {
    }
    public function deleteDetailIssuing($id, $Issuing)
    {
        $where = array('id' => $id);
        $this->m_model->delete($where, 'tb_productissuing');
        $this->session->set_flashdata('pesan', 'Data Product Issuing Berhasil dihapus!');
        redirect("operator/issuing/detail_issuing/$Issuing");
    }


    public function edit($id)
    {
    }

    public function delete($id)
    {
        $where = array('id' => $id);
        $this->m_model->delete($where, 'tb_issuing');
        $this->session->set_flashdata('pesan', 'Data barang keluar Berhasil dihapus!');
        redirect('operator/issuing');
    }
}
