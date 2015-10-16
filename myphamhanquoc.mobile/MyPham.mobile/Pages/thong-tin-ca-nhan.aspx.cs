using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;
using GiaNguyen.Components;

namespace MyPham.Pages
{
    public partial class thong_tin_ca_nhan : System.Web.UI.Page
    {
        #region Declare
        clsFormat fm = new clsFormat();
        Account ac = new Account();
        Userinfo user = new Userinfo();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {

            var _configs = ac.config();

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

            header.Title = "Thông tin cá nhân";
            if (!IsPostBack)
            {
                LoadUserAuto();
            }
        }

        public void LoadUserAuto()
        {
            try
            {
                if (Session["USER_ID"] != null)
                {
                    int _iUserID = Utils.CIntDef(Session["USER_ID"]);
                    var _vUser = ac.loadUser(_iUserID);
                    if (_vUser.Count > 0)
                    {
                        Lbemail.Text = _vUser.First().CUSTOMER_EMAIL;
                        Txtname.Text = _vUser.First().CUSTOMER_FULLNAME;
                        Txtphone.Text = _vUser.First().CUSTOMER_PHONE1;
                        Txtadd.Text = _vUser.First().CUSTOMER_ADDRESS;
                    }
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Thông báo: Bạn chưa đăng nhập ');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        protected void btnFinish_Click(object sender, EventArgs e)
        {
            try
            {

                int _iUserID = Utils.CIntDef(Session["USER_ID"]);
                //var _vUser = ac.loadUser(_iUserID);
                if (ac.updateUserInfo(_iUserID, Txtname.Text, Txtphone.Text, Txtadd.Text) == true)
                {
                    string strScript = "<script>";
                    strScript += "alert(' Cập nhật thành công!');";
                    strScript += "window.location='/thong-tin-ca-nhan.html';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}