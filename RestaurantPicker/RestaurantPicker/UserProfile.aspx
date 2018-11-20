<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="RestaurantPicker.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="container-fluid">

    </div>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lbl_Greeting" runat="server" Text="Welcome," CssClass="col-md-2 offset-md-1 col-form-label" Font-Size="Large"></asp:Label>
            
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
                            <asp:Button ID="btn_Edit" runat="server" Text="Edit Profile" CssClass="btn btn-info offset-md-7" OnClick="btn_Edit_Click" />
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
        <div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="Favorites">
            <table class="table">
              <thead class="thead-light">
                <tr>
                  <th scope="col">Favorite Food</th>
                  <th scope="col">Restaurant Name</th>
                  <th scope="col">Street</th>
                  <th scope="col">Zipcode</th>
                </tr>
              </thead>
           </table>
        </div>
        <div class="tab-pane fade" id="ratings" role="tabpanel" aria-labelledby="Ratings">  
            <asp:GridView ID="gv_UserRatings" runat="server" AutoGenerateColumns="false" CssClass="table table-striped">
                <Columns>
                    <asp:BoundField DataField="Rest_Name" HeaderText="Restaurant Name" />
                    <asp:BoundField DataField="Rating" HeaderText="Rating" />
                    <asp:BoundField DataField="Review" HeaderText="Review" />
                    <asp:BoundField DataField="Street" HeaderText="Street" />
                    <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" />
                </Columns>
            </asp:GridView>          
            <%--<table class="table">
              <thead class="thead-light">
                <tr>
                  <th scope="col">Restaurant Name</th>
                  <th scope="col">Rating</th>
                  <th scope="col">Review</th>
                  <th scope="col">Street</th>
                  <th scope="col">Zipcode</th>
                </tr>
              </thead>
              
            </table>--%>

        </div>
    </div>
    <div class="modal fade" id="EditModal" role="dialog" aria-labelledby="EditModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text="Edit Profile"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:ValidationSummary ID="ValidationSummary1" ValidationGroup="EditProfileSummary" runat="server" />
                            </div>
                            <div class="row">
                                <asp:Label ID="lbl_Fname" runat="server" CssClass="col-md-3" Text="First Name" AssociatedControlID="tb_Fname"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="tb_Fname" ForeColor="Red" Text="*" Display="Dynamic" ValidationGroup="EditProfileSummary" ErrorMessage="First Name is a required field."></asp:RequiredFieldValidator>
                                <asp:TextBox ID="tb_Fname" runat="server" CssClass="form-control col-md-6" placeholder="Enter First Name" MaxLength="25"></asp:TextBox>
                            </div>
                            <div class="row">
                                <asp:Label ID="lbl_Lname" runat="server" CssClass="col-md-3" Text="Last Name"></asp:Label>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="tb_Lname" ForeColor="Red" Text="*" Display="Dynamic" ValidationGroup="EditProfileSummary" ErrorMessage="Last Name is a required field."></asp:RequiredFieldValidator>
                                <asp:TextBox ID="tb_Lname" runat="server" CssClass="form-control col-md-6" placeholder="Enter Last Name" MaxLength="25"></asp:TextBox>
                            </div>
                            <div class="row">
                                <asp:Label ID="Label5" runat="server" CssClass="col-md-3" Text="Email"></asp:Label>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ValidationGroup="EditProfileSummary" ControlToValidate="tb_Email" ValidationExpression="^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z]{2,5})$" Display="Dynamic" Text="*" ForeColor="Red" ErrorMessage="Please enter a valid Email"></asp:RegularExpressionValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="tb_Email" ForeColor="Red" Text="*" Display="Dynamic" ValidationGroup="EditProfileSummary" ErrorMessage="Email is a required field."></asp:RequiredFieldValidator>
                                <asp:TextBox ID="tb_Email" runat="server" CssClass="form-control col-md-6" placeholder="Enter Email" MaxLength="75"></asp:TextBox>
                            </div>
                            <div class="row">
                                <asp:Label ID="Label6" runat="server" CssClass="col-md-3" Text="Zip Code"></asp:Label>
                                <asp:TextBox ID="tb_ZipCode" runat="server" CssClass="form-control col-md-6" MaxLength="5"></asp:TextBox>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn_SubmitChanges" runat="server" CssClass="btn btn-success" Text="Update" OnClick="btn_SubmitChanges_Click" ValidationGroup="EditProfileSummary" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>

</asp:Content>
