﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MyPham.Usercontrols
{
    public partial class CateProductsHome : System.Web.UI.UserControl
    {
        #region Decclare
        Propertity per = new Propertity();
        Function fun = new Function();
        List_product list_pro = new List_product();
        List_news lnews = new List_news();
        Home index = new Home();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Menu1();
                loadSpBanchay();
                loadSpGiamGia();
                loadSpGoiY();
                loadNews();
            }
        }

        #region LoadData
        private void loadSpBanchay()
        {
            try
            {
                rptProBanchay.DataSource = index.Loadindex(1, 2, -1, 12);
                rptProBanchay.DataBind();
            }
            catch
            {
            }
        }
        private void loadSpGiamGia()
        {
            try
            {
                rptProGiamGia.DataSource = list_pro.Load_listproGiamGia(12);
                rptProGiamGia.DataBind();
            }
            catch
            {
            }
        }
        private void loadSpGoiY()
        {
            try
            {
                rptProGoiY.DataSource = list_pro.Load_listproGoiY(12);
                rptProGoiY.DataBind();
            }
            catch
            {
            }
        }
        private void loadNews()
        {
            var list = lnews.Load_listNewsHome(12);
            int count = list.Count;
            if (count > 0)
            {
                var list1 = list.Take(1);
                rptNewsTop.DataSource = list1;
                rptNewsTop.DataBind();

                if (count > 1)
                {
                    var list2 = list.Skip(1).ToList();
                    rptNews.DataSource = list2;
                    rptNews.DataBind();
                }
            }
        }
        protected void Load_Menu1()
        {
            try
            {
                Rpmenu.DataSource = per.Load_danhmuc_position(1, 1, 2);
                Rpmenu.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion

        #region Function
        public string GetLinkNews(object News_Url, object News_Seo_Url, object cat_seo)
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
        public string GetImageAd(object Ad_Id, object Ad_Image1, object Ad_Target, object Ad_Url, object Ad_Item_Desc)
        {
            try
            {
                string temp;
                temp = fun.GetImageAd(Ad_Id, Ad_Image1, Ad_Target, Ad_Url, Ad_Item_Desc);
                return temp;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        public string GetImage_Cat(object News_Id, object News_Image1)
        {

            try
            {
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return PathFiles.GetPathCategory(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1);
                }
                else
                {
                    return "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
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
        #endregion

        protected IQueryable sanpham(object cat_parent_id)
        {
            var list = list_pro.sanpham(cat_parent_id, 8);
            return list;
        }
    }
}