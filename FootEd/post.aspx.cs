using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace FootEd
{
    public partial class post : System.Web.UI.Page
    {
        //protected void Page_Load(object sender, EventArgs e)
        //{
        //    if (!IsPostBack)
        //    {
        //        int postId = Convert.ToInt32(Request.QueryString["PostId"]);
        //        BindPost(postId);
        //        BindComments(postId);
        //    }
        //}

        //private void BindPost(int postId)
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand("SELECT Title, Content, Author, Date FROM Posts WHERE PostId = @PostId", conn);
        //        cmd.Parameters.AddWithValue("@PostId", postId);

        //        conn.Open();
        //        SqlDataReader reader = cmd.ExecuteReader();
        //        if (reader.Read())
        //        {
        //            lblTitle.Text = reader["Title"].ToString();
        //            lblContent.Text = reader["Content"].ToString();
        //            lblAuthor.Text = reader["Author"].ToString();
        //            lblDate.Text = Convert.ToDateTime(reader["Date"]).ToString();
        //        }
        //        conn.Close();
        //    }
        //}

        //private void BindComments(int postId)
        //{
        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        SqlDataAdapter da = new SqlDataAdapter("SELECT Author, Content, Date FROM Comments WHERE PostId = @PostId", conn);
        //        da.SelectCommand.Parameters.AddWithValue("@PostId", postId);
        //        DataTable dt = new DataTable();
        //        da.Fill(dt);
        //        rptComments.DataSource = dt;
        //        rptComments.DataBind();
        //    }
        //}

        //protected void btnSubmitComment_Click(object sender, EventArgs e)
        //{
        //    int postId = Convert.ToInt32(Request.QueryString["PostId"]);
        //    string content = txtCommentContent.Text.Trim();
        //    string author = User.Identity.Name; // Assuming users are authenticated
        //    DateTime date = DateTime.Now;

        //    string connStr = ConfigurationManager.ConnectionStrings["YourConnectionString"].ConnectionString;
        //    using (SqlConnection conn = new SqlConnection(connStr))
        //    {
        //        SqlCommand cmd = new SqlCommand("INSERT INTO Comments (PostId, Content, Author, Date) VALUES (@PostId, @Content, @Author, @Date)", conn);
        //        cmd.Parameters.AddWithValue("@PostId", postId);
        //        cmd.Parameters.AddWithValue("@Content", content);
        //        cmd.Parameters.AddWithValue("@Author", author);
        //        cmd.Parameters.AddWithValue("@Date", date);

        //        conn.Open();
        //        cmd.ExecuteNonQuery();
        //        conn.Close();
        //    }

        //    BindComments(postId);
        //    txtCommentContent.Text = string.Empty;
        //}
    }
}
