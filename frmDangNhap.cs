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
    public partial class frmDangNhap : Form
    {
        public frmDangNhap()
        {
            InitializeComponent();
        }

        private void btnDangNhap_Click(object sender, EventArgs e)
        {
           
                           
           
            if ((textBox1.Text == "admin") && (textBox2.Text == "admin")) this.Close();
            else
            {
                MessageBox.Show("Tên người dùng/Mật khẩu không đúng!!!", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Warning);
                textBox1.Focus();
            }
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
           
            DialogResult traloi;
            traloi = MessageBox.Show("Bạn chắc không", "Trả Lời", MessageBoxButtons.OKCancel, MessageBoxIcon.Question);
            if (traloi == DialogResult.OK) Application.Exit();
        }

        private void toolTip1_Popup(object sender, PopupEventArgs e)
        {
            toolTip1.ToolTipIcon = ToolTipIcon.Info;
            toolTip1.ToolTipTitle = "Đăng Nhập";
        }

            
    }
}
