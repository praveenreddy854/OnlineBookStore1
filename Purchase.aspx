<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Purchase.aspx.cs" Inherits="OnlineBookStore.WebForm3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .purchaseRightDiv
        {
            position :relative;
            top : -580px;
            left : 500px;
        }
        .purchaseLeftDiv
        {
            position :relative;
            top : 0px;
            left : 20px;
        }
        .buttonDiv
        {
            position :relative;
            left : 20px;
        }
    </style>
    <asp:DataList ID="dlBook" runat="server">
        <ItemTemplate>
            <table class="position80PX" >
                <tr>
                    <td>
                        <div class="purchaseLeftDiv">
                            <asp:Image ID="imgBook" runat="server" Height="500px" ImageUrl='<%# Eval("BookURL") %>' Width="400px" />
                        </div>
                        <br />
                        <br />
                       <div class="buttonDiv">
                             
                            <button runat="server" id="btnAddToKart" onserverclick="btnAddToKart_Click" class="btn btn-warning" ><i class="fa fa-shopping-cart" aria-hidden="true"> ADD TO CART</i></button>&nbsp;&nbsp;
                            <button runat="server" id="btnBuyNow" onserverclick="btnBuyNow_Click" class="btn btn-primary" ><i class="fa fa-bolt" aria-hidden="true"> BUY NOW</i></button>
                            
                        </div>
                    
                        <div class="purchaseRightDiv">
                            <asp:Label ID="lblName" CssClass="purchaseLabelHeaders" runat="server" Text='<%# Eval("BookName") %>'></asp:Label>
                            <br />
                            <br />
                            <b class="purchaseLabelHeaders">$</b><asp:Label ID="lblPrice" CssClass="purchaseLabelHeaders" runat="server" Text='<%# Eval("Price") %>'></asp:Label>
                            <br />
                            <br />
                            <b class="purchaseLabelHeaders">Description</b><br />
                            <asp:Label ID="lblDesc" runat="server" Text='<%# Eval("BookDescription") %>'></asp:Label>
                        </div>
                    </td>
                </tr>

                
                
            </table>


        </ItemTemplate>

    </asp:DataList>

</asp:Content>
