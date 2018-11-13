<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RestaurantPicker.Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="Content/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=ResolveUrl("~/Scripts/StyleSheet1.css") %>"/>
    <title></title>
</head>
<body>
    <form id="form" runat="server">
        <br />
        <div class ="page-header">
            <header><h1 style="align-content:center" >Restaurant Picker</h1></header>
        </div>
        <div>
            <nav id="nav_bar">
                <div class="row">
                    <div class="col-md-5">
                        <asp:Label ID="lbl_InputEmail" runat="server" Text="Email" AssociatedControlID="tb_InputEmail"></asp:Label>
                        <asp:TextBox ID="tb_InputEmail" runat="server" CssClass="form-control" placeholder="Enter Email" ></asp:TextBox>
                    </div>
                    <div class="col-md-5">
                        <asp:Label ID="lbl_InputPassword" runat="server" Text="Password" AssociatedControlID="tb_InputPassword"></asp:Label>
                        <asp:TextBox ID="tb_InputPassword" runat="server" CssClass="form-control" placeholder="Enter Password"></asp:TextBox>
                    </div>
                    <div class="col-md-2 justify-content-center align-self-end">
                        <asp:Button ID="Button1" type="submit" runat ="server" CssClass="btn btn-primary" Text="Log In"></asp:Button>
                    </div>                    
                 </div>
            </nav>
        </div>
        <br />
        <div id ="Signup">        
            <div id ="Div1"><h4>Sign Up!</h4> </div>
            <div>
                <div class="row">
                    <asp:Label ID="lbl_Fname" runat="server" CssClass="col-md-2" Text="First Name" AssociatedControlID="tb_Fname"></asp:Label>
                    <asp:TextBox ID="tb_Fname" runat="server" CssClass="form-control col-md-6" placeholder="Enter First Name"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lbl_Lname" runat="server" CssClass="col-md-2" Text="Last Name"></asp:Label>
                    <asp:TextBox ID="tb_Lname" runat="server" CssClass="form-control col-md-6" placeholder="Enter Last Name"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lbl_Email" runat="server" CssClass="col-md-2" Text="Email"></asp:Label>
                    <asp:TextBox ID="tb_Email" runat="server" CssClass="form-control col-md-6" placeholder="Enter Email"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lbl_Password1" runat="server" CssClass="col-md-2" Text="Password"></asp:Label>
                    <asp:TextBox ID="tb_Password1" runat="server" CssClass="form-control col-md-6" placeholder="Password"></asp:TextBox>
                </div>
                <br />
                <div class="row">
                    <asp:Label ID="lbl_Password2" runat="server" CssClass="col-md-2" Text="Email"></asp:Label>
                    <asp:TextBox ID="tb_Password2" runat="server" CssClass="form-control col-md-6" placeholder="Confirm Password"></asp:TextBox>
                </div>
                <div class="row">
                    <div class="col-md-2 offset-col-md-2">
                        <asp:Button ID="btn_SignUp" type="signup" runat ="server" CssClass="btn btn-info" Text="Sign Up"></asp:Button>
                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="Continue">
            <div id ="Div2"><h4>Continue without Sign Up!</h4> </div>
            <p>Note: By doing this, you can just view the restaurants and its ratings. But you cannot rate them.</p>
            <div>
	            <asp:Button ID="btn_Continue" type="signup" runat ="server" CssClass="btn btn-info" Text="Continue" OnClick="btn_Continue_Click"></asp:Button>
            </div>
        </div>

    </form>            
</body>
</html>
