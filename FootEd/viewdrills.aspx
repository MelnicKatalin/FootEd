<%@ Page Language="C#" AutoEventWireup="true" CodeFile="viewdrills.aspx.cs" Inherits="FootEd.viewdrills" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">

            <div class="col-sm-12">
                <center>
                    <h3>Drills List</h3>
                </center>
                <div class="row">
                    <div class="col-sm-12 col-md-12">
                        <asp:Panel class="alert alert-success" role="alert" ID="Panel1" runat="server" Visible="False">
                            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                        </asp:Panel>
                    </div>
                </div>
                <br />
                <div class="row">
                    <div class="card">
                        <div class="card-body">

                            <div class="row">
                                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FootEdDBConnectionString3 %>" SelectCommand="SELECT * FROM [drill_master_tbl]"></asp:SqlDataSource>
                                <div class="col">
                                    <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="drill_id" DataSourceID="SqlDataSource1">
                                        <Columns>
                                            <asp:BoundField DataField="drill_id" HeaderText="ID" ReadOnly="True" SortExpression="drill_id">
                                                <ControlStyle Font-Bold="True" />
                                                <ItemStyle Font-Bold="True" />
                                            </asp:BoundField>
                                            <asp:TemplateField>
                                                <ItemTemplate>
                                                    <div class="container-fluid">
                                                        <div class="row">
                                                            <div class="col-lg-10">
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("drill_name") %>' Font-Bold="True" Font-Size="X-Large"></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Explanation -
                                 <asp:Label ID="Label12" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("explanation") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                                <div class="row">
                                                                    <div class="col-12">
                                                                        Organization -
                                 <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Italic="True" Font-Size="Smaller" Text='<%# Eval("organization") %>'></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                            <div class="col-lg-2">
                                                                <asp:Image class="img-fluid" ID="Image1" runat="server" ImageUrl='<%# Eval("drill_img_link") %>' />
                                                            </div>
                                                            <div class="input-group">
                                                                <asp:Button class="btn btn-primary" ID="Button1" runat="server" Text="More Details" CommandArgument='<%# Eval("drill_id") %>' OnClick="Button1_Click"></asp:Button>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                        </Columns>
                                    </asp:GridView>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
             <div class="row mt-4">
                 <div class="col-sm-12 text-center">
                     <a href="homepage.aspx" class="btn btn-primary">&laquo; Back to HomePage</a>
                 </div>
             </div>
        </div>
    </div>
</asp:Content>
