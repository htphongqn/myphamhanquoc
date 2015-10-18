using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.IO;
using vpro.functions;
using GiaNguyen.Components;
using Controller;

namespace yeuthietkeweb
{
    public partial class dathangthanhcong : System.Web.UI.Page
    {
        #region Declare
        Config cf = new Config();
        SendMail sm = new SendMail();
        Order_now _orderRepo = new Order_now();
        clsFormat fm = new clsFormat();
        Propertity per = new Propertity();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
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

            header.Title = "Liên hệ";

            LoadThanks();
            Load_Hotline();
        }
        private void LoadThanks()
        {
            int orderIdF = Utils.CIntDef(Session["orderIdF"]);
            var item = _orderRepo.GetOrdersById(orderIdF);
            if (item != null)
            {
                lbCode.Text = item.ORDER_CODE;
                lbName.Text = item.ORDER_NAME;
                lbHinhthuc.Text = item.ORDER_PAYMENT == 1 ? "Nhận hàng tại cửa hàng" : "Giao hàng tại nhà";
                lbTotal.Text = fm.FormatMoney(item.ORDER_TOTAL_ALL);
            }
        }
        protected void Load_Hotline()
        {
            try
            {
                rptHotline.DataSource = per.Load_hotline().Take(2);
                rptHotline.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}