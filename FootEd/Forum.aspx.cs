using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPosts();
            }
        }

        private void BindPosts()
        {
            string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlDataAdapter da = new SqlDataAdapter("SELECT PostId, Title, Subject, Author, Date FROM Posts", conn);
                DataTable dt = new DataTable();
                da.Fill(dt);
                rptPosts.DataSource = dt;
                rptPosts.DataBind();
            }
        }

        protected void btnSubmit_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text.Trim();
            string Subject = txtSubject.Text.Trim();
            string author = User.Identity.Name; // Assuming users are authenticated
            DateTime date = DateTime.Now;

            string connStr = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
            using (SqlConnection conn = new SqlConnection(connStr))
            {
                SqlCommand cmd = new SqlCommand("INSERT INTO Posts (Title, Subject, Author, Date) VALUES (@Title, @Subject, @Author, @Date)", conn);
                cmd.Parameters.AddWithValue("@Title", title);
                cmd.Parameters.AddWithValue("@Subject", Subject);
                cmd.Parameters.AddWithValue("@Author", author);
                cmd.Parameters.AddWithValue("@Date", date);

                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
            }

            BindPosts();
            txtTitle.Text = string.Empty;
            txtSubject.Text = string.Empty;
        }

        protected void ViewPost_Command(object sender, CommandEventArgs e)
        {
            int postId = Convert.ToInt32(e.CommandArgument);
            Response.Redirect("Post.aspx?PostId=" + postId);
        }
    }
}
