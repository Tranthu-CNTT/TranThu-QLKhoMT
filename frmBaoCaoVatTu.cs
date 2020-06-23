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
    public partial class frmBaoCaoVatTu : Form
    {
        public frmBaoCaoVatTu()
        {
            InitializeComponent();
        }
        //Download source code tại Sharecode.vn
        private void frmBaoCaoVatTu_Load(object sender, EventArgs e)
        {
            SqlConnection sqlConn = new SqlConnection(@"Data Source=DESKTOP-AQEI1KT\SQLEXPRESS;Initial Catalog=khomaytinh;Integrated Security=True");
            string sql = "SELECT *FROM VATTU";
            SqlDataAdapter sqlDa = new SqlDataAdapter(sql,sqlConn);
            DataTable dt = new DataTable();
            sqlDa.Fill(dt);
            rptVatTu cr = new rptVatTu();
            cr.SetDataSource(dt);
            crystalReportViewer1.ReportSource = cr;
        }

        
    }
}
