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
        <div id ="space"></div>
    <div class ="page-header">
        <header><h1 align ="center">Restaurant Picker</h1></header>
        <%--<asp:Button ID="Button" runat="server" Text="This is a cool test button!" Class="btn btn-info"/>--%>
    </div>
        <div id ="space"></div>
        
    <div>
        <nav id="nav_bar">
            <%--<div class="card" style="width: 18rem;">
  <img class="card-img-top" src=".../100px180/" alt="Card image cap">
  <div class="card-body">
    <h5 class="card-title">Continue without Sign Up!</h5>
    <p class="card-text">Note: By doing this, you can just view the restaurants and its ratings. But you cannot rate them.</p>
    <a href="#" class="btn btn-primary">Continue</a>
  </div>
</div>--%>
            <div>
                <label for="exampleInputEmail1">
                    Email address <input type="email" class="form-control" id="Email1" aria-describedby="emailHelp" placeholder="Enter email">
                </label>
                <label for="exampleInputPassword1">
                    Password <input type="password" class="form-control" id="Password3" placeholder="Password">
                </label>
              <Button type="submit" runrat ="server" class="btn btn-primary">Log In</Button>
             </div>
            </nav>
        </div>
    <div id ="space"></div>
        <div id ="Signup">
                    
        <div id ="Div1"><h4>Sign Up!</h4> </div>
        <div><label for="FirstName">
            First Name <input type="name" name="form-control" placeholder="Enter FirstName"/></label>
        </div>
        <div><label for="LastName">
            Last Name <input type="name" name="form-control" placeholder="Enter LastName"/>
            </label>
        </div>
        <div><label for="Email">
            Email address <input type="name" name="form-control" placeholder="Enter Email"/></label>
         </div>
        <div >
        <label for="Password1">
            Password <input type="password" class="form-control" id="Password1" placeholder="Password"/></label>
        </div>
        <div >
        <label for="ConfirmPassword">Confirm Password <input type="password" class="form-control" id="Password2" placeholder="Confirm Password"/></label>
        </div>
        <div>
        <asp:Button ID="Button" type="signup" runrat ="server" class="btn btn-info">Sign Up</asp:Button>
        </div>
        </div>
        <div id ="space"></div>
        <div class="Continue">
        <div id ="Div2"><h4>Continue without Sign Up!</h4> </div>
        <p>Note: By doing this, you can just view the restaurants and its ratings. But you cannot rate them.</p>
        <div>
	    <asp:Button ID="Button" type="signup" runrat ="server" class="btn btn-info">Continue</asp:Button>
        </div>
        </div>

    </form>            
</body>
</html>
