using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using Expense_Manager.Models;

namespace Expense_Manager
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["Exp"].ConnectionString;
        }

        protected void ButtonLogin_Click(object sender, EventArgs e)
        {
            if(TextBox1.Text!=string.Empty && TextBox2.Text != string.Empty)
            {
                using(SqlConnection con = new SqlConnection(GetConnectionString()))
                {
                    SqlCommand cmd = new SqlCommand("select UserName, Password from tblLogin where UserName=@UserName and Password=@Password", con);
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Username", TextBox1.Text.Trim());
                    cmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());
                    try
                    {
                        con.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        if(dr.HasRows)
                        {
                            while(dr.Read())
                            {
                                Response.Write("<script>alert('" + dr.GetValue(0).ToString() + "')</script>");
                                Session["UserName"] = dr.GetValue(0).ToString();
                            }
                            Response.Redirect("Home.aspx");
                        }
                        else
                        {
                            Response.Write("<script>alert('invalid UserName or Password.... Try again')</script>");
                        }
                    }
                    catch(Exception ex)
                    {
                        Response.Write("<script>alert('Something went wrong!!+ "+ex.Message+"')</script>");
                    }
                    finally
                    {
                        con.Close();
                    }

                }

            }
        }
    }
}