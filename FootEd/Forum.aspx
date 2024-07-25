<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="FootEd.forum" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Football Forum</title>
    <style>
        .forum-header {
            background-color: #343a40;
            color: white;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
        .post-form {
            background-color: #f8f9fa;
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }
        .post-card {
            background-color: #ffffff;
            padding: 15px;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
            position: relative;
        }
        .post-card h5 {
            margin-bottom: 10px;
        }
        .post-card .post-content {
            margin-bottom: 10px;
        }
        .post-card .post-footer {
            border-top: 1px solid #e9ecef;
            padding-top: 10px;
        }
        .post-card .delete-btn {
            position: absolute;
            bottom: 10px;
            right: 10px;
        }
        .comment-form {
            margin-top: 20px;
            padding: 15px;
            background-color: #f1f1f1;
            border-radius: 5px;
        }
        .comment-card {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <!-- Add the Label here for displaying messages -->
                <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />

                <div class="post-form">
                    <h2>Create a New Post</h2>
                    <div class="form-group">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Title"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Content"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmitPost" runat="server" CssClass="btn btn-primary btn-block" Text="Submit" OnClick="btnSubmitPost_Click" />
                </div>
            </div>
            <div class="col-md-8">
                <div class="forum-header">
                    <h1 class="mb-4">Football Forum</h1>
                </div>
                <div class="posts-container">
                    <asp:Repeater ID="rptPosts" runat="server" OnItemDataBound="rptPosts_ItemDataBound">
                        <ItemTemplate>
                            <div class="post-card">
                                <h5><%# Eval("Title") %></h5>
                                <div class="post-content"><%# Eval("Content") %></div>
                                <div class="post-footer">
                                    <small class="text-muted">By <%# Eval("Author") %> on <%# Eval("Date", "{0:yyyy-MM-dd HH:mm:ss}") %></small>
                                    <asp:HyperLink ID="lnkViewComments" runat="server" NavigateUrl='<%# "comments.aspx?postId=" + Eval("PostId") %>' Text="View Comments" />
                                    <asp:Button ID="btnDeletePost" runat="server" CssClass="btn btn-danger btn-sm delete-btn" Text="Delete" CommandName="DeletePost" CommandArgument='<%# Eval("PostId") %>' OnClick="btnDeletePost_Click" />
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
