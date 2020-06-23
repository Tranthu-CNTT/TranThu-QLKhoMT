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
    public partial class frmXemDanhMuc : Form
    {
        public frmXemDanhMuc()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void frmXemDanhMuc_Load(object sender, EventArgs e)
        {
            int intDM = Convert.ToInt32(this.Text);
            switch (intDM)
            {
                
                case 1:
                    lblDM.Text = "DANH MỤC KHÁCH HÀNG";
                    string sql = "SELECT* FROM KHACHHANG";
                    dataGridView1.DataSource = kn.hienthi(sql);
                    break;
                case 2: lblDM.Text = "DANH MỤC VẬT TƯ";
                    string sql1 = "SELECT* FROM VATTU";
                    dataGridView1.DataSource = kn.hienthi(sql1);
                    break;
                case 3: lblDM.Text = "DANH MỤC NHÂN VIÊN";
                    string sql2 = "SELECT* FROM NHANVIENKHO";
                    dataGridView1.DataSource = kn.hienthi(sql2);
                    break;
                case 4: lblDM.Text = "DANH MỤC PHIẾU NHẬP";
                    string sql3 = "SELECT* FROM PHIEUNHAP";
                    dataGridView1.DataSource = kn.hienthi(sql3);
                    break;
                case 5: lblDM.Text = "DANH MỤC PHIẾU XUẤT";
                    string sql4 = "SELECT* FROM PHIEUXUAT";
                    dataGridView1.DataSource = kn.hienthi(sql4);
                    break;
                case 6: lblDM.Text = "DANH MỤC DÒNG PHIẾU NHẬP";
                    string sql5 = "SELECT* FROM DONG_PHIEUNHAP";
                    dataGridView1.DataSource = kn.hienthi(sql5);
                    break;

                case 7: lblDM.Text = "DANH MỤC DÒNG PHIẾU XUẤT";
                    string sql6 = "SELECT* FROM DONG_PHIEUXUAT";
                    dataGridView1.DataSource = kn.hienthi(sql6);
                    break;    
            }
        }

        private void btnTroVe_Click(object sender, EventArgs e)
        {
            this.Close();
        }
    }
}
