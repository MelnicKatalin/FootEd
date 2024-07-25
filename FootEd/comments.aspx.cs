using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class comments : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        private int postId;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!int.TryParse(Request.QueryString["postId"], out postId))
            {
                Response.Redirect("forum.aspx");
            }

            if (!IsPostBack)
            {
                BindComments();
            }
        }

        protected void BindComments()
        {
            List<Comment> comments = new List<Comment>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT CommentId, PostId, Comments_Content, UserId, Date FROM Comments WHERE PostId = @PostId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PostId", postId);
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Comment comment = new Comment
                        {
                            CommentId = reader.GetInt32(0),
                            PostId = reader.GetInt32(1),
                            Content = reader.GetString(2),
                            UserId = reader.GetString(3),
                            Date = reader.GetDateTime(4),
                            Author = GetAuthorName(reader.GetString(3))
                        };
                        comments.Add(comment);
                    }
                }
            }

            rptComments.DataSource = comments;
            rptComments.DataBind();
        }

        protected string GetAuthorName(string userId)
        {
            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT full_name FROM member_master_tbl WHERE user_id = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    return cmd.ExecuteScalar() as string;
                }
            }
        }

        protected void rptComments_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Comment comment = (Comment)e.Item.DataItem;
                Button btnDeleteComment = (Button)e.Item.FindControl("btnDeleteComment");
                string currentUserId = Session["username"] as string;

                // Only show delete button if the user is the comment owner
                if (currentUserId != comment.UserId)
                {
                    btnDeleteComment.Visible = false;
                }
            }
        }

        protected void btnSubmitComment_Click(object sender, EventArgs e)
        {
            string content = txtCommentContent.Text;
            string userId = Session["username"] as string;

            if (string.IsNullOrEmpty(userId))
            {
                Response.Write("<script>alert('Not Connected');</script>");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "INSERT INTO Comments (PostId, Comments_Content, UserId, Date) VALUES (@PostId, @Content, @UserId, @Date)";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PostId", postId);
                    cmd.Parameters.AddWithValue("@Content", content);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                    cmd.ExecuteNonQuery();
                }
            }

            BindComments();
        }

        protected void btnDeleteComment_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int commentId = int.Parse(btn.CommandArgument);
            string userId = Session["username"] as string;

            if (string.IsNullOrEmpty(userId))
            {
                Response.Write("<script>alert('Not Connected');</script>");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Ensure only the author can delete the comment
                string query = "DELETE FROM Comments WHERE CommentId = @CommentId AND UserId = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@CommentId", commentId);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        Response.Write("<script>alert('You do not have permission to delete this comment.');</script>");
                    }
                }
            }

            BindComments();
        }

        public class Comment
        {
            public int CommentId { get; set; }
            public int PostId { get; set; }
            public string Content { get; set; }
            public string UserId { get; set; }
            public string Author { get; set; }
            public DateTime Date { get; set; }
        }
    }
}
