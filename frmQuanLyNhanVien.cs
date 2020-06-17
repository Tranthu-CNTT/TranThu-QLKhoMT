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
    public partial class frmQuanLyNhanVien : Form
    {
        public frmQuanLyNhanVien()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        string gioitinh;
        private void frmQuanLyNhanVien_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM NHANVIENKHO";
            dataGridView1.DataSource = kn.hienthi(sql);
        }
        //Download source code tại Sharecode.vn
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbMaNhanVien.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtbTenNhanVien.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            dtpNgaySinh.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtbDiaChi.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtbSoDienThoai.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            DateTime dtt = DateTime.Now;
            if (rdBtnNam.Checked == true)
                gioitinh = "Nam";
            else gioitinh = "Nữ";
            if (txtbMaNhanVien.Text == "" || txtbTenNhanVien.Text == "" || txtbDiaChi.Text == "")
            {
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin / Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtbMaNhanVien.Focus();
            }
            else if (dtpNgaySinh.Value >= dtt) MessageBox.Show("Bạn đã nhập đúng ngày sinh chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                string sql1 = "INSERT INTO NHANVIENKHO VALUES('" + txtbMaNhanVien.Text + "','" + txtbTenNhanVien.Text + "','" + dtpNgaySinh.Text + "','" + gioitinh.Trim() + "','" + txtbDiaChi.Text + "','" + txtbSoDienThoai.Text + "')";
                kn.capnhat(sql1);
                frmQuanLyNhanVien_Load(sender, e); 
                MessageBox.Show("Bạn đã thêm xong", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            DateTime dtt = DateTime.Now;
            if (rdBtnNam.Checked == true)
                gioitinh = "Nam";
            else gioitinh = "Nu";
            if (txtbMaNhanVien.Text == "" || txtbTenNhanVien.Text == "" || txtbDiaChi.Text == "")
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin.Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else if (dtpNgaySinh.Value >= dtt)
                MessageBox.Show("Bạn đã chọn đúng ngày chưa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn sửa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyNhanVien_Load(sender, e);
                }
                else
                {
                    string sql = "UPDATE NHANVIENKHO SET TenNV='" + txtbTenNhanVien.Text + "',NgaySinh='" + dtpNgaySinh.Text + "',GioiTinh='" + gioitinh.Trim() + "',DiaChi='" + txtbDiaChi.Text + "',SDT='" + txtbSoDienThoai.Text + "' WHERE MaNV='" + txtbMaNhanVien.Text + "'";
                    kn.capnhat(sql);
                    frmQuanLyNhanVien_Load(sender, e);
                    MessageBox.Show("Bạn đã sửa xong thông tin về nhân viên", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtbMaNhanVien.Text == "") MessageBox.Show("Bạn chưa điền đầy đủ thông tin cần xóa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn xóa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyNhanVien_Load(sender, e);
                }
                else
                {
                    string sql = "DELETE FROM NHANVIENKHO WHERE MaNV='" + txtbMaNhanVien.Text + "'";
                    kn.capnhat(sql);
                    frmQuanLyNhanVien_Load(sender, e);
                    MessageBox.Show("Bạn đã xóa xong", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                }
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        
    }
}
