<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="OnlineBookStore.WebForm5" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Assets/Styles/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <style>
        a 
        {
            text-decoration : none;
        }
        #loginParent
        {
            height : 850px;
        }
        .col-lg-3
        {
            width : 40%;
        }
    </style>
    <div id="wrap">
        <div id="regbar">
            <div id="navthing">
                <h2><a runat="server" href="~/Login.aspx" id="loginform">Login</a> | <a href="~/Register.aspx" runat="server" >Register</a></h2>
                <div id="loginParent">
                    <div>
                        <a runat="server" href="~/Home.aspx"><i class="fa fa-book"></i></a>
                    </div>
                    <div class="login">

                        <div class="formholder">
                            <div class="randompad">
                                <fieldset>
                                    <asp:Label ID="lblFirstName" CssClass="col-lg-3 control-label" runat="server" Text="First Name"></asp:Label>
                                    <asp:TextBox ID="txtFirstName" placeholder="Jack" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvFirstName" ControlToValidate="txtFirstName" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblLastName" CssClass="col-lg-3 control-label" runat="server" Text="Last Name"></asp:Label>
                                    <asp:TextBox ID="txtLastname" placeholder="Jack" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvtxtLastname" ControlToValidate="txtLastname" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblEmail" CssClass="col-lg-3 control-label" runat="server" Text="Email"></asp:Label>
                                    <asp:TextBox ID="txtEmail" placeholder="Jack@gmail.com" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvEmail" ControlToValidate="txtEmail" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblUserId" CssClass="col-lg-3 control-label" runat="server" Text="UserId"></asp:Label>
                                    <asp:TextBox ID="txtUserId" placeholder="Praveen@gmail.com" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUserId" ControlToValidate="txtUserId" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblPassword" CssClass="col-lg-3 control-label" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="************" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblConfirmPassword" CssClass="col-lg-3 control-label" runat="server" Text="Confirm Password"></asp:Label>
                                    <asp:TextBox ID="txtConfirmPassword" TextMode="Password" placeholder="************" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvConfirmPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <asp:CompareValidator ID="cvPassword" ControlToValidate="txtConfirmPassword" ForeColor="Red" ControlToCompare="txtPassword" runat="server" ErrorMessage="Confirm password not matching with password"></asp:CompareValidator>
                                    <br />
                                    <asp:Button ID="btnLogin" CssClass="form-control input-lg" runat="server" Text="Register" OnClick="btnLogin_Click" />

                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>
        <br />
       

    </div>
    
</asp:Content>
