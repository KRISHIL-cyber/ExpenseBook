<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="webpageAddExpenses.aspx.cs" Inherits="Expense_Manager.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="panel panal-primary">
            <h4><center>Add Expenses</center></h4>
        </div>
        <div class="row alert-danger">
            <div class="col-md-2">
                <div class="form-group">
                    <label>Main Category: </label>
                    <asp:DropDownList ID="ddlMainCategory" CssClass="form-control" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMainCategory_SelectedIndexChanged"></asp:DropDownList>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <label>Sub Category: </label>
                    <asp:DropDownList ID="ddlSubCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                </div>
            </div>

            <div class="col-md-5">
                <div class="form-group">
                    <label>Description: </label>
                    <asp:TextBox ID="txtDesc" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                </div>
            </div>

            <div class="col-md-2">
                <div class="form-group">
                    <label>Amount Rs.: </label>
                    <asp:TextBox ID="txtAmt" CssClass="form-control" runat="server" TextMode="Number"></asp:TextBox>
                </div>
            </div>
        </div>
        <br />

        <div class="row">
            <div class="col-md-3">
                <div class="form-group">
                    <asp:Button ID="btnSubmit" CssClass="btn btn-success btn-lg" runat="server" Text="Submit" OnClick="btnSubmit_Click" />
                </div>
            </div>
        </div>

        <div class="row">
            <h3 class="text-center">All Expense List</h3>
            <div class="col-md-1">

            </div>
            <div class="col-md-10">
                <div class="table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
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
            </div>
            <div class="col-md-1">

            </div>
        </div>
    </div>
</asp:Content>
