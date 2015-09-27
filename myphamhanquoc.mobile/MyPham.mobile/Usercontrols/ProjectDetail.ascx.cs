using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using GiaNguyen.Components;

namespace MyPham.Usercontrols
{
    public partial class ProjectDetail : System.Web.UI.UserControl
    {
        #region Declare
        Product_Details pro_detail = new Product_Details();
        News_details ndetail = new News_details();
        Function fun = new Function();
        Propertity per = new Propertity();
        Attfile att = new Attfile();
        Home index = new Home();
        public clsFormat fm = new clsFormat();
        public string _sNewsSeoUrl = string.Empty;
        public string comment_url = "";
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _sNewsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);
            if (!IsPostBack)
            {
                Loaddetails();
                Getlinkattfile();

                Show_File_HTML_ChiTiet();
                Tinkhac();
            }
        }

        #region Loadatt_file
        public IQueryable Loadfiledinhkem(object news_id)
        {
            try
            {
                int id = Utils.CIntDef(news_id);
                var list = att.Loadatt_file(id);
                return list.ToList().Count > 0 ? list : null;
            }
            catch (Exception)
            {

                throw;
            }
        }
        public string BindAttItems(object News_Id, object Ext_Id, object Att_Name, object Att_Url, object Att_File, object Ext_Image)
        {
            try
            {
                return att.BindAttItems(News_Id, Ext_Id, Att_Name, Att_Url, Att_File, Ext_Image);

            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return "";
            }
        }
        #endregion
        #region Loaddata
        public void Getlinkattfile()
        {
            int _newsID = Utils.CIntDef(Session["news_id"]);
            //   Hpattfile.NavigateUrl = pro_detail.Getnameattfile(_newsID);
        }
        public void Load_albumimg(int _Newsid, ref Repeater rp)
        {
            rp.DataSource = pro_detail.Load_albumimg(_Newsid);
            rp.DataBind();
        }
        public void Loaddetails()
        {
            try
            {
                //Show_File_HTML();

                var list = pro_detail.Load_Product_Detail(_sNewsSeoUrl);
                LabelNEWS_TITLE.Text = list[0].NEWS_TITLE;
                LiteralNEWS_DESC.Text = list[0].NEWS_DESC;
                lblGiaKm.Text = GetPrice(list[0].NEWS_PRICE1, list[0].NEWS_PRICE2);
                lblCodeProduct.Text = list[0].NEWS_CODE;

                per.demluotxem(list[0].NEWS_ID);
                lblView.Text = list[0].NEWS_COUNT + "";

                liLoadBuy.Text = String.Format(@"<a href='{0}' class='btn_web cart_btn'><span>Mua ngay</span></a>", GetBuyButton(list[0].NEWS_ID, list[0].NEWS_PRICE2, list[0].NEWS_PRICE1));

                //Load Album
                Load_albumimg(list[0].NEWS_ID, ref Rpalbumimg);
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
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
                return fun.GetImageT_News_Hasclass(News_Id, News_Image1, "");
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string GetImagethuonghieu(object News_Id, object News_Image1)
        {

            try
            {
                if (Utils.CIntDef(News_Id) > 0 && !string.IsNullOrEmpty(Utils.CStrDef(News_Image1)))
                {
                    return PathFiles.GetPathAdItems(Utils.CIntDef(News_Id)) + Utils.CStrDef(News_Image1);
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
        public string getdate(object date)
        {
            return fun.getDate(date);
        }
        public string getnamecate(object newsid)
        {
            try
            {
                return pro_detail.getnamecate(newsid);
            }
            catch (Exception)
            {

                throw;
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
        public string GetBuyButton(object News_ID, object Price1, object Price2)
        {
            try
            {
                decimal _dPrice1 = Utils.CDecDef(Price1);
                decimal _dPrice2 = Utils.CDecDef(Price2);
                if (_dPrice1 == 0 && _dPrice2 == 0)
                {
                    return "";
                }
                else
                {
                    return "/Pages/addtocart.aspx?id=" + Utils.CIntDef(News_ID) + "";
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }
        }
        public string getUrlface()
        {
            return System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + Request.RawUrl;
        }
        #endregion

        public void Tinkhac()
        {
            try
            {
                if (_sNewsSeoUrl != "")
                {
                    var _tinTucKhac = pro_detail.Load_Similar_Product(_sNewsSeoUrl).Take(8);
                    if (_tinTucKhac.ToList().Count > 0)
                    {
                        Rptinkhac.DataSource = _tinTucKhac;
                        Rptinkhac.DataBind();
                    }
                    else
                        thesame_P.Visible = false;
                }
                else thesame_P.Visible = false;
            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }

        #region HTML
        private void Show_File_HTML_ChiTiet()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                liShowHtmChiTiet.Text = pro_detail.Show_File_HTML(_newsID);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        #endregion
    }
}