<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="ManageUsers.aspx.cs" Inherits="OnlineBookStore.Admin.ManageUsers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <style>
        .panel
        {
            width : 1150px; 
            position :relative;
            left : 100px;
            top : -100px;
              
        }
        .headerForManageBooks
        {
            font-size : x-large;

        }
    </style>
    <div class="panel panel-default">
        <div class="panel-heading">
            <b class="headerForManageBooks">Manage Customers</b>
        </div>
        <div class="panel-body">
            <asp:gridview id="gvBooks" runat="server" BackColor="White" DataKeyNames="UserID" OnDataBound="gvBooks_DataBound" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" DataSourceID="edsUsers" ForeColor="Black" GridLines="Vertical" Height="190px"  Width="989px">
                <AlternatingRowStyle BackColor="#CCCCCC" />
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <FooterStyle BackColor="#CCCCCC" />
                <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                <SortedAscendingHeaderStyle BackColor="#808080" />
                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                <SortedDescendingHeaderStyle BackColor="#383838" />
            </asp:gridview>
            <asp:entitydatasource id="edsUsers" runat="server" ConnectionString="name=BookDBContext" DefaultContainerName="BookDBContext" EnableDelete="True" EnableFlattening="False" EnableUpdate="True" EntitySetName="Users" EnableInsert="True"></asp:entitydatasource>
        </div>
    </div>
</asp:Content>
