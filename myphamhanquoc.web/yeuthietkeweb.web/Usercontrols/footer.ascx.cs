using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.IO;
using GiaNguyen.Components;

namespace yeuthietkeweb.UIs
{
    public partial class Footer : System.Web.UI.UserControl
    {
        #region Declare
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        Controller.Register_email rg = new Controller.Register_email();
        SendMail semail = new SendMail();
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Show_Footer_HTML();
                Load_SocialNetwork();
                Load_Online();
                Load_Menu1();
                loadBrand();
            }
        }
       
        private void Show_Footer_HTML()
        {
            Literal_Info.Text = cf.Show_File_HTML("footer-vi.htm", "/Data/footer/");
        }
        protected void Load_SocialNetwork()
        {
            try
            {
                rptSocialNetwork.DataSource = per.Load_socialnetwork();
                rptSocialNetwork.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected string Bind_SocialNetwork(object ONLINE_TYPE, object ONLINE_DESC, object ONLINE_NICKNAME)
        {
            try
            {
                var list = fun.Bind_SocialNetwork(ONLINE_TYPE, ONLINE_DESC, ONLINE_NICKNAME);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        protected void Load_Online()
        {
            try
            {
                lbOnline.Text = string.Format("{0:#,#}", Utils.CIntDef(Application["Online"]));
                var _hit = cf.Config_meta();
                if (_hit.ToList().Count > 0)
                {
                    int sum = Utils.CIntDef(_hit.ToList()[0].CONFIG_HITCOUNTER);
                    lbTotal.Text = string.Format("{0:#,#}", sum);
                }
                var item = cf.counter().Where(a => (a.HIT_DATE.Value.Date - DateTime.Now.Date).Days == 0).ToList();
                if (item != null && item.Count > 0)
                {
                    int today = Utils.CIntDef(item[0].HIT_VALUE);
                    lbToday.Text = string.Format("{0:#,#}", today);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }

        #region Load data
        private void loadBrand()
        {
            rptBrand.DataSource = per.Load_Brand();
            rptBrand.DataBind();
        }
        protected void Load_Menu1()
        {
            try
            {
                Rpmenu_foot.DataSource = per.Loadmenu(1, 1, 1, -1, -1);
                Rpmenu_foot.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        #endregion

        #region Function
        public string GetLink_Cat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                string temp = fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
                return temp;
            }
            catch (Exception)
            {

                throw;
            }
        }

        public string GetStyleActive(object Cat_Seo_Url, object Cat_Url)
        {
            try
            {
                string _curl = Utils.CStrDef(Request.QueryString["curl"]);
                string _seoUrl = Utils.CStrDef(Request.QueryString["purl"]);
                return per.GetStyleActive(Cat_Seo_Url, Cat_Url);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        #endregion
        protected void lbregisemail_Click(object sender, EventArgs e)
        {
            string email = txtEmail.Value;
            if (rg.Add_email(email))
            {
                string _sMailBody = string.Empty;
                string _sEmailCC = string.Empty;
                _sMailBody += "Cám ơn bạn đã đặt đăng ký nhận tin từ e-mail với chúng tôi.";
                var _ccMail = cf.Getemail(2);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                semail.SendEmailSMTP("Thông báo: Bạn đã đăng ký nhận tin thành công", email, _sEmailCC, "", _sMailBody, true, false);

                string strScript = "<script>";
                strScript += "alert('Bạn đã đăng ký nhận tin thành công!');window.location='" + Request.RawUrl + "'";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                //Lberrors.Text = "Đăng ký thành công";
                txtEmail.Value = "";
            }
            else
            {
                //Lberrors.Text = "E-mail này đã được đăng ký";
                string strScript = "<script>";
                strScript += "alert('E-mail này đã được đăng ký!');window.location='" + Request.RawUrl + "'";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
                txtEmail.Value = "";
            }
        }
    }
}