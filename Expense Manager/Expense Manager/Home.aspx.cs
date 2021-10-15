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
    public partial class Home : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Session["Username"] != string.Empty)
                {
                    if (!Page.IsPostBack)
                    {
                        lblUser.Text = Session["Username"].ToString();
                    }
                }
                else
                {
                    Session.RemoveAll();
                    Session.Abandon();
                    Session["Username"] = "";
                    Response.Redirect("Login.aspx");
                }
            }
            catch (Exception ex)
            {
                Response.Write("<script> alert('" + ex.Message + "') </sctipt>");
            }
        }
        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["Exp"].ConnectionString;
        }

        protected void Unnamed1_Click(object sender, EventArgs e)
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {
                SqlCommand cmd = new SqlCommand();
                try
                {
                    con.Open();
                    Response.Redirect("AboutUs.aspx");
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