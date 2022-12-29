using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostelistan
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        string Conn = System.Configuration.ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void login_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Conn);


            SqlCommand cmd = new SqlCommand("user_login" , con);

            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("email", username.Text);
            cmd.Parameters.AddWithValue("password", password.Text);
      

            con.Open();
            int count = (int)cmd.ExecuteScalar();
            if (count == 1)
            {
                Session["user"] = username.Text;

                SqlCommand cmd2 = new SqlCommand("Who_logged_in", con);


                cmd2.CommandType = System.Data.CommandType.StoredProcedure;
                cmd2.Parameters.AddWithValue("email", username.Text);




                string acc_type =(string)cmd2.ExecuteScalar();
                if (acc_type == "2")
                    Response.Redirect("hostellist.aspx");
                else if (acc_type == "3")
                    Response.Redirect("hostel_poster.aspx");
                else if (acc_type == "4")
                    Response.Redirect("service_provider.aspx");
            }
            else
            {
                Msg.Text = "Incorrect Email OR Password";
            }

        }

        protected void register_Click(object sender, EventArgs e)
        {
            Response.Redirect("signup.aspx");
        }
    }
}