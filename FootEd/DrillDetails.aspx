<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DrillDetails.aspx.cs" Inherits="DrillDetails" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Drill Details</title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2><asp:Literal ID="drillName" runat="server"></asp:Literal></h2>
    <img id="drillImage" runat="server" />
    <p><asp:Literal ID="drillDescription" runat="server"></asp:Literal></p>
    <p><strong>Duration:</strong> <asp:Literal ID="drillDuration" runat="server"></asp:Literal></p>
</asp:Content>
