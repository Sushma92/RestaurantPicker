<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Restaurant.aspx.cs" Inherits="RestaurantPicker.Restaurant" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-header">Search</div>
                <div class="card-body">
                    <div class="row">

                    </div>
                </div>
            </div>
        </div>
        <br />
        <div class="col-md-10 offset-md-1">
            <div class="card">
                <div class="card-body">
                    <asp:GridView ID="gv_Restaurants" runat="server" CssClass="table table-striped" AutoGenerateColumns="false">
                        <Columns>
                            <asp:BoundField HeaderText="Name" DataField="Rest_Name" />
                            <asp:BoundField HeaderText="Weblink" DataField="Web_Link" />
                            <asp:BoundField HeaderText="Street" DataField="Street" />
                            <asp:BoundField HeaderText="City" DataField="City" />
                            <asp:BoundField HeaderText="State" DataField="State" />
                            <asp:BoundField HeaderText="Zip Code" DataField="ZipCode" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
   
</asp:Content>