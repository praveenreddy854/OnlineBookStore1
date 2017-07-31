<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" EnableEventValidation="false"  AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="OnlineBookStore.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <%--<div class="HeaderList">
        <h4>
            You are at right place to select books
        </h4>
    </div>--%>
    <style>
        .padding{
            padding-left : 60px;
        }
        .priceLabelClass
        {
            color : black;
            font-weight : bold;
        }
        .nameLabelClass
        {
            color : black;
            font-weight : bold;
        }
    </style>
    <div class="position80PX">
        <asp:DataList ID="dlBooks" runat="server" RepeatColumns="4" CellPadding="10"  BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" GridLines="None">
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <ItemStyle BackColor="White" ForeColor="#330099" CssClass="padding" />
        <ItemTemplate>
            <table class="nav-justified">
                <tr>
                    <td>
                        <asp:ImageButton ID="imgButton" CommandArgument='<%# Eval("BookId") %>' OnClick="imgButton_Click" ImageUrl='<%# Eval("BookURL") %>'  Width="250px" Height="250px" runat="server" />

                    </td>
                    
                </tr>
                <tr>
                    <td align="center">
                        
                    <asp:Label ID="lblBookName" CssClass="nameLabelClass" runat="server" Text= '<%# Eval("BookName") %>'></asp:Label>
                    </td>
                </tr>
                <tr >
                    <td align="center">
                        <b style="color:black;">$</b><asp:Label ID="lblPrice" CssClass="priceLabelClass" runat="server" Text= '<%# Eval("Price") %>'></asp:Label>
                    </td>
                </tr>
                
            </table>
        </ItemTemplate>
        <SelectedItemStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />

    </asp:DataList>
    </div>
    
</asp:Content>

