using QLBanSach.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace QLBanSach
{
    public partial class ThemSach : System.Web.UI.Page
    {
        SachDAO sachDAO = new SachDAO();
        protected void btXuLy_Click(object sender, EventArgs e)
        {
            try
            {
                int macd = int.Parse(ddlChuDe.SelectedValue);
                string tensach = txtTenSach.Text;
                bool khuyenmai = chkKhuyenMai.Checked;
                int dongia = int.Parse(txtDongia.Text);
                DateTime NgayCapNhat = DateTime.Now;

                //xu ly upload file anh
                string hinh = FHinh.FileName;
                string path = Server.MapPath("~/bia_sach") + "/" + FHinh.FileName;
                FHinh.SaveAs(path);

                //tao doi tuong can them 
                Sach sach = new Sach { TenSach = tensach, KhuyenMai = khuyenmai, Dongia = dongia, MaCD = macd, Hinh = hinh,NgayCapNhat=NgayCapNhat };
                //goi phuong thuc tu lop DAO de them vao CSDL
                sachDAO.Insert(sach);

                lbThongBao.Text = "Thao tác thêm tour thành công";
                Response.AddHeader("Refresh", "1; url=XemSach.aspx");
            }
            catch (Exception ex)
            {
                lbThongBao.Text = "Thao tác thêm tour thất bại";

            }


        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }
    }
}