using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class drilldetails : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string drillId = Request.QueryString["drill_id"];
                if (string.IsNullOrEmpty(drillId))
                {
                    Response.Redirect("viewdrills.aspx");
                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            string drillId = btn.CommandArgument;
            Response.Redirect("drillvideo.aspx?drill_id=" + drillId);
        }
    }
}
