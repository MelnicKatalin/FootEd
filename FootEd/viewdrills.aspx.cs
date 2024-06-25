using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class viewdrills : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string drillId = btn.CommandArgument;
            Response.Redirect("drilldetails.aspx?drill_id=" + drillId);
        }


    }
}