<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage1.Master" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="Expense_Manager.Reports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Reports</title>

    <style>
        th[scope=col]{
            text-align:center;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="panel panel-primary">
            <div class =" panel-heading"><h5>All Records</h5></div>
            <div class="panel-body">
                <div class="row">
                <div class="col-md-12">
                    <div class="table table-responsive">
                        <asp:GridView ID="GridView1" CssClass="table table-responsive table-hover" Caption="" runat="server" EmptyDataText="Record Not Found...   " BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False"
                            AllowPaging="true" PageSize="10" 
                            OnPageIndexChanging="GridView1_PageIndexChanging"
                             OnRowCancelingEdit ="GridView1_RowCancelingEdit" 
                            OnRowEditing="GridView1_RowEditing"
                             OnRowUpdating="GridView1_RowUpdating"
                             OnRowDeleting="GridView1_RowDeleting"
                             OnRowDataBound="GridView1_RowDataBound" >     
                           
                            <AlternatingRowStyle BackColor="#CCCCCC" />
                            <FooterStyle BackColor="#CCCCCC" />
                            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                            <SortedAscendingCellStyle BackColor="#F1F1F1" />
                            <SortedAscendingHeaderStyle BackColor="#808080" />
                            <SortedDescendingCellStyle BackColor="#CAC9C9" />
                            <SortedDescendingHeaderStyle BackColor="#383838" />
                            
                            <RowStyle HorizontalAlign ="center" />
                            <Columns>
                                <asp:TemplateField HeaderText="ID">
                                    <ItemTemplate> 
                                        <asp:Label ID="lblGV1ID" runat="server" Text='<%#Eval("ID") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                
                                <asp:TemplateField HeaderText="Main Category">
                                    <ItemTemplate> 
                                        <asp:Label ID="lblGV1MainCat" runat="server" Text='<%#Eval("ExpenseType") %>'></asp:Label>
                                    </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:Label ID="lblGV1MainCat" runat="server" Text='<%#Eval("ExpenseTypeID") %>' Visible="false"></asp:Label>
                                     <asp:DropDownList ID="ddlMainCat" CssClass="form-control" runat="server"></asp:DropDownList>
                                 </EditItemTemplate> 
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Sub Category">
                                    <ItemTemplate> 
                                        <asp:Label ID="lblGV1SubCat" runat="server" Text='<%#Eval("ExpSubType_Desc") %>'></asp:Label>
                                    </ItemTemplate>
                                 <EditItemTemplate>
                                      <asp:Label ID="lblGV1SubCatID" runat="server" Text='<%#Eval("ExpSubTypeID") %>' Visible="false"></asp:Label>
                                      <asp:DropDownList ID="ddlSubCat" CssClass="form-control"  runat="server"></asp:DropDownList>
                                 </EditItemTemplate>
                                </asp:TemplateField>

                                 <asp:TemplateField HeaderText="Description">
                                    <ItemTemplate> 
                                        <asp:Label ID="lblGV1Desc" runat="server" Text='<%#Eval("Decription") %>'></asp:Label>
                                    </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtEditDescription"  CssClass="form-control" style="text-transform:uppercase" runat="server" Text='<%#Eval("Decription") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:TemplateField HeaderText="Amount">
                                    <ItemTemplate> 
                                        <asp:Label ID="lblGV1Amount" runat="server" Text='<%#Eval("Amount") %>'></asp:Label>
                                    </ItemTemplate>
                                 <EditItemTemplate>
                                     <asp:TextBox ID="txtEditAmount"  CssClass="form-control" style="text-transform:uppercase" runat="server" Text='<%#Eval("Amount") %>'></asp:TextBox>
                                 </EditItemTemplate>
                                </asp:TemplateField>

                                <asp:BoundField DataField="DateOfPayment" HeaderText="Date" ReadOnly="true"/>
                                <asp:BoundField DataField="CreatedBy" HeaderText="Username" ReadOnly="true"/>

                                <asp:CommandField ShowEditButton="true" ControlStyle-CssClass="btn btn-sm btn-success" HeaderText="Edit" />
                            <asp:CommandField ShowDeleteButton="true" ButtonType="Button" ControlStyle-CssClass="btn btn-sm btn-danger" HeaderText="Delete"/>
                            </Columns>
                        </asp:GridView>
                    </div>     
                </div>
            </div>
            </div>
        </div>
    </div>
</asp:Content>
