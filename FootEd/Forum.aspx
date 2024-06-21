<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="FootEd.forum" %>



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
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <div class="post-form">
                    <h2>Create a New Post</h2>
                    <div class="form-group">
                        <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Title"></asp:TextBox>
                    </div>
                    <div class="form-group">
                        <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Content"></asp:TextBox>
                    </div>
                    <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary btn-block" Text="Submit"  />
                </div>
            </div>
            <div class="col-md-8">
                <div class="forum-header">
                    <h1 class="mb-4">Football Forum</h1>
                </div>
                <div class="posts-container">
                    <asp:Repeater ID="rptPosts" runat="server">
                        <ItemTemplate>
                            <div class="post-card">
                                <h5><%# Eval("Title") %></h5>
                                <div class="post-content"><%# Eval("Content") %></div>
                                <div class="post-footer">
                                    <small class="text-muted">By <%# Eval("Author") %> on <%# Eval("Date", "{0:yyyy-MM-dd HH:mm:ss}") %></small>
                                    <div class="text-right">
                                        <asp:Button ID="btnView" runat="server" CssClass="btn btn-link" Text="View" CommandName="Select" CommandArgument='<%# Eval("PostId") %>'  />
                                    </div>
                                </div>
                            </div>
                        </ItemTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
</asp:Content>