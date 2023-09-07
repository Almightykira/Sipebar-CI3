<?php
defined('BASEPATH') or exit('No direct script access allowed');
require 'vendor/autoload.php';

use PhpOffice\PhpSpreadsheet\Spreadsheet;
use PhpOffice\PhpSpreadsheet\Writer\Xlsx;


class Report_issuing extends CI_Controller
{

    public function __construct()
    {
        parent::__construct();
        $this->load->library('Pdf');
        if (!$this->session->userdata('level')) {
            $this->session->set_flashdata('pesan', 'Anda harus masuk terlebih dahulu!');
            redirect('home');
        }
    }

    public function index()
    {
        $data['title']        = 'Laporan';
        $data['subtitle']    = 'Semua data laporan issuing akan muncul disini';

        // $data['santri']    = $this->m_model->get_desc('tb_santri');
        // //$data['santrii']	= $this->m_model->get_desc('tb_santri')->result_array();
        // $data['agama']    = $this->m_model->get_desc('tb_agama');
        // $data['absensi']    = $this->m_model->get_desc('tb_absensi');
        // $data['kelas']    = $this->m_model->get_desc('tb_kelas');
        // $data['pembayaran']    = $this->m_model->get_desc('tb_pembayaran');

        $tgl_awal = $this->input->get('tgl_awal'); // Ambil data tgl_awal sesuai input (kalau tidak ada set kosong)
        $tgl_akhir = $this->input->get('tgl_akhir'); // Ambil data tgl_awal sesuai input (kalau tidak ada set kosong)
        if (empty($tgl_awal) or empty($tgl_akhir)) { // Cek jika tgl_awal atau tgl_akhir kosong, maka :
            $transaksi = $this->m_model->view_all_issuing();  // Panggil fungsi view_all yang ada di TransaksiModel
            $url_cetak = 'report_issuing/cetak';
            $label = 'Semua Data Laporan issuing';
        } else { // Jika terisi
            $transaksi = $this->m_model->view_by_date_issuing($tgl_awal, $tgl_akhir);  // Panggil fungsi view_by_date yang ada di TransaksiModel
            $url_cetak = 'report_issuing/cetak?tgl_awal=' . $tgl_awal . '&tgl_akhir=' . $tgl_akhir;
            $tgl_awal = date('d-m-Y', strtotime($tgl_awal)); // Ubah format tanggal jadi dd-mm-yyyy
            $tgl_akhir = date('d-m-Y', strtotime($tgl_akhir)); // Ubah format tanggal jadi dd-mm-yyyy
            $label = 'Periode Tanggal ' . $tgl_awal . ' s/d ' . $tgl_akhir;
        }
        $data['transaksi'] = $transaksi;
        $data['url_cetak'] = base_url('index.php/report/' . $url_cetak);
        $data['label'] = $label;

        $this->load->view('templates/header', $data);
        $this->load->view('templates/sidebar');
        $this->load->view('report/report_issuing');
        $this->load->view('templates/footer');
    }

    public function cetak()
    {
        $tgl_awal = $this->input->get('tgl_awal'); // Ambil data tgl_awal sesuai input (kalau tidak ada set kosong)
        $tgl_akhir = $this->input->get('tgl_akhir'); // Ambil data tgl_awal sesuai input (kalau tidak ada set kosong)
        if (empty($tgl_awal) or empty($tgl_akhir)) { // Cek jika tgl_awal atau tgl_akhir kosong, maka :
            $transaksi = $this->m_model->view_all_issuing();  // Panggil fungsi view_all yang ada di TransaksiModel
            $label = 'Semua Data';
        } else { // Jika terisi
            $transaksi = $this->m_model->view_by_date_issuing($tgl_awal, $tgl_akhir);  // Panggil fungsi view_by_date yang ada di TransaksiModel
            $tgl_awal = date('d-m-Y', strtotime($tgl_awal)); // Ubah format tanggal jadi dd-mm-yyyy
            $tgl_akhir = date('d-m-Y', strtotime($tgl_akhir)); // Ubah format tanggal jadi dd-mm-yyyy
            $label = 'Periode Tanggal ' . $tgl_awal . ' s/d ' . $tgl_akhir;
        }
        $data1 =  $label;
        $data = $transaksi;


        error_reporting(0); // AGAR ERROR MASALAH VERSI PHP TIDAK MUNCUL
        $pdf = new FPDF('L', 'mm', 'Letter');
        $pdf->AddPage();
        $pdf->SetFont('Arial', 'B', 16);
        $pdf->Cell(0, 7, 'Laporan Data Issuing', 0, 1, 'C');
        $pdf->Cell(0, 7,  $data1, 0, 1, 'C');
        $pdf->Cell(10, 7, '', 0, 1);
        $pdf->SetFont('Arial', 'B', 10);
        $pdf->Cell(10, 6, 'No', 1, 0, 'C');
        $pdf->Cell(35, 6, 'Date ', 1, 0, 'C');
        $pdf->Cell(40, 6, 'No Issuing', 1, 0, 'C');
        $pdf->Cell(40, 6, 'Picker', 1, 0, 'C');
        $pdf->Cell(40, 6, 'Remarks', 1, 1, 'C');


        $pdf->SetFont('Arial', '', 10);

        $gangguan =  $data;
        $no = 0;
        foreach ($gangguan as $data) {
            $no++;
            $pdf->Cell(10, 6, $no, 1, 0, 'C');
            $pdf->Cell(35, 6, $data->date, 1, 0);
            $pdf->Cell(40, 6, $data->no_issuing, 1, 0);
            $pdf->Cell(40, 6, $data->picker, 1, 0);
            $pdf->Cell(40, 6, $data->remarks, 1, 1);
        }
        $pdf->Output();
    }
}
