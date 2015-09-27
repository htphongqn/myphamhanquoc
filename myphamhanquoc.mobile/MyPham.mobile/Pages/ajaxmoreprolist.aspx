<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ajaxmoreprolist.aspx.cs" Inherits="MyPham.Pages.ajaxmoreprolist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Repeater ID="Rplistpro" runat="server">
        <ItemTemplate>
            <div class="item_P">
                <div class="product">
                    <div class="img_product"> 
                        <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                            <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                        </a>
                    </div>
                    <div class="info_P">
                        <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                        <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                        <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                    </div>
                </div>
            </div>
        </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
