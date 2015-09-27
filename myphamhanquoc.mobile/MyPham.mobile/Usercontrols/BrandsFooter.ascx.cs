using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MyPham.Usercontrols
{
    public partial class BrandsFooter : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                loadBrand();
        }

        private void loadBrand()
        {
            rptBrand.DataSource = per.Load_Brand();
            rptBrand.DataBind();
        }
    }
}