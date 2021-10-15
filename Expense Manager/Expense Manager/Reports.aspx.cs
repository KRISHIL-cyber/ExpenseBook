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
    public partial class Reports : System.Web.UI.Page
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
            String Uname = Session["UserName"].ToString();
            SqlCommand cmd = new SqlCommand("select t1.ID,t1.ExpenseTypeID, t2.ExpenseType, t1.ExpSubTypeID, t3.ExpSubType_Desc, t1.Decription, t1.Amount, t1.DateOfPayment , t1.CreatedBy from tblAllExpenses as t1 inner join tblExpenseType as t2 on t1.ExpenseTypeID = t2.ExpenseTypeID inner join tblExpSubType as t3 on t1.ExpSubTypeID = t3.ExpSubTypeID where CreatedBy=@Uname");
            cmd.CommandType = CommandType.Text;
            cmd.Parameters.AddWithValue("@Uname", Uname);
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
            GridView1.EditIndex = e.NewEditIndex;
            BindMainCatIntoGrid();
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
                DropDownList ddlUpMainCat = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlMainCat");
                DropDownList ddlUpSubCat = (DropDownList)GridView1.Rows[e.RowIndex].FindControl("ddlSubCat");
                TextBox txtUpdateDese = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditDescription");
                TextBox txtUpdateamt = (TextBox)GridView1.Rows[e.RowIndex].FindControl("txtEditAmount");
                SqlConnection con = new SqlConnection(GetConn());


                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("update tblAllExpenses set ExpenseTypeID=@ID1, ExpSubTypeID=@ID2, Decription=@Desc, Amount=@amt, DateOfPayment=GETDATE() ,CreatedBy=@cb where ID=@IDD", con);
                cmd.Parameters.AddWithValue("@ID1", ddlUpMainCat.SelectedValue);
                cmd.Parameters.AddWithValue("@ID2", ddlUpSubCat.SelectedValue);
                cmd.Parameters.AddWithValue("@Desc", txtUpdateDese.Text);
                cmd.Parameters.AddWithValue("@amt", Convert.ToDecimal(txtUpdateamt.Text));
                cmd.Parameters.AddWithValue("@IDD", id2);
                cmd.Parameters.AddWithValue("@cb", Session["UserName"].ToString());
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
                SqlCommand cmd = new SqlCommand("delete from tblAllExpenses where ID=@ID", con);

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
            if (e.Row.RowType == DataControlRowType.DataRow && GridView1.EditIndex == e.Row.RowIndex)
            {
                //bind main category
                DropDownList ddl1 = (DropDownList)e.Row.FindControl("ddlMainCat");
                SqlCommand cmd = new SqlCommand("select distinct ExpenseTypeID, ExpenseType from tblExpenseType");
                ddl1.DataSource = GetData(cmd);
                ddl1.DataValueField = "ExpenseTypeID";
                ddl1.DataTextField = "ExpenseType";
                ddl1.DataBind();

                Label lblmaincatID = (Label)e.Row.FindControl("lblGV1MainCat");
                ddl1.SelectedValue = lblmaincatID.Text;


                //bind Sub category
                DropDownList ddl2 = (DropDownList)e.Row.FindControl("ddlSubCat");
                cmd = new SqlCommand("select t1.ExpSubTypeID, t1.ExpSubType_Desc from tblExpSubType as t1 inner join tblExpenseType as t2 on t1.ExpenseTypeID=t2.ExpenseTypeID");
                ddl2.DataSource = GetData(cmd);
                ddl2.DataValueField = "ExpSubTypeID";
                ddl2.DataTextField = "ExpSubType_Desc";
                ddl2.DataBind();

                Label lblsubcatID = (Label)e.Row.FindControl("lblGV1SubCatID");
                ddl2.SelectedValue = lblsubcatID.Text;

            }


            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                string item = e.Row.Cells[0].Text;
                foreach (Button button in e.Row.Cells[4].Controls.OfType<Button>())
                {
                    button.Attributes["onclick"] = "if(!confirm('Do you want to delete" + e.Row.Cells[1].Text + "?')){return false;}";
                }
            }
        }
    }
}