using System;
using System.Web.UI;

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
    }
}
