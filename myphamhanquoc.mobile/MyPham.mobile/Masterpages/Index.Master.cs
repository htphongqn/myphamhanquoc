using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MyPham.Masterpages
{
    public partial class Index : System.Web.UI.MasterPage
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                form1.Action = Request.RawUrl;
                Load_Hotline();
            }
        }

        protected void Load_Hotline()
        {
            try
            {
                rptHotline.DataSource = per.Load_hotline().Take(1);
                rptHotline.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}