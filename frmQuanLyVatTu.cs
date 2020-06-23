using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace QuanLyKhoMayTinh
{
    public partial class frmQuanLyVatTu : Form
    {
        public frmQuanLyVatTu()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void frmQuanLyVatTu_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM VATTU";
            dataGridView1.DataSource = kn.hienthi(sql);
        }
        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            txtbMaVatTu.Text = dataGridView1.Rows[e.RowIndex].Cells[0].Value.ToString();
            txtbSoLuong.Text = dataGridView1.Rows[e.RowIndex].Cells[1].Value.ToString();
            txtbDonGia.Text = dataGridView1.Rows[e.RowIndex].Cells[2].Value.ToString();
            txtbHang.Text = dataGridView1.Rows[e.RowIndex].Cells[3].Value.ToString();
            txtbChungLoai.Text = dataGridView1.Rows[e.RowIndex].Cells[4].Value.ToString();
        }

        private void btnThem_Click(object sender, EventArgs e)
        {
            if (txtbMaVatTu.Text == "")
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin/Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            else
            {
                string sql = "INSERT INTO VATTU VALUES('" + txtbMaVatTu.Text + "','" + txtbSoLuong.Text + "','" + txtbDonGia.Text+ "','" + txtbHang.Text+ "','" + txtbChungLoai.Text + "')";
                kn.capnhat(sql);
                frmQuanLyVatTu_Load(sender, e);
                MessageBox.Show("Vật tư đã được thêm vào trong cơ sở dữ liệu của bạn", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

            }            
        }

        private void btnSua_Click(object sender, EventArgs e)
        {           
            if (txtbMaVatTu.Text == "")
            {
                MessageBox.Show("Bạn chưa điền đầy đủ thông tin cần sửa", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtbMaVatTu.Focus();
            }
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn có muốn sửa không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyVatTu_Load(sender, e);
                }
                else
                {
                    string sql = "UPDATE VATTU SET SoLuong='" + txtbSoLuong.Text + "',DonGia='" + txtbDonGia.Text + "',Hang='" + txtbHang.Text + "',ChungLoai='" + txtbChungLoai.Text + "' WHERE MaVT='" + txtbMaVatTu.Text + "'";
                    kn.capnhat(sql);
                    frmQuanLyVatTu_Load(sender, e);
                    MessageBox.Show("Bạn đã sửa thành công thông tin về vật tư", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);

                }
            }
        }

        private void btnXoa_Click(object sender, EventArgs e)
        {            
            if (txtbMaVatTu.Text == "")
            {
                MessageBox.Show("Mã vật tư không được để trống / Mời bạn nhập lại", "Thông Báo", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                txtbMaVatTu.Focus();
            }
            else
            {
                DialogResult traloi;
                traloi = MessageBox.Show("Bạn co muốn xóa vật tư này không", "Thông Báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
                if (traloi == DialogResult.Cancel)
                {
                    frmQuanLyVatTu_Load(sender, e);
                }
                else
                {
                    string sql = "DELETE FROM VATTU WHERE MaVT='" + txtbMaVatTu.Text + "'";
                    kn.capnhat(sql);
                    frmQuanLyVatTu_Load(sender, e);
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
