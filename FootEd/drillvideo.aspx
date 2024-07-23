<%@ Page Language="C#" AutoEventWireup="true" CodeFile="drillvideo.aspx.cs" Inherits="FootEd.drillvideo" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-12 text-center">

                <hr />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FootEdDBConnectionString3 %>" SelectCommand="SELECT drill_vid_link FROM [drill_master_tbl] WHERE [drill_id] = @drill_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="drill_id" QueryStringField="drill_id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
            <ItemTemplate>
                <div class="row">
                    <div class="col-12">
                        <center>
                            <video width="70%" height="auto" controls>
                                <source src='<%# ResolveUrl(Eval("drill_vid_link").ToString()) %>' type="video/mp4">
                                Your browser does not support the video tag.
                            </video>
                        </center>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
        <div class="row mt-4">
            <div class="col-sm-12 text-center">
                <a href="drilldetails.aspx?drill_id=<%# Eval("drill_id") %>" class="btn btn-primary">&laquo; Back to Drill Details</a>
            </div>
        </div>
    </div>
</asp:Content>
