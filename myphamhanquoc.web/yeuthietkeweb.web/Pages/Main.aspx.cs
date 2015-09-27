using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using vpro.functions;
using Controller;

namespace yeuthietkeweb
{
    public partial class Main : System.Web.UI.Page
    {
        #region Declare
        Get_session getsession = new Get_session();
        Config cf = new Config();
        #endregion
        #region Page Event
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                Bind_icon();

                UserControl product_list = Page.LoadControl("../Usercontrols/product_list.ascx") as UserControl;
                UserControl product_detail = Page.LoadControl("../Usercontrols/product_detail.ascx") as UserControl;
                UserControl news_list = Page.LoadControl("../Usercontrols/news_list.ascx") as UserControl;
                UserControl new_detail = Page.LoadControl("../Usercontrols/new_detail.ascx") as UserControl;
                UserControl search = Page.LoadControl("../Usercontrols/SearchResult.ascx") as UserControl;
                int _type = Utils.CIntDef(Request["type"]);
                string _catSeoUrl = Utils.CStrDef(Request.QueryString["curl"]);
                string _newsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);

                switch (_type)
                {
                    case 3:
                        getsession.LoadCatInfo(_catSeoUrl);
                        Bind_meta_tags_cat();
                        if (Utils.CIntDef(Session["Cat_type"]) == 1)
                        {
                            phdMain.Controls.Add(product_list);
                        }
                        else
                        {
                            if (Utils.CIntDef(Session["Cat_showitem"]) == 1)
                            {
                                phdMain.Controls.Add(new_detail);
                            }
                            else phdMain.Controls.Add(news_list);
                        }
                        break;
                    case 5:
                        Bind_meta_tags_index();
                        HtmlHead header = base.Header;           
                        header.Title = "Tìm kiếm";
                        phdMain.Controls.Add(search);
                        break;
                    case 6:
                        getsession.LoadNewsInfo(_newsSeoUrl);
                        Bind_meta_tags_news();
                        if (getsession.Getcat_type(_newsSeoUrl) == 1)
                        {
                            phdMain.Controls.Add(product_detail);
                        }
                        else
                        {
                            phdMain.Controls.Add(new_detail);
                        }
                        break;
                    default:
                        Response.Redirect("/trang-chu.html");
                        break;
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
        public void Bind_meta_tags_cat()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            //Face tags
            HtmlMeta propety = new HtmlMeta();
            HtmlMeta propetyTitle = new HtmlMeta();
            HtmlMeta propetyDesc = new HtmlMeta();
            //Twitter tags
            HtmlMeta propetyTw = new HtmlMeta();
            HtmlMeta propetyTitleTw = new HtmlMeta();
            HtmlMeta propetyDescTw = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            header.Title = Utils.CStrDef(Session["Cat_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["Cat_seo_keyword"]);


            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            //Facebook meta
            propety.Attributes.Add("property", "og:image");
            propety.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathCategory(Utils.CIntDef(Session["Cat_id"])) + Utils.CStrDef(Session["Cat_image1"]);
            header.Controls.Add(propety);
            //Title         
            propetyTitle.Attributes.Add("property", "og:title");
            propetyTitle.Content = Utils.CStrDef(Session["Cat_seo_title"]);
            header.Controls.Add(propetyTitle);
            //Desc
            propetyDesc.Attributes.Add("property", "og:description");
            propetyDesc.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            header.Controls.Add(propetyDesc);
            //Twitter meta
            propetyTw.Attributes.Add("property", "twitter:image");
            propetyTw.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathCategory(Utils.CIntDef(Session["Cat_id"])) + Utils.CStrDef(Session["Cat_image1"]);
            header.Controls.Add(propetyTw);
            //Title         
            propetyTitleTw.Attributes.Add("property", "twitter:title");
            propetyTitleTw.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            header.Controls.Add(propetyTitleTw);
            //Desc
            propetyDescTw.Attributes.Add("property", "twitter:description");
            propetyDescTw.Content = Utils.CStrDef(Session["Cat_seo_desc"]);
            header.Controls.Add(propetyDescTw);
            #endregion
        }
        public void Bind_meta_tags_news()
        {
            #region Bind Meta Tags
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            //Face tags
            HtmlMeta propety = new HtmlMeta();
            HtmlMeta propetyTitle = new HtmlMeta();
            HtmlMeta propetyDesc = new HtmlMeta();
            //Twitter tags
            HtmlMeta propetyTw = new HtmlMeta();
            HtmlMeta propetyTitleTw = new HtmlMeta();
            HtmlMeta propetyDescTw = new HtmlMeta();

            headerDes.Name = "Description";
            headerKey.Name = "Keywords";
            header.Title = Utils.CStrDef(Session["News_seo_title"]);
            headerDes.Content = Utils.CStrDef(Session["News_seo_desc"]);
            headerKey.Content = Utils.CStrDef(Session["News_seo_keyword"]);
            if (string.IsNullOrEmpty(headerDes.Content))
            {
                headerDes.Content = "";
            }
            header.Controls.Add(headerDes);

            if (string.IsNullOrEmpty(headerKey.Content))
            {
                headerKey.Content = "";
            }

            header.Controls.Add(headerKey);
            //Facebook meta
            propety.Attributes.Add("property", "og:image");
            propety.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])) + Utils.CStrDef(Session["News_image3"]);
            header.Controls.Add(propety);
            //Title         
            propetyTitle.Attributes.Add("property", "og:title");
            propetyTitle.Content = Utils.CStrDef(Session["News_seo_title"]);
            header.Controls.Add(propetyTitle);
            //Desc
            propetyDesc.Attributes.Add("property", "og:description");
            propetyDesc.Content = Utils.CStrDef(Session["News_seo_desc"]);
            header.Controls.Add(propetyDesc);
            //Twitter meta
            propetyTw.Attributes.Add("property", "twitter:image");
            propetyTw.Content = "" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + "" + PathFiles.GetPathNews(Utils.CIntDef(Session["News_id"])) + Utils.CStrDef(Session["News_image3"]);
            header.Controls.Add(propetyTw);
            //Title         
            propetyTitleTw.Attributes.Add("property", "twitter:title");
            propetyTitleTw.Content = Utils.CStrDef(Session["News_seo_title"]);
            header.Controls.Add(propetyTitleTw);
            //Desc
            propetyDescTw.Attributes.Add("property", "twitter:description");
            propetyDescTw.Content = Utils.CStrDef(Session["News_seo_desc"]);
            header.Controls.Add(propetyDescTw);


            #endregion
        }
        private void Bind_icon()
        {
            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                if (!string.IsNullOrEmpty(_configs.ToList()[0].CONFIG_FAVICON))
                    ltrFavicon.Text = "<link rel='shortcut icon' href='" + PathFiles.GetPathConfigs() + _configs.ToList()[0].CONFIG_FAVICON + "' />";
            }
        }
        public void Bind_meta_tags_index()
        {
            HtmlHead header = base.Header;
            HtmlMeta headerDes = new HtmlMeta();
            HtmlMeta headerKey = new HtmlMeta();
            headerDes.Name = "Description";
            headerKey.Name = "Keywords";

            var _configs = cf.Config_meta();

            if (_configs.ToList().Count > 0)
            {
                header.Title = _configs.ToList()[0].CONFIG_TITLE;

                headerDes.Content = _configs.ToList()[0].CONFIG_DESCRIPTION;
                header.Controls.Add(headerDes);

                headerKey.Content = _configs.ToList()[0].CONFIG_KEYWORD;
                header.Controls.Add(headerKey);
            }
            else
            {
                header.Title = "Enews Standard V1.0";

                headerDes.Content = "Enews Standard V1.0";
                header.Controls.Add(headerDes);

                headerKey.Content = "Enews Standard V1.0";
                header.Controls.Add(headerKey);
            }
        }
    }
}