using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class home_main : System.Web.UI.UserControl
    {
        Function fun = new Function();
        Propertity per = new Propertity();
        Home index = new Home();
        int autoId = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_ads();
                Load_Menu1();
                loadBrand();
                loadSpNoibat();
                loadSpBanchay();
                loadSpMuanhieu();
                loadCatHome();
            }
        }
        #region producthome
        private void loadSpNoibat()
        {
            try
            {
                rptProNoibat.DataSource = index.Loadindex(1, 1, -1, 20);
                rptProNoibat.DataBind();
            }
            catch
            {
            }
        }

        private void loadSpBanchay()
        {
            try
            {
                rptProBanchay.DataSource = index.Loadindex(1, 2, -1, 20);
                rptProBanchay.DataBind();
            }
            catch
            {
            }
        }

        private void loadSpMuanhieu()
        {
            try
            {
                rptPromuanhieu.DataSource = index.Loadindex(1, 3, -1, 20);
                rptPromuanhieu.DataBind();
            }
            catch
            {
            }
        }
        #endregion
        #region load cathome
        private void loadCatHome()
        {
            rptCatHome.DataSource = index.Load_cate_index(10, 1);
            rptCatHome.DataBind();
        }
        public IQueryable Load_proindex(object catid, int limit)
        {
            return index.Load_pro_index_cate(catid, limit);
        }
        #endregion
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(1, 1);
                rptAds.DataSource = list;
                rptAds.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
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
        public int getIdAuto()
        {
            autoId++;
            return autoId;
        }
        private void loadBrand()
        {
            var list = per.Load_Brand();
            //change source
            List<string[]> l = new List<string[]>();
            foreach (var item in list)
            {
                l.Add(new string[] { item.ID.ToString(), item.NAME, "/thuong-hieu.html?thuonghieu=" + item.ID.ToString(), "/data/brand/" + item.ID.ToString() + "/" + item.IMAGE1 });
            }
            var brands = from obj in l
                             select new
                             {
                                 Id = obj[0],
                                 Name = obj[1],
                                 Url = obj[2],
                                 ImageUrl = obj[3]
                             };

            //ddl
            ddlBrand.DataTextField = "Name";
            ddlBrand.DataValueField = "Url";
            ddlBrand.DataSource = brands;
            ddlBrand.DataBind();
            ddlBrand.SelectedIndex = 0;
            //rpt
            rptBrands.DataSource = brands;
            rptBrands.DataBind();
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
        protected IQueryable Load_Menu2(object cat_parent_id)
        {
            try
            {
                var list = per.Menu2(cat_parent_id);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        protected IQueryable Load_Menu2(object cat_parent_id, object limit)
        {
            try
            {
                int limited = Utils.CIntDef(limit);
                var list = per.Menu2(cat_parent_id).Take(limited);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        #region function
        public string GetImage_Cat(object Cat_id, object Cat_img)
        {
            return fun.Getimages_Cat(Cat_id, Cat_img);
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
        public int getidcapcha(object Cat_id)
        {
            string[] a = Cat_id.ToString().Split(',');
            return Utils.CIntDef(a[1]);
        }
        #endregion
    }
}