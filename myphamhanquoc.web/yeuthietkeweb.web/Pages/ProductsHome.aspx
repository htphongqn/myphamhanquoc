<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductsHome.aspx.cs" Inherits="yeuthietkeweb.web.Pages.ProductsHome" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<body>
    <form id="form1" runat="server">
    <!--Menu-->
    <link rel="stylesheet" href="/Resources/Styles/jquery.bxslider.css" type="text/css" media="screen" />
    <script type="text/javascript" src="/Resources/Scripts/all_scripts.js"></script>
    <asp:Repeater ID="rptsp" runat="server">
        <HeaderTemplate><ul></HeaderTemplate>
        <ItemTemplate>
            <li>
                <div class="product">
                <div class="img_product"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt=" <%#Eval("NEWS_TITLE") %>"  /> </a></div>
                <%#Getgiamgia(Eval("News_Price1"), Eval("News_Price2"))%>
                <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"><%#Eval("NEWS_TITLE") %></a></h3>
                <div class="price"><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></div>
                <div class="f_price"><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></div>
                <a href="<%# "../Pages/addtocart.aspx?id=" + Eval("NEWS_ID") %>" class="addtocart">Mua hàng</a>
                </div>
            </li>
        </ItemTemplate>
        <FooterTemplate></ul></FooterTemplate>
    </asp:Repeater>
    </form>
</body>

