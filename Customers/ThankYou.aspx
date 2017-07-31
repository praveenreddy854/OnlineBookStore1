<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="ThankYou.aspx.cs" Inherits="OnlineBookStore.Customers.ThankYou" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
    .position180PX
    {
        position :relative;
        left : 300px;
    }
    .position480PX
    {
        position :relative;
        left : 400px;
    }
</style>
    <div class="pnl panel-default position180PX">
       
        <div class="panel-body">
            <h1>Thank you for your order
            </h1>
            <h2>Your order number is : <asp:label id="lblOrderId" runat="server" text="Label"></asp:label>
            </h2>
            <h5>You will receive an email shortly for the order you placed. For any queries please contact customer care for contact tab.
            </h5>
            <div id="position480PX">
                <asp:Button ID="btnContinue" CssClass="btn btn-warning" PostBackUrl="~/Home.aspx"  runat="server" Text="CONTINUE SHOPPING" />
            </div>
        </div>

    </div>

</asp:Content>
