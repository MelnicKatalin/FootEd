<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="post.aspx.cs" Inherits="FootEd.post" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1><asp:Label ID="lblTitle" runat="server"></asp:Label></h1>
    <p><asp:Label ID="lblContent" runat="server"></asp:Label></p>
    <p><strong>Author:</strong> <asp:Label ID="lblAuthor" runat="server"></asp:Label></p>
    <p><strong>Date:</strong> <asp:Label ID="lblDate" runat="server"></asp:Label></p>

    <h2>Comments</h2>
    <asp:Repeater ID="rptComments" runat="server">
        <ItemTemplate>
            <p><strong><%# Eval("Author") %>:</strong> <%# Eval("Content") %> <em>(<%# Eval("Date") %>)</em></p>
        </ItemTemplate>
    </asp:Repeater>

    <h3>Leave a comment</h3>
    <asp:TextBox ID="txtCommentContent" runat="server" TextMode="MultiLine" Rows="3" Placeholder="Your comment"></asp:TextBox><br />
    <asp:Button ID="btnSubmitComment" runat="server" Text="Submit"  />
</asp:Content>
