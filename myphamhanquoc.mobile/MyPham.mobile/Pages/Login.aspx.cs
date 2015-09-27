using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;
using vpro.functions;

namespace MyPham.Pages
{
    public partial class Login : System.Web.UI.Page
    {
        static Account acc = new Account();
        static clsFormat fm = new clsFormat();
        Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }

            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = "Đăng nhập";
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            if (acc.Login(txtEmail.Value, fm.MaHoaMatKhau(txtPassword.Value)))
            {
                string strScript = "<script>";
                strScript += "alert('Đăng nhập thành công!');";
                strScript += "window.location='/';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Email hoặc mật khẩu không đúng!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
    }
}