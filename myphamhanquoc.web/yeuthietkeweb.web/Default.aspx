<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="yeuthietkeweb.Default" %>
<%@ Register src="Usercontrols/home_main.ascx" tagname="home_main" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    <uc1:home_main ID="home_main1" runat="server" />
</asp:Content>
