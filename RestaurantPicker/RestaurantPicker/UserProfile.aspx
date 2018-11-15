<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="RestaurantPicker.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js" type="text/javascript"></script>
    <br />
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lbl_Greeting" runat="server" Text="Welcome," CssClass="col-md-2 offset-md-1 col-form-label" Font-Size="Large"></asp:Label>
            <asp:Button ID="btn_Edit" runat="server" Text="Edit Profile" CssClass="btn btn-info offset-md-7" />    
        </div>
    </div>
    <div class="panel col-md-10 offset-md-1">
        <ul class="nav nav-tabs" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="UserProfile" data-toggle="tab" href="#user" aria-controls="user" aria-selected="true">User Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="FriendsList" data-toggle="tab" href="#friends" aria-controls="friends" aria-selected="false">Friends List</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="Favorites" data-toggle="tab" href="#favorites" aria-controls="favorites" aria-selected="false">Favorites</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="Ratings" data-toggle="tab" href="#ratings" aria-controls="ratings" aria-selected="false">Ratings/Reviews</a>
          </li>
        </ul>
    </div>
    <div class="tab-content col-md-10 offset-md-1" id="tabContent">
        <div class="tab-pane fade show active" id="user" role="tabpanel" aria-labelledby="UserProfile">
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <asp:Label ID="Label1" runat="server" Text="First Name" CssClass="col-md-2 col-form-label"></asp:Label>
                        <asp:Label ID="lbl_FirstName" runat="server" CssClass="col-md-4 form-control-plaintext" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <asp:Label ID="Label2" runat="server" Text="Last Name" CssClass="col-md-2 col-form-label"></asp:Label>
                        <asp:Label ID="lbl_LastName" runat="server" CssClass="col-md-4 form-control-plaintext" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <asp:Label ID="Label3" runat="server" Text="Email" CssClass="col-md-2 col-form-label"></asp:Label>
                        <asp:Label ID="lbl_Email" runat="server" CssClass="col-md-4 form-control-plaintext" Text=""></asp:Label>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <div class="input-group">
                        <asp:Label ID="Label4" runat="server" Text="Zip Code" CssClass="col-md-2 col-form-label"></asp:Label>
                        <asp:Label ID="lbl_Zip" runat="server" CssClass="col-md-4 form-control-plaintext" Text=""></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="tab-pane fade" id="friends" role="tabpanel" aria-labelledby="FriendsList">!...</div>
        <div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="Favorites">?...</div>
        <div class="tab-pane fade" id="ratings" role="tabpanel" aria-labelledby="Ratings">pp...</div>
    </div>
</asp:Content>
