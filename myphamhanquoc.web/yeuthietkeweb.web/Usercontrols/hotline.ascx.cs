using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class hotline : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
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