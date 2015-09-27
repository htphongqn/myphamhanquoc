<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CateProductsHome.ascx.cs" Inherits="MyPham.Usercontrols.CateProductsHome" %>

<asp:Repeater ID="Rpmenu1" runat="server">
<ItemTemplate>
<div class="box">
    <div class="box_Tab">
        <h2 class="tt_tab"> <span><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>" title="<%# Eval("CAT_NAME") %>"><%# Eval("CAT_NAME") %></a></span></h2>
    </div>
    <div class="submenu_icon submenu_ico_lv_index"> </div>
    <div class="submobile_menu">
        <div class="container">
        <ul>
            <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("CAT_ID"))%>'>
                <ItemTemplate>
                    <li><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>" title="<%# Eval("CAT_NAME") %>"><%# Eval("CAT_NAME") %></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
        </div>
    </div>
    <div class="box_ct list_products cf">
        <asp:Repeater ID="Repeater3" runat="server" DataSource='<%# sanpham(Eval("CAT_ID"))%>'>
            <ItemTemplate>
                <div class="item_P">
                    <div class="product">
                        <div class="img_product"> 
                            <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                            </a> 
                        </div>
                        <div class="info_P">
                            <h3 class="product_name"> 
                                <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a>
                            </h3>
                            <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                            <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
</ItemTemplate>
</asp:Repeater>