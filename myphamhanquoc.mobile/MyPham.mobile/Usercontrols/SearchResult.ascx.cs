using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace MyPham.UIs
{
    public partial class SearchResult : System.Web.UI.UserControl
    {
        #region Declare
        Search_result search = new Search_result();
        Function fun = new Function();
        Pageindex_chage change = new Pageindex_chage();
        Product_Details pro_detail = new Product_Details();
        string _txt = string.Empty;
        int _page = 0;
        clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _txt = Utils.CStrDef(Request.QueryString["key"]);
            if (!IsPostBack)
            {
                Load_list();
            }
        }
        #region Loadsearch
        public void Load_list()
        {
            try
            {
                int _sotin = 25;

                if (_txt == "Nhập từ khóa tìm kiếm…")
                {
                    _txt = "";
                }
                else
                {
                    if (!_txt.Contains("%"))
                        _txt = "%" + _txt + "%";
                }
                var _vNews = search.Load_search_resultM(_txt, 1, 0, 10);
                if (_vNews.ToList().Count > 0)
                {
                    if (_page != 0)
                    {

                        Rplistpro.DataSource = _vNews.Skip(_sotin * _page - _sotin).Take(_sotin);
                        Rplistpro.DataBind();
                    }
                    else
                    {
                        Rplistpro.DataSource = _vNews.Take(_sotin);
                        Rplistpro.DataBind();
                    }
                }


            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        public int getCountList()
        {
            var list = search.Load_search_resultM(_txt, 1, 0, 999);
            return list.Count;
        }
        public int getId()
        {
            return 0;
        }
        public string getKey()
        {
            return _txt;
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
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        public string GetPrice(object News_Price1, object News_Price2)
        {
            try
            {
                decimal _dPrice1 = Utils.CDecDef(News_Price1);
                decimal _dPrice2 = Utils.CDecDef(News_Price2);
                if (_dPrice1 == 0)
                {
                    return "Liên hệ";
                }
                else
                {
                    if (_dPrice2 != 0)
                    {
                        return fun.Getprice(_dPrice2);
                    }
                    else
                    {
                        return fun.Getprice(_dPrice1);
                    }
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string hienthigia(object gia1, object gia2)
        {
            int giam = tinh_phantram(gia1, gia2);
            if (giam > 0)
            {
                return "<div class='reduce'>-" + giam + "%</div>";
            }
            else
                return "";

        }
        public int tinh_phantram(object News_Price1, object News_Price2)
        {
            if (Utils.CIntDef(News_Price1) == 0 || Utils.CIntDef(News_Price2) == 0)
            {
                return 0;
            }
            else
            {
                decimal _dPrice1 = Utils.CDecDef(News_Price1);
                decimal _dPrice2 = Utils.CDecDef(News_Price2);
                decimal s = (_dPrice1 * 100) / _dPrice2;
                s = 100 - s;
                int d = Utils.CIntDef(s);
                return d;
            }
        }
        #endregion
        protected void Rplistnews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddCart")
            {
                string _sNews_Seo_Url = Utils.CStrDef(e.CommandArgument);
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                        Response.Redirect("~/Resources/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=1");
                }
            }
        }
    }
}