using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace yeuthietkeweb.Master
{
    public partial class SiteVI : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Request.Browser["IsMobileDevice"] == "true")
            {
                Response.Redirect("http://m.websitemypham.com");
            }
            if (!IsPostBack) 
                form1.Action = Request.RawUrl;
        }
    }
}