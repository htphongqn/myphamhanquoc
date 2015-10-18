﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MyPham.Pages
{
    public partial class ajaxmoreprolist : System.Web.UI.Page
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        Propertity per = new Propertity();
        Controller.Home index = new Controller.Home();
        Search_result search = new Search_result();
        int _Catid = 0;
        int _skip = 0;
        int _code = 0;
        int _cat = 0;
        int _page = 0;
        string _txt = string.Empty;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Request.QueryString["id"]);
            _skip = Utils.CIntDef(Request.QueryString["skip"]);
            _code = Utils.CIntDef(Request.QueryString["code"]);

            _page = Utils.CIntDef(Request.QueryString["page"]);
            _txt = Utils.CStrDef(Request.QueryString["key"]);
            if (!IsPostBack)
            {
                switch (_code)
                {
                    case 1: Loadlist(); break;
                    case 2: Load_listSearch(); break;
                }
            }
        }

        public void Loadlist()
        {
            try
            {
                int sotin = list_pro.Getsotin(_Catid);
                var list = list_pro.Load_listproM(_Catid, _skip, 12);
                if (list.Count > 0)
                {
                    Rplistpro.DataSource = list;
                    Rplistpro.DataBind();
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        public void Load_listSearch()
        {
            try
            {
                if (_txt == "Tìm kiếm...")
                {
                    _txt = "";
                }
                else
                {
                    if (!_txt.Contains("%"))
                        _txt = "%" + _txt + "%";
                }
                var _vNews = search.Load_search_resultM(_txt, 1, _skip, 12);
                if (_vNews.ToList().Count > 0)
                {
                    Rplistpro.DataSource = _vNews;
                    Rplistpro.DataBind();
                }


            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
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
    }
}