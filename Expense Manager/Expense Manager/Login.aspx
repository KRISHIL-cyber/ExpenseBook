<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Expense_Manager.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
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
            margin:15px
        }

        .navbar-inverse .navbar-brand {
            color: #24bdc5;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse">
                <div class="container-fluid">
                    <div class="navbar-header">
                        <a class="navbar-brand"><center>ExpenseBook</center></a>
                    </div>

                </div>
            </nav>
            <br />
            <br />
            <br />
            <div class="container-fluid text-center">
                <div class="row content">
                    <div class="col-md-4"></div>
                    <div class="col-sm-4 text-center">
                        <br />
                        <div class="panel panel-success">
                            
                            <div class="panel-heading" style="padding:1px"><h3>Login</h3></div>
                                
                            <div class="panel-body">
                                <div>
                                    <div class="form-group text-left">
                                        <label>Username:</label>
                                        <asp:TextBox ID="TextBox1" runat="server" CssClass="form-control" placeholder="Enter Your Username" required></asp:TextBox>
                                        
                                    </div>
                                    <div class="form-group text-left">
                                        <label>Password:</label>
                                        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter Your Password" required="required"></asp:TextBox>
                                        
                                    </div>
                                </div>



                                <div class="form-group">
                                    <asp:Button ID="ButtonLogin" CssClass="btn btn-success btn-lg" runat="server" Text="LOGIN" OnClick="ButtonLogin_Click" />
                                </div>
                                <div>
                                    <a href="Signup.aspx">Create a New Account</a>
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
