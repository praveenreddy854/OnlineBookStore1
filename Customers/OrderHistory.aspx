<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="OrderHistory.aspx.cs" Inherits="OnlineBookStore.Customers.OrderHistory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        
        .gvOrders td
        {
            padding-left : 50px;
            padding-bottom : 5px;
            padding-top : 5px;
            padding-right : 50px;
            
        }
        .gvOrders th
        {
            padding-left : 54px;
            padding-bottom : 7px;
            padding-top : 7px;
            padding-right : 50px;
        }
        .gvOrders
        {
            position :relative;
            left : 100px;
            top : -50px;
        }
    </style>
    <b style="position : relative ; left : 500px; top : -70px; font-weight :bolder; font-size :xx-large">Your Orders</b>
    
    <asp:GridView ID="gvOrders" runat="server" EmptyDataText="You have no orders yet" CssClass="gvOrders" AutoGenerateColumns="false" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField HeaderText="Item">
                <ItemTemplate>
                    <img runat="server" src='<%# Eval("BookURL") %>' height="80" width="80" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="BookName" HeaderText="Book"  />
            <asp:BoundField DataField="OrderTotal" HeaderText="Order Total" />
            <asp:BoundField DataField="OrderId" HeaderText="Order ID" />
            <asp:BoundField DataField="OrderDate" DataFormatString="{0:M/d/yyyy}" HeaderText="Ordered Date" />
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" CssClass="gvOrdersHeader" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        <EmptyDataRowStyle CssClass="notVisible" />

    </asp:GridView>
</asp:Content>
