﻿using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class forum : System.Web.UI.Page
    {
        private string connectionString = ConfigurationManager.ConnectionStrings["con"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPosts();
            }
        }

        protected void BindPosts()
        {
            List<Post> posts = new List<Post>();

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                string query = "SELECT PostId, Title, Post_Content, UserId, Date FROM Posts";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    SqlDataReader reader = cmd.ExecuteReader();
                    while (reader.Read())
                    {
                        Post post = new Post
                        {
                            PostId = reader.GetInt32(0),
                            Title = reader.GetString(1),
                            Content = reader.GetString(2),
                            UserId = reader.GetString(3),
                            Date = reader.GetDateTime(4),
                            Author = GetAuthorName(reader.GetString(3))
                        };

                        posts.Add(post);
                    }
                }
            }

            rptPosts.DataSource = posts;
            rptPosts.DataBind();
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

        protected void rptPosts_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                Post post = (Post)e.Item.DataItem;
                Button btnDeletePost = (Button)e.Item.FindControl("btnDeletePost");
                string currentUserId = Session["username"] as string;

                // Only show delete button if the user is the post owner
                if (currentUserId != post.UserId)
                {
                    btnDeletePost.Visible = false;
                }
            }
        }

        protected void btnSubmitPost_Click(object sender, EventArgs e)
        {
            string title = txtTitle.Text;
            string content = txtContent.Text;
            string userId = Session["username"] as string;

            if (string.IsNullOrEmpty(userId))
            {
                Response.Write("<script>alert('Not Connected');</script>");
            }
            else
            {
                using (SqlConnection conn = new SqlConnection(connectionString))
                {
                    conn.Open();
                    string query = "INSERT INTO Posts (Title, Post_Content, UserId, Date) VALUES (@Title, @Content, @UserId, @Date)";
                    using (SqlCommand cmd = new SqlCommand(query, conn))
                    {
                        cmd.Parameters.AddWithValue("@Title", title);
                        cmd.Parameters.AddWithValue("@Content", content);
                        cmd.Parameters.AddWithValue("@UserId", userId);
                        cmd.Parameters.AddWithValue("@Date", DateTime.Now);
                        cmd.ExecuteNonQuery();
                    }
                }
            }

            BindPosts();
        }

        protected void btnDeletePost_Click(object sender, EventArgs e)
        {
            Button btn = (Button)sender;
            int postId = int.Parse(btn.CommandArgument);
            string userId = Session["username"] as string;

            if (string.IsNullOrEmpty(userId))
            {
                Response.Write("<script>alert('Not Connected');</script>");
                return;
            }

            using (SqlConnection conn = new SqlConnection(connectionString))
            {
                conn.Open();
                // Ensure only the author can delete the post
                string query = "DELETE FROM Posts WHERE PostId = @PostId AND UserId = @UserId";
                using (SqlCommand cmd = new SqlCommand(query, conn))
                {
                    cmd.Parameters.AddWithValue("@PostId", postId);
                    cmd.Parameters.AddWithValue("@UserId", userId);
                    int rowsAffected = cmd.ExecuteNonQuery();
                    if (rowsAffected == 0)
                    {
                        Response.Write("<script>alert('You do not have permission to delete this post.');</script>");
                    }
                }
            }

            BindPosts();
        }

        public class Post
        {
            public int PostId { get; set; }
            public string Title { get; set; }
            public string Content { get; set; }
            public string UserId { get; set; }
            public string Author { get; set; }
            public DateTime Date { get; set; }
        }
    }
}
