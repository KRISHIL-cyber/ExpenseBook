using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Expense_Manager
{
    public partial class MasterPage1 : System.Web.UI.MasterPage
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
            catch(Exception ex)
            {
                Response.Redirect("<script> alert('" + ex.Message + "') </sctipt>");
            }
            
        }
    }
}