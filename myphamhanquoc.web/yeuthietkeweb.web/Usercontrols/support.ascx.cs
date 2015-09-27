using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;
using vpro.functions;

namespace yeuthietkeweb.web.Usercontrols
{
    public partial class support : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_Hotline();
                Load_Support();
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
        protected void Load_Support()
        {
            try
            {
                rptSupport.DataSource = per.Load_hotro();
                rptSupport.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }
        }
    }
}