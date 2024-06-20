<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="post.aspx.cs" Inherits="FootEd.post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <h1 class="mb-4"><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
        <p><asp:Label ID="lblContent" runat="server" CssClass="lead"></asp:Label></p>
        <p><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server"></asp:Label></p>
        <p><strong>Date:</strong> <asp:Label ID="lblDate" runat="server" TextFormatString="{0:dd/MM/yyyy}"></asp:Label></p>

        <h2>Comments</h2>
        <asp:Repeater ID="rptComments" runat="server">
            <ItemTemplate>
                <div class="card mb-3">
                    <div class="card-body">
                        <p><strong><%# Eval("Author") %>:</strong> <%# Eval("Content") %> <em>(<%# Eval("Date") %>)</em></p>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

        <h3>Leave a Comment</h3>
        <div class="form-group">
            <asp:TextBox ID="txtCommentContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Your comment"></asp:TextBox>
        </div>
        <asp:Button ID="btnSubmitComment" runat="server" CssClass="btn btn-primary" Text="Submit" OnClick="btnSubmitComment_Click" />
    </div>
</asp:Content>