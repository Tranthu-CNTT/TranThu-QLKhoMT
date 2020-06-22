using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports.Engine;

namespace QuanLyKhoMayTinh
{
    public partial class frmBaoCaoKhachHang : Form
    {
        public frmBaoCaoKhachHang()
        {
            InitializeComponent();
        }
        
        private void frmBaoCaoKhachHang_Load(object sender, EventArgs e)
        {
            string sql = "SELECT * FROM KHACHHANG";
            SqlConnection sqlConn = new SqlConnection(@"Data Source=DESKTOP-AQEI1KT\SQLEXPRESS;Initial Catalog=khomaytinh;Integrated Security=True");
            SqlDataAdapter sqlDa = new SqlDataAdapter(sql,sqlConn);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            rptKhachHang cr = new rptKhachHang();
            cr.SetDataSource(dt);
            rptKhachHang.ReportSource = cr;
            
        }

        
    }
}
