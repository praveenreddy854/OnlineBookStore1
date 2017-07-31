<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="OnlineBookStore.Contact" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <style>
        .width400px {
            width: 400px !important;
        }
        #container{
            position :relative !important;
            top : -120px !important;
            left : 400px;
            
        }
        .purchaseLabelHeaders
        {
            position :relative !important;
            left : -50px !important;
        }
        .form-control1
        {
            position :relative;
            left : 100px !important;
        }
        .btn1
        {
            position :relative;
            left : 200px !important;
        }
    </style>
    
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-5">
            </div>
            <div class="col-md-3">
                <h4 class="purchaseLabelHeaders">CONTACT</h4>
            </div>
            <br />
        </div>
        <div class="row">
            
            <div class="col-md-6">
               

                <asp:TextBox ID="txtName" placeholder="Your Name" CssClass="form-control width400px form-control1" runat="server">

                </asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                <asp:TextBox ID="txtEmail" placeholder="Your email address" CssClass="form-control width400px form-control1" runat="server">

                </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtEmail" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                <br />
                
                <asp:TextBox ID="txtDescription" placeholder="Messabge" runat="server" CssClass="form-control form-control1" Height="170px" Width="633px">

                </asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="txtDescription" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" TargetControlID="txtDescription" runat="server"></ajaxToolkit:HtmlEditorExtender>
                <br />
                <br />
                
                <asp:Button ID="btnSendMessage" CssClass="btn btn-primary btn1" OnClick="btnSendMessage_Click" runat="server" Text="SEND MESSAGE" />
                <asp:Label ID="lblMessage" runat="server" ></asp:Label>

            </div>


        </div>
    </div>

</asp:Content>
