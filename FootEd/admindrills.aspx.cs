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
            updateDrillByID();
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
                    Response.Write("<script>alert('Drill Deleted Successfully');</script>");
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

        void updateDrillByID()
        {

            if (checkIfDrillExists())
            {
                try
                {


                    string types = "";
                    foreach (int i in ListBox1.GetSelectedIndices())
                    {
                        types = types + ListBox1.Items[i] + ",";
                    }
                    types = types.Remove(types.Length - 1);

                    string filepath = "~/drill_catalogue/cone";
                    string filepath2 = "~/drills_catalogoue/cone";
                    string filename = Path.GetFileName(PhotoUpload.PostedFile.FileName);
                    string filename2 = Path.GetFileName(VideoUpload.PostedFile.FileName);
                    if (filename == "" || filename == null)
                    {
                        filepath = global_filepath;
                    }
                    if (filename2 == "" || filename2 == null)
                    {
                        filepath2 = global_filepath;
                    }
                    else
                    {
                        PhotoUpload.SaveAs(Server.MapPath("drill_catalogue/" + filename));
                        filepath = "~/drill_catalogue/" + filename;
                        VideoUpload.SaveAs(Server.MapPath("drill_catalogue/" + filename2));
                        filepath2 = "~/drill_catalogue/" + filename2;
                    }

                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Drill_master_tbl set drill_name=@drill_name, type=@type, explanation=@explanation, organization=@organization, coaching_points=@coaching_points, variations=@variations, drill_img_link=@drill_img_link, drill_vid_link=@drill_vid_link where Drill_id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@drill_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@type", types);
                    cmd.Parameters.AddWithValue("@explanation", TextBox3.Text.Trim());
                    cmd.Parameters.AddWithValue("@organization", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@coaching_points", TextBox5.Text.Trim());
                    cmd.Parameters.AddWithValue("@variations", TextBox7.Text.Trim());
                    cmd.Parameters.AddWithValue("@drill_img_link", filepath);
                    cmd.Parameters.AddWithValue("@drill_vid_link", filepath2);


                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Drill Updated Successfully');</script>");


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
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {

                    TextBox1.Text = dt.Rows[0]["drill_id"].ToString();
                    TextBox2.Text = dt.Rows[0]["drill_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["explanation"].ToString();
                    TextBox6.Text = dt.Rows[0]["organization"].ToString(); 
                    TextBox5.Text = dt.Rows[0]["coaching_points"].ToString();
                    TextBox7.Text = dt.Rows[0]["variations"].ToString();
                    ListBox1.ClearSelection();
                    string[] type = dt.Rows[0]["type"].ToString().Trim().Split(',');
                    for (int i = 0; i < type.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == type[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
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
            ListBox1.Text = "";
            TextBox3.Text = "";
            TextBox6.Text = "";
            TextBox5.Text = "";
            TextBox7.Text = "";

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
                // types = Attacking, Defending,
                types = types.Remove(types.Length - 1);

                string filepath = "~/drill_catalogue/cone.png";
                string filename = Path.GetFileName(PhotoUpload.PostedFile.FileName);
                PhotoUpload.SaveAs(Server.MapPath("drill_catalogue/" + filename));
                filepath = "~/drill_catalogue/" + filename;

                string filepath2 = "~/drill_catalogue/cone.png";;
                string filename2 = Path.GetFileName(VideoUpload.PostedFile.FileName);
                VideoUpload.SaveAs(Server.MapPath("" + filename2));
                filepath2 = "~/drill_catalogue/" + filename2;


                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("INSERT INTO drill_master_tbl(drill_id,drill_name,type,explanation,organization,coaching_points,variations,drill_img_link,drill_vid_link) values(@drill_id,@drill_name,@type,@explanation,@organization,@coaching_points,@variations,@drill_img_link,@drill_vid_link)", con);

                cmd.Parameters.AddWithValue("@drill_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@drill_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@type", types);
                cmd.Parameters.AddWithValue("@explanation", TextBox3.Text.Trim());
                cmd.Parameters.AddWithValue("@organization", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@coaching_points", TextBox5.Text.Trim());
                cmd.Parameters.AddWithValue("@variations", TextBox7.Text.Trim());
                cmd.Parameters.AddWithValue("@drill_img_link", filepath);
                cmd.Parameters.AddWithValue("@drill_vid_link", filepath2);

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