using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using System.Collections;
using GiaNguyen.Components;
using MVC_Kutun.Components;
using System.Web.UI.HtmlControls;

namespace yeuthietkeweb.Pages
{
    public partial class sanphamtheothuonghieu : System.Web.UI.Page
    {
        Function fun = new Function();
        Propertity per = new Propertity();
        Controller.Home index = new Controller.Home();
        List_product list_pro = new List_product();
        Checkcookie ck = new Checkcookie();
        setCookieLike ck_like = new setCookieLike();
        Product_Details pro_detail = new Product_Details();
        clsFormat fm = new clsFormat();
        Config cf = new Config();
        Pageindex_chage change = new Pageindex_chage();
        int _thuonghieu = 0;
        int _page = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _thuonghieu = Utils.CIntDef(Request.QueryString["thuonghieu"]);


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

            
            var brand = per.GetBrandById(_thuonghieu);
            if (brand != null)
            {
                header.Title = brand.NAME;
                Lbtitle.Text = brand.NAME;
                Lbtitle2.Text = brand.NAME;
            }
            Loadlist();
            loadBrand();
        }
        private void loadBrand()
        {
            var list = per.Load_Brand();
            //change source
            List<string[]> l = new List<string[]>();
            foreach (var item in list)
            {
                int count = list_pro.GetCountProductByBrandId(item.ID);
                l.Add(new string[] { item.ID.ToString(), item.NAME, "/thuong-hieu.html?thuonghieu=" + item.ID.ToString(), "/data/brand/" + item.ID.ToString() + "/" + item.IMAGE1, item.NAME + " (" + count + ")" });
            }
            var brands = from obj in l
                         select new
                         {
                             Id = obj[0],
                             Name = obj[1],
                             Url = obj[2],
                             ImageUrl = obj[3],
                             NameCount = obj[4],
                         };
            //rpt
            rptBrands.DataSource = brands;
            rptBrands.DataBind();
        }
        public void Loadlist()
        {
            try
            {
                int sotin = 30;
                var list = list_pro.loadProductByBrandId(_thuonghieu);
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

                    ltrPage.Text = change.result(list.Count, sotin, "thuong-hieu", "", 0, _thuonghieu.ToString(), 0, "", 0, _page, 3);

                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        protected void lnkRemoveyeuthich_Click(object sender, EventArgs e)
        {
            string url = Request.RawUrl;
            if (!String.IsNullOrEmpty(url))
            {
                string _sNews_Seo_Url = Utils.CStrDef(((LinkButton)sender).CommandArgument);
                string[] a = url.Split('?');
                if (ck.Listcookie_like().Contains(_sNews_Seo_Url))
                {
                    ck_like.Removecookie(_sNews_Seo_Url);
                    string strScript = "<script>";
                    strScript += "alert('Đã xóa sản phẩm khỏi danh sách so sánh!');";
                    strScript += "window.location='" + a[0] + "';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
        }
        protected void Rplistnews_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "AddCart")
            {
                string _sNews_Seo_Url = Utils.CStrDef(e.CommandArgument);
                var list = pro_detail.Load_Product_Detail(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                        Response.Redirect("~/vi-vn/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=1");
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
                return "<div class='reducephantram'>" + Utils.CIntDef(100 - (_dPrice2 * 100 / _dPrice1)) + "%</div>";
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