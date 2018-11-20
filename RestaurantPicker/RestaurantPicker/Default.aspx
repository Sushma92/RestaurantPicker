<%@ Page Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="RestaurantPicker.Default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=ResolveUrl("~/Scripts/StyleSheet1.css") %>"/>
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class ="page-header">
        <header><h1 style="align-content:center" >Restaurant Picker</h1></header>
    </div>
    <div>
        <nav id="nav_bar">
            <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <asp:Label ID="Label1" runat="server" Text="Unable to sign in. Please make sure that you inputted the correct username and password." Font-Bold="true" ForeColor="Red" Visible="false"></asp:Label>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
            <div class="row">
                <div class="col-md-5">
                    <asp:Label ID="lbl_InputEmail" runat="server" Text="Email" AssociatedControlID="tb_InputEmail"></asp:Label>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ValidationGroup="NewUserSummary" ControlToValidate="tb_InputEmail" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Display="Dynamic" Text="*" ForeColor="Red" ErrorMessage="Please enter a valid Email"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="tb_InputEmail" runat="server" CssClass="form-control" placeholder="Enter Email" MaxLength="75" ></asp:TextBox>
                </div>
                <div class="col-md-5">
                    <asp:Label ID="lbl_InputPassword" runat="server" Text="Password" AssociatedControlID="tb_InputPassword"></asp:Label>
                    <asp:TextBox ID="tb_InputPassword" runat="server" CssClass="form-control" placeholder="Enter Password" TextMode="Password"></asp:TextBox>
                </div>
                <div class="col-md-2 justify-content-center align-self-end">
                    <asp:Button ID="btn_Login" runat="server" Text="Login" CssClass="btn btn-info" OnClick="btn_Login_Click" />
                    
                </div>                    
                </div>
        </nav>
    </div>
    <br />
    <div id ="Signup">        
        <div id ="Div1"><h4>Sign Up!</h4> </div>
        <div>
            <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <ContentTemplate>
                    <div class="row">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" Font-Bold="true" ValidationGroup="NewUserSummary" EnableClientScript="true" />
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
            
            <div class="row">
                <asp:Label ID="lbl_Fname" runat="server" CssClass="col-md-2" Text="First Name" AssociatedControlID="tb_Fname"></asp:Label>
                <asp:TextBox ID="tb_Fname" runat="server" CssClass="form-control col-md-6" placeholder="Enter First Name" MaxLength="25"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Label ID="lbl_Lname" runat="server" CssClass="col-md-2" Text="Last Name"></asp:Label>
                <asp:TextBox ID="tb_Lname" runat="server" CssClass="form-control col-md-6" placeholder="Enter Last Name" MaxLength="25"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Label ID="lbl_Email" runat="server" CssClass="col-md-2" Text="Email"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="NewUserSummary" ControlToValidate="tb_Email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Display="Dynamic" Text="*" ForeColor="Red" ErrorMessage="Please enter a valid Email"></asp:RegularExpressionValidator>
                <asp:TextBox ID="tb_Email" runat="server" CssClass="form-control col-md-6" placeholder="Enter Email" MaxLength="75"></asp:TextBox>
                
            </div>
            <div class="row">
                <asp:Label ID="lbl_Password1" runat="server" CssClass="col-md-2" Text="Password"></asp:Label>
                <asp:TextBox ID="tb_Password1" runat="server" CssClass="form-control col-md-6" placeholder="Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="row">
                <asp:Label ID="lbl_Password2" runat="server" CssClass="col-md-2" Text="Confirm Password"></asp:Label>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Text="*" ValidationGroup="NewUserSummary" ForeColor="Red" ErrorMessage="Password Mismatch" ControlToValidate="tb_Password2" ControlToCompare="tb_Password1" Operator="Equal" Type="String" Display="Dynamic"></asp:CompareValidator>
                <asp:TextBox ID="tb_Password2" runat="server" CssClass="form-control col-md-6" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
            </div>
            <div class="row">
                <div class="col-md-2 offset-col-md-2">
                    <asp:Button ID="btn_SignUp" type="signup" runat ="server" CssClass="btn btn-info" Text="Sign Up" ValidationGroup="NewUserSummary"></asp:Button>
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
    <script>

    </script>
</asp:Content>