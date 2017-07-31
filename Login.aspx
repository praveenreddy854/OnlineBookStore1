<%@ Page Title="" Language="C#" MasterPageFile="~/LoginMaster.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="OnlineBookStore.WebForm4" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <link href="Assets/Styles/bootstrap/css/bootstrap.css" rel="stylesheet" />
    <div id="wrap">
        <div id="regbar">
            <div id="navthing">
                <h2><a runat="server" href="~/Login.aspx" id="loginform">Login</a> | <a runat="server" href="~/Register.aspx">Register</a></h2>
                <div id="loginParent">
                    <div>
                        <a runat="server" href="~/Home.aspx"><i class="fa fa-book"></i></a>
                    </div>
                    <div class="login">

                        <div class="formholder">
                            <div class="randompad">
                                <fieldset>

                                    <asp:Label ID="lblUserId" CssClass="col-lg-3 control-label" runat="server" Text="UserId"></asp:Label>
                                    <asp:TextBox ID="txtUserId" placeholder="Praveen@gmail.com" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvUserId" ControlToValidate="txtUserId" runat="server" ForeColor="Red" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblPassword" CssClass="col-lg-3 control-label" runat="server" Text="Password"></asp:Label>
                                    <asp:TextBox ID="txtPassword" TextMode="Password" placeholder="************" CssClass="form-control input-lg" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="rfvPassword" ControlToValidate="txtPassword" ForeColor="Red" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
                                    <br />
                                    <asp:Label ID="lblMessage" runat="server" ></asp:Label>
                                    <br />
                                    <asp:Button ID="btnLogin" OnClick="btnLogin_Click" CssClass="form-control input-lg" runat="server" Text="Login" />

                                </fieldset>
                            </div>
                        </div>
                    </div>
                </div>


            </div>
        </div>


    </div>

</asp:Content>
