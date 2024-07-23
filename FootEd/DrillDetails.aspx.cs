using System;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class drilldetails : System.Web.UI.Page
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
