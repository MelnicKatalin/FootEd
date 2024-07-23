<%@ Page Language="C#" AutoEventWireup="true" CodeFile="drillvideo.aspx.cs" Inherits="FootEd.drillvideo" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FootEdDBConnectionString4 %>" SelectCommand="SELECT drill_vid_link FROM [drill_master_tbl] WHERE [drill_id] = @drill_id">
            <selectparameters>
                <asp:QueryStringParameter Name="drill_id" QueryStringField="drill_id" Type="String" />
            </selectparameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <itemtemplate>
                <center>
                    <video width="70%" height="auto" controls>
                        <source src='<%# ResolveUrl(Eval("drill_vid_link").ToString()) %>' type="video/mp4">
                        Your browser does not support the video tag.
                    </video>
                </center>
            </itemtemplate>
        </asp:Repeater>
        <div class="row mt-4">
            <div class="col-12 text-center mt-4">
                <center>
                    <asp:Button ID="btnViewVideo" runat="server" Text="View Details" PostBackUrl='<%# "drilldetails.aspx?drill_id=" + Eval("drill_id") %>' CssClass="btn btn-primary" />
                </center>
            </div>
        </div>
    </div>
</asp:Content>
