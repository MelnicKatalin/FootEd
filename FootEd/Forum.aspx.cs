using System;
using System.Data;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace FootEd
{
    public partial class Forum : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindPosts();
            }
        }

        protected void CommentButton_Click(object sender, EventArgs e)
        {
            var button = sender as Button;
            int postId = int.Parse(button.CommandArgument);
            string comment = (button.Parent.FindControl("CommentTextBox") as TextBox).Text;

            // Save comment to the database
            DataAccess da = new DataAccess();
            da.AddComment(postId, "username", comment);

            // Rebind posts to refresh comments
            BindPosts();
        }

        protected void CreatePostButton_Click(object sender, EventArgs e)
        {
            // Redirect to a new page to create a post
            Response.Redirect("CreatePost.aspx");
        }

        private void BindPosts()
        {
            DataAccess da = new DataAccess();
            DataTable dt = da.GetPosts();
            PostsRepeater.DataSource = dt;
            PostsRepeater.DataBind();
        }
    }
}
