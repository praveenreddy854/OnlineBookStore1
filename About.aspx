<%@ Page Title="" Language="C#" MasterPageFile="~/CustomerMasterPage.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="OnlineBookStore.About" %>
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
    <div class="panel panel-default">
        <div class="panel-heading">
            <h4>
                ABOUT US
            </h4>
        </div>
        <div class="panel-body">
            <h4>
                WHO WE ARE
                
            </h4>
            <hr style="position :relative; top: -10px;" />
            <hr style="position :relative; top: -25px;" />
            <p style="position :relative; top: -20px;" >Online Book store is an online web application where the customer can purchase books online. 
            Through a web browser the customers can search for a book by its title or author, 
            later can add to the shopping cart and finally purchase using credit card transaction. 
            The user can login using his account details or new customers can set up an account very quickly. 
            They should give the details of their name, contact number and shipping address. 
            The books are divided into many categories based on subject Like History, Science, Maths and Travel etc.</p>

            <h4>
                WHAT WE DO
                
            </h4>
            <hr style="position :relative; top: -10px;" />
            <hr style="position :relative; top: -25px;" />
            <p style="position :relative; top: -20px;" >Online Book store is an online web application where the customer can purchase books online. 
            Through a web browser the customers can search for a book by its title or author, 
            later can add to the shopping cart and finally purchase using credit card transaction. 
            The user can login using his account details or new customers can set up an account very quickly. 
            They should give the details of their name, contact number and shipping address. 
            The books are divided into many categories based on subject Like History, Science, Maths and Travel etc.</p>
        </div>
    </div>
</asp:Content>
