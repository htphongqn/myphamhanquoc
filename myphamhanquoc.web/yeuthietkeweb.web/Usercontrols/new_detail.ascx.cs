using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using GiaNguyen.Components;
using Controller;
using vpro.functions;

namespace yeuthietkeweb.UIs
{
    public partial class new_detail : System.Web.UI.UserControl
    {
        #region Declare

        public clsFormat _clsFormat = new clsFormat();
        News_details ndetail = new News_details();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        string _sNews_Seo_Url = string.Empty;
        SendMail send = new SendMail();
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNews_Seo_Url = Utils.CStrDef(Request.QueryString["purl"]);
            Show_File_HTML();
            hplPrint.HRef = "/in/" + _sNews_Seo_Url + ".html";
            Get_ViewMore();
            Tinkhac();
            gettitle();
            LoadTitle();
        }
        private void LoadTitle()
        {
            string[] page_nameUrl = Request.Url.Segments;
            if (page_nameUrl.Length > 0)
            {
                string page_name = page_nameUrl[page_nameUrl.Length - 1];
                if (page_name == "Contact.aspx")
                {
                    //lbTitle.Text = "Liên hệ";
                }
                else
                {
                    object cat_ID = HttpContext.Current.Session["Cat_id"];
                    var item = per.GetCatalogryByID(cat_ID);
                    if (item != null)
                    {
                        //lbTitle.Text = item.CAT_NAME;
                    }
                }
            }
            else
            {
                object cat_ID = HttpContext.Current.Session["Cat_id"];
                var item = per.GetCatalogryByID(cat_ID);
                if (item != null)
                {
                    //lbTitle.Text = item.CAT_NAME;
                }
            }

        }
        #region My Function
        public void gettitle()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                lbNewsTitle.Text = ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url).Count > 0 ? ndetail.gettitle(_sCat_Seo_Url, _sNews_Seo_Url)[0].News_title : "";
            }
            catch (Exception)
            {

                throw;
            }
        }
        private void Get_ViewMore()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                hplViewmore.HRef = ndetail.Get_ViewMore(_newsID);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        private void Show_File_HTML()
        {
            try
            {
                string _sCat_Seo_Url = Utils.CStrDef(Request.QueryString["curl"]);
                if (!string.IsNullOrEmpty(_sCat_Seo_Url))
                {
                    _sNews_Seo_Url = ndetail.Get_News_seo_url(_sCat_Seo_Url);
                }
                liHtml.Text = ndetail.Showfilehtm(_sCat_Seo_Url, _sNews_Seo_Url);
                var list = ndetail.Load_details(_sNews_Seo_Url);
                if (list.Count > 0)
                {
                    //lbDesc.Text = list[0].NEWS_DESC;
                    lbNewsDate.Text = getDate(list[0].NEWS_PUBLISHDATE);
                }
                //lbCommentFace.Text = "<div class='fb-comments' data-href='http://dichvuviettel.com.vn" + Request.RawUrl + "' data-numposts='5' data-colorscheme='light' data-width='100%'></div>";
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public void Tinkhac()
        {
            try
            {
                if (_sNews_Seo_Url != "")
                {
                    var _tinTucKhac = ndetail.Load_othernews(_sNews_Seo_Url);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        RpNewsOther.DataSource = _tinTucKhac;
                        RpNewsOther.DataBind();
                    }
                    else
                        dvOtherNews.Visible = false;
                }
                else dvOtherNews.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
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
        #endregion
    }
}