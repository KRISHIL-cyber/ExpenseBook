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
    public partial class EditSubCat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindMainCatIntoGrid();
            }
        }

        private string GetConn()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["Exp"].ConnectionString;
        }


        private void BindMainCatIntoGrid()
        {
            SqlCommand cmd = new SqlCommand("set nocount on ; select distinct t1.ExpSubTypeID, t2.ExpenseType, t1.ExpenseTypeID, t1.ExpSubType_Desc from tblExpSubType as t1 with(nolock) inner join tblExpenseType as t2 with(nolock) on t1.ExpenseTypeID = t2.ExpenseTypeID");
            GridView1.DataSource = GetData(cmd);
            GridView1.DataBind();

            GridView1.UseAccessibleHeader = true;
            GridView1.HeaderRow.TableSection = TableRowSection.TableHeader;
        }
        private object GetData(SqlCommand cmd)
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(GetConn());
            SqlDataAdapter da = new SqlDataAdapter();
            cmd.CommandType = CommandType.Text;
            cmd.Connection = con;
            try
            {
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();

                }
                da.SelectCommand = cmd;
                da.Fill(dt);
                return dt;
            }
            catch
            {
                return null;

            }
            finally
            {
                con.Close();
                da.Dispose();
                con.Dispose();
            }
        }
        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            BindMainCatIntoGrid();
        }
        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
        }
        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindMainCatIntoGrid();

        }
        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblGV1ID"));
                int id2 = Convert.ToInt32(id.Text);
                TextBox txtUpdateCat = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditExpense");
                SqlConnection con = new SqlConnection(GetConn());


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update tblExpenseType set ExpenseType=@ExpenseType where ExpenseTypeID=@ID", con);
                cmd.Parameters.AddWithValue("@ExpenseType", txtUpdateCat.Text);
                cmd.Parameters.AddWithValue("@ID", id2);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                BindMainCatIntoGrid();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }



        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                Label id = ((Label)GridView1.Rows[e.RowIndex].FindControl("lblGV1ID"));
                int id2 = Convert.ToInt32(id.Text);
                SqlConnection con = new SqlConnection(GetConn());


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("delete from tblExpenseType where ExpenseTypeID=@ID", con);

                cmd.Parameters.AddWithValue("@ID", id2);
                cmd.ExecuteNonQuery();
                con.Close();
                GridView1.EditIndex = -1;
                BindMainCatIntoGrid();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "')<script>");
            }
        }

        protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[3].Controls.OfType<Button>())
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete" + e.Row.Cells[1].Text + "?')){return false;}";
                }
            }
        }
    }
}