using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace yeuthietkeweb.UIs
{
    public partial class product_list : System.Web.UI.UserControl
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        Home index = new Home();
        Propertity per = new Propertity();
        int _Catid = 0;
        string _idbrand = "";
        string _cat_seo_url = string.Empty;
        int _page = 0;
        string _price;
        int _typepri, _sortvl = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _idbrand = Utils.CStrDef(Request.QueryString["idbrand"]);
            _typepri = Utils.CIntDef(Request.QueryString["typepri"]);
            _price = Utils.CStrDef(Request.QueryString["price"]);
            _sortvl = Utils.CIntDef(Request.QueryString["sort"]);
            if (!IsPostBack)
            {               
                Loadtitle();
                Loadlist();
            }
        }
        public void Loadtitle()
        {
            try
            {
                Lbtitle.Text = list_pro.Loadtitle(_cat_seo_url);
            }
            catch
            {

            }
        }
        public void Loadlist()
        {
            try
            {
                int sotin = list_pro.Getsotin(_Catid);
                var list = list_pro.loadProductByAll(_Catid, _idbrand, _typepri, _price, _sortvl);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        rptProducts.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        rptProducts.DataBind();
                    }
                    else
                    {
                        rptProducts.DataSource = list.Take(sotin);
                        rptProducts.DataBind();
                    }

                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, "", _Catid, _idbrand, _sortvl, _price, _typepri, _page, 1);

                }

            }
            catch
            {
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
        #endregion

        protected void ddlSort_SelectedIndexChanged(object sender, EventArgs e)
        {
            string getUrl = "&price=" + _price + "&typepri=" + _typepri + "&idbrand=" + _idbrand + "&sort=" + ddlSort.SelectedItem.Value;
            Response.Redirect("~/" + _cat_seo_url + ".html?page=0" + getUrl);
        }
    }
}