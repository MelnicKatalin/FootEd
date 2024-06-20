<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="FootEd.forum" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Football Forum</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-5">
        <div class="row">
            <div class="col-md-4">
                <h2>Create a New Post</h2>
                <div class="form-group">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="form-control" Placeholder="Title"></asp:TextBox>
                </div>
                <div class="form-group">
                    <asp:TextBox ID="txtContent" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="5" Placeholder="Content"></asp:TextBox>
                </div>
                <asp:Button ID="btnSubmit" runat="server" CssClass="btn btn-primary" Text="Submit"  />
            </div>
            <div class="col-md-8">
                
                <asp:GridView ID="gvPosts" runat="server" CssClass="table table-striped" AutoGenerateColumns="False" DataKeyNames="PostId">
                    <Columns>
                        <asp:BoundField DataField="Title" HeaderText="Title" />
                        <asp:BoundField DataField="Author" HeaderText="Author" />
                        <asp:BoundField DataField="Date" HeaderText="Date" DataFormatString="{0:dd/MM/yyyy}" />
                        <asp:ButtonField Text="View" CommandName="Select"  buttontype="button" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>