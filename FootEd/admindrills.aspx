<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="admindrills.aspx.cs" Inherits="FootEd.admindrills" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server"></asp:Content>
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
                        <asp:FileUpload class="form-control" ID="PhotoUpload" runat="server" />
                     </div>
                  </div>
                  <div class="row">
                      <div class="col">
                          <asp:FileUpload class="form-control" ID="VidoeUpload" runat="server" />
                      </div>
                  </div>
                  

                  <div class="row">
                     <div class="col-md-3">
                        <label>Drill ID</label>
                        <div class="form-group">
                           <div class="input-group">
                              <asp:TextBox CssClass="form-control" ID="TextBox1" runat="server" placeholder="Drill ID"></asp:TextBox>
                              <asp:LinkButton class="btn btn-primary" ID="LinkButton4" runat="server"><i class="fas fa-check-circle"></i></asp:LinkButton>
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
                        <asp:Button ID="Button1" class="btn btn-lg btn-block btn-success" runat="server" Text="Add" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button3" class="btn btn-lg btn-block btn-warning" runat="server" Text="Update" />
                     </div>
                     <div class="col-4">
                        <asp:Button ID="Button2" class="btn btn-lg btn-block btn-danger" runat="server" Text="Delete" />
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
                     <div class="col">
                        <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</asp:Content>