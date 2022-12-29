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
    public partial class WebForm5 : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;





        protected void Page_Load(object sender, EventArgs e)
        {

            SqlConnection con = new SqlConnection(strcon);

            Label7.Text = Session["user"].ToString();
            string em = Session["user"].ToString();
            SqlCommand cmd = new SqlCommand("specificservice", con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("email", em);


            con.Open();
            GridView2.DataSource = cmd.ExecuteReader();
            GridView2.DataBind();
        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    

    // go button click
    protected void Button4_Click(object sender, EventArgs e)
        {
            getServiceByID();
        }


        // update button click
        protected void Button3_Click(object sender, EventArgs e)
        {
            updateServiceByID();
        }
        // delete button click
        protected void Button2_Click(object sender, EventArgs e)
        {
            deleteServiceByID();
        }
        // add button click
        protected void Button1_Click(object sender, EventArgs e)
        {
            if (checkIfServiceExists())
            {
                Response.Write("<script>alert('Service Already Exists, try some other Service ID');</script>");
            }
            else
            {
                addNewService();
            }
        }



        // user defined functions

        void deleteServiceByID()
        {
            if (checkIfServiceExists())
            {
                try
                {
                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }

                    SqlCommand cmd = new SqlCommand("DELETE from Service WHERE ServiceId='" + TextBox1.Text.Trim() + "'", con);

                    cmd.ExecuteNonQuery();
                    con.Close();
                    Response.Write("<script>alert('Service Deleted Successfully');</script>");

                    GridView2.DataBind();

                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }

            }
            else
            {
                Response.Write("<script>alert('Invalid Service ID');</script>");
            }
        }

        void updateServiceByID()
        {

            if (checkIfServiceExists())
            {
                try
                {




                    SqlConnection con = new SqlConnection(strcon);
                    if (con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("UPDATE Services set Name=@service_name, Location=@location, ServiceType=@service_type, city=@city, ServiceCost=@service_cost, description=@description where ServiceId='" + TextBox1.Text.Trim() + "'", con);

                    cmd.Parameters.AddWithValue("@service_id", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@service_name", TextBox2.Text.Trim());
                    cmd.Parameters.AddWithValue("@location", DropDownList4.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@service_type", DropDownList3.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@city", DropDownList1.SelectedItem.Value);
                    cmd.Parameters.AddWithValue("@service_cost", TextBox10.Text.Trim());
                    cmd.Parameters.AddWithValue("@description", TextBox6.Text.Trim());




                    cmd.ExecuteNonQuery();
                    con.Close();
                    GridView2.DataBind();
                    Response.Write("<script>alert('Service Updated Successfully');</script>");


                }
                catch (Exception ex)
                {
                    Response.Write("<script>alert('" + ex.Message + "');</script>");
                }
            }
            else
            {
                Response.Write("<script>alert('Invalid Service ID');</script>");
            }
        }


        void getServiceByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT ServiceID,ServiceName,ServiceType,city,ServiceCost,Location,description from Services WHERE ServiceId='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["ServiceName"].ToString();

                    TextBox10.Text = dt.Rows[0]["ServiceCost"].ToString().Trim();


                    TextBox6.Text = dt.Rows[0]["description"].ToString();

                    DropDownList1.SelectedValue = dt.Rows[0]["city"].ToString().Trim();
                    DropDownList4.SelectedValue = dt.Rows[0]["Location"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["ServiceType"].ToString().Trim();





                }
                else
                {
                    Response.Write("<script>alert('Invalid Service ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }



        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }

     

        bool checkIfServiceExists()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }

                SqlCommand cmd = new SqlCommand("SELECT ServiceID,ServiceName,ServiceType,city,ServiceCost,Location,description from Services WHERE ServiceId='" + TextBox1.Text.Trim() + "' OR ServiceName='" + TextBox2.Text.Trim() + "';", con);
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

        void addNewService()
        {
            try
            {




                SqlConnection con = new SqlConnection(strcon);
                if (con.State == System.Data.ConnectionState.Closed)
                {
                    con.Open();
                }
                string em = Session["user"].ToString();

                SqlCommand cmd = new SqlCommand("INSERT INTO Services(ServiceID,ServiceName,Location,ServiceType,city,ServiceCost,description,email) values (@service_id,@service_name,@location,@service_type,@city,@service_cost,@description,@email)", con);

                cmd.Parameters.AddWithValue("@service_id", TextBox1.Text.Trim());
                cmd.Parameters.AddWithValue("@service_name", TextBox2.Text.Trim());
                cmd.Parameters.AddWithValue("@location", DropDownList4.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_type", DropDownList3.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@city", DropDownList1.SelectedItem.Value);
                cmd.Parameters.AddWithValue("@service_cost", TextBox10.Text.Trim());
                cmd.Parameters.AddWithValue("@description", TextBox6.Text.Trim());
                cmd.Parameters.AddWithValue("@email", em);





                cmd.ExecuteNonQuery();
                con.Close();
                Response.Write("<script>alert('Service added successfully.');</script>");
                GridView2.DataBind();

            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }
    }
}
