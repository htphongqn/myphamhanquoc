using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;
using System.Data;
using System.Web.UI.HtmlControls;
using GiaNguyen.Components;

namespace yeuthietkeweb.Pages
{
    public partial class change_pass : System.Web.UI.Page
    {
        #region Declare
        Userinfo user = new Userinfo();
        Config cf = new Config();
        clsFormat fm = new clsFormat();
        int _iUserID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _iUserID = Utils.CIntDef(Session["USER_ID"]);
            if (_iUserID == 0) Response.Redirect("/");
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

            header.Title = "Đổi mật khẩu";
            if (!IsPostBack)
            {

            }
        }
        
        #region Update user
        protected void Lblogins_Click(object sender, EventArgs e)
        {
            string passfm = fm.MaHoaMatKhau(Txtpassnew.Value);
            if (user.Change_pass(_iUserID, passfm))
            {
                string strScript = "<script>";
                strScript += "alert(' Cập nhật thành công!');";
                strScript += "window.location='/doi-mat-khau.html';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
        }
        #endregion
    }
}