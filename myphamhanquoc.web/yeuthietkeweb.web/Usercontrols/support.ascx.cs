using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using GiaNguyen.Components;
using System.IO;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class support : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Hotline();
            }
        }

        protected void Load_Hotline()
        {
            try
            {
                rptHotline.DataSource = per.Load_hotline().Take(2);
                rptHotline.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        Config cf = new Config();
        SendMail sm = new SendMail();
        protected void lnkbtnGui_Click(object sender, EventArgs e)
        {
            try
            {
                string _sEmailCC = string.Empty;
                string _sEmail = txtEmail.Value;
                string _sName = txtName.Value;
                string _add = "";
                string _phone = Txtphone.Value;
                string _content = txtDesc.Value;
                string _title = "";// txttitle.Value;
                string att = FileUpload1.FileName;
                int cId = cf.Insert_contact(_sName, _sEmail, _title, _content, _add, _phone, att);
                if (FileUpload1.HasFile)
                {
                    string pathfile = Server.MapPath("/data/contact/" + cId);
                    string fullpathfile = pathfile + "/" + Path.GetFileName(FileUpload1.FileName);
                    if (!Directory.Exists(pathfile))
                    {
                        Directory.CreateDirectory(pathfile);
                    }
                    FileUpload1.SaveAs(fullpathfile);
                }
                string _mailBody = string.Empty;
                _mailBody += "<br/><br/><strong>Tên khách hàng</strong>: " + _sName;
                _mailBody += "<br/><br/><strong>Số điện thoại</strong>: " + _phone;
                _mailBody += "<br/><br/><strong>Email</strong>: " + _sEmail;
                //_mailBody += "<br/><br/><strong>Địa chỉ</strong>: " + _add;
                //_mailBody += "<br/><br/><strong>Tiêu đề</strong>: " + _title;
                _mailBody += "<br/><br/><strong>Nội dung</strong>: " + _content + "<br/><br/>";
                string _sMailBody = string.Empty;
                _sMailBody += "Cám ơn quý khách: " + _sName + " đã đặt liên hệ với chúng tôi. Đây là email được gửi từ website của " + System.Configuration.ConfigurationManager.AppSettings["EmailDisplayName"] + " <br>" + _mailBody;
                _sEmailCC = cf.Getemail(2).Count > 0 ? cf.Getemail(2)[0].EMAIL_TO : "";
                sm.SendEmailSMTP("Thông báo: Bạn đã liên hệ thành công", _sEmail, _sEmailCC, "", _sMailBody, true, false);
                string strScript = "<script>";
                strScript += "alert(' Đã gửi thành công!');";
                strScript += "window.location='"+Request.RawUrl+"';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}