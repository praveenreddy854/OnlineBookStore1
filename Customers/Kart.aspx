<%@ Page Title="" EnableEventValidation="false" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Kart.aspx.cs" Inherits="OnlineBookStore.Customers.Kart" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        table
        {
            position :relative;
            left : 40px;
        }
    </style>
    <style>
        .cardNumber {
            width: 400px !important;
        }

        .auto-style1 {
            width: 171px;
        }

        tr {
            height: 40px;
        }

        .container-fluid {
            width: 900px;
        }

        .selectPickerExp {
            width: 49.5%;
            display: inline !important;
        }

        .panel-default {
            width: 1000px !important;
            position: relative;
            left: 200px;
            border: none !important;
        }

        .buttonsDiv {
            position: relative;
            left: 350px;
        }

            .buttonsDiv .btn {
                width: 200px !important;
            }

        .width {
            width: 100px !important;
        }

        td {
            padding-right: 120px;
            padding-bottom: 5px;
        }
        .buttonClass
        {
            padding-right: 30px;
        }
        #kartItemsDiv
        {
            position :relative;
            left : 100px;
        }
        #subTotalHeader
        {
            position :relative;
            left : -230px;
        }
    </style>
    <div id="kartItemsDiv">
        <asp:DataList ID="dlKart" runat="server">

                        <HeaderTemplate>
                            <asp:Panel ID="pnlHeader" Visible='<%# !bool.Parse((dlKart.Items.Count==0).ToString())%>' runat="server">
                                <table class="nav-justified" runat="server" >
                                <tr>
                                    <th style="position :relative; left :30px">ITEM 
                                    </th>
                                    <th>QUANTITY
                                    </th>
                                    <th id="subTotalHeader">SUB TOTAL
                                    </th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </table>
                            </asp:Panel>
                            

                        </HeaderTemplate>
                        <ItemTemplate>
                            <table class="nav-justified">
                                <tr>
                                    
                                    <td>
                                       
                                                <asp:Image ID="imgBookURL" Width="100px" Height="100px" ImageUrl='<%# Bind("BookURL") %>' runat="server" /></td>
                                    <td>
                                        
                                        <asp:TextBox ID="txtQuantity"  Text='<%# Bind("Quantity")  %>'  Width="30px" runat="server"></asp:TextBox>
                                        
                                    </td>
                                                
                                                <td>
                                                    
                                                   $<asp:Label ID="lblSubTot" runat="server" Text='<%# Bind("KartTotal") %>'></asp:Label>

                                                </td>
                                           
                                        <td class="buttonClass">
                                            
                                            <asp:Button ID="btnSave" OnClick="btnSave_Click"  CommandArgument='<%# Bind("KartId") %>' CssClass="btn btn-primary width" runat="server" Text="SAVE" /></td>
                                        <td>
                                            <asp:Button ID="btnDelete" OnClick="btnDelete_Click"  CommandArgument='<%# Bind("KartId") %>' CssClass="btn btn-warning width" runat="server" Text="DELETE" /></td>
                                    <td class="buttonClass">
                                        <asp:HiddenField ID="hfID" runat="server" Value='<%# Bind("KartId") %>' />
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hfBookPrice" runat="server" Value='<%# Bind("BookPrice") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>

                        <FooterTemplate>
                            <asp:Label Visible='<%#bool.Parse((dlKart.Items.Count==0).ToString())%>' runat="server" ID="lblNoRecord" CssClass="position180PX" Text="No Record Found!"></asp:Label>
                        </FooterTemplate>
                    </asp:DataList>

        <asp:Panel ID="pnlTotal" Visible='<%# bool.Parse((dlKart.Items.Count==0).ToString())%>' runat="server">
            <div style="position: relative; left: 600px;">
                        
                        <b style="font-size: larger" runat="server">Total Payable : $<asp:Label ID="lblPrice"  runat="server"></asp:Label></b>
                    </div>
        </asp:Panel>
                    
        <br />
        <br />

                
    </div>
    <div class="buttonsDiv">
        <asp:Button ID="btnContinue" CssClass="btn btn-warning" PostBackUrl="~/Home.aspx" runat="server" Text="CONTINUE SHOPPING" />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btnConfrimOrder" CssClass="btn btn-primary" OnClick="btnConfrimOrder_Click" runat="server" Text="BUY NOW" />
    
        <br />
        <br />
    </div>
</asp:Content>
