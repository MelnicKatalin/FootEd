<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="homepage.aspx.cs" Inherits="FootEd.homepage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <section>
        <img src="imgs/homeimage2.png" class="img-fluid" />
    </section>
    <section>
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <center>
                        
                        <p><b>The 3 primary features</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/cone.png" /><a href="homepage.aspx"></a>
                        <h4 style="font-size: 18px;">Drills Catalogue</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/chatbot1.png" />
                        <h4 style="font-size: 18px;">ChatBot</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/forum.png " />
                        <h4 style="font-size: 18px;">Browse the forum</h4>
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
                        
                        <p><b>A simple 3 step process</b></p>
                    </center>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/sign-up.png" />
                        <h4 style="font-size: 18px;">Sign Up</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/glass.png" />
                        <h4 style="font-size: 18px;">Search Drills</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
                <div class="col-md-4">
                    <center>
                        <img width="120px" src="imgs/football.png" />
                        <h4 style="font-size: 18px;">Visit Us</h4>
                        <p class="text-justify"></p>
                    </center>
                </div>
            </div>
        </div>
    </section>
</asp:Content>
