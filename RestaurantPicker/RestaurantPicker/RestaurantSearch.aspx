<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="RestaurantSearch.aspx.cs" Inherits="RestaurantPicker.Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link rel="stylesheet" type="text/css" href="<%=ResolveUrl("~/Scripts/StyleSheet1.css") %>"/>
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
    <br />
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">Search Restaurants</div>
                <div class="card-body">
                    <asp:UpdatePanel ID="UpdatePanel2" runat="server">
                        <ContentTemplate>
                            <div class="row">
                                <div class="col-md-12">
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ForeColor="Red" ErrorMessage="Error!! Please enter a numeric value for Zip Code." ValidationExpression="\d{5}" ControlToValidate="tb_ZipCode" Display="Dynamic"></asp:RegularExpressionValidator>
                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ForeColor="Red" ErrorMessage="Error!! Please enter characters for the State." ValidationExpression="[A-Za-z]{2}" ControlToValidate="tb_State" Display ="Dynamic"></asp:RegularExpressionValidator>
                                </div>
                            </div>
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
                                        <asp:TextBox ID="tb_State" runat="server" CssClass="form-control" placeholder="e.g. AL" MaxLength="2"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:Label ID="lbl_ZipCode" runat="server" AssociatedControlID="tb_ZipCode" CssClass="form-control" Text="Zip Code"></asp:Label>
                                        <asp:TextBox ID="tb_ZipCode" runat="server" CssClass="form-control" MaxLength="5" ></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="input-group">
                                        <asp:Label ID="lbl_Street" runat="server" AssociatedControlID="tb_Street" CssClass="form-control" Text="Street"></asp:Label>
                                        <asp:TextBox ID="tb_Street" runat="server" CssClass="form-control"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                         </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
                <div class="card-footer">
                    <asp:Button ID="btn_SearchRestaurants" CssClass="btn btn-success" runat="server" Text="Search" OnClick="btn_SearchRestaurants_Click" />
                    <asp:Button ID="btn_ResetSearch" runat="server" CssClass="btn btn-danger" Text="Reset" OnClick="btn_ResetSearch_Click" />
                </div>
            </div>
        </div>
        <br />
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                        <ContentTemplate>
                            <asp:GridView ID="gv_Restaurants" runat="server" CssClass="table table-striped" AutoGenerateColumns="false" 
                                AllowPaging="true" OnPageIndexChanging="gv_Restaurants_PageIndexChanging" PageSize="5" AllowSorting="true" OnRowCommand="gv_Restaurants_RowCommand"
                                DataKeyNames="Rest_ID">
                                <Columns>
                                    <asp:BoundField HeaderText="Name" DataField="Rest_Name" />
                                    <asp:BoundField HeaderText="Weblink" DataField="Web_Link" />
                                    <asp:BoundField HeaderText="Street" DataField="Street" />
                                    <asp:BoundField HeaderText="City" DataField="City" />
                                    <asp:BoundField HeaderText="State" DataField="State" />
                                    <asp:BoundField HeaderText="Zip Code" DataField="ZipCode" />
                                    <asp:ButtonField CommandName="Select" Text="View" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                    
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>