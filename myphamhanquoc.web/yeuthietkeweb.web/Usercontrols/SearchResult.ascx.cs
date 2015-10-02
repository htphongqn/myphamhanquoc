﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace yeuthietkeweb.UIs
{
    public partial class SearchResult : System.Web.UI.UserControl
    {
        #region Declare
        Search_result search = new Search_result();
        Function fun = new Function();
        Pageindex_chage change = new Pageindex_chage();
        Product_Details pro_detail = new Product_Details();
        string _txt = string.Empty; int _catid = 0;
        int _page = 0;
        clsFormat fm = new clsFormat();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _txt = Utils.CStrDef(Request.QueryString["keyword"]);
            _catid = Utils.CIntDef(Request.QueryString["catid"]);
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

                if (_txt == "Từ khóa tìm kiếm")
                {
                    _txt = "";
                }
                else
                {
                    if (!_txt.Contains("%"))
                        _txt = "%" + _txt + "%";
                }
                var _vNews = search.Load_search_result(_txt, -1);
                if (_vNews.ToList().Count > 0)
                {
                    if (_page != 0)
                    {

                        rptProducts.DataSource = _vNews.Skip(_sotin * _page - _sotin).Take(_sotin);
                        rptProducts.DataBind();
                    }
                    else
                    {
                        rptProducts.DataSource = _vNews.Take(_sotin);
                        rptProducts.DataBind();
                    }
                    ltrPage.Text = change.result(_vNews.ToList().Count, _sotin, "", _txt, _catid, "", 0, "", 0, _page, 2);
                }


            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
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
        public string Getgiamgia(object News_Price1, object News_Price2)
        {
            return fun.Getgiamgia(News_Price1, News_Price2);
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