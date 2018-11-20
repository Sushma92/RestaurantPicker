<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="RestaurantPicker.Restaurant1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
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
                <div class="card-header" style="font-size:x-large">Restaurant Information</div>
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
                <div class="card-header">
                    <span>
                        <asp:Label ID="Label5" runat="server" Text="Restaurant Reviews" Font-Size="X-Large"></asp:Label>
                        <asp:Button ID="btn_Review" runat="server" class="btn btn-danger float-right" OnClick="btn_Review_Click" />
                    </span>
                </div>
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
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <div class="modal fade" id="ReviewModal" role="dialog" aria-labelledby="ReviewModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <asp:UpdatePanel ID="UpdatePanel1" runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
                <ContentTemplate>
                    <div class="modal-content">
                        <div class="modal-header">
                            <h4 class="modal-title"><asp:Label ID="lblModalTitle" runat="server" Text="Leave a rating and a review!"></asp:Label></h4>
                            <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                        </div>
                        <div class="modal-body">
                            <div class="row">
                                <div class="col-md-2">
                                    <asp:Label ID="Label6" runat="server" Text="Rating "></asp:Label>
                                </div>
                                <div class="col-md-10">
                                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" RepeatLayout="Flow">
                                        <asp:ListItem Text="5" Value="5"></asp:ListItem>
                                        <asp:ListItem Text="4" Value="4"></asp:ListItem>
                                        <asp:ListItem Text="3" Value="3"></asp:ListItem>
                                        <asp:ListItem Text="2" Value="2"></asp:ListItem>
                                        <asp:ListItem Text="1" Value="1"></asp:ListItem>
                                    </asp:RadioButtonList>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:Label ID="Label7" runat="server" Text="Review"></asp:Label>
                                    <asp:TextBox ID="tb_Review" CssClass="form-control" runat="server" TextMode="MultiLine"></asp:TextBox>
                                </div>
                                
                            </div>
                        </div>
                        <div class="modal-footer">
                            <asp:Button ID="btn_SubmitReview" runat="server" Text="Submit" OnClick="btn_SubmitReview_Click" UseSubmitBehavior="false" data-dismiss="modal" />
                            <button class="btn btn-info" data-dismiss="modal" aria-hidden="true">Close</button>
                        </div>
                    </div>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <br />
</asp:Content>
