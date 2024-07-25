<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="comments.aspx.cs" Inherits="FootEd.comments" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Post Comments</title>
    <style>
        .comment-card {
            background-color: #f9f9f9;
            padding: 10px;
            border-radius: 5px;
            margin-top: 10px;
            box-shadow: 0 1px 2px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .comment-card .delete-btn {
            position: absolute;
            bottom: 10px;
            right: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-12">
                <div class="forum-header">
                    <h1 class="mb-4">Comments</h1>
                </div>
                <div class="comments-container">
                    <asp:Repeater ID="rptComments" runat="server" OnItemDataBound="rptComments_ItemDataBound">
                        <ItemTemplate>
                            <div class="comment-card">
                                <small class="text-muted"><%# Eval("Author") %> on <%# Eval("Date", "{0:yyyy-MM-dd HH:mm:ss}") %></small>
                                <p><%# Eval("Content") %></p>
                                <asp:Button ID="btnDeleteComment" runat="server" CssClass="btn btn-danger btn-sm delete-btn" Text="Delete" CommandName="DeleteComment" CommandArgument='<%# Eval("CommentId") %>' OnClick="btnDeleteComment_Click" />
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
                <div class="comment-form mt-4">
                    <h2>Add a Comment</h2>
                    <div class="form-group">
                        <asp:TextBox ID="txtCommentContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="3" Placeholder="Add a comment"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmitComment" runat="server" CssClass="btn btn-secondary" Text="Submit" OnClick="btnSubmitComment_Click" />
                </div>
            </div>
        </div>
    </div>
</asp:Content>
