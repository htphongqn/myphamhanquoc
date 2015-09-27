<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top_menu.ascx.cs" Inherits="yeuthietkeweb.UIs.top_menu" %>

<ul class="top_link fr">
    <asp:Repeater ID="Rpmenu" runat="server">
        <ItemTemplate>
            <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'>
                <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>">
                    <%#Eval("cat_name")%>
                </a>            
            </li>
        </ItemTemplate>
    </asp:Repeater>
</ul>