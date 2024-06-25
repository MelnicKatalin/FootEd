﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admindrills.aspx.cs" Inherits="FootEd.admindrills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script type="text/javascript">
       $(document).ready(function () {
           $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
       });

       function readURL(input) {
           if (input.files && input.files[0]) {
               var reader = new FileReader();

               reader.onload = function (e) {
                   $('#imgview').attr('src', e.target.result);
               };

               reader.readAsDataURL(input.files[0]);
           }
       }

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
      <div class="row">
         <div class="col-md-5">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Drill Details</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <center>
                           <img width="100px" src="imgs/football.png" />
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <asp:FileUpload class="form-control" ID="PhotoUpload" runat="server"  />
                     </div>
                  </div>
                  <div class="row">
                      <div class="col">
                          <asp:FileUpload class="form-control" ID="VideoUpload" runat="server" />
                      </div>
                  </div>
                  

                  <div class="row">
                     <div class="col-md-3">
                        <label>Drill ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Drill ID"></asp:TextBox>
                              <asp:Button class="btn btn-primary" ID="Button4" runat="server" Text="Go" OnClick="Button4_Click" />
                           </div>
                        </div>
                     </div>
                     <div class="col-md-9">
                        <label>Drill Name</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox2" runat="server" placeholder="Drill Name"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                     
                     <div class="col-md-4">
                        <label>Type</label>
                        <div class="form-group">
                           <asp:ListBox CssClass="form-control" ID="ListBox1" runat="server" SelectionMode="Multiple" Rows="5">
                              <asp:ListItem Text="Shooting" Value="Shooting" />
                              <asp:ListItem Text="Passing" Value="Passing" />
                              <asp:ListItem Text="Dribbling" Value="Dribbling" />
                              <asp:ListItem Text="Defensive" Value="Defensive" />
                              <asp:ListItem Text="Goalkeeping" Value="Goalkeeping" />
                              <asp:ListItem Text="Fitness" Value="Fitness" />
                              <asp:ListItem Text="Set Piece" Value="Set Piece" />
                              <asp:ListItem Text="Tactical" Value="Tactical" />
                           </asp:ListBox>
                        </div>
                     </div>
                  </div>
                  <div class="row">
                      <div class="col-12">
                          <label>Explanation</label>
                          <div class="form-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox3" runat="server" placeholder="" TextMode="MultiLine" Rows="2"></asp:TextBox>
                          </div>
                      </div>
                  </div>
                  <div class="row">
                     <div class="col-12">
                        <label>Organization</label>
                        <div class="form-group">
                           <asp:TextBox CssClass="form-control" ID="TextBox6" runat="server" placeholder="" TextMode="MultiLine" Rows="2"></asp:TextBox>
                        </div>
                     </div>
                  </div>
                   <div class="row">
                       <div class="col-12">
                           <label>Coaching Points</label>
                           <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="TextBox5" runat="server" placeholder="" TextMode="MultiLine" Rows="2"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                   <div class="row">
                       <div class="col-12">
                           <label>Variations</label>
                           <div class="form-group">
                               <asp:TextBox CssClass="form-control" ID="TextBox7" runat="server" placeholder="" TextMode="MultiLine" Rows="2"></asp:TextBox>
                           </div>
                       </div>
                   </div>
                   <div class="row">
                     <div class="col-4">
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" OnClick="Button1_Click"/>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" OnClick="Button3_Click"/>
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" OnClick="Button2_Click"/>
                     </div>
                  </div>
               </div>
            </div>
            <a href="homepage.aspx"><< Back to Home</a><br>
            <br>
         </div>
         <div class="col-md-7">
            <div class="card">
               <div class="card-body">
                  <div class="row">
                     <div class="col">
                        <center>
                           <h4>Drill List</h4>
                        </center>
                     </div>
                  </div>
                  <div class="row">
                     <div class="col">
                        <hr>
                     </div>
                  </div>
                  <div class="row">
                         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FootEdDBConnectionString2 %>" SelectCommand="SELECT * FROM [drill_master_tbl]"></asp:SqlDataSource>
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
      </div>
   </div>
</asp:Content>