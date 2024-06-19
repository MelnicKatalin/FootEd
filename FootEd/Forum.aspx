<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="forum.aspx.cs" Inherits="FootEd.forum" %>



<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Football Forum</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>Football Forum</h1>
    <asp:GridView ID="gvPosts" runat="server" AutoGenerateColumns="False" DataKeyNames="PostId" >
        <Columns>
            <asp:BoundField DataField="Title" HeaderText="Title" />
            <asp:BoundField DataField="Author" HeaderText="Author" />
            <asp:BoundField DataField="Date" HeaderText="Date" />
            <asp:ButtonField Text="View" CommandName="Select" />
        </Columns>
    </asp:GridView>

    <h2>Create a new post</h2>
    <asp:TextBox ID="txtTitle" runat="server" Placeholder="Title"></asp:TextBox><br />
    <asp:TextBox ID="txtContent" runat="server" TextMode="MultiLine" Rows="5" Placeholder="Content"></asp:TextBox><br />
    <asp:Button ID="btnSubmit" runat="server" Text="Submit"  />
</asp:Content>
