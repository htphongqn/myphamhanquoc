using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using System.IO;
using Controller;
using System.Data;
using GiaNguyen.Components;
using MVC_Kutun.Components;

namespace yeuthietkeweb.UIs
{
    public partial class product_detail : System.Web.UI.UserControl
    {
        #region Declare
        Product_Details pro_detail = new Product_Details();
        Function fun = new Function();
        Attfile att = new Attfile();
        Comment cm = new Comment();
        List_product list_pro = new List_product();
        Getcookie ck = new Getcookie();
        Checkcookie checkck = new Checkcookie();
        setCookieLike setck = new setCookieLike();
        Getcookie_comapre ck_compare = new Getcookie_comapre();
        public clsFormat fm = new clsFormat();
        string _sNewsSeoUrl = string.Empty;
        public string comment_url = "";
        int count1 = 1;
        int count2 = 1;
        int _Catid = 0;
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _sNewsSeoUrl = Utils.CStrDef(Request.QueryString["purl"]);
            //Hyperlike.Attributes.Add("newsurl", _sNewsSeoUrl);
            if (!IsPostBack)
            {
                Addsee();
                Load_Similar_Product(_sNewsSeoUrl);
                Load_random_quantam(_sNewsSeoUrl);
                Loadimgalbum(0,1,ref Rpimg);
                Loadimgalbum(0, 20, ref Rpimgsmall);
                Load_ads();
                Loaddetails();
            }
        }
        public void Load_ads()
        {
            try
            {
                var list = per.Load_slider(2, 1);
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
        
        #region area
        //private void loadArea()
        //{
        //    Drarea.DataValueField = "PROP_ID";
        //    Drarea.DataTextField = "PROP_NAME";
        //    Drarea.DataSource = pro_detail.loadArea();
        //    Drarea.DataBind();
        //    ListItem l = new ListItem("--- Tỉnh/TP ---", "0");
        //    l.Selected = true;
        //    Drarea.Items.Insert(0, l);
        //}
        //private void Loaddis(int id)
        //{
        //    var list = pro_detail.loadAreaDis(id);
        //    if (list.Count > 0)
        //    {
        //        Drdistric.DataValueField = "PROP_ID";
        //        Drdistric.DataTextField = "PROP_NAME";
        //        Drdistric.DataSource = list;
        //        Drdistric.DataBind();
        //        ListItem l = new ListItem("--- Quận/Huyện ---", "0");
        //        l.Selected = true;
        //        Drdistric.Items.Insert(0, l);
        //    }
        //    else
        //    {
        //        DataTable dt = new DataTable("Newtable");

        //        dt.Columns.Add(new DataColumn("PROP_ID"));
        //        dt.Columns.Add(new DataColumn("PROP_NAME"));

        //        DataRow row = dt.NewRow();
        //        row["PROP_ID"] = 0;
        //        row["PROP_NAME"] = "--- Quận/Huyện ---";
        //        dt.Rows.Add(row);

        //        Drdistric.DataTextField = "PROP_NAME";
        //        Drdistric.DataValueField = "PROP_ID";
        //        Drdistric.DataSource = dt;
        //        Drdistric.DataBind();

        //    }
        //}
        #endregion
        #region Addcookie
        private void Addcookie()
        {
            if (!checkck.Listcookie_see().Contains(_sNewsSeoUrl))
                ck.Addcookie(_sNewsSeoUrl);
        }
        #endregion
        #region Addsee
        private void Addsee()
        {
            pro_detail.Addsee(_sNewsSeoUrl);
        }
        #endregion
        #region Loaddata

        public void Load_img_news(int take, int skip, ref Repeater rp)
        {
            rp.DataSource = pro_detail.Load_Product_Detail(_sNewsSeoUrl);
            rp.DataBind();
        }
        public void Loadimgalbum(int skip,int limit,ref Repeater rp)
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                var list = pro_detail.Load_albumimg(_newsID,skip,limit).ToList();
                if (list.Count > 0)
                {
                    rp.DataSource = list;
                    rp.DataBind();
                    
                }

            }
            catch (Exception)
            {

                throw;
            }
        }
        public void Loaddetails()
        {
            try
            {
                var list = pro_detail.Load_Product_Detail(_sNewsSeoUrl);
                if (list.Count > 0)
                {
                    Show_File_HTML();
                    Lbtitle_details.Text = list[0].NEWS_TITLE;
                    Lbdesc_details.Text = setBr(list[0].NEWS_DESC);
                    lbTinhtrang.Text = list[0].NEWS_FIELD1 == "1" ? "Còn hàng" : "Hết hàng";
                    var brand = per.GetBrandById(Utils.CIntDef(list[0].UNIT_ID1));
                    if(brand != null)
                        lbThuonghieu.Text = "<a href='/thuong-hieu.html?thuonghieu=" + brand.ID + "' style='color: #d32571'>" + brand.NAME + "</a>";
                    Lbcode.Text = list[0].NEWS_CODE;
                    Lbprice1.Text = GetPrice1(list[0].NEWS_PRICE1, list[0].NEWS_PRICE2);
                    Lbprice2.Text = GetPrice2(list[0].NEWS_PRICE1, list[0].NEWS_PRICE2);
                    //Lbsee.Text = list[0].NEWS_COUNT.ToString();
                    //string titlecate = pro_detail.getNameCateWithNews(list[0].NEWS_ID);
                    //string url = pro_detail.getCatUrlWithNews(list[0].NEWS_ID);
                    //Hptitle_cate.Text = titlecate;
                    //Hptitle_cate.NavigateUrl = url;
                    //Lbtitle.Text = titlecate;
                    //Lbface.Text = "<div class='fb-like' data-href='" + Request.RawUrl + "'data-layout='button_count' data-action='like' data-show-faces='true' data-share='true' style='float: left'> </div>";
                    lbCommentFace.Text = "<div class='fb-comments' data-href='" + System.Configuration.ConfigurationManager.AppSettings["URLWebsite"] + Request.RawUrl + "' data-numposts='5' data-colorscheme='light' data-width='100%'></div>";
            
                }

            }
            catch (Exception ex)
            {

                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Show_File_HTML_sup(string HtmlFile)
        {
            string pathFile;
            string strHTMLContent;
            pathFile = Server.MapPath("../Data/contact/" + HtmlFile);

            if ((File.Exists(pathFile)))
            {
                StreamReader objNewsReader;
                objNewsReader = new StreamReader(pathFile);
                strHTMLContent = objNewsReader.ReadToEnd();
                objNewsReader.Close();
                //Lithotro.Text = strHTMLContent;
            }


        }
        private void Show_File_HTML()
        {
            try
            {
                int _newsID = Utils.CIntDef(Session["news_id"]);
                liHtml_info.Text = pro_detail.Show_File_HTML(_newsID);
                //Litthuonghieu_info.Text = pro_detail.Show_File_HTML(_newsID, 2);
                //Literal_bailienquan.Text = pro_detail.Show_File_HTML(_newsID, 3);
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }

        public void Load_Similar_Product(string News_Seo_Url)
        {
            try
            {
                rp_sanphamcungloai.DataSource = pro_detail.Load_Similar_Product(_sNewsSeoUrl, 10);
                rp_sanphamcungloai.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
        private void Load_random_quantam(string News_Seo_Url)
        {
            rp_sanphamquantam.DataSource = pro_detail.loadPro_Random(News_Seo_Url, 5);
            rp_sanphamquantam.DataBind();
        }

        #endregion

        #region function

        private string setBr(object desc)
        {
            string _des = Utils.CStrDef(desc);
            if (!String.IsNullOrEmpty(_des))
            {
                if (_des.Contains("\r\n")) _des = _des.Replace("\r\n", "<br/>");
            }
            return _des;
        }
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

        protected void Lbaddtocart_Click(object sender, EventArgs e)
        {
            try
            {
                var list = pro_detail.Load_Product_Detail(_sNewsSeoUrl);
                if (list.Count > 0)
                {
                    if (Utils.CDecDef(list[0].NEWS_PRICE1) != 0)
                        Response.Redirect("/Pages/Addtocart.aspx?id=" + list[0].NEWS_ID + "&quantity=" + ddlQuantity.SelectedItem.Value, true);
                    else
                    {
                        string strScript = "<script>";
                        strScript += "alert(' Bạn hãy liên hệ chúng tôi để mua sản phẩm này!');";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                
            }
        }

        protected void Lbaddlike_Click(object sender, EventArgs e)
        {
            string url = Request.RawUrl;
            if (!String.IsNullOrEmpty(url))
            {
                string[] a = url.Split('?');
                if (!checkck.Listcookie_like().Contains(_sNewsSeoUrl))
                {
                    setck.Addcookie(_sNewsSeoUrl);
                    string strScript = "<script>";
                    strScript += "alert('Đã thêm vào yêu thích!');";
                    strScript += "window.location='"+a[0]+"';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    string strScript = "<script>";
                    strScript += "alert(' Bạn đã thích sản phẩm này!');";
                    strScript += "window.location='" + a[0] + "';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
            }
            
        }
        protected void lnkCompare_Click(object sender, EventArgs e)
        {
            string url = Request.RawUrl;
            if (!String.IsNullOrEmpty(url))
            {
                string _sNews_Seo_Url = Utils.CStrDef(((LinkButton)sender).CommandArgument);
                string[] a = url.Split('?');
                var list = checkck.Listcookie_compare();
                if (list != null && list.Count >= 2)
                {
                    string strScript = "<script>";
                    strScript += "alert('Chỉ được thêm 2 sản phẩm vào danh sách so sánh!');";
                    strScript += "window.location='" + a[0] + "';";
                    strScript += "</script>";
                    Page.RegisterClientScriptBlock("strScript", strScript);
                }
                else
                {
                    if (!checkck.Listcookie_compare().Contains(_sNews_Seo_Url))
                    {
                        ck_compare.Addcookie(_sNews_Seo_Url);
                        string strScript = "<script>";
                        strScript += "alert('Đã thêm sản phẩm vào danh sách so sánh!');";
                        strScript += "window.location='" + a[0] + "';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                    else
                    {
                        string strScript = "<script>";
                        strScript += "alert(' Sản phẩm đã tồn tại trong danh sách so sánh!');";
                        strScript += "window.location='" + a[0] + "';";
                        strScript += "</script>";
                        Page.RegisterClientScriptBlock("strScript", strScript);
                    }
                }
            }
        }
        //protected void Drarea_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int id = Utils.CIntDef(Drarea.SelectedValue);
        //    Loaddis(id);
            
        //}

        //protected void Drdistric_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    Lbgiaohang.Text = pro_detail.getGiaohang(Utils.CIntDef(Drdistric.SelectedValue));
        //}

    }
}