using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Hostelistan
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        string Conn = ConfigurationManager.ConnectionStrings["dbcon"].ConnectionString;

 protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                password.Attributes["type"] = "password";
            }
            else
            {
              

                if (R1.Checked && R2.Checked)
                {
                    R2.Checked = false;
                    R1.Checked = false;
                }
            }
        }

        
        protected void RadioButton_checked(object sender, EventArgs e)
        {
            if (R1.Checked)
                R2.Checked = false;
            if (R2.Checked)
                R1.Checked = false;
        }

        protected void Register_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection(Conn);

            var a = Accounttype.SelectedItem.Value;
            String gen = "\0";
            if (R1.Checked)
            {
                gen = String.Copy("Male");
                

            }
            else if(R2.Checked)
            {
                gen = String.Copy("Female");
            }



            SqlCommand cmd = new SqlCommand("insert_signup" , con);
            cmd.CommandType = System.Data.CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("firstname", firtname.Text);
            cmd.Parameters.AddWithValue("lastname", lastname.Text);
            cmd.Parameters.AddWithValue("email", Email.Text);
            cmd.Parameters.AddWithValue("password", password.Text);
            cmd.Parameters.AddWithValue("phoneno", phone.Text);
            cmd.Parameters.AddWithValue("address", address.Text);
            cmd.Parameters.AddWithValue("cnic", cnic.Text);
            cmd.Parameters.AddWithValue("Gender", gen);
            cmd.Parameters.AddWithValue("usertype", a.ToString());

            con.Open();
                cmd.ExecuteNonQuery();
                con.Close();

            string message = "Your Email ID is  " + firtname.Text + "\n@Masters ";
            System.Text.StringBuilder sb = new System.Text.StringBuilder();
            sb.Append("<script type = 'text/javascript'>");
            sb.Append("window.onload=function(){");
            sb.Append("alert('");
            sb.Append(message);
            sb.Append("')};");
            sb.Append("</script>");
            ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            Response.Redirect("login.aspx");


        }
    }
}