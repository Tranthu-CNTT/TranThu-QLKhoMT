using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace QuanLyKhoMayTinh
{
    public partial class frmChinh : Form
    {
        public frmChinh()
        {
            InitializeComponent();
        }
        public void frmlogin()
        {
            Form frm = new frmDangNhap();
            frm.ShowDialog();
        }
        public void xemdanhmuc(int intDanhMuc)
        {
            Form frm = new frmXemDanhMuc();
            frm.Text = intDanhMuc.ToString();
            frm.ShowDialog();
        }
        private void frmChinh_Load(object sender, EventArgs e)
        {
            frmlogin();  
        }

        private void đăngNhậpToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            frmlogin();
        }

        private void thoátToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn có chắc không?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK) Application.Exit();
        }

        private void danhMụcKháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(1);
        }

        private void danhMụcVậtTưToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(2);
        }

        private void danhMụcNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(3);
        }

        private void danhMụcPhiếuNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(4);
        }

        private void danhMụcPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(5);
        }

        private void danhMụcDòngPhiếuNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(6);
        }

        private void dAnhMụcDòngPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            xemdanhmuc(7);
        }

        private void quảnLýKháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmQuanLyKhachHang();
            frm.ShowDialog();

        }
        private void quảnLýVậtTưToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmQuanLyVatTu();
            frm.ShowDialog();
        }

        private void quảnLýNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmQuanLyNhanVien();
            frm.ShowDialog();
        }

        private void quảnLýPhiếuNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmQuanLyPhieuNhap();
            frm.ShowDialog();
        }

        private void quảnLýPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmQuanLyPhieuXuat();
            frm.ShowDialog();
        }

        private void báoCáoKháchHàngToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmBaoCaoKhachHang();
            frm.ShowDialog();
        }

        private void báoCáoNhânViênToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmBaoCaoVatTu();
            frm.ShowDialog();
        }

        private void báoCáoNhânViênToolStripMenuItem1_Click(object sender, EventArgs e)
        {
            Form frm = new frmBaoCaoNhanVien();
            frm.ShowDialog();
        }

        private void báoCáoPhiếuNhậpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmBaoCaoPhieuNhap();
            frm.ShowDialog();
        }

        private void báoCáoPhiếuXuấtToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmBaoCaoPhieuXuat();
            frm.ShowDialog();
        }

        private void hóaĐơnToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frm = new frmHoaDon();
            frm.ShowDialog();
        }

        private void trợGiúpToolStripMenuItem_Click(object sender, EventArgs e)
        {
            Form frmhelp = new Formhelp();
            frmhelp.Show();
        }

        private void quảnLýDanhMụcToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        
    }
}
