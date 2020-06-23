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
    public partial class frmQuanLyPhieuXuat : Form
    {
        public frmQuanLyPhieuXuat()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbSoPhieuXuat.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            dtpNgayXuat.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtbMaNhanVien.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtbMaKhachHang.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
        }

        private void frmQuanLyPhieuXuat_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM PHIEUXUAT";
            dataGridView1.DataSource = kn.hienthi(sql);
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            string sql = "INSERT INTO PHIEUXUAT VALUES('" + txtbSoPhieuXuat.Text + "','" + dtpNgayXuat.Text + "','" + txtbMaNhanVien.Text + "','" + txtbMaKhachHang.Text + "')";
            DateTime dtt = DateTime.Now;
            if (txtbSoPhieuXuat.Text == "" || dtpNgayXuat.Text == "" || txtbMaNhanVien.Text == "" || txtbMaKhachHang.Text == "")
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin cần thêm.Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtpNgayXuat.Value >= dtt)
                MessageBox.Show("Bạn đã chắc chọn đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                kn.capnhat(sql);
                frmQuanLyPhieuXuat_Load(sender,e);
                MessageBox.Show("Bạn đã thêm phiếu xuất thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            string sql = "UPDATE PHIEUXUAT SET NgayXuat='" + dtpNgayXuat.Text + "',MaNV='" + txtbMaNhanVien.Text + "',MaKH='" + txtbMaKhachHang.Text + "' WHERE SoPX='" + txtbSoPhieuXuat.Text + "'";
            DateTime dtt = DateTime.Now;
            if (txtbSoPhieuXuat.Text == "" || dtpNgayXuat.Text == "" || txtbMaNhanVien.Text == "" || txtbMaKhachHang.Text == "")
                MessageBox.Show("Bạn đã chắc điền đầy đủ thông tin chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtpNgayXuat.Value >= dtt)
                MessageBox.Show("Bạn có chắc đã chọn đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn sửa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyPhieuXuat_Load(sender, e);
                }
                else
                {
                    kn.capnhat(sql);
                    frmQuanLyPhieuXuat_Load(sender, e);
                    MessageBox.Show("Bạn đã sửa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }

            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            string sql = "DELETE FROM PHIEUXUAT WHERE SoPX='" + txtbSoPhieuXuat.Text + "'";
            DateTime dtt = DateTime.Now;
            if (txtbSoPhieuXuat.Text == "") MessageBox.Show("Bạn phải chọn số phiếu xuất để xóa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtpNgayXuat.Value >= dtt) MessageBox.Show("bạn đã chắc chọn đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn xóa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyPhieuXuat_Load(sender, e);
                }
                else
                {
                    kn.capnhat(sql);
                    frmQuanLyPhieuXuat_Load(sender, e);
                    MessageBox.Show("Bạn đã xóa thành công", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }
        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
