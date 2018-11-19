<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="RestaurantPicker.Restaurant1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-4 offset-md-1">
                <div class="input-group">
                    <asp:Label ID="lbl_RestHeading" Font-Size="X-Large" runat="server" CssClass= "form-control-plaintext"></asp:Label>
                </div>
            </div>
            <div class="col-md-2 offset-5">
                <div class="input-group">
                    <asp:Label ID="lbl_RestRating" Font-Size="X-Large" runat="server" CssClass="form-control-plaintext" Text="Label"></asp:Label>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">Restaurant Information</div>
                <div class="card-body">
                
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <asp:Label ID="Label1" runat="server" Text="Street" CssClass="form-control-plaintext col-md-1"></asp:Label>
                                <asp:Label ID="lbl_Rest_Street" runat="server" CssClass= "col-md-4 form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <asp:Label ID="Label2" runat="server" Text="City" CssClass="form-control-plaintext col-md-1"></asp:Label>
                                <asp:Label ID="lbl_Rest_City" runat="server" CssClass= "col-md-4 form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <asp:Label ID="Label3" runat="server" Text="State" CssClass="form-control-plaintext col-md-1"></asp:Label>
                                <asp:Label ID="lbl_Rest_State" runat="server" CssClass= "col-md-4 form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-12">
                            <div class="input-group">
                                <asp:Label ID="Label4" runat="server" Text="Zip" CssClass="form-control-plaintext col-md-1"></asp:Label>
                                <asp:Label ID="lbl_Rest_Zip" runat="server" CssClass= "col-md-4 form-control-plaintext"></asp:Label>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <br />
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">Restaurant Reviews</div>
                <div class="card-body">
                    <asp:Repeater ID="Repeater1" runat="server">
                        <ItemTemplate>
                            <div class="col-md-12">
                                <div class="card">
                                    <div class="card-header">
                                        <div class="float-left">
                                             <%#Eval("Fname")%> <%#Eval("Lname")%>
                                        </div>
                                        <div class="float-right"><%#Eval("Rating")%></div>
                                    </div>
                                    <div class="card-body"><%#Eval("Review") %></div>
                                </div>
                            </div>
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label ID="defaultItem" runat="server" 
                                Visible='<%# Repeater1.Items.Count == 0 %>' Text="Sorry! No reviews have been left for this restaurant yet!\n" />
                            <asp:Button ID="btn_Home" runat="server" Visible='<%# %>' Text="Click here to log in!" />
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    

</asp:Content>
