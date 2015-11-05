using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;

namespace yeuthietkeweb.Pages
{
    public partial class register : System.Web.UI.Page
    {
        #region Declare
        Account acc = new Account();
        clsFormat fm = new clsFormat();
        SendMail send = new SendMail();
        Userinfo user = new Userinfo();
        Config cf = new Config();
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

            header.Title = "Đăng ký";

            if (!IsPostBack)
            {
                if (!string.IsNullOrEmpty(Utils.CStrDef(HttpContext.Current.Session["User_ID"])))
                {
                    Response.Redirect("trang-chu.html");
                }
            }
        }
        protected void btnDangky_Click(object sender, EventArgs e)
        {
            try
            {
                string strSecView = LookCookie().ToLower();
                string strSecurity = txtCapcha.Value.ToString().ToLower();
                if (strSecurity != strSecView)
                {
                    Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                    return;
                }
                string _sbody = string.Empty;
                string _email = txtEmail.Value;
                string _pass = fm.MaHoaMatKhau(txtPassword.Value);
                string _fullname = txtFullname.Value;
                string _address = txtAddress.Value;
                string _Phone = txtPhone.Value;
                string _sCodeActive = fm.TaoChuoiTuDong(15);
                //if (this.txtCapcha.Value == this.Session["CaptchaImageText"].ToString())
                //{
                    if (acc.Check_email(txtEmail.Value))
                    {
                        lbMessage.Text = "Email đã có người sử dụng!";
                        return;
                    }

                    if (acc.Register(_fullname, _address, _Phone, _email, _pass))
                    {
                        string strScript = "<script>";
                        strScript += "alert(' Đăng ký thành công!');";
                        strScript += "window.location='/trang-chu.html';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                    else
                    {
                        lbMessage.Text = "Lỗi, Vui lòng thử lại!";
                    }
                //}
                //else
                //{
                //    lbMessage.Text = "Mã xác nhận không đúng!";
                //}
            }
            catch
            {
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