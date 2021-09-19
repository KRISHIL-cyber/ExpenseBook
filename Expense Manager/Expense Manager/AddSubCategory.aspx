<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="AddSubCategory.aspx.cs" Inherits="Expense_Manager.AddSubCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Add Expense Subcategory</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-4"></div>    
            <div class="col-md-4">
                <div class="form-group">
                    <label class="text-uppercase"> Main Expense Category</label>
                    <asp:DropDownList ID="ddlMainCategory" AutoSelectOnMatch = "false" CssClass="form-control" runat="server">
                    </asp:DropDownList>
                </div>

                <div class="form-group">
                    <label class="text-uppercase"> Expense Sub Category</label>
                    <asp:TextBox ID="TextBox1" CssClass="form-control" runat="server"></asp:TextBox>
                </div>

                <div class="form-group">
                    <asp:Button ID="Button1" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="ADD" OnClick="Button1_Click" />
                </div>
            </div>  
            <div class="col-md-4"></div>  
        </div>

        <div class="row">
            <div class="col-md-2"></div>
            <div class="col-md-8">
                <asp:GridView ID="GridView1" CssClass="table table-hover" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
                    <AlternatingRowStyle BackColor="#CCCCCC" />
                    <FooterStyle BackColor="#CCCCCC" />
                    <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#808080" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#383838" />

                </asp:GridView>
            </div>
            <div class="col-md-2"></div>
        </div>
    </div>
</asp:Content>
