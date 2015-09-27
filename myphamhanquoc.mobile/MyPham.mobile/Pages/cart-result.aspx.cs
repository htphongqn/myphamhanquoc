using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;
using System.Web.UI.HtmlControls;

namespace yeuthietkeweb.vi_vn
{
    public partial class cart_result : System.Web.UI.Page
    {
        #region Declare
        Cart_result cart = new Cart_result();
        clsFormat fm = new clsFormat();
        Function fun = new Function();
        Config cf = new Config();
        int _count = 1;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            if (!IsPostBack)
            {
                Load_Cart(_guid);
                Lbtotal.Text = fm.FormatMoney(cart.Total_Amount(_guid));
                //saveNum();
            }
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

            header.Title = "Giỏ hàng";
        }
        public void Load_Cart(Guid _guid)
        {
            if (string.IsNullOrEmpty(Utils.CStrDef(Session["news_guid"])))
            {
                string strScript = "<script>";
                strScript += "alert('Thông báo: Giỏ hàng của bạn trống! Quay trở lại mua hàng... ');";
                strScript += "window.location='/';";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {

                var _basket = cart.Load_cart(_guid).Distinct();

                if (_basket.ToList().Count > 0)
                {

                    Rpgiohang.DataSource = _basket;
                    Rpgiohang.DataBind();
                    //liCount.Text = _basket.ToList().Count.ToString();
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert('Thông báo: Giỏ hàng của bạn trống! Quay trở lại mua hàng... ');";
                    strScript += "window.location='/';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }

        public string GetPrice(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice(News_Price1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetLink(object News_Url, object News_Seo_Url, object cat_seo)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, cat_seo);
            }
            catch (Exception ex)
            {
                vpro.functions.clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        public string GetImageT(object News_Id, object News_Image1)
        {

            try
            {
                return fun.GetImageT_News(News_Id, News_Image1);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }

        public string GetProductName(object Title, int intLength)
        {
            if (Utils.CStrDef(Title).Length > intLength)
                return Utils.CStrDef(Title).Substring(0, intLength) + "...";
            return Utils.CStrDef(Title);
        }

        protected void Rpgiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Guid _guid = (Guid)Session["news_guid"];

                int _sID = int.Parse(e.CommandArgument.ToString());
                cart.Delete_cart(_guid, _sID);
                Response.Redirect("/gio-hang.html");
            }
        }

        protected void Lbcapnhap_Click(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            for (int i = 0; i < Rpgiohang.Items.Count; i++)
            {
                DropDownList ddl = Rpgiohang.Items[i].FindControl("ddlQuanTiTy") as DropDownList;
                HtmlInputHidden s = Rpgiohang.Items[i].FindControl("newsid") as HtmlInputHidden;
                int _newid = int.Parse(s.Value);
                cart.Update_cart(_guid, _newid, Utils.CIntDef(ddl.SelectedItem.Text));
            }
            Load_Cart(_guid);
            Lbtotal.Text = fm.FormatMoney(cart.Total_Amount(_guid));
        }
        public int getorder()
        {
            return _count++;
        }
        protected void ddlQuanTiTy_SelectedIndexChanged(object sender, EventArgs e)
        {
            Lbcapnhap_Click(sender, e);
        }

        protected void Rpgiohang_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                DropDownList ddlQuanTiTy = (DropDownList)e.Item.FindControl("ddlQuanTiTy");
                if (ddlQuanTiTy != null)
                {
                    int tt = Utils.CIntDef((e.Item.DataItem as Model.Cart_result_entity).Basket_quantity);
                    ddlQuanTiTy.SelectedValue = tt.ToString();
                }
            }
        }
    }
}