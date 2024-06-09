using System;
using System.Data;
using System.Data.SqlClient;

namespace FootEd
{
    public class DataAccess
    {
        private string connectionString = "your_connection_string_here";

        public DataTable GetPosts()
        {
            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //    SqlCommand cmd = new SqlCommand("SELECT * FROM Posts ORDER BY PostDate DESC", conn);
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    DataTable dt = new DataTable();
            //    da.Fill(dt);
            //    return dt;
            //}
            DataTable dt = new DataTable();
            return dt;
        }

        public void AddComment(int postId, string username, string content)
        {
            //using (SqlConnection conn = new SqlConnection(connectionString))
            //{
            //    SqlCommand cmd = new SqlCommand("INSERT INTO Comments (PostID, Username, Content, CommentDate) VALUES (@PostID, @Username, @Content, @CommentDate)", conn);
            //    cmd.Parameters.AddWithValue("@PostID", postId);
            //    cmd.Parameters.AddWithValue("@Username", username);
            //    cmd.Parameters.AddWithValue("@Content", content);
            //    cmd.Parameters.AddWithValue("@CommentDate", DateTime.Now);
            //    conn.Open();
            //    cmd.ExecuteNonQuery();
            //}
        }
    }
}
