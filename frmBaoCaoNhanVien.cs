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
    public partial class frmBaoCaoNhanVien : Form
    {
        public frmBaoCaoNhanVien()
        {
            InitializeComponent();
        }

        private void frmBaoCaoNhanVien_Load(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(@"Data Source=DESKTOP-AQEI1KT\SQLEXPRESS;Initial Catalog=khomaytinh;Integrated Security=True");
            string sql = "SELECT *FROM NHANVIENKHO";
            SqlDataAdapter sqlDa = new SqlDataAdapter(sql, sqlConn);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            rptNhanVien cr = new rptNhanVien();
            cr.SetDataSource(dt);
            crystalReportViewer1.ReportSource = cr;
        }
    }
}
