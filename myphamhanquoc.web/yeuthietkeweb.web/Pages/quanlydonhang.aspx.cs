using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Web.UI.HtmlControls;

namespace yeuthietkeweb.Pages
{
    public partial class quanlydonhang : System.Web.UI.Page
    {
        Order_now order = new Order_now();
        Propertity per = new Propertity();
        Function fun = new Function();
        Config cf = new Config();
        int _count = 0;
        int _iUserID = 0;
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

            header.Title = "Quản lý đơn hàng";

            if (!IsPostBack)
            {
                LoadGridItems();
            }            
        }

        public void LoadGridItems()
        {
            var AllList = order.GetOrders(_iUserID);

            if (AllList.ToList().Count > 0)
            {
                rptOrders.DataSource = AllList;
                rptOrders.DataBind();
            }
        }

        public IQueryable LoadGridItems(object orderId)
        {
            try
            {
                int _m_id_order = Utils.CIntDef(orderId);
                var AllList = order.Load_OrderItems(_m_id_order);

                return AllList;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetThanhtien(object price, object quantity)
        {
            int _price = Utils.CIntDef(price);
            int _quantity = Utils.CIntDef(quantity);
            int _thanhtien = _price + _quantity;
            return fun.Getprice(_thanhtien);
        }
        public string GetTongtien(object ORDER_ID)
        {
            var orderitem = order.GetOrdersById(Utils.CIntDef(ORDER_ID));
            return fun.Getprice(orderitem.ORDER_TOTAL_ALL);
        }
        protected void rptOrders_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "delete")
            {
                int _sID = int.Parse(e.CommandArgument.ToString());
                order.RemoveOrders(_sID);
                Response.Redirect("/don-hang-cua-toi.html");
            }
        }

        #region funtion
        public string getPublishDate(object obj_date)
        {
            return string.Format("{0:dd-MM-yyyy}", obj_date);
        }

        public string getLink(object obj_id)
        {
            return "danh-sach-don-hang.html?id=" + Utils.CStrDef(obj_id);
        }
        public string getOrder()
        {
            _count = _count + 1;
            return _count.ToString();
        }
        public string getOrderStatus(object obj_status)
        {
            switch (Utils.CIntDef(obj_status))
            {
                case 0:
                    return "<font color='#FF0000'>Chưa xử lý</font>";
                case 1:
                    return "<font color='#0c5cd4'>Liên hệ khách hàng</font>";
                case 2:
                    return "<font color='#0c5cd4'>Giao hàng</font>";
                case 3:
                    return "<font color='#529214'>Thành công</font>";
                case 4:
                    return "<font color='#c4670c'>Thất bại</font>";
                default:
                    return "Chưa xử lý";
            }
        }
        public string getOrderPayment(object obj_payment)
        {
            switch (Utils.CIntDef(obj_payment))
            {
                case 1:
                    return "<font color='#0c5cd4'>Thanh toán bằng tiền mặt</font>";
                case 2:
                    return "<font color='#529214'>Thanh toán tại ngân hàng</font>";
                default:
                    return "Khác";
            }
        }
        public string GetMoney(object obj_value)
        {
            return string.Format("{0:#,#} đ", obj_value).Replace(',', '.');
        }
        public string GetNewsTitle(object Title)
        {
            try
            {
                return Utils.CStrDef(Title);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }        
        #endregion

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
        #endregion
    }
}