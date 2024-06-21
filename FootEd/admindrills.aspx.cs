using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace FootEd
{
    public partial class admindrills : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;

        protected void Page_Load(object sender, EventArgs e)
        {
            

            GridView1.DataBind();
        }

        // go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getDrillByID();
        }


        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            //updateDrillByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteDrillByID();
        }
        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfDrillExists())
            {
                Response.Write("<script>alert('Drill Already Exists');</script>");
            }
            else
            {
                addNewDrill();
            }
        }



        // user defined functions

        bool checkIfDrillExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT * from drill_master_tbl where drill_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                if (dt.Rows.Count >= 1)
                {
                    return true;
                }
                else
                {
                    return false;
                }


            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
                return false;
            }
        }

        void deleteDrillByID()
        {
            if (checkIfDrillExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from drill_master_tbl WHERE drill_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Member Deleted Successfully');</script>");
                    clearForm();
                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Drill ID');</script>");
            }
        }

        void getDrillByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                SqlCommand cmd = new SqlCommand("select * from drill_master_tbl where drill_id='" + TextBox1.Text.Trim() + "'", con);
                SqlDataReader dr = cmd.ExecuteReader();
                if (dr.HasRows)
                {
                    while (dr.Read())
                    {
                        TextBox2.Text = dr.GetValue(0).ToString();
                        TextBox7.Text = dr.GetValue(9).ToString();
                        TextBox3.Text = dr.GetValue(2).ToString();


                    }

                }
                else
                {
                    Response.Write("<script>alert('Invalid credentials');</script>");
                }

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }



        void clearForm()
        {
            TextBox1.Text = "";
            TextBox2.Text = "";
            TextBox7.Text = "";
            TextBox3.Text = "";

        }


        void addNewDrill()
        {
            try
            {
                string types = "";
                foreach (int i in ListBox1.GetSelectedIndices())
                {
                    types = types + ListBox1.Items[i] + ",";
                }
                // types = Adventure,Self Help,
                types = types.Remove(types.Length - 1);

                string filepath = "~/book_inventory/books1.png";
                string filename = Path.GetFileName(PhotoUpload.PostedFile.FileName);
                PhotoUpload.SaveAs(Server.MapPath("book_inventory/" + filename));
                filepath = "~/book_inventory/" + filename;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO drill_master_tbl(drill_id,drill_name,type,drill_img_link,drill_vid_link) values(@drill_id,@drill_name,@type,@drill_img_link,@drill_vid_link)", con);

                cmd.Parameters.AddWithValue("@drill_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@drill_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@type", types);
                cmd.Parameters.AddWithValue("@drill_img_link", filepath);
                //cmd.Parameters.AddWithValue("@drill_vid_link", filepath2);

                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Drill added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}