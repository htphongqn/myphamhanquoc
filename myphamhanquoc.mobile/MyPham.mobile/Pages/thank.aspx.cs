using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.Web.UI.HtmlControls;
using Controller;

namespace MyPham.Pages
{
    public partial class thank : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        Function fun = new Function();
        Order_now order = new Order_now();
        int _idorder = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _idorder = Utils.CIntDef(Request["orderid"]);
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

            header.Title = "Thank you";
            if (!IsPostBack) loadOrder();

        }
        #region load data
        private void loadOrder()
        {
            var list = order.load_ordePaymentFinal(_idorder);
            if (list.Count > 0)
            {
                lblName.Text = list[0].ORDER_NAME;
                lblName1.Text = list[0].ORDER_NAME;
                lblCode.Text = list[0].ORDER_CODE;
                lblPayment.Text = list[0].ORDER_PAYMENT == 1 ? "Thanh toán trước (Đối với khách hàng ở Tỉnh)" : "Thanh toán khi nhận hàng";
                lblPayAll.Text = String.Format("{0:###,##0} đ", list[0].ORDER_TOTAL_ALL);
            }
        }
        #endregion
        #region function
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
        #endregion
    }
}