<%@ Page Title="" Language="C#" EnableEventValidation="false"  MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="OnlineBookStore.Customers.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="../Assets/Styles/bootstrap/js/bootstrap.js"></script>
    <script src="../Assets/Scripts/jquery-3.1.1.js"></script>
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
            width: 33.5%;
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
                width: 300px !important;
            }

        .width {
            width: 100px !important;
        }

        td {
            padding-right: 60px;
            padding-bottom: 5px;
        }
    </style>
    <script>
        $(function () {
            $('#paymentHeader').click(function () {
                if ($('#ipaymentHeader').hasClass('fa-plus-circle')) {
                    $('#ipaymentHeader').removeClass('fa-plus-circle');
                    $('#ipaymentHeader').addClass('fa-minus-circle');
                }

                else {
                    $('#ipaymentHeader').removeClass('fa-minus-circle');
                    $('#ipaymentHeader').addClass('fa-plus-circle');
                }


            });

            $('#shippingtHeader').click(function () {
                if ($('#ishippingtHeader').hasClass('fa-plus-circle')) {
                    $('#ishippingtHeader').removeClass('fa-plus-circle');
                    $('#ishippingtHeader').addClass('fa-minus-circle');
                }

                else {
                    $('#ishippingtHeader').removeClass('fa-minus-circle');
                    $('#ishippingtHeader').addClass('fa-plus-circle');
                }


            });

            $('#orderHeader').click(function () {
                if ($('#iorderHeader').hasClass('fa-plus-circle')) {
                    $('#iorderHeader').removeClass('fa-plus-circle');
                    $('#iorderHeader').addClass('fa-minus-circle');
                }

                else {
                    $('#iorderHeader').removeClass('fa-minus-circle');
                    $('#iorderHeader').addClass('fa-plus-circle');
                }


            });

        });

    </script>
    <div class="panel panel-default">
        <div class="panel-heading">

            <a href="#paymentBody" id="paymentHeader" data-toggle="collapse"><i id="ipaymentHeader" class="fa fa-minus-circle" aria-hidden="true"></i></a><b>PAYMENT METHOD</b>

        </div>
        <br />
        <div class="panel-body collapse in" id="paymentBody">
            <div class="container-fluid">

                <div class="well">


                    <table>
                        <tr>
                            <td class="auto-style1">Card Type
                            </td>
                            <td>
                                <asp:RadioButton ID="rblVisa" Checked="true" GroupName="cardType" runat="server" /><asp:Image Width="50px" Height="50px" ImageUrl="~/Images/visa.png" runat="server"></asp:Image>
                                <asp:RadioButton ID="rblAmericanExp" GroupName="cardType" runat="server" /><asp:Image Width="40px" Height="25px" ImageUrl="~/Images/AmericanExpress.jpg" runat="server"></asp:Image>
                                <asp:RadioButton ID="rblDiscover" GroupName="cardType" runat="server" /><asp:Image Width="40px" Height="25px" ImageUrl="~/Images/Discover.jpg" runat="server"></asp:Image>
                                <asp:RadioButton ID="rblMaster" GroupName="cardType" runat="server" /><asp:Image Width="40px" Height="30px" ImageUrl="~/Images/Master.png" runat="server"></asp:Image>
                                
                                <br />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Card Number
                            </td>
                            <td>
                                <asp:TextBox ID="txtCardNum" CssClass="form-control cardNumber" placeholder="4444444444444444" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" ForeColor="Red" ControlToValidate="txtCardNum" runat="server" ErrorMessage="Please enter card number"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" ForeColor="Red" ControlToValidate="txtCardNum" runat="server" ValidationExpression="\d{16}" ErrorMessage="Please enter 16 digit card number"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">CVV
                            </td>
                            <td>
                                <asp:TextBox ID="txtCVV" CssClass="form-control cardNumber" placeholder="123" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" ForeColor="Red" ControlToValidate="txtCVV" runat="server" ErrorMessage="Please enter CVV"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" ForeColor="Red" ControlToValidate="txtCVV" runat="server" ValidationExpression="\d{3}" ErrorMessage="Please enter 3 digit CVV"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Expiry Date
                            </td>
                            <td>
                                <asp:DropDownList CssClass="selectpicker form-control selectPickerExp show-tick" ID="ddlMonth" runat="server">
                                    <asp:ListItem>Select Month</asp:ListItem>
                                    <asp:ListItem>1</asp:ListItem>
                                    <asp:ListItem>2</asp:ListItem>
                                    <asp:ListItem>3</asp:ListItem>
                                    <asp:ListItem>4</asp:ListItem>
                                    <asp:ListItem>5</asp:ListItem>
                                    <asp:ListItem>6</asp:ListItem>
                                    <asp:ListItem>7</asp:ListItem>
                                    <asp:ListItem>8</asp:ListItem>
                                    <asp:ListItem>9</asp:ListItem>
                                    <asp:ListItem>10</asp:ListItem>
                                    <asp:ListItem>11</asp:ListItem>
                                    <asp:ListItem>12</asp:ListItem>
                                </asp:DropDownList>
                                
                                <asp:DropDownList CssClass="selectpicker  form-control selectPickerExp" ID="ddlYear" runat="server">
                                    <asp:ListItem Value="0">Select Year</asp:ListItem>
                                    <asp:ListItem>2017</asp:ListItem>
                                    <asp:ListItem>2018</asp:ListItem>
                                    <asp:ListItem>2019</asp:ListItem>
                                    <asp:ListItem>2020</asp:ListItem>
                                    <asp:ListItem>2021</asp:ListItem>
                                    <asp:ListItem>2022</asp:ListItem>
                                    <asp:ListItem>2023</asp:ListItem>
                                    <asp:ListItem>2024</asp:ListItem>
                                    <asp:ListItem>2025</asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="Red" ControlToValidate="ddlMonth" InitialValue="Select Month" runat="server" ErrorMessage="Please select expiry month"></asp:RequiredFieldValidator>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" ForeColor="Red" ControlToValidate="ddlYear" InitialValue="Select Year" runat="server" ErrorMessage="Please select expiry year"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                    </table>

                    <div>
                    </div>





                </div>
            </div>
        </div>
    </div>

    <div class="panel panel-default">
        <div class="panel-heading">

            <a href="#shippingtBody" id="shippingtHeader" data-toggle="collapse"><i id="ishippingtHeader" class="fa fa-minus-circle" aria-hidden="true"></i></a><b>SHIPPING ADDRESS</b>

        </div>
        <br />
        <div class="panel-body collapse in" id="shippingtBody">
            <div class="container-fluid">

                <div class="well">


                    <table>
                        <tr>
                            <td class="auto-style1">First Name 
                            </td>
                            <td>
                                <asp:TextBox ID="txtName" CssClass="form-control cardNumber" placeholder="John" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" ControlToValidate="txtName" ForeColor="Red" runat="server" ErrorMessage="Please enter first name"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Last Name 
                            </td>
                            <td>
                                <asp:TextBox ID="txtLastName" CssClass="form-control cardNumber" placeholder="Michael" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" ControlToValidate="txtLastName" ForeColor="Red" runat="server" ErrorMessage="Please enter last name"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Email 
                            </td>
                            <td>
                                <asp:TextBox ID="txtEmail" CssClass="form-control cardNumber" placeholder="John@gmail.com" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" ControlToValidate="txtEmail" ForeColor="Red" runat="server" ErrorMessage="Please enter email"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Address 1 
                            </td>
                            <td>
                                <asp:TextBox ID="txtAdress1" CssClass="form-control cardNumber" placeholder="312 Ming street" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" ControlToValidate="txtAdress1" ForeColor="Red" runat="server" ErrorMessage="Please enter address1"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Address2 
                            </td>
                            <td>
                                <asp:TextBox ID="txtAdress2" CssClass="form-control cardNumber" placeholder="Apt c" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">City 
                            </td>
                            <td>
                                <asp:TextBox ID="txtCity" CssClass="form-control cardNumber" placeholder="New York" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" ControlToValidate="txtCity" ForeColor="Red" runat="server" ErrorMessage="Please enter city"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">City 
                            </td>
                            <td>
                                <asp:TextBox ID="txtState" CssClass="form-control cardNumber" placeholder="New York" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" ControlToValidate="txtState" ForeColor="Red" runat="server" ErrorMessage="Please enter state"></asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Zip 
                            </td>
                            <td>
                                <asp:TextBox ID="txtZip" CssClass="form-control cardNumber" placeholder="660235" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" ControlToValidate="txtZip" ForeColor="Red" runat="server" ErrorMessage="Please enter zip"></asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtZip" ValidationExpression="\d{5,7}" ErrorMessage="Please enter valid zip"></asp:RegularExpressionValidator>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1">Phone 
                            </td>
                            <td>
                                <asp:TextBox ID="txtPhone" CssClass="form-control cardNumber" placeholder="6602385718" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" ControlToValidate="txtPhone" ForeColor="Red" runat="server" ErrorMessage="Please enter phone"></asp:RequiredFieldValidator>
                                
                            </td>
                        </tr>
                    </table>

                </div>
            </div>

        </div>
    </div>


    <div class="panel panel-default">
        <div class="panel-heading">

            <a href="#orderSummary" id="orderHeader" data-toggle="collapse"><i id="iorderHeader" class="fa fa-minus-circle" aria-hidden="true"></i></a><b>ORDER SUMMARY</b>

        </div>
        <br />
        <div class="panel-body collapse in" id="orderSummary">
            <div class="container-fluid">

                <div class="well">
                    

                    <asp:DataList ID="dlOrders" runat="server">
                        <HeaderTemplate>
                            <table class="nav-justified">
                                <tr>
                                    <th style="">ITEM 
                                    </th>
                                    <th>QUANTITY
                                    </th>
                                    <th>SUB TOTAL
                                    </th>
                                    <th></th>
                                    <th></th>
                                </tr>
                            </table>

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
                                                    
                                                   $<asp:Label ID="lblSubTot" runat="server" Text='<%# Bind("ItemTotal") %>'></asp:Label>

                                                </td>
                                           
                                        <td>
                                            
                                            <asp:Button ID="btnSave" CausesValidation="false" OnClick="btnSave_Click" CommandArgument='<%# Bind("OrderByItemID") %>' CssClass="btn btn-primary width" runat="server" Text="SAVE" /></td>
                                        <td>
                                            <asp:Button ID="btnDelete" CausesValidation="false" OnClick="btnDelete_Click" CommandArgument='<%# Bind("OrderByItemID") %>' CssClass="btn btn-warning width" runat="server" Text="DELETE" /></td>
                                    <td>
                                        <asp:HiddenField ID="hfID" runat="server" Value='<%# Bind("OrderByItemID") %>' />
                                    </td>
                                    <td>
                                        <asp:HiddenField ID="hfBookPrice" runat="server" Value='<%# Bind("BookPrice") %>' />
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>

                    </asp:DataList>


                    <div style="position: relative; left: 600px;">
                        
                        <b style="font-size: larger">Total Payable : $<asp:Label ID="lblPrice" runat="server"></asp:Label></b>
                    </div>
                </div>
            </div>

        </div>
    </div>


    <div class="buttonsDiv">
        <asp:Button ID="btnConfrimOrder" CssClass="btn btn-primary" OnClick="btnConfrimOrder_Click" runat="server" Text="CONFIRM ORDER" />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="btnContinue" CssClass="btn btn-warning" OnClick="btnContinue_Click" runat="server" Text="CONTINUE SHOPPING" />
        <br />
        <br />
    </div>

</asp:Content>
