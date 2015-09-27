<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left_news.ascx.cs" Inherits="yeuthietkeweb.UIs.left_news" %>

<div id="sidebar" class="three columns">
    <div class="box_ct whiteBg most-viewed" id="cate_left">
    <h2>Danh mục tin tức</h2>
    <ul class="list_field">
        <asp:Repeater ID="Rpmenu" runat="server">
        <ItemTemplate>                
        <li> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>"><%#Eval("CAT_NAME") %></a> </li>
        </ItemTemplate>
    </asp:Repeater>
    </ul>
    </div>
</div>
    

