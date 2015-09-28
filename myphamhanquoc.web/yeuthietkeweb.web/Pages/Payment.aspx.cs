using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Net.Mail;
using System.Text;
using System.Web.UI.HtmlControls;
using Controller;
using System.Configuration;
using GiaNguyen.Components;

namespace yeuthietkeweb.Pages
{
    public partial class Payment : System.Web.UI.Page
    {
        #region Declare
        Payment_cart pay = new Payment_cart();
        Cart_result rscart = new Cart_result();
        clsFormat fm = new clsFormat();
        SendMail sm = new SendMail();
        Config cf = new Config();
        Cart_result cart = new Cart_result();
        Function fun = new Function();
        Userinfo user = new Userinfo();
        int _iUserID = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            //_iUserID = Utils.CIntDef(Session["USER_ID"]);
            //if (_iUserID == 0) Response.Redirect("/");
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

            header.Title = "Thanh toán";
            Guid _guid = (Guid)Session["news_guid"];
            if (!pay.Check_Cart(_guid))
            {
                Response.Redirect("/trang-chu.html", false);
            }
            if (!IsPostBack)
            {
                Loaduser_info();
                Load_Cart(_guid);
                Lbtotal.Text = fm.FormatMoney(cart.Total_Amount(_guid));

            }
        }
        public void Loaduser_info()
        {
            var list = user.Loaduserinfo(_iUserID);
            if (list.Count > 0)
            {
                txtName.Value = list.First().CUSTOMER_FULLNAME;
                txtEmail.Value = list.First().CUSTOMER_EMAIL;
                txtAddress.Value = list.First().CUSTOMER_ADDRESS;
                txtPhone.Value = list.First().CUSTOMER_PHONE1;
            }
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

                var _basket = cart.Load_cart(_guid);

                if (_basket.ToList().Count > 0)
                {

                    Rpgiohang.DataSource = _basket;
                    Rpgiohang.DataBind();
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


        #region function
        public string getBuy(object news_id, object sta)
        {
            return fun.getBuy(news_id, sta);
        }
        public string Getprice(object News_Price1)
        {
            return fun.Getprice(News_Price1);
        }
        public decimal Getprice_addtocart(object News_Price1)
        {
            return fun.Getprice_addtocart(News_Price1);
        }
        public string GetPrice1(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice1(News_Price1, News_Price2);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetPrice2(object News_Price1, object News_Price2)
        {
            try
            {
                return fun.Getprice2(News_Price1, News_Price2);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        //public string Getgiam(object News_Price1, object News_Price2)
        //{
        //    return fun.Getgiamgia(News_Price1, News_Price2);
        //}
        public string Getgiamgia(object Price1, object Price2)
        {
            decimal _dPrice1 = Utils.CDecDef(Price1);
            decimal _dPrice2 = Utils.CDecDef(Price2);
            if (_dPrice2 != 0)
            {
                return Utils.CIntDef(100 - (_dPrice2 * 100 / _dPrice1)) + "%";
            }
            return "";
        }
        public string GetLink(object News_Url, object News_Seo_Url, object Cat_Seo_Url)
        {
            try
            {
                return fun.Getlink_News(News_Url, News_Seo_Url, Cat_Seo_Url);
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
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        public string GetProductName(object Title, int intLength)
        {
            if (Utils.CStrDef(Title).Length > intLength)
                return Utils.CStrDef(Title).Substring(0, intLength) + "...";
            return Utils.CStrDef(Title);
        }
        #endregion

        //public string Getnamecolor_size(object cat_id)
        //{
        //    return cart.Getnamecolor_size(cat_id);
        //}

        protected void Rpgiohang_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                Guid _guid = (Guid)Session["news_guid"];

                int _sID = int.Parse(e.CommandArgument.ToString());
                cart.Delete_cart(_guid, _sID);
                Response.Redirect("/gio-hang.html");
            }
            else if (e.CommandName == "update")
            {
                Guid _guid = (Guid)Session["news_guid"];
                int _newid = int.Parse(e.CommandArgument.ToString());
                TextBox txt = e.Item.FindControl("Txtquantity") as TextBox;
                if (int.Parse(txt.Text) <= 0 || int.Parse(txt.Text) > 50)
                {
                    string strScript = "<script>";
                    strScript += "alert('Số lượng sản phẩm phải lớn hơn 0 và nhỏ hơn 100 ');";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    cart.Update_cart(_guid, _newid, Utils.CIntDef(txt.Text));
                }
                Response.Redirect("/gio-hang.html");
            }
        }
        public void Finish()
        {
            try
            {
                Guid _guid = (Guid)Session["News_guid"];

                //Thông tin lưu vào bảng đặt hàng
                string _sName = txtName.Value;
                string _sEmail = txtEmail.Value;
                string _sAddress = txtAddress.Value;
                int _iPaymentID = Utils.CIntDef(ddlPayment.SelectedValue);
                string _sDesc = txtDesc.Value;
                DateTime _dateDate = DateTime.Now;
                string _sEmailCC = string.Empty;
                string _sPhone = txtPhone.Value;
                string _hinhtuc=ddlPayment.SelectedItem.Text;
                string _webname=ConfigurationManager.AppSettings["EmailDisplayName"];
                string _url=ConfigurationManager.AppSettings["URLWebsite"];
                var _ccMail = cf.Getemail(3);
                if (_ccMail.ToList().Count > 0)
                {
                    _sEmailCC = _ccMail.ToList()[0].EMAIL_TO;
                }
                if (pay.Payment_cart_rs(_iUserID, _guid, rscart.Total_Amount(_guid), _sEmail, _sName, _sPhone, _sAddress, _iPaymentID, _hinhtuc, _sDesc, _webname, _url))
                {
                    sm.SendEmailSMTP("Thông báo: Bạn đã đặt hàng thành công", _sEmail, _sEmailCC, "", pay._Mailbody, true, false);
                    pay.Delete_basket(_guid);
                    Response.Write("<script LANGUAGE='JavaScript' >alert('Thông báo: Xác nhận thành công. Cảm ơn bạn đã mua hàng tại cửa hàng của chúng tôi!');document.location='" + ResolveClientUrl("/trang-chu.html") + "';</script>");
                }
                else Response.Write("<script LANGUAGE='JavaScript' >alert('Lỗi!');document.location='" + ResolveClientUrl("/trang-chu.html") + "';</script>");

             
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        protected void Lbthanhtoan_Click(object sender, EventArgs e)
        {
            if (Utils.CIntDef(ddlPayment.SelectedValue) == 0)
            {
                string strScript = "<script>";
                strScript += "alert('Thông báo: Vui lòng chọn hình thức mua hàng!');";
                strScript += "</script>";
                Page.RegisterClientScriptBlock("strScript", strScript);
            }
            else
            {
                Finish();
            }
        }
       
    }
}