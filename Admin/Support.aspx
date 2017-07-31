<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="Support.aspx.cs" Inherits="OnlineBookStore.Admin.Support" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .panel
        {
            width : 1100px;
            position : relative;
            left : 100px;
            top : -100px;
        }
    </style>
        <asp:datalist id="dlMessages" runat="server">
            <ItemTemplate>
                <div class="panel panel-default">
                <div class="panel-heading">
                    <h4>
                        Message ID : <asp:Label runat="server" id="lblMessageID" Text='<%# Eval("MessageID") %>' ></asp:Label>
                        <asp:Label runat="server" id="lblDate" Text='<%# Eval("DateOfMessage") %>' ></asp:Label>
                    </h4>
                </div>
                <div class="panel-body">
                    Customer Name : <asp:Label runat="server" Text='<%# Eval("Name") %>'></asp:Label>
                    <br />
                    Email : <asp:Label runat="server" Text='<%# Eval("Email") %>'></asp:Label>
                    <br />
                    Message : <asp:Label runat="server" Text='<%# Eval("Message") %>'></asp:Label>
                </div>
                    </div>
                </ItemTemplate>
        </asp:datalist>
    
</asp:Content>
