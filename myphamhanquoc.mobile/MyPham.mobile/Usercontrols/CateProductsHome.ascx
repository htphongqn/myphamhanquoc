<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CateProductsHome.ascx.cs" Inherits="MyPham.Usercontrols.CateProductsHome" %>

<!--Bestsell Products-->
<div class="box">
  <div class="box_Tab">SẢN PHẨM BÁN CHẠY</div>
  <div class="box_ct whiteBg home_product_box_list">
    <ul>
        <asp:Repeater ID="rptProBanchay" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a> 
                </div>
                <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
  </div>
</div>
<!--end Bestsell Products-->
<!--SaleOff Products-->
<div class="box">
  <div class="box_Tab">SẢN PHẨM GIẢM GIÁ</div>
  <div class="box_ct whiteBg home_product_box_list">
    <ul>
      <asp:Repeater ID="rptProGiamGia" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a> 
                </div>
                <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                    <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
  </div>
</div>
<!--end SaleOff Products-->
<!--HomeCategoriesBottom-->
<div class="box">
  <div class="box_Tab tab_home">DANH MỤC SẢN PHẨM</div>
  <div class="box_ct cate_bot">
    <ul>
    <asp:Repeater ID="Rpmenu" runat="server">
    <ItemTemplate>
        <li>
            <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>"> 
                <i class="ico_cate"><img src="<%#GetImage_Cat(Eval("CAT_ID"),Eval("CAT_IMAGE2"))%>" alt="<%#Eval("cat_name")%>" /></i>
                <h3><%#Eval("cat_name")%></h3>
            </a>
        </li>
    </ItemTemplate>
    </asp:Repeater>
    </ul>
  </div>
</div>
<!--end HomeCategoriesBottom-->
<!--Related Products-->
<div class="box">
  <div class="box_Tab">GỢI Ý SẢN PHẨM</div>
  <div class="box_ct home_product_relate_list">
    <ul>
      <asp:Repeater ID="rptProGoiY" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a> 
                </div>
                <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                    <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </li>
        </ItemTemplate>
      </asp:Repeater>
    </ul>
  </div>
</div>
<!--end Related Products-->
<!--News Home-->
<div class="box">
  <h3 class="box_Tab">Tin tức mới nhất</h3>  
  <div class="box_ct whiteBg home_product_box_list newsHome">
    <asp:Repeater ID="rptNewsTop" runat="server">
    <ItemTemplate>
	<article class="hotNews">
	    <figure class="img_news">
	    	<a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
                <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>"></a>
	    </figure>
	    <h2><a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h2>
	    <p><%# Eval("NEWS_DESC") %></p>
  	</article>
    </ItemTemplate>
    </asp:Repeater>
    <ul>
        <asp:Repeater ID="rptNews" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                    <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> </a> </div>
                <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h2>
            </div>
        </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
  </div>
</div>
<!--end News Home-->
