<%@ Page Title="Forum" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Forum.aspx.cs" Inherits="FootEd.Forum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .container {
            width: 60%;
            margin: 0 auto;
            text-align: center;
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .post-box {
            border: 1px solid #ccc;
            padding: 10px;
            margin-top: 10px;
            text-align: left;
        }
        .comment-box {
            margin-top: 10px;
        }
        .create-post {
            margin-top: 20px;
        }
        .create-post-container {
            display: flex;
            justify-content: center;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="header">
            <h2>Posts</h2>
        </div>
        <asp:Repeater ID="PostsRepeater" runat="server">
            <ItemTemplate>
                <div class="post-box">
                    <div>
                        <strong><%# DataBinder.Eval(Container.DataItem, "Username") %></strong>
                        <span style="float:right"><%# DataBinder.Eval(Container.DataItem, "Likes") %> <img src="like.png" alt="Like" /></span>
                    </div>
                    <p><%# DataBinder.Eval(Container.DataItem, "Content") %></p>
                    <a href="#">View <%# DataBinder.Eval(Container.DataItem, "CommentCount") %> comments</a>
                    <div class="comment-box">
                        <asp:TextBox ID="CommentTextBox" runat="server" CssClass="comment-textbox" Placeholder="Comment something!!"></asp:TextBox>
                        <asp:Button ID="CommentButton" runat="server" Text="Comment" CssClass="comment-button" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "PostID") %>' OnClick="CommentButton_Click" />
                    </div>
                    <div class="post-date">
                        <%# DataBinder.Eval(Container.DataItem, "PostDate") %>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="create-post-container">
            <asp:Button ID="CreatePostButton" runat="server" Text="Create a Post" CssClass="create-post" OnClick="CreatePostButton_Click" />
        </div>
    </div>
</asp:Content>
