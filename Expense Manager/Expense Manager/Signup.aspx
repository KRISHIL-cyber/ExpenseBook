<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Signup.aspx.cs" Inherits="Expense_Manager.Signup" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <style>
        /* Remove the navbar's default margin-bottom and rounded borders */
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
        }
        .navbar-header ,.navbar-brand {
            width: 100%;
            text-align: center;
            color: orange;
            font-size: 35px;
            font-weight: bold;
        }
        .container-fluid
        {
            margin:14px
        }

        .navbar-inverse .navbar-brand {
            color: #24bdc5;
        }
    </style>
</head>
<body>
    <form id="form2" runat="server">
        <div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand"><center>ExpenseBook</center></a>
                    </div>

                </div>
            </nav>
            <div class="container-fluid text-center">
                <div class="row content">
                    <div class="col-md-4"></div>
                    <div class="col-sm-4 text-center">
                        <br />
                        <div class="panel panel-success">
                            
                            <div class="panel-heading" style="padding:1px"><h3>Register</h3></div>
                                
                            <div class="panel-body">
                                <div>
                                    <div class="form-group text-left">
                                        <label>Username:</label>
                                        <asp:TextBox ID="uname" runat="server" CssClass="form-control" placeholder="Enter Your Username" required></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="uname" ErrorMessage="*6-14 character required" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]{6,14}$"></asp:RegularExpressionValidator>
                                        
                                    </div>
                                    <div class="form-group text-left">
                                        <label>Email:</label>
                                        <asp:TextBox ID="email" runat="server" CssClass="form-control" placeholder="Enter Your Email" required="required"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="email" ErrorMessage="*Proper email id is required" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group text-left">
                                        <label>Password:</label>
                                        <asp:TextBox ID="passwd" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Your Password" required="required"></asp:TextBox>
                                        <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="passwd" ErrorMessage="*Only Alphanumeric allowed" ForeColor="Red" ValidationExpression="^[a-zA-Z0-9_]{6,14}$"></asp:RegularExpressionValidator>
                                    </div>

                                    <div class="form-group text-left">
                                        <label>Confirm Password:</label>
                                        <asp:TextBox ID="repasswd" runat="server" TextMode="Password" CssClass="form-control" placeholder="Re Enter Your Password" required="required"></asp:TextBox>
                                        <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToCompare="repasswd" ControlToValidate="passwd" ErrorMessage="*Confirm password doesn't match" ForeColor="Red"></asp:CompareValidator>
                                    </div>
                                </div>



                                <div class="form-group">
                                    <asp:Button ID="ButtonSignup" CssClass="btn btn-success btn-lg" runat="server" Text="SignUp" OnClick="ButtonSignup_Click" />
                                </div>
                                <div>
                                    <a href="Login.aspx">Already Have an Account</a>
                                </div>

                            </div>
                        </div>
                    </div>
                    <div class="col-md-4"></div>
                </div>
            </div>

        </div>
    </form>
</body>
</html>
