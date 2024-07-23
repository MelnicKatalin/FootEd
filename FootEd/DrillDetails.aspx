<%@ Page Language="C#" AutoEventWireup="true" CodeFile="drilldetails.aspx.cs" Inherits="FootEd.drilldetails" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .details-label {
            font-weight: bold;
            margin-top: 10px;
        }
        .details-content {
            margin-bottom: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container mt-4">
        <div class="row">
            <div class="col-sm-12 text-center">
                <h3>Drill Details</h3>
                <hr />
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FootEdDBConnectionString3 %>" SelectCommand="SELECT * FROM [drill_master_tbl] WHERE [drill_id] = @drill_id">
            <SelectParameters>
                <asp:QueryStringParameter Name="drill_id" QueryStringField="drill_id" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
        <div class="card mb-4">
            <div class="card-body">
                <asp:Repeater ID="Repeater1" runat="server" DataSourceID="SqlDataSource1">
                    <ItemTemplate>
                        <div class="row">
                            <div class="col-12">
                                <div class="details-label">Drill Name</div>
                                <div class="details-content"><%# Eval("drill_name") %></div>
                            </div>
                            <div class="col-12">
                                <div class="details-label">Explanation</div>
                                <div class="details-content"><%# Eval("explanation") %></div>
                            </div>
                            <div class="col-12">
                                <div class="details-label">Organization</div>
                                <div class="details-content"><%# Eval("organization") %></div>
                            </div>
                            <div class="col-12">
                                <div class="details-label">Coaching Points</div>
                                <div class="details-content"><%# Eval("coaching_points") %></div>
                            </div>
                            <div class="col-12">
                                <div class="details-label">Variations</div>
                                <div class="details-content"><%# Eval("variations") %></div>
                            </div>
                            <div class="col-12 text-center mt-4">
                                <center>
                                    <asp:Button ID="btnViewVideo" runat="server" Text="View Full Video" PostBackUrl='<%# "drillvideo.aspx?drill_id=" + Eval("drill_id") %>' CssClass="btn btn-primary" />
                                </center>
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="row mt-4">
            <div class="col-sm-12 text-center">
                <a href="viewdrills.aspx" class="btn btn-primary">&laquo; Back to Drills List</a>
            </div>
        </div>
    </div>
</asp:Content>
