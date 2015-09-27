<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="Main.aspx.cs" Inherits="yeuthietkeweb.Main" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    <asp:PlaceHolder ID="phdMain" runat="server"></asp:PlaceHolder>
</asp:Content>
