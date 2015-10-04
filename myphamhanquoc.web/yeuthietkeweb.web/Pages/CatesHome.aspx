<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatesHome.aspx.cs" Inherits="yeuthietkeweb.web.Pages.CatesHome" %>

    <asp:Repeater ID="rptcate" runat="server">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"> <%#Eval("CAT_NAME") %></a> </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>

