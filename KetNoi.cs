using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;

namespace QuanLyKhoMayTinh
{
    class KetNoi
    {
        
        public SqlConnection taoketnoi()
        {
            return new SqlConnection(@"Data Source=DESKTOP-N0EBTUL;Initial Catalog=khomaytinh;Integrated Security=True");
        }
        public DataTable hienthi(string sql)
        {
            SqlConnection sqlConn = taoketnoi();
            DataTable dt = new DataTable();
            SqlDataAdapter sqlDa = new SqlDataAdapter(sql, sqlConn);
            sqlDa.Fill(dt);
            return dt;
        }
        public void capnhat(string sql)
        {
            SqlConnection sqlConn = taoketnoi();
            sqlConn.Open();
            SqlCommand sqlComm = new SqlCommand(sql, sqlConn);
            sqlComm.ExecuteNonQuery();
            sqlComm.Dispose();
            sqlConn.Close();
        }
     
        
        
        
    }
}
