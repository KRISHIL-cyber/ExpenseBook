<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Expense_Manager.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Signup.css" rel="stylesheet" />
    <title></title>
    <style type="text/css">
        .btn-lg {}
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <div class="header">
                <h2>  Create Account</h2>
            </div>
            <div class="form-control">
                <label for="username">Username</label>
                <asp:TextBox ID="uname" runat="server" CssClass="form-control"></asp:TextBox>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
                <asp:RequiredFieldValidator ID="UsernameValidator" runat="server" BackColor="White" ControlToValidate="uname" ErrorMessage="*Username required" ForeColor="Red"></asp:RequiredFieldValidator>
&nbsp;<br />
                <asp:RegularExpressionValidator ID="UsernameExpressionValidator" runat="server" ControlToValidate="uname" ErrorMessage="*6-14 character required" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]{6,14}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-control">
                <label for="username">Email</label>
                <asp:TextBox ID="email" runat="server" CssClass="form-control"></asp:TextBox>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
                <asp:RequiredFieldValidator ID="EmailValidator" runat="server" ControlToValidate="email" ErrorMessage="*Email id required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="EmailExpressionValidator" runat="server" ControlToValidate="email" ErrorMessage="*Proper email id is required" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </div>
            <div class="form-control">
                <label for="username">Password</label>
                <asp:TextBox ID="passwd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
                <asp:RequiredFieldValidator ID="PasswordValidator" runat="server" ControlToValidate="passwd" ErrorMessage="*Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:RegularExpressionValidator ID="PassExpressionValidator" runat="server" ControlToValidate="passwd" ErrorMessage="*Only Alphanumeric allowed" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]{6,14}$"></asp:RegularExpressionValidator>
            </div>
            <div class="form-control">
                <label for="username">Password check</label>
                 <asp:TextBox ID="repasswd" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                <i class="fas fa-check-circle"></i>
                <i class="fas fa-exclamation-circle"></i>
                <small>Error message</small>
                <asp:RequiredFieldValidator ID="RepasswordValidator" runat="server" ControlToValidate="repasswd" ErrorMessage="*Confirm Password required" ForeColor="Red"></asp:RequiredFieldValidator>
                <br />
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="repasswd" ControlToValidate="passwd" ErrorMessage="*Confirm password doesn't match" ForeColor="Red"></asp:CompareValidator>
            </div>
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="ButtonSignup" CssClass="btn btn-success btn-lg" runat="server" Text="SignUp" OnClick="ButtonSignup_Click" BackColor="#009933" BorderColor="#003300" BorderStyle="Solid" Height="41px" Width="115px" />
            <br />
            <br />
&nbsp;&nbsp;&nbsp; <a href="Login.aspx">Login</a><br />
            <br />
        </div>
        <div>
            <h3>&nbsp;</h3>
        </div>
    </form>
</body>
</html>


