<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="FootEd.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/homeimage2.jpg" class="img-fluid" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        <h2>Our Features</h2>
                        <p><b>The 3 primary features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/cone.png" /><a href="homepage.aspx"></a>
                        <h4>Drills Catalogue</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/glass.png" />
                        <h4>Search Drills</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/forum.png " />
                        <h4>Browse the forum</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
            </div>
        </div>
    </section>
    <section>
        <img src="imgs/homeimage3.jpg" class="img-fluid" />
    </section>
    <section>
        <div class="container">
            <div class="row">

                <div class="col-12">
                    <center>
                        <h2>The process</h2>
                        <p><b>A simple 3 step process</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/sign-up.png" />
                        <h4>Sign Up</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/glass.png" />
                        <h4>Search Drills</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="100px" src="imgs/football.png" />
                        <h4>Visit Us</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
