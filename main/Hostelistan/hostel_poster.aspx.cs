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

namespace Hostelistan
{



    public partial class WebForm4 : System.Web.UI.Page
    {




        string strcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        static int global_actual_stock, global_current_stock, global_issued_books;



        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strcon);

            Label1.Text = Session["user"].ToString();
            string em= Session["user"].ToString();
            SqlCommand cmd = new SqlCommand("specificuser", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("email", em);


            con.Open();
            GridView1.DataSource=cmd.ExecuteReader();
            GridView1.DataBind();
        }

        // go button click
        protected void Button4_Click(object sender, EventArgs e)
        {
            getHostelByID();
        }


        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateHostelByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteHostelByID();
        }
        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfHostelExists())
            {
                Response.Write("<script>alert('Hostel Already Exists, try some other Hostel ID');</script>");
            }
            else
            {
                addNewHostel();
            }
        }



        // user defined functions

        void deleteHostelByID()
        {
            if (checkIfHostelExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Hostel WHERE Hostel_Id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Hostel Deleted Successfully');</script>");

                    GridView1.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Member ID');</script>");
            }
        }

        void updateHostelByID()
        {

            if (checkIfHostelExists())
            {
                try
                {

                    int actual_stock = Convert.ToInt32(TextBox4.Text.Trim());
                    int current_stock = Convert.ToInt32(TextBox5.Text.Trim());

                    if (global_actual_stock == actual_stock)
                    {

                    }
                    else
                    {
                        if (actual_stock < global_issued_books)
                        {
                            Response.Write("<script>alert('Actual Hostel Capacity cannot be less than the Issued Rooms');</script>");
                            return;


                        }
                        else
                        {
                            current_stock = actual_stock - global_issued_books;
                            TextBox5.Text = "" + current_stock;
                        }
                    }



                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Hostel set Name=@hostel_name, Location=@Location, Type=@hostel_type, city=@city, cost=@hostel_cost, No_of_Rooms=@actual_capacity where Hostel_Id='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@hostel_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@hostel_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@Location", DropDownList4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@hostel_type", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@hostel_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@hostel_description", TextBox6.Text.Trim());
                    cmd.Parameters.AddWithValue("@actual_capacity", TextBox4.Text.Trim());
                    cmd.Parameters.AddWithValue("@current_capacity", TextBox4.Text.Trim());



                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView1.DataBind();
                    Response.Write("<script>alert('Hostel Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Hostel ID');</script>");
            }
        }


        void getHostelByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT Hostel_ID,Name,Location,Type,city,cost,no_of_rooms from Hostel WHERE Hostel_Id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["Name"].ToString();

                    TextBox10.Text = dt.Rows[0]["cost"].ToString().Trim();

                    TextBox4.Text = dt.Rows[0]["No_of_Rooms"].ToString().Trim();
                    TextBox5.Text = dt.Rows[0]["No_of_Rooms"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["hostel_description"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["No_of_Rooms"].ToString()) - Convert.ToInt32(dt.Rows[0]["No_of_Rooms"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["city"].ToString().Trim();
                    DropDownList4.SelectedValue = dt.Rows[0]["Location"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["Type"].ToString().Trim();



                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["No_of_Rooms"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["No_of_Rooms"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;


                }
                else
                {
                    Response.Write("<script>alert('Invalid Hostel ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        bool checkIfHostelExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT Hostel_ID,Name,Location,Type,city,cost,no_of_rooms from Hostel where Hostel_Id='" + TextBox1.Text.Trim() + "' OR Name='" + TextBox2.Text.Trim() + "';", con);
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

        void addNewHostel()
        {
            try
            {




                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                string em = Session["user"].ToString();

                SqlCommand cmd = new SqlCommand("INSERT INTO Hostel(Hostel_ID,Name,Location,Type,city,cost,no_of_rooms,email) values (@hostel_id,@hostel_name,@Location,@hostel_type,@city,@hostel_cost,@actual_capacity,@email)", con);

                cmd.Parameters.AddWithValue("@hostel_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@hostel_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@Location", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@hostel_type", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@hostel_cost", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@hostel_description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@actual_capacity", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@current_capacity", TextBox4.Text.Trim());
                cmd.Parameters.AddWithValue("@email", em);




                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Hostel added successfully.');</script>");
                GridView1.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}