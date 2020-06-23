namespace QuanLyKhoMayTinh
{
    partial class frmHoaDon
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.tabControl1 = new System.Windows.Forms.TabControl();
            this.tabPage1 = new System.Windows.Forms.TabPage();
            this.btnThoat = new System.Windows.Forms.Button();
            this.btnTinh = new System.Windows.Forms.Button();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.label9 = new System.Windows.Forms.Label();
            this.cbBDonGia = new System.Windows.Forms.ComboBox();
            this.label8 = new System.Windows.Forms.Label();
            this.txtbTongTien = new System.Windows.Forms.TextBox();
            this.cbBChungLoai = new System.Windows.Forms.ComboBox();
            this.cbBMaVT = new System.Windows.Forms.ComboBox();
            this.cbBTenKH = new System.Windows.Forms.ComboBox();
            this.cbBTenNV = new System.Windows.Forms.ComboBox();
            this.txtbSoLuong = new System.Windows.Forms.TextBox();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label1 = new System.Windows.Forms.Label();
            this.tabControl1.SuspendLayout();
            this.tabPage1.SuspendLayout();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // tabControl1
            // 
            this.tabControl1.Controls.Add(this.tabPage1);
            this.tabControl1.Location = new System.Drawing.Point(1, 12);
            this.tabControl1.Name = "tabControl1";
            this.tabControl1.SelectedIndex = 0;
            this.tabControl1.Size = new System.Drawing.Size(614, 376);
            this.tabControl1.TabIndex = 0;
            // 
            // tabPage1
            // 
            this.tabPage1.Controls.Add(this.btnThoat);
            this.tabPage1.Controls.Add(this.btnTinh);
            this.tabPage1.Controls.Add(this.groupBox1);
            this.tabPage1.Location = new System.Drawing.Point(4, 22);
            this.tabPage1.Name = "tabPage1";
            this.tabPage1.Padding = new System.Windows.Forms.Padding(3);
            this.tabPage1.Size = new System.Drawing.Size(606, 350);
            this.tabPage1.TabIndex = 0;
            this.tabPage1.Text = "Tính Dòng Hóa Đơn";
            this.tabPage1.UseVisualStyleBackColor = true;
            // 
            // btnThoat
            // 
            this.btnThoat.Location = new System.Drawing.Point(328, 309);
            this.btnThoat.Name = "btnThoat";
            this.btnThoat.Size = new System.Drawing.Size(75, 23);
            this.btnThoat.TabIndex = 2;
            this.btnThoat.Text = " Thoát";
            this.btnThoat.UseVisualStyleBackColor = true;
            this.btnThoat.Click += new System.EventHandler(this.btnThoat_Click);
            // 
            // btnTinh
            // 
            this.btnTinh.Location = new System.Drawing.Point(177, 309);
            this.btnTinh.Name = "btnTinh";
            this.btnTinh.Size = new System.Drawing.Size(75, 23);
            this.btnTinh.TabIndex = 1;
            this.btnTinh.Text = "Tính Tiền";
            this.btnTinh.UseVisualStyleBackColor = true;
            this.btnTinh.Click += new System.EventHandler(this.btnTinh_Click);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.cbBDonGia);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.txtbTongTien);
            this.groupBox1.Controls.Add(this.cbBChungLoai);
            this.groupBox1.Controls.Add(this.cbBMaVT);
            this.groupBox1.Controls.Add(this.cbBTenKH);
            this.groupBox1.Controls.Add(this.cbBTenNV);
            this.groupBox1.Controls.Add(this.txtbSoLuong);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label1);
            this.groupBox1.Location = new System.Drawing.Point(4, 4);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(599, 284);
            this.groupBox1.TabIndex = 0;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Chi Tiết Hóa Đơn";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(177, 181);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(49, 13);
            this.label9.TabIndex = 23;
            this.label9.Text = " Đơn Giá";
            // 
            // cbBDonGia
            // 
            this.cbBDonGia.FormattingEnabled = true;
            this.cbBDonGia.Items.AddRange(new object[] {
            "9",
            "11",
            "32",
            "30",
            "26",
            "34",
            "31",
            "17",
            "61",
            "148",
            "350",
            "725",
            "320",
            "350",
            "250",
            "38",
            "38",
            "20",
            "26",
            "27",
            "95",
            "21",
            "17",
            "52",
            "20",
            "20",
            "75",
            "93",
            "178",
            "35",
            "85",
            "99",
            "198",
            "42",
            "46",
            "81",
            "57",
            "65",
            "77",
            "66",
            "119",
            "47",
            "118",
            "126",
            "250",
            "220",
            "326",
            "1000",
            "11",
            "13",
            "57",
            "63",
            "450",
            "300",
            "800",
            "310",
            "890",
            "470",
            "16",
            "16",
            "25",
            "13",
            "62",
            "113",
            "30",
            "7",
            "8",
            "79",
            "52",
            "165",
            "212",
            "306",
            "82",
            "47",
            "48",
            "80",
            "37",
            "16",
            "28"});
            this.cbBDonGia.Location = new System.Drawing.Point(248, 178);
            this.cbBDonGia.Name = "cbBDonGia";
            this.cbBDonGia.Size = new System.Drawing.Size(151, 21);
            this.cbBDonGia.TabIndex = 22;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(167, 249);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(59, 13);
            this.label8.TabIndex = 21;
            this.label8.Text = " Tổng Tiền";
            // 
            // txtbTongTien
            // 
            this.txtbTongTien.Location = new System.Drawing.Point(247, 249);
            this.txtbTongTien.Name = "txtbTongTien";
            this.txtbTongTien.Size = new System.Drawing.Size(150, 20);
            this.txtbTongTien.TabIndex = 20;
            // 
            // cbBChungLoai
            // 
            this.cbBChungLoai.FormattingEnabled = true;
            this.cbBChungLoai.Items.AddRange(new object[] {
            "Chuột                         ",
            "Chuột                         ",
            "DVD Rewrite",
            "DVD Rewrite",
            "DVD Rewrite",
            "DVD Rewrite",
            "DVD Rewrite",
            "Chuột                         ",
            "CPU",
            "CPU",
            "Màn hình",
            "Màn hình",
            "Màn Hình",
            "Màn Hình",
            "Màn Hình",
            "CPU",
            "RAM",
            "RAM",
            "RAM",
            "RAM",
            "RAM",
            "RAM",
            "DVD Rom",
            "CPU",
            "DVD Rom",
            "DVD Rom",
            "Video Card",
            "Video Card",
            "Video Card",
            "Bàn Phím",
            "Bàn Phím",
            "Bàn Phím",
            "Bàn Phím",
            "Mother broad",
            "Mother broad",
            "Mother broad",
            "Mother broad",
            "Mother broad",
            "Mother broad",
            "Video Card",
            "Video Card",
            "Video Card",
            "CPU",
            "CPU",
            "CPU",
            "CPU",
            "CPU",
            "CPU",
            "Bàn Phím",
            "Bàn Phím",
            "Bàn Phím",
            "Bàn Phím",
            "Màn hình",
            "Màn Hình",
            "Màn Hình",
            "Màn Hình",
            "Màn Hình",
            "Màn Hình",
            "Chuột                         ",
            "Chuột                         ",
            "Chuột                         ",
            "Chuột                         ",
            "Chuột                         ",
            "Chuột                         ",
            "Bàn Phím",
            "Chuột                         ",
            "Chuột                         ",
            "Mother broad",
            "Mother broad",
            "CPU",
            "CPU",
            "CPU",
            "HDD",
            "HDD",
            "HDD",
            "HDD",
            "HDD",
            "Chuột                         ",
            "Chuột                         "});
            this.cbBChungLoai.Location = new System.Drawing.Point(248, 147);
            this.cbBChungLoai.Name = "cbBChungLoai";
            this.cbBChungLoai.Size = new System.Drawing.Size(151, 21);
            this.cbBChungLoai.TabIndex = 19;
            // 
            // cbBMaVT
            // 
            this.cbBMaVT.FormattingEnabled = true;
            this.cbBMaVT.Items.AddRange(new object[] {
            " M100     ",
            "1000      ",
            "22B2L     ",
            "22B2S     ",
            "22X       ",
            "24B1LT    ",
            "24B1ST    ",
            "3000      ",
            "AM3 Athlon",
            "AM3 Phenom",
            "BX300     ",
            "BX400     ",
            "C350      ",
            "C400      ",
            "C450      ",
            "D450      ",
            "DDR2-800  ",
            "DDR2-800A ",
            "DDR2-800B ",
            "DDR3-1333 ",
            "DDR3-1600 ",
            "DDR400    ",
            "E16x48    ",
            "E3300     ",
            "E818A3    ",
            "E818A6T   ",
            "EAH5450   ",
            "ENGT2201  ",
            "ENGTX275  ",
            "G1        ",
            "G110      ",
            "G15       ",
            "G19       ",
            "G31MX     ",
            "G41MVF20  ",
            "GAEP41TUDL",
            "GAG31MES2C",
            "GAG41MT   ",
            "GAP41TES3G",
            "GVN210D2  ",
            "GVN240D3  ",
            "GVNX84S   ",
            "i3-530    ",
            "i3-540    ",
            "i5-660    ",
            "i5-760    ",
            "i7-920    ",
            "i7-990    ",
            "K100      ",
            "K120      ",
            "K340      ",
            "K350      ",
            "L32A10    ",
            "L32C20    ",
            "L42F10S   ",
            "LD310     ",
            "LF20FR    ",
            "LH70IR    ",
            "M115      ",
            "M125      ",
            "M215      ",
            "M305      ",
            "M555      ",
            "M950      ",
            "MK140     ",
            "N110      ",
            "N3000     ",
            "P5G41TM   ",
            "P5KPLAMSE ",
            "Q8300     ",
            "Q9400     ",
            "Q9550     ",
            "SATA2-1TB ",
            "SATA2-1TBA",
            "SATA2-2TB ",
            "SATA2-2TBA",
            "SATA2-80GB",
            "V1        ",
            "V2        "});
            this.cbBMaVT.Location = new System.Drawing.Point(248, 114);
            this.cbBMaVT.Name = "cbBMaVT";
            this.cbBMaVT.Size = new System.Drawing.Size(151, 21);
            this.cbBMaVT.TabIndex = 18;
            this.cbBMaVT.Text = " ";
            // 
            // cbBTenKH
            // 
            this.cbBTenKH.FormattingEnabled = true;
            this.cbBTenKH.Items.AddRange(new object[] {
            "Duy Khánh",
            "Lưu Vỹ",
            "Gia Minh"});
            this.cbBTenKH.Location = new System.Drawing.Point(418, 57);
            this.cbBTenKH.Name = "cbBTenKH";
            this.cbBTenKH.Size = new System.Drawing.Size(146, 21);
            this.cbBTenKH.TabIndex = 16;
            // 
            // cbBTenNV
            // 
            this.cbBTenNV.FormattingEnabled = true;
            this.cbBTenNV.Items.AddRange(new object[] {
            "Nguyễn Minh Hùng",
            "Phạm Minh Thắng",
            "Vũ Minh Tuyết"});
            this.cbBTenNV.Location = new System.Drawing.Point(107, 57);
            this.cbBTenNV.Name = "cbBTenNV";
            this.cbBTenNV.Size = new System.Drawing.Size(151, 21);
            this.cbBTenNV.TabIndex = 14;
            // 
            // txtbSoLuong
            // 
            this.txtbSoLuong.Location = new System.Drawing.Point(247, 214);
            this.txtbSoLuong.Name = "txtbSoLuong";
            this.txtbSoLuong.Size = new System.Drawing.Size(150, 20);
            this.txtbSoLuong.TabIndex = 13;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(170, 217);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(56, 13);
            this.label7.TabIndex = 12;
            this.label7.Text = " Số Luợng";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(162, 150);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(64, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = " Chủng Loại";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(166, 114);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(60, 13);
            this.label5.TabIndex = 8;
            this.label5.Text = " Mã Vật Tư";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(308, 57);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(89, 13);
            this.label3.TabIndex = 6;
            this.label3.Text = "Tên Khách Hàng";
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(6, 57);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(82, 13);
            this.label1.TabIndex = 1;
            this.label1.Text = " Tên Nhân Viên";
            // 
            // frmHoaDon
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(612, 391);
            this.Controls.Add(this.tabControl1);
            this.Name = "frmHoaDon";
            this.Text = "Hóa Đơn";
            this.Load += new System.EventHandler(this.frmHoaDon_Load);
            this.tabControl1.ResumeLayout(false);
            this.tabPage1.ResumeLayout(false);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.TabControl tabControl1;
        private System.Windows.Forms.TabPage tabPage1;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.ComboBox cbBMaVT;
        private System.Windows.Forms.ComboBox cbBTenKH;
        private System.Windows.Forms.ComboBox cbBTenNV;
        private System.Windows.Forms.TextBox txtbSoLuong;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Button btnTinh;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.TextBox txtbTongTien;
        private System.Windows.Forms.ComboBox cbBChungLoai;
        private System.Windows.Forms.Button btnThoat;
        private System.Windows.Forms.ComboBox cbBDonGia;
        private System.Windows.Forms.Label label9;
    }
}