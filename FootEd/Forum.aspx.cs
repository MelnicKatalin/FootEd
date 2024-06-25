using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI;
namespace FootEd
{
    public partial class forum : System.Web.UI.Page
    {
        //protected void page_load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        bindposts();
        //    }
        //}

        //private void bindposts()
        //{
        //    string connstr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        //    SqlConnection conn = new SqlConnection(connstr);)
        //    {
        //        sqldataadapter da = new sqldataadapter("select postid, title, author, date from posts", conn);
        //        datatable dt = new datatable();
        //        da.fill(dt);
        //        gvposts.datasource = dt;
        //        gvposts.databind();
        //    }
        //}

        //protected void btnsubmit_click(object sender, eventargs e)
        //{
        //    string title = txttitle.text.trim();
        //    string content = txtcontent.text.trim();
        //    string author = user.identity.name; // assuming users are authenticated
        //    datetime date = datetime.now;

        //    string connstr = configurationmanager.connectionstrings["yourconnectionstring"].connectionstring;
        //    using (sqlconnection conn = new sqlconnection(connstr))
        //    {
        //        sqlcommand cmd = new sqlcommand("insert into posts (title, content, author, date) values (@title, @content, @author, @date)", conn);
        //        cmd.parameters.addwithvalue("@title", title);
        //        cmd.parameters.addwithvalue("@content", content);
        //        cmd.parameters.addwithvalue("@author", author);
        //        cmd.parameters.addwithvalue("@date", date);

        //        conn.open();
        //        cmd.executenonquery();
        //        conn.close();
        //    }

        //    bindposts();
        //    txttitle.text = string.empty;
        //    txtcontent.text = string.empty;
        //}

        //protected void gvposts_selectedindexchanged(object sender, eventargs e)
        //{
        //    int postid = (int)gvposts.selecteddatakey.value;
        //    response.redirect("post.aspx?postid=" + postid);
        //}
    }
}
