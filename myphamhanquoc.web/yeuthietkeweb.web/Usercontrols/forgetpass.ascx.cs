using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class forgetpass : System.Web.UI.UserControl
    {
        #region Declare
        Account acc = new Account();
        SendMail send = new SendMail();
        clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            div3.Visible = true;
            Label1.Visible = false;
            div5.Visible = false;
        }
        protected void Lbforgetpass_Click(object sender, EventArgs e)
        {
            try
            {
                Panel3.CssClass = Panel3.CssClass.Replace("hidden", "");
                string _email = Txtmailforget.Value;
                string strSecView = LookCookie().ToLower();
                string strSecurity = Textcapchaforget.Text.ToString().ToLower();
                if (strSecurity != strSecView)
                {
                    Response.Write("<script>alert('Nhập mã bảo mật sai!');</script>");
                    return;
                }
                if (acc.Check_email(_email))
                {
                    string _matKhau = fm.TaoChuoiTuDong(7);
                    acc.Sendpass(_email, _matKhau);
                    send.SendMail_RecoverPassword(_email, _matKhau, acc.Name);
                    div3.Visible = false;
                    div5.Visible = true;
                }
                else Lbforgeterrors.Text = "Email không tồn tại";
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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