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
    public partial class frmQuanLyKhachHang : Form
    {
        public frmQuanLyKhachHang()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void frmQuanLyKhachHang_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM KHACHHANG";
            dataGridView1.DataSource = kn.hienthi(sql);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbMaKhach.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtbTenKhach.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtbDiaChi.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtbDienThoai.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtbEmail.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
            txtbCongTy.Text = dataGridView1.Rows[e.RowIndex].Cells[5].Value.ToString();
            txtbKieuThanhToan.Text = dataGridView1.Rows[e.RowIndex].Cells[6].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txtbMaKhach.Text == "" || txtbTenKhach.Text == "" || txtbDiaChi.Text == "")
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin/Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                string sql = "INSERT INTO KHACHHANG VALUES('" + txtbMaKhach.Text + "','" + txtbTenKhach.Text + "','" + txtbDiaChi.Text + "','" + txtbDienThoai.Text + "','" + txtbEmail.Text + "','" + txtbCongTy.Text + "','" + txtbKieuThanhToan.Text + "')";
                kn.capnhat(sql);
                frmQuanLyKhachHang_Load(sender,e);
                MessageBox.Show("Khách hàng đã được thêm vào trong cơ sở dữ liệu của bạn", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                
            }            
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {
            if (txtbMaKhach.Text == "")
            {
                MessageBox.Show("Bạn hãy nhập mã khách hàng cần xóa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtbMaKhach.Focus();
            }
            else
            {               
                DialogResult traloi;
                string sql = "DELETE FROM KHACHHANG WHERE MaKH='" + txtbMaKhach.Text + "'";
                traloi = MessageBox.Show("Bạn có muốn xóa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyKhachHang_Load(sender, e);        
                }
                else
                {
                    kn.capnhat(sql);
                    frmQuanLyKhachHang_Load(sender, e);
                    MessageBox.Show("Bạn đã xóa xong", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnSua_Click(object sender, EventArgs e)
        {
            if (txtbMaKhach.Text == "" || txtbTenKhach.Text == "" || txtbDiaChi.Text == "")
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin cần sửa / Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn sửa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyKhachHang_Load(sender, e);
                }
                else
                {
                    string sql = "UPDATE KHACHHANG SET TenKh='" + txtbTenKhach.Text + "',DiaChi='" + txtbDiaChi.Text + "',SDT='" + txtbDienThoai.Text + "',Email='" + txtbEmail.Text + "',CongTy='" + txtbCongTy.Text + "',KieuThanhToan='" + txtbKieuThanhToan.Text + "' WHERE MaKH='" + txtbMaKhach.Text + "'";
                    kn.capnhat(sql);
                    frmQuanLyKhachHang_Load(sender, e);
                    MessageBox.Show("Đã sửa xong thông tin của khách hàng", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }       
            
        
}
