<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMaster.Master" AutoEventWireup="true" CodeBehind="AddBook.aspx.cs" Inherits="OnlineBookStore.Admin.AddBook" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .width400px {
            width: 400px !important;
        }
        #container{
            position :relative !important;
            top : -120px !important;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div class="container" id="container">
        <div class="row">
            <div class="col-md-5">
            </div>
            <div class="col-md-3">
                <h4 class="purchaseLabelHeaders">Add a Book</h4>
            </div>
        </div>
        <div class="row">
            <div class="col-md-3">
            </div>
            <div class="col-md-2 form-group">
                <br />

                <asp:Label ID="lblCategory" CssClass="control-label" runat="server" Text="Category"></asp:Label><br />
                <br />
                <br />
                <asp:Label ID="lblBookName" CssClass="control-label" runat="server" Text="Book Name"></asp:Label><br />
                <br />
                <br />
                <asp:Label ID="lblAuthor" CssClass="control-label" runat="server" Text="Author Name"></asp:Label><br />
                <br />
                
                <asp:Label ID="lblFileUpload" CssClass="control-label" runat="server" Text="Upload Image"></asp:Label><br />
                <br />
                <br />
                
                <asp:Label ID="lblPrice" CssClass="control-label" runat="server" Text="Price"></asp:Label>
                <br />
                <br />
                <br />
                <br />
                <br />
                
                <br />
                <br />
                <asp:Label ID="lblDescription" CssClass="control-label" runat="server" Text="Description"></asp:Label><br />
                <br />

            </div>


            <div class="col-md-6">
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                    <ContentTemplate>
                        <asp:RadioButton ID="rblNewCategory" Checked="true" GroupName="category" OnCheckedChanged="rblNewCategory_CheckedChanged" AutoPostBack="true" runat="server" />New Category
                        <asp:RadioButton ID="rblExistingCategory" OnCheckedChanged="rblExistingCategory_CheckedChanged" AutoPostBack="true" GroupName="category" runat="server" />Existing Category
                         <br />
                        <asp:TextBox ID="txtNewCategory" CssClass="form-control width400px" placeholder="Drama" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlExistingCategory" CssClass="form-control width400px" runat="server"></asp:DropDownList>
                        <br />
                    </ContentTemplate>
                </asp:UpdatePanel>

                <asp:TextBox ID="txtBookName" placeholder="Wings of Fire" CssClass="form-control width400px" runat="server"></asp:TextBox>
                <br />
                <asp:TextBox ID="txtAuthorName" placeholder="Abdul Kalam" CssClass="form-control width400px" runat="server"></asp:TextBox>
                <br />
                <asp:FileUpload ID="imageUpload"  CssClass="form-control width400px" runat="server" /><br />
                <asp:TextBox ID="txtPrice" placeholder="49.99" CssClass="form-control width400px" runat="server"></asp:TextBox>
                <br />

                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control auto-style1" Height="170px" Width="633px"></asp:TextBox>
                <ajaxToolkit:HtmlEditorExtender ID="HtmlEditorExtender1" TargetControlID="txtDescription" runat="server"></ajaxToolkit:HtmlEditorExtender>
                <br />
                <br />
                
                <asp:Button ID="btnAddBook" CssClass="btn btn-primary" runat="server" Text="ADD BOOK" OnClick="btnAddBook_Click" />

            </div>


        </div>
    </div>



</asp:Content>

<asp:Content ID="Content2" runat="server" ContentPlaceHolderID="head">
    <style type="text/css">
        .auto-style1 {
            margin-left: 231px;
        }
    </style>
</asp:Content>


