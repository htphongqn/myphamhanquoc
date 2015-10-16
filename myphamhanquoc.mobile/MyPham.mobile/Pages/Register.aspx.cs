using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using GiaNguyen.Components;
using vpro.functions;

namespace MyPham.Pages
{
    public partial class Register : System.Web.UI.Page
    {
        #region Declare
        Account acc = new Account();
        Config cf = new Config();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        Userinfo user = new Userinfo();
        #endregion
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

            header.Title = "Đăng ký thành viên";
        }

        protected void Lbregis_Click(object sender, EventArgs e)
        {
            string _sbody = string.Empty;
            string _email = txtEmail.Value;
            string _fullname = txtName.Value;
            string _pass = fm.MaHoaMatKhau(txtPassword1.Value);
            string _sCodeActive = fm.TaoChuoiTuDong(15);
            string _sphone = txtphone.Value;
            string _add = txtadd.Value;
            //if (this.txtcode.Value == Utils.CStrDef(this.Session["CaptchaImageText"]))
            string _capt = Request.Cookies["slmsrcd1"].Value;
            if(this.txtcode.Value == _capt)
            {
                if (acc.Register(_fullname, _email, _pass, _sphone, _add))
                {
                    string strScript = "<script>";
                    strScript += "alert(' Đăng ký thành công!');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Email này đã có người sử dụng!');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            else
            {
                string strScript = "<script>";
                strScript += "alert('Mã xác nhận không đúng!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
        public string querys()
        {
            return LookCookie();
        }
        private string LookCookie()
        {
            HttpCookie Cookie = new HttpCookie("slmsrcd1");
            Cookie = Request.Cookies["slmsrcd1"];
            string strUser = "";
            if (Cookie != null && Cookie.Value != "" &&
                 Cookie.Value != null)
            {
                strUser = Cookie.Value.ToString();
            }
            return strUser;
        }
    }
}