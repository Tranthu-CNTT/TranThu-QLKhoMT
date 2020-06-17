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
    public partial class frmQuanLyPhieuNhap : Form
    {
        public frmQuanLyPhieuNhap()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbSoPhieuNhap.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            dtpNgayNhap.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtbMaNhanVien.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO PHIEUNHAP VALUES('" + txtbSoPhieuNhap.Text + "','" + dtpNgayNhap.Text + "','" + txtbMaNhanVien.Text + "')";
            DateTime dtt = DateTime.Now;
            if (txtbSoPhieuNhap.Text == "")
            {
                MessageBox.Show("Số phiếu nhập không được để trống", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
            }
            else if (dtpNgayNhap.Value >= dtt)
                MessageBox.Show("Bạn đã chắc nhập đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                kn.capnhat(sql);
                frmQuanLyPhieuNhap_Load(sender, e);
                MessageBox.Show("Đã thêm phiếu nhập", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE PHIEUNHAP SET NgayNhap='" + dtpNgayNhap.Text + "',MaNV='" + txtbMaNhanVien.Text + "' WHERE SoPN='" + txtbSoPhieuNhap.Text + "'";
            DateTime dtt = DateTime.Now;
            if (txtbSoPhieuNhap.Text == "") MessageBox.Show("Số phiếu nhập không được để trống ", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtpNgayNhap.Value >= dtt)
                MessageBox.Show("Bạn đã chắc nhập đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn sửa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyPhieuNhap_Load(sender, e);
                }
                else
                {
                    kn.capnhat(sql);
                    frmQuanLyPhieuNhap_Load(sender, e);
                    MessageBox.Show("Bạn đã sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "DELETE FROM PHIEUNHAP WHERE SoPN='" + txtbSoPhieuNhap.Text + "'";
            if (txtbSoPhieuNhap.Text == "") MessageBox.Show("Số phiếu nhập không được để trống", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn xóa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyPhieuNhap_Load(sender, e);
                }
                else
                {
                    kn.capnhat(sql);
                    frmQuanLyPhieuNhap_Load(sender, e);
                    MessageBox.Show("Bạn đã xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        private void frmQuanLyPhieuNhap_Load(object sender, EventArgs e)
        {
            string sql = "SELECT* FROM PHIEUNHAP";
            dataGridView1.DataSource = kn.hienthi(sql);
        }
    }
}
