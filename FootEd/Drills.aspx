<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Drills.aspx.cs" Inherits="Drills" MasterPageFile="~/Site1.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Team Drills Showcase</title>
    <style>
        .drills-container {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }
        .drill-card {
            border: 1px solid #ccc;
            padding: 20px;
            text-align: center;
            cursor: pointer;
            transition: transform 0.3s;
        }
        .drill-card:hover {
            transform: scale(1.05);
        }
        .drill-image {
            max-width: 100%;
            height: auto;
        }
        .drill-title {
            font-size: 18px;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>Team Drills</h2>
    <div class="drills-container">
        <asp:Repeater ID="drillsRepeater" runat="server">
            <ItemTemplate>
                <div class="drill-card" onclick="location.href='DrillDetails.aspx?id=<%# DataBinder.Eval(Container.DataItem, "Id") %>'">
                    <img src='<%# DataBinder.Eval(Container.DataItem, "ImageUrl") %>' alt='<%# DataBinder.Eval(Container.DataItem, "Name") %>' class="drill-image" />
                    <div class="drill-title"><%# DataBinder.Eval(Container.DataItem, "Name") %></div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</asp:Content>
