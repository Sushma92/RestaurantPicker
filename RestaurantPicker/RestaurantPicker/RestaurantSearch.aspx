<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RestaurantSearch.aspx.cs" Inherits="RestaurantPicker.Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=ResolveUrl("~/Scripts/StyleSheet1.css") %>"/>
    <br />
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">Search Restaurants</div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:Label ID="lbl_Name" runat="server" AssociatedControlID="tb_Name" CssClass="form-control" Text="Name"></asp:Label>
                                <asp:TextBox ID="tb_Name" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:Label ID="lbl_City" runat="server" AssociatedControlID="tb_City" CssClass="form-control" Text="City"></asp:Label>
                                <asp:TextBox ID="tb_City" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:Label ID="lbl_State" runat="server" AssociatedControlID="tb_State" CssClass="form-control" Text="State"></asp:Label>
                                <asp:TextBox ID="tb_State" runat="server" CssClass="form-control" placeholder="e.g. AL"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row">
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:Label ID="lbl_ZipCode" runat="server" AssociatedControlID="tb_ZipCode" CssClass="form-control" Text="Zip Code"></asp:Label>
                                <asp:TextBox ID="tb_ZipCode" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="input-group">
                                <asp:Label ID="lbl_Street" runat="server" AssociatedControlID="tb_Street" CssClass="form-control" Text="Street"></asp:Label>
                                <asp:TextBox ID="tb_Street" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="card-footer">
                    <asp:Button ID="btn_SearchRestaurants" CssClass="btn btn-success" runat="server" Text="Search" />
                    <asp:Button ID="btn_ResetSearch" runat="server" CssClass="btn btn-danger" Text="Reset" />
                </div>
            </div>
        </div>
        <br />
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <asp:GridView ID="gv_Restaurants" runat="server" CssClass="table table-striped" AutoGenerateColumns="false" 
                        AllowPaging="true" PageSize="5" AllowSorting="true">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="Rest_Name" />
                            <asp:BoundField HeaderText="Weblink" DataField="Web_Link" />
                            <asp:BoundField HeaderText="Street" DataField="Street" />
                            <asp:BoundField HeaderText="City" DataField="City" />
                            <asp:BoundField HeaderText="State" DataField="State" />
                            <asp:BoundField HeaderText="Zip Code" DataField="ZipCode" />
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <a href="#">View</a>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>