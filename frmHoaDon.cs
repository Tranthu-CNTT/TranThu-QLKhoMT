using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;
using System.Data.SqlClient;
using CrystalDecisions.CrystalReports;
using CrystalDecisions.CrystalReports.Engine;
using CrystalDecisions.Shared;

namespace QuanLyKhoMayTinh
{
    public partial class frmHoaDon : Form
    {
        public frmHoaDon()
        {
            InitializeComponent();
        }
        KetNoi kn = new KetNoi();
        private void frmHoaDon_Load(object sender, EventArgs e)
        {
            //string sql = "SELECT MaNV,TenNV,MaKH,TenKH FROM NHANVIENKHO,KHACHHANG WHERE NHANVIENKHO.DiaChi=KHACHHANG.DiaChi AND KHACHHANG.";
            //SqlConnection sqlConn = new SqlConnection("Data Source=.\\sqlexpress;Initial Catalog=khomaytinh;Integrated Security=True");
            //sqlConn.Open();
            //SqlDataAdapter sqlDa = new SqlDataAdapter(sql,sqlConn);
            //DataSet ds = new DataSet();
            //sqlDa.Fill(ds,"NHANVIENKHO,KHACHHANG");
            //DataTable dt = ds.Tables["NHANVIENKHO,KHACHHANG"];
            //loadComb();


        }

        private void btnTinh_Click(object sender, EventArgs e)
        {
            txtbTongTien.Text=(double.Parse(txtbSoLuong.Text)*double.Parse(cbBDonGia.Text)).ToString();
        }

        private void btnThoat_Click(object sender, EventArgs e)
        {
            this.Close();
        }

        //private void cbBTenNV_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "SELECT TenNV FROM NHANVIENKHO WHERE TenNV='"+cbBTenNV+"'";
        //    dt.Load(kn.doc(sql));
        //    cbBTenNV.Text = dt.Rows[0]["TenNV"].ToString();
        //}

        //private void cbBMaNV_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "SELECT MaNV FROM NHANVIENKHO WHERE MaNV='"+cbBMaNV+"'";
        //    dt.Load(kn.doc(sql));
        //    cbBMaNV.Text = dt.Rows[0]["MaNV"].ToString();
        //}

        //private void cbBTenKH_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "SELECT TenKH FROM KHACHHANG WHERE TenKH='"+cbBTenKH+"'";
        //    dt.Load(kn.doc(sql));
        //    cbBTenKH.Text = dt.Rows[0]["TenKH"].ToString();
        //}

        //private void cbBMaKH_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "SELECT MaKH FROM KHACHHANG WHERE MaKH='"+cbBMaKH+"'";
        //    dt.Load(kn.doc(sql));
        //    cbBMaKH.Text = dt.Rows[0]["MaKH"].ToString();

        //}

        //private void cbBMaVT_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    DataTable dt = new DataTable();
        //    string sql = "SELECT MaVT FROM VATTU WHERE MaVT='"+cbBMaVT+"'";
        //    dt.Load(kn.doc(sql));
        //    cbBMaVT.Text = dt.Rows[0]["MaVT"].ToString();

        //}

    //    private void cbBChungLoai_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        DataTable dt = new DataTable();
    //        string sql = "SELECT ChungLoai FROM VATTU WHERE ChungLoai='"+cbBChungLoai+"'";
    //        dt.Load(kn.doc(sql));
    //        cbBChungLoai.Text = dt.Rows[0]["ChungLoai"].ToString();

    //    }

    //    private void cbBDonGia_SelectedIndexChanged(object sender, EventArgs e)
    //    {
    //        DataTable dt = new DataTable();
    //        string sql = "SELECT DonGia FROM VATTU WHERE DonGia='"+cbBDonGia+"'";
    //        dt.Load(kn.doc(sql));
    //        cbBDonGia.Text = dt.Rows[0]["DonGia"].ToString();
    //    }
    //    public void loadComb()
    //    {
    //        string sql = "SELECT TenNV FROM NHANVIENKHO";
    //        DataTable dt = new DataTable();
    //        dt.Load(kn.doc(sql));
    //        for (int i = 0; i < dt.Rows.Count; i++)
    //        {
    //            cbBTenNV.Items.Add(dt.Rows[i]["TenNV"]);
    //        }
    //        string sql1 = "SELECT MaNV FROM NHANVIENKHO";
    //        DataTable dt1 = new DataTable();
    //        dt1.Load(kn.doc(sql1));
    //        for (int i = 0; i < dt1.Rows.Count; i++)
    //        {
    //            cbBMaNV.Items.Add(dt1.Rows[i]["MaNV"]);            
    //        }
    //        string sql2 = "SELECT TenKH FROM KHACHHANG";
    //        DataTable dt2 = new DataTable();
    //        dt2.Load(kn.doc(sql2));
    //        for(int i=0;i<dt2.Rows.Count;i++)
    //        {
    //            cbBTenKH.Items.Add(dt2.Rows[i]["TenKH"]);           
    //        }
    //        string sql3="SELECT MaKH FROM KHACHHANG";
    //        DataTable dt3=new DataTable();
    //        dt3.Load(kn.doc(sql3));
    //        for(int i=0;i<dt3.Rows.Count;i++)
    //        {
    //          cbBMaKH.Items.Add(dt3.Rows[i]["MaKH"]);            
    //        }
    //        string sql4="SELECT MaVT FROM VATTU";
    //        DataTable dt4=new DataTable();
    //        dt4.Load(kn.doc(sql4));
    //        for(int i=0;i<dt4.Rows.Count;i++)
    //        {
    //         cbBMaVT.Items.Add(dt4.Rows[i]["MaVT"]);            
    //        }
    //        string sql5="SELECT ChungLoai FROM VATTU";
    //        DataTable dt5=new DataTable();
    //        dt5.Load(kn.doc(sql5));
    //        for(int i=0;i<dt5.Rows.Count;i++)
    //        {
    //          cbBChungLoai.Items.Add(dt5.Rows[i]["ChungLoai"]);
    //        }
    //        string sql6="SELECT DonGia FROM VATTU";
    //        DataTable dt6=new DataTable();
    //        dt6.Load(kn.doc(sql6));
    //        for(int i=0;i<dt6.Rows.Count;i++)
    //        {
    //          cbBDonGia.Items.Add(dt6.Rows[i]["DonGia"]);            
    //        }






       }
       
       

       
       
       

       

        

       

       
    //}
}
