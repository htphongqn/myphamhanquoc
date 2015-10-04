using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class top_main : System.Web.UI.UserControl
    {
        #region Declare
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Txtsearch.Attributes.Add("onkeypress", "return clickButton(event,'" + Lbsearch.ClientID + "')");
            if (!string.IsNullOrEmpty(Utils.CStrDef(Session["User_ID"])))
            {
                lbthanhvien.Text = Utils.CStrDef(Session["User_Name"]);
                div_login.Visible = false;
                div_login2.Visible = false;
                div_logout.Visible = true;
            }
            else
            {
                div_login.Visible = true;
                div_login2.Visible = true;
                div_logout.Visible = false;
            }
            if (!IsPostBack)
            {
                Load_Menu1();
                LoadSearchCatsProduct();
            }
        }
        protected void Lbsearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("/tim-kiem.html?page=0&catid=" + ddlSearchCatsProduct.SelectedValue + "&keyword=" + Txtsearch.Value);
        }
        private void LoadSearchCatsProduct()
        {
            //var list = per.Load_danhmuc(1, 1, -1);
            //ddlSearchCatsProduct.DataSource = list;
            //ddlSearchCatsProduct.DataBind();
        }
        protected void Load_Menu1()
        {
            try
            {
                var list = per.Load_danhmuc(1, 1, -1);
                Rpmenu.DataSource = list;
                Rpmenu.DataBind();

                ddlSearchCatsProduct.DataSource = list;
                ddlSearchCatsProduct.DataBind();
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
        protected bool DisplayLoad_Menu2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                if (list != null && list.ToList().Count > 0)
                    return true;
                else
                    return false;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return false;
            }
        }
        public string GetImage_Cat(object Cat_id, object Cat_img)
        {
            return fun.Getimages_Cat(Cat_id, Cat_img);
        }
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
        protected void lbtnDangXuat_Click(object sender, EventArgs e)
        {
            try
            {
                //sau khi đăng xuất, xóa hết sản phẩm trong giỏ hàng của người đó
                LogOut();
                Session["Login_Email"] = null;
                Session["User_ID"] = null;
                //Response.Redirect(Request.RawUrl);
                Response.Redirect("/");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void LogOut()
        {
            try
            {
                Session.Abandon();
                Response.Redirect("/");

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}