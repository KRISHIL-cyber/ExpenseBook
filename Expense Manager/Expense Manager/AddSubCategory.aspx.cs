using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
   
namespace Expense_Manager
{
    public partial class AddSubCategory : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindmainExps();
                bindgrid();
            }
        }
        private string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["Exp"].ConnectionString;
        }

        private void BindmainExps()
        {
            using (SqlConnection con = new SqlConnection(GetConnectionString()))
            {

                con.Open();

                SqlCommand cmd = new SqlCommand("sp_getmainExpense", con);
                cmd.CommandType = CommandType.StoredProcedure;
                SqlDataAdapter da = new SqlDataAdapter(cmd);

                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count > 0)
                { 
                    ddlMainCategory.DataSource = dt;
                    ddlMainCategory.DataTextField = "ExpenseType";
                    ddlMainCategory.DataValueField = "ExpenseTypeID";
                    ddlMainCategory.DataBind();
                    ddlMainCategory.Items.Insert(0, new ListItem("--Select--", "0"));
                    con.Close();
                }
                else
                {
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "Runcode", "javascript.alert('Sorry No records Found with this keyword....')", true);
                }
                con.Close();
            }
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            try
            { 
                if (ddlMainCategory.SelectedIndex!=-1 && ddlMainCategory.SelectedIndex != 0  && TextBox1.Text!=string.Empty)
                {
                    SqlConnection con = new SqlConnection(GetConnectionString());
                    if(con.State == ConnectionState.Closed)
                    {
                        con.Open();
                    }
                    SqlCommand cmd = new SqlCommand("Insert into  dbo.tblExpSubType(ExpenseTypeID, ExpSubType_Desc) values(@ExpenseTypeID, @ExpSubType_Desc)", con);

                    cmd.Parameters.AddWithValue("@ExpenseTypeID", ddlMainCategory.SelectedValue);
                    cmd.Parameters.AddWithValue("@ExpSubType_Desc", TextBox1.Text.Trim());

                    int i = 0;
                    i = cmd.ExecuteNonQuery();

                    if (i >= 1)
                    {
                        Response.Write("<script>alert('Record Saved Successfully')</script>");
                        TextBox1.Text = string.Empty;
                        TextBox1.Focus();
                        bindgrid();
                    }
                    else
                    {
                        Response.Write("<script>alert('Record Not Saved ... Error')</script>");
                    }
                    con.Close();

                }
                else
                {
                    Response.Write("<script>alert('Please select main category annd enter sub category');</script>");
                }
            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" +ex.Message+ "');</script>");
            }
        }

        protected void bindgrid()
        {
            SqlConnection con = new SqlConnection(GetConnectionString());
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            DataSet ds = new DataSet();
            SqlCommand cmd = new SqlCommand("sp_getSubExpenseCat", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            con.Close();
            if (ds.Tables[0].Rows.Count > 0)
            {
                GridView1.DataSource = ds;
                GridView1.DataBind();
            }
            else
            {
                Response.Write("<script>alert('Record Not Found')</script>");
            }
        }

       
    }
}