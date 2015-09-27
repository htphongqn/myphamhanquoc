using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using vpro.functions;
using Controller;

namespace MyPham.Usercontrols
{
    public partial class Statistics : System.Web.UI.UserControl
    {
        private Propertity per = new Propertity();
        private Function fun = new Function();
        private Config cf = new Config();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                Load_SocialNetwork();
                Load_Online();
            }
        }

        protected void Load_SocialNetwork()
        {
            try
            {
                rptSocialNetwork.DataSource = per.Load_socialnetwork();
                rptSocialNetwork.DataBind();
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
        protected string Bind_SocialNetwork(object ONLINE_TYPE, object ONLINE_DESC, object ONLINE_NICKNAME)
        {
            try
            {
                var list = fun.Bind_SocialNetwork(ONLINE_TYPE, ONLINE_DESC, ONLINE_NICKNAME);
                return list;
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
                return null;
            }

        }
        protected void Load_Online()
        {
            try
            {
                lbOnline.Text = string.Format("{0:#,#}", Utils.CIntDef(Application["Online"]));
                var _hit = cf.Config_meta();
                if (_hit.ToList().Count > 0)
                {
                    int sum = Utils.CIntDef(_hit.ToList()[0].CONFIG_HITCOUNTER);
                    lbTotal.Text = string.Format("{0:#,#}", sum);
                }
                var item = cf.counter().Where(a => (a.HIT_DATE.Value.Date - DateTime.Now.Date).Days == 0).ToList();
                if (item != null && item.Count > 0)
                {
                    int today = Utils.CIntDef(item[0].HIT_VALUE);
                    lbToday.Text = string.Format("{0:#,#}", today);
                }
            }
            catch (Exception ex)
            {
                clsVproErrorHandler.HandlerError(ex);
            }

        }
    }
}