using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace RUAN_VINADev.vi_vn
{
    public partial class Addtocart : System.Web.UI.Page
    {
        #region Declare
        Addto_cart cart = new Addto_cart();
        #endregion
        protected void Page_Load(object sender, EventArgs e)
        {
            int id = Utils.CIntDef(Request.QueryString["id"]);
            int _quantity = Utils.CIntDef(Request.QueryString["quantity"]);
            Guid _guid = (Guid)Session["news_guid"];
            cart.Add_To_Cart(id, _guid, _quantity);
            Response.Redirect("/gio-hang.html");
        }
    }
}