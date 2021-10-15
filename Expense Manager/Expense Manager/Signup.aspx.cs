using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Expense_Manager
{
    public partial class Signup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["Exp"].ConnectionString;
        }

       

        protected void ButtonSignup_Click(object sender, EventArgs e)
        {

            if (uname.Text != string.Empty && passwd.Text != string.Empty && email.Text !=string.Empty && repasswd.Text!=string.Empty)
            {
                    
                    SqlConnection con = new SqlConnection(GetConnectionString());
                    SqlCommand cmd = new SqlCommand("select Count(*) from tblLogin where UserName=@UserName or Email=@Email", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Username", uname.Text);
                    cmd.Parameters.AddWithValue("@Email", email.Text);
                    int numOfRows = 0;
                    try
                    {
                        con.Open();
                        SqlDataReader sReader = cmd.ExecuteReader();

                        while (sReader.Read())
                        {
                            if (!(sReader.IsDBNull(0)))
                            {
                                numOfRows = Convert.ToInt32(sReader[0]);
                                if (numOfRows > 0)
                                {
                                    Response.Write("<script>alert('User already exists...')</script>");
                                }
                            }
                        }
                        sReader.Close();
                        if(numOfRows==0)
                        {
                            SqlCommand create = new SqlCommand("insert into tblLogin values(@UserName,@Password,@Email)", con);
                            create.CommandType = CommandType.Text;
                            create.Parameters.AddWithValue("UserName", uname.Text);
                            create.Parameters.AddWithValue("Password", passwd.Text);
                            create.Parameters.AddWithValue("Email", email.Text);
                            create.ExecuteNonQuery();
                            Response.Write("<script>alert('User registered successfully')</script>");

                            uname.Text = "";
                            passwd.Text = "";
                            repasswd.Text = "";
                            email.Text = "";
                        }
                    }
                    catch (Exception ex)
                    {
                        Response.Write("<script>alert('Something went wrong!!+ " + ex.Message + "')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }

       
            }
        }
    }
}