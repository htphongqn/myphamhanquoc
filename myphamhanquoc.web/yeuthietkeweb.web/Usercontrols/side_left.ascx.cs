using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;
using Model;

namespace yeuthietkeweb.UIs
{
    public partial class side_left : System.Web.UI.UserControl
    {
        Function fun = new Function();
        Propertity per = new Propertity();
        List_product lpro = new List_product();
        int _Catid = 0;
        string _idbrand = "";
        string _cat_seo_url = string.Empty;
        int _page = 0;
        string _price;
        int _typepri, _sortvl = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _idbrand = Utils.CStrDef(Request.QueryString["idbrand"]);
            _typepri = Utils.CIntDef(Request.QueryString["typepri"]);
            _price = Utils.CStrDef(Request.QueryString["price"]);
            _sortvl = Utils.CIntDef(Request.QueryString["sort"]);
            if (!IsPostBack)
            {
                setHrefPrice();
                Load_Menu1(); 
                loadBrand();
            }
        }
        private void setHrefPrice()
        {
            string getUrl = "&idbrand=" + _idbrand + "&sort=" + _sortvl;
            lid200.HRef = "/" + _cat_seo_url + ".html?page=0&price=200000&typepri=3" + getUrl;
            li200.HRef = "/" + _cat_seo_url + ".html?page=0&price=200000,500000&typepri=1" + getUrl;
            li500.HRef = "/" + _cat_seo_url + ".html?page=0&price=500000,1000000&typepri=1" + getUrl;
            li1000.HRef = "/" + _cat_seo_url + ".html?page=0&price=1000000,2000000&typepri=1" + getUrl;
            li2000.HRef = "/" + _cat_seo_url + ".html?page=0&price=2000000&typepri=2" + getUrl;
        }
        private void loadBrand()
        {
            var list = per.Load_Brand();
            //change source
            List<string[]> l = new List<string[]>();
            foreach (var item in list)
            {
                int count = lpro.GetCountProductByBrandId(item.ID, _cat_seo_url);
                l.Add(new string[] { item.ID.ToString(), item.NAME, item.NAME + " (" + count + ")"});
            }
            var brands = from obj in l
                         select new
                         {
                             Id = obj[0],
                             Name = obj[1],
                             NameCount = obj[2],
                         };

            chklBrand.DataTextField = "NameCount";
            chklBrand.DataValueField = "Id";
            chklBrand.DataSource = brands;
            chklBrand.DataBind();

            string [] _strbrand = _idbrand.Split(',');
            foreach (string item in _strbrand)
            {
                for (int i = 0; i < chklBrand.Items.Count; i++)
                {
                    if (chklBrand.Items[i].Value == item)
                        chklBrand.Items[i].Selected = true;
                }
            }
        }

        protected void chklBrand_SelectedIndexChanged(object sender, EventArgs e)
        {
            string _strbrand = "";
            for (int i = 0; i < chklBrand.Items.Count; i++)
            {
                if (chklBrand.Items[i].Selected)
                    _strbrand += chklBrand.Items[i].Value + ",";
            }
            if (_strbrand != "")
                _strbrand.Substring(0, _strbrand.Length - 2);

            string getUrl = "&price="+_price+"&typepri="+ _typepri +"&idbrand=" + _strbrand + "&sort=" + _sortvl;
            Response.Redirect("~/" + _cat_seo_url + ".html?page=0" + getUrl);
        }
        protected void Load_Menu1()
        {
            try
            {
                var item = per.GetCatalogryByID(_Catid);
                if (item != null && item.CAT_PARENT_ID > 0)
                {
                    _Catid = item.CAT_PARENT_ID.Value;
                    var item1 = per.GetCatalogryByID(_Catid);
                    if (item1 != null && item1.CAT_PARENT_ID > 0)
                    {
                        _Catid = item1.CAT_PARENT_ID.Value;
                        var item2 = per.GetCatalogryByID(_Catid);
                        if (item != null && item2.CAT_PARENT_ID > 0)
                        {
                            _Catid = item2.CAT_PARENT_ID.Value;
                        }
                    }
                }

                var list = per.GetById(_Catid);
                Rpmenu.DataSource = list;
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
    }
}