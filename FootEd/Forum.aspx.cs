using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FootEd
{
    public partial class forum : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        BindPosts();
        //    }
        //}

        //private void BindPosts()
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        SqlDataAdapter da = new SqlDataAdapter("SELECT PostId, Title, Author, Date FROM Posts", conn);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        gvPosts.DataSource = dt;
        //        gvPosts.DataBind();
        //    }
        //}

        //protected void btnSubmit_Click(object sender, EventArgs e)
        //{
        //    string title = txtTitle.Text.Trim();
        //    string content = txtContent.Text.Trim();
        //    string author = User.Identity.Name; // Assuming users are authenticated
        //    DateTime date = DateTime.Now;

        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand("INSERT INTO Posts (Title, Content, Author, Date) VALUES (@Title, @Content, @Author, @Date)", conn);
        //        cmd.Parameters.AddWithValue("@Title", title);
        //        cmd.Parameters.AddWithValue("@Content", content);
        //        cmd.Parameters.AddWithValue("@Author", author);
        //        cmd.Parameters.AddWithValue("@Date", date);

        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }

        //    BindPosts();
        //    txtTitle.Text = string.Empty;
        //    txtContent.Text = string.Empty;
        //}

        //protected void gvPosts_SelectedIndexChanged(object sender, EventArgs e)
        //{
        //    int postId = (int)gvPosts.SelectedDataKey.Value;
        //    Response.Redirect("Post.aspx?PostId=" + postId);
        //}
    }
}
