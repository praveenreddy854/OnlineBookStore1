<%@ Page Title="" Language="C#" EnableEventValidation="false" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageOrders.aspx.cs" Inherits="OnlineBookStore.Admin.ManageOrders" %>
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
        .auto-style1 {
            position : relative;
            left: 199px;
            top : -50px;
            width: 1148px;
        }
    </style>
    <b style="position : relative ; left : 500px; top : -70px; font-weight :bolder; font-size :xx-large">Customer's Orders</b>
    <asp:GridView ID="gvOrders" CssClass="auto-style1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataSourceID="sqlDSOrders" ForeColor="#333333" GridLines="None" OnRowCommand="gvOrders_RowCommand">
        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                    <asp:Button runat="server" ID ="btnDelete" Text="Delete" OnClick="btnDelete_Click" CommandArgument='<%# Eval("OrderID") %>' />
                </ItemTemplate>
            </asp:TemplateField>
            
            <asp:BoundField DataField="OrderID" HeaderText="OrderID" ReadOnly="True" SortExpression="OrderID" />
            <asp:BoundField DataField="BookName" HeaderText="BookName" ReadOnly="True" SortExpression="BookName" />
            <asp:BoundField DataField="OrderStatusID" HeaderText="OrderStatusID" ReadOnly="True" SortExpression="OrderStatusID" />
            <asp:BoundField DataField="UserName" HeaderText="UserName" ReadOnly="True" SortExpression="UserName" />
            <asp:BoundField DataField="OrderTotal" HeaderText="OrderTotal" ReadOnly="True" SortExpression="OrderTotal" />
            <asp:BoundField DataField="Quantity" HeaderText="Quantity" ReadOnly="True" SortExpression="Quantity" />
            <asp:BoundField DataField="Email" HeaderText="Email" ReadOnly="True" SortExpression="Email" />
            
        </Columns>
        <EditRowStyle BackColor="#999999" />
        <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
        <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#E9E7E2" />
        <SortedAscendingHeaderStyle BackColor="#506C8C" />
        <SortedDescendingCellStyle BackColor="#FFFDF8" />
        <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
</asp:GridView>
    <asp:SqlDataSource ID="sqlDSOrders" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT o.OrderID, b.BookName, o.OrderStatusID, u.UserName, o.OrderTotal, oi.Quantity, u.Email FROM Orders AS o INNER JOIN OrderByItem AS oi ON o.OrderID = oi.OrderID INNER JOIN Users AS u ON u.UserID = o.UserID INNER JOIN Book AS b ON b.BookID = oi.BookID UNION SELECT o.OrderID, b.BookName, o.OrderStatusID, u.UserName, o.OrderTotal, oi.Quantity, u.Email FROM Orders AS o INNER JOIN BooksInKart AS oi ON o.OrderID = oi.OrderId INNER JOIN Users AS u ON u.UserID = o.UserID INNER JOIN Book AS b ON b.BookID = oi.BookID" ProviderName="System.Data.SqlClient">
    </asp:SqlDataSource>
    
</asp:Content>
