using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Controller;

namespace MyPham.Usercontrols
{
    public partial class SearchTool : System.Web.UI.UserControl
    {
        Cart_result cr = new Cart_result();
        protected void Page_Load(object sender, EventArgs e)
        {
            Guid _guid = (Guid)Session["news_guid"];
            Lbtotalcart.Text = cr.Total_quantity(_guid).ToString();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            string key = txtsearch.Value;
            Response.Redirect("/tim-kiem.html?page=0&key=" + key);
        }
    }
}