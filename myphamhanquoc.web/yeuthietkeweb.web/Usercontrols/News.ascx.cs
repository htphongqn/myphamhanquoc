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
    public partial class News : System.Web.UI.UserControl
    {
        #region Declare
        List_news lnews = new List_news();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        Propertity per = new Propertity();
        Home index = new Home();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        int _typecat = 0;
        #endregion

        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _typecat = Utils.CIntDef(Request.QueryString["typecat"]);
            if (!IsPostBack)
            {
                LoadTitle();
                Loadlist();
            }
        }
        private void LoadTitle()
        {
            string[] page_nameUrl = Request.Url.Segments;
            if (page_nameUrl.Length > 0)
            {
                string page_name = page_nameUrl[page_nameUrl.Length - 1];
                if (page_name == "Contact.aspx")
                {
                    lbTitle.Text = "Liên hệ";
                }
                else
                {
                    object cat_ID = HttpContext.Current.Session["Cat_id"];
                    var item = per.GetCatalogryByID(cat_ID);
                    if (item != null)
                    {
                        lbTitle.Text = item.CAT_NAME;
                    }
                }
            }
            else
            {
                object cat_ID = HttpContext.Current.Session["Cat_id"];
                var item = per.GetCatalogryByID(cat_ID);
                if (item != null)
                {
                    lbTitle.Text = item.CAT_NAME;
                }
            }

        }
        
        public void Loadlist()
        {
            try
            {
                int sotin = (_typecat == 0 ? lnews.Getsotin(_Catid) : 100);
                var list = lnews.Load_listnews(_Catid);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        Rplistnews.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        Rplistnews.DataBind();
                    }
                    else
                    {
                        Rplistnews.DataSource = list.Take(sotin);
                        Rplistnews.DataBind();
                    }

                    ltrPage.Text = change.result(list.Count, sotin, _cat_seo_url, 0, _page, 1);

                }

            }
            catch (Exception)
            {

                throw;
            }
        }

        #region function
        public string Getimages_Cat(object cat_id, object cat_img)
        {
            return fun.Getimages_Cat(cat_id, cat_img);
        }
        public string Getlink_Cat(object Cat_Url, object Cat_Seo_Url)
        {
            try
            {
                return fun.Getlink_Cat(Cat_Url, Cat_Seo_Url);
            }
            catch (Exception)
            {

                throw;
            }
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

        public string getDate(object News_PublishDate)
        {
            return fun.getDate(News_PublishDate);
        }
        public string Getprice(object price)
        {
            return fun.Getprice(price);
        }
        #endregion
    }
}