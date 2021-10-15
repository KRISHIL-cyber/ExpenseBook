<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="Expense_Manager.Home" %>

<!DOCTYPE html>
<html style="font-size: 16px;">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta charset="utf-8">
    <meta name="keywords" content="Marketing Strategy">
    <meta name="description" content="">
    <meta name="page_type" content="np-template-header-footer-from-plugin">
    <title>Home</title>
    <link rel="stylesheet" href="nicepage.css" media="screen">
    <link rel="stylesheet" href="Home.css" media="screen">
    <script class="u-script" type="text/javascript" src="jquery.js" defer=""></script>
    <script class="u-script" type="text/javascript" src="nicepage.js" defer=""></script>
    <meta name="generator" content="Nicepage 3.28.0, nicepage.com">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <link id="u-theme-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto:100,100i,300,300i,400,400i,500,500i,700,700i,900,900i|Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i">
    <link id="u-page-google-font" rel="stylesheet" href="https://fonts.googleapis.com/css?family=Oswald:200,300,400,500,600,700">


    <script type="application/ld+json">{
		"@context": "http://schema.org",
		"@type": "Organization",
		"name": ""
}</script>
    <meta name="theme-color" content="#478ac9">
    <meta property="og:title" content="Home">
    <meta property="og:type" content="website">

    <style>
        .navbar {
            margin-bottom: 0;
            border-radius: 0;
            background-color: black;
        }

        /* Add a gray background color and some padding to the footer */
        footer {
            background-color: black;
            padding: 25px;
            color: white;
        }

        .navbar-inverse .navbar-brand {
            color: #24bdc5;
        }

        .button {
            display: inline-block;
            border-radius: 100px;
            background-color: #db545a;
            border: none;
            color: #FFFFFF;
            text-align: center;
            font-size: 28px;
            padding: 10px;
            width: 260px;
            transition: all 0.5s;
            cursor: pointer;
            margin: 5px;
        }

            .button span {
                cursor: pointer;
                display: inline-block;
                position: relative;
                transition: 0.5s;
            }

                .button span:after {
                    content: '\00bb';
                    position: absolute;
                    opacity: 0;
                    top: 0;
                    right: -20px;
                    transition: 0.5s;
                }

            .button:hover span {
                padding-right: 25px;
            }

                .button:hover span:after {
                    opacity: 1;
                    right: 0;
                }
    </style>

</head>
<body class="u-body">
    <nav class="navbar navbar-inverse">
        <div class="container-fluid">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="Home.aspx">ExpenseBook</a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav">
                    <li><a href="Reports.aspx">My Records</a></li>
                    <li><a href="ExpenseMainCatagory.aspx">Main Category</a></li>
                    <li><a href="AddSubCategory.aspx">Sub Category</a></li>
                    <li><a href="webpageAddExpenses.aspx">Add Expenses</a></li>
                    <li class="dropdown">
                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">Edit
                                    <span class="caret"></span>
                        </a>
                        <ul class="dropdown-menu">
                            <li><a href="EditMainCat.aspx">Edit Main Catagory</a></li>
                            <li><a href="EditSubCat.aspx">Edit SubCatagory</a></li>
                        </ul>
                    </li>
                    <li><a href="AboutUs.aspx">About Us</a></li>

                </ul>

                <ul class="nav navbar-nav navbar-right">
                    <li><a href="#"><span class="glyphicon glyphicon-user"></span>
                        <asp:Label ID="lblUser" runat="server" Text=""></asp:Label>
                    </a></li>
                    <li><a href="Logout.aspx"><span class="glyphicon glyphicon-log-in"></span>&nbsp;Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>
    <section class="u-align-left u-clearfix u-image u-valign-middle-md u-section-1" id="carousel_c5bd" data-image-width="1493" data-image-height="808">
        <div class="u-clearfix u-sheet u-sheet-1">
            <h2 class="u-custom-font u-font-oswald u-text u-text-palette-2-base u-text-1">Expense<br>
                Book
            </h2>
            <h6 class="u-text u-text-2">How to Manage Your Expenses.</h6>
            <p class="u-align-justify u-text u-text-3">
                <span style="font-weight: 700;">Follow the 50:30:20 rule</span>&nbsp;– By spending 50% of your salary on your needs and 30% on your wants, you can make sure you’re not spending too much on things you don’t need – and also ensure that some income is set aside as savings. Needs would include expenses on rent, mortgage, utilities, groceries, clothes etc..
            </p>
            <form id="form1" runat="server">
                <div class="form-group">
                    <asp:Button class="button" runat="server" Text="About Team" OnClick="Unnamed1_Click" Style="vertical-align: middle"></asp:Button>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
