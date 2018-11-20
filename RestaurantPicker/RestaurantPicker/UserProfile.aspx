<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="UserProfile.aspx.cs" Inherits="RestaurantPicker.User" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <div class="row">
        <div class="col-md-12">
            <asp:Label ID="lbl_Greeting" runat="server" Text="Welcome," CssClass="col-md-2 offset-md-1 col-form-label" Font-Size="Large"></asp:Label>
        </div>
    </div>
    <div class="row">
        <div class="col-md-12">
                        <asp:Label ID="lbl_Staus" runat="server" Text="" Visible ="false"></asp:Label>
        </div>
    </div>
    <div class="container-fluid">
        <div class="panel col-md-10 offset-md-1">
            <ul class="nav nav-tabs" role="tablist" id="profiletabs">
              <li class="nav-item">
                <a class="nav-link active" id="UserProfile" data-toggle="tab" href="#user" aria-controls="user" aria-selected="true">User Profile</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" runat="server" id="FSearch" data-toggle="tab" href="#friendsearch" aria-controls="friendsearch" aria-selected="false">Search for Friends</a>
              </li>
                <li class="nav-item">
                    <a class="nav-link" id="FList" data-toggle="tab" href="#friendslist" aria-controls="friendslist" aria-selected="false">Friend List</a>
                </li>
              <li class="nav-item">
                <a class="nav-link" id="Favorites" data-toggle="tab" href="#favorites" aria-controls="favorites" aria-selected="false">Favorites</a>
              </li>
              <li class="nav-item">
                <a class="nav-link" id="Ratings" data-toggle="tab" href="#ratings" aria-controls="ratings" aria-selected="false">Ratings/Reviews</a>
              </li>
            </ul>
        </div>
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
        <div class="tab-pane fade" id="friendsearch" role="tabpanel" aria-labelledby="FSearch">
            <br />
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="card-header">Search for Friends</div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                            <ContentTemplate>
                                <div class="row">
                                    <div class="col-md-12">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <asp:Label ID="lbl_FriendFname" runat="server" AssociatedControlID="tb_FriendFname" CssClass="form-control" Text="First Name"></asp:Label>
                                            <asp:TextBox ID="tb_FriendFname" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <asp:Label ID="lbl_City" runat="server" AssociatedControlID="tb_FriendLname" CssClass="form-control" Text="Last Name"></asp:Label>
                                            <asp:TextBox ID="tb_FriendLname" runat="server" CssClass="form-control" MaxLength="25"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <asp:Label ID="lbl_FriendZipCode" runat="server" AssociatedControlID="tb_FriendZipCode" CssClass="form-control" Text="Zip Code"></asp:Label>
                                            <asp:TextBox ID="tb_FriendZipCode" runat="server" CssClass="form-control" MaxLength="5" ></asp:TextBox>
                                        </div>
                                    </div>
                                    <div class="col-md-6">
                                        <div class="input-group">
                                            <asp:Label ID="lbl_FriendEmail" runat="server" AssociatedControlID="tb_FriendEmail" CssClass="form-control" Text="Email"></asp:Label>
                                            <asp:TextBox ID="tb_FriendEmail" runat="server" CssClass="form-control" MaxLength="75"></asp:TextBox>
                                        </div>
                                    </div>
                                </div>
                             </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div class="card-footer">
                        <asp:Button ID="btn_SearchFriends" runat="server" Text="Search" CssClass="btn btn-success" OnClick="btn_SearchFriends_Click" />
                        <asp:Button ID="btn_ResetFriends" runat="server" Text="Reset" CssClass="btn btn-danger" OnClick="btn_ResetFriends_Click" />
                    </div>
                </div>
            </div>
            <br />
            <div class="col-md-10 offset-md-1">
                <asp:UpdatePanel ID="UpdatePanel4" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gv_FriendSearch" CssClass="table table-striped" runat="server" AutoGenerateColumns="false" 
                            OnRowCommand="gv_FriendSearch_RowCommand" DataKeyNames="UserID"
                             AllowPaging="true" PageSize="5" OnPageIndexChanging="gv_FriendSearch_PageIndexChanging">
                        <Columns>
                            <asp:BoundField HeaderText="First Name" DataField="Fname" />
                            <asp:BoundField HeaderText="Last Name" DataField="Lname" />
                            <asp:BoundField HeaderText="Email" DataField="Email" />
                            <asp:BoundField HeaderText="Zip Code" DataField="ZipCode" />
                            <asp:ButtonField CommandName="Add" Text="Add user as friend" />
                        </Columns>
                        <EmptyDataTemplate>
                            Sorry! No friends found :(
                        </EmptyDataTemplate>
                    </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>
        <div class="tab-pane fade" id="friendslist" role="tabpanel" aria-labelledby="FList">
            <br />
            <div class="col-md-10 offset-md-1">
                <asp:UpdatePanel ID="UpdatePanel5" runat="server">
                    <ContentTemplate>
                        <asp:GridView ID="gv_FriendList" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" 
                            HeaderStyle-CssClass="thead-light" DataKeyNames="UserID" OnRowCommand="gv_FriendList_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="Fname" HeaderText="Restaurant Name" />
                                <asp:BoundField DataField="Lname" HeaderText="Rating" />
                                <asp:BoundField DataField="Email" HeaderText="Review" />
                                <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" />
                                <asp:ButtonField CommandName="Go" Text="Go to Friend's Page" />
                                <asp:TemplateField>
                                    <ItemTemplate>
                                        <a runat="server" id="friendPageLink"></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                            <EmptyDataTemplate>
                                This user has not made any friends yet!.
                            </EmptyDataTemplate>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </div>
        </div>
        <div class="tab-pane fade" id="favorites" role="tabpanel" aria-labelledby="Favorites">
            <br />
            <div class="col-md-10 offset-md-1">
                <div class="card">
                    <div class="card-header">
                        <span>
                            <asp:Label ID="lbl_faveFood" runat="server" Text="Favorite Foods"></asp:Label>
                            <asp:Button ID="btn_AddFaveFood" runat="server" CssClass="btn btn-info float-right" Text="Add a New Favorite Food" OnClick="btn_AddFaveFood_Click" />
                        </span>
                    </div>
                    <div class="card-body">
                        <asp:UpdatePanel ID="UpdatePanel6" runat="server">
                            <ContentTemplate>
                                <asp:GridView ID="gv_Favorites" runat="server" CssClass="table table-striped" 
                                    HeaderStyle-CssClass="thead-light" AutoGenerateColumns="false"
                                     AllowPaging="true" OnPageIndexChanging="gv_Favorites_PageIndexChanging" OnRowCommand="gv_Favorites_RowCommand"
                                     DataKeyNames="Rest_ID, Food_ID">
                                    <Columns>
                                        <asp:BoundField HeaderText="Name" DataField="Name" />
                                        <asp:BoundField HeaderText="Restaurant" DataField="Rest_Name" />
                                        <asp:ButtonField CommandName="Delete" Text="Remove Favorite" />
                                    </Columns>
                                    <EmptyDataTemplate>
                                        This user hasn't picked any favorite foods yet!
                                    </EmptyDataTemplate>
                                </asp:GridView>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
                
            </div>
        </div>
        <div class="tab-pane fade" id="ratings" role="tabpanel" aria-labelledby="Ratings">
            <br /> 
            <div class="col-md-10 offset-md-1">
                <asp:GridView ID="gv_UserRatings" runat="server" AutoGenerateColumns="false" CssClass="table table-striped" 
                    HeaderStyle-CssClass="thead-light">
                    <Columns>
                        <asp:BoundField DataField="Rest_Name" HeaderText="Restaurant Name" />
                        <asp:BoundField DataField="Rating" HeaderText="Rating" />
                        <asp:BoundField DataField="Review" HeaderText="Review" />
                        <asp:BoundField DataField="Street" HeaderText="Street" />
                        <asp:BoundField DataField="ZipCode" HeaderText="Zip Code" />
                    </Columns>
                    <EmptyDataTemplate>
                        This user has not left any reviews yet. Check back later!
                    </EmptyDataTemplate>
                </asp:GridView>          
            </div>
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

    <div class="modal fade bd-example-modal-lg" id="FaveFoodModal" role="dialog" aria-labelledby="FaveFoodModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <asp:UpdatePanel ID="UpdatePanel7" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><asp:Label ID="Label7" runat="server" Text="Add Favorite Food"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <asp:ValidationSummary ID="ValidationSummary2" ValidationGroup="EditProfileSummary" runat="server" />
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <h6>Select a favorite food (and optionally where you ate it)</h6>
                                </div>
                            </div>
                            <br />
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="Label8" runat="server" Text="Favorite Food"></asp:Label>
                                </div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddl_FoodOptions" runat="server"></asp:DropDownList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <asp:Label ID="Label9" runat="server" Text="Restaurant"></asp:Label>
                                </div>
                                <div class="col-md-8">
                                    <asp:DropDownList ID="ddl_Restaurants" runat="server">
                                        <asp:ListItem Selected="True" Value="0">--</asp:ListItem>
                                    </asp:DropDownList>
                                </div>
                            </div>
                            
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn_AddFavoriteFood" runat="server" CssClass="btn btn-success" Text="Add" OnClick="btn_AddFavoriteFood_Click" ValidationGroup="" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        </div>

    <asp:UpdatePanel ID="UpdatePanel3" runat="server">
        <ContentTemplate>
            <asp:HiddenField ID="HiddenValue" runat="server" Value="0"></asp:HiddenField>
        </ContentTemplate>
    </asp:UpdatePanel>
        
    <script>
        $('#profiletabs a[href="' + $("#<%= HiddenValue.ClientID %>").val() + '"]').tab('show');
        $('a[data-toggle="tab"]').on('shown.bs.tab', function (e) {
            var target = $(e.target).attr("href") // activated tab
            $("#<%= HiddenValue.ClientID %>").val(target)
            var hidden = $("#<%= HiddenValue.ClientID %>").val();
        });

    </script>
</asp:Content>
