using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace MyPham.Usercontrols
{
    public partial class ListProject : System.Web.UI.UserControl
    {
        #region Declare
        List_product list_pro = new List_product();
        Function fun = new Function();
        clsFormat fm = new clsFormat();
        Pageindex_chage change = new Pageindex_chage();
        int _Catid = 0;
        string _cat_seo_url = string.Empty;
        int _page = 0;
        int _thuonghieu = 0;
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            _Catid = Utils.CIntDef(Session["Cat_id"]);
            _cat_seo_url = Request.QueryString["curl"];
            _page = Utils.CIntDef(Request.QueryString["page"]);
            _thuonghieu = Utils.CIntDef(Request.QueryString["thuonghieu"]);
            if (!IsPostBack)
            {
                Loadtitle();
                Loadlist();
            }
        }
        public void Loadtitle()
        {
            try
            {
                Lbtitle.Text = list_pro.Loadtitle(_cat_seo_url);
            }
            catch (Exception)
            {
                throw;
            }
        }
        public void Loadlist()
        {
            try
            {
                int sotin = list_pro.Getsotin(_Catid);
                var list = list_pro.Load_listproM(_Catid, 0, 12);
                if (list.Count > 0)
                {
                    if (_page != 0)
                    {
                        Rplistpro.DataSource = list.Skip(sotin * _page - sotin).Take(sotin);
                        Rplistpro.DataBind();
                    }
                    else
                    {
                        Rplistpro.DataSource = list.Take(sotin);
                        Rplistpro.DataBind();
                    }
                }
            }
            catch (Exception)
            {

                throw;
            }
        }

        #region function

        public int getCountList()
        {
            var list = list_pro.Load_listproM(_Catid, 0, 999);
            return list.Count;
        }
        public int getId()
        {
            return _Catid;
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
        public string getdate(object date)
        {
            return fun.getDate(date);
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
        public string hienthigia(object gia1, object gia2)
        {
            int giam = tinh_phantram(gia1, gia2);
            if (giam > 0)
            {
                return "<div class='reduce'>-" + giam + "%</div>";
            }
            else
                return "";

        }
        public int tinh_phantram(object News_Price1, object News_Price2)
        {
            if (Utils.CIntDef(News_Price1) == 0 || Utils.CIntDef(News_Price2) == 0)
            {
                return 0;
            }
            else
            {
                decimal _dPrice1 = Utils.CDecDef(News_Price1);
                decimal _dPrice2 = Utils.CDecDef(News_Price2);
                decimal s = (_dPrice1 * 100) / _dPrice2;
                s = 100 - s;
                int d = Utils.CIntDef(s);
                return d;
            }
        }
        #endregion
    }
}