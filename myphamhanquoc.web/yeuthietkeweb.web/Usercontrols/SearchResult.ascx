<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="yeuthietkeweb.UIs.SearchResult" %>
            
    <%--<div class="eleven columns" id="main_content">
      <!--Breadcrumbs-->
      <ul class="breadcrumbs">
        <li class="home"><a href="/trang-chu.html">Trang chủ</a></li>
        <li class="current">Tìm kiếm</li>
      </ul>
      <!--end Breadcrumbs-->
      <h2 class="page_title">
      <asp:Label ID="lbTitle" runat="server" Text="Kết quả tìm kiếm"></asp:Label>
      </h2>
      <!--List News-->
      <section id="list_news_page" class="news_body">
       <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                    <article>
                      <figure class="img_post fl"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a> </figure>
                      <h3><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h3>
                      <span class="date_post"><%# getDate(Eval("NEWS_PUBLISHDATE"))%></span> 
                      <p class="text"> <%# Eval("NEWS_DESC") %></p>
                      </article>                  
                </ItemTemplate>
            </asp:Repeater>
      </section>
      <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
      <!--end List News-->
    </div>--%>


    <%@ Register src="path.ascx" tagname="path" tagprefix="uc1" %>
<%--<%@ Register src="side_left.ascx" tagname="side_left" tagprefix="uc2" %>--%>

  <%@ Register src="cate_seo.ascx" tagname="cate_seo" tagprefix="uc3" %>

  <div class="main cf">
    <uc1:path ID="path1" runat="server" />      
<%--    <!--Sidebar-->
    <uc2:side_left ID="side_left1" runat="server" />
    <!--end Sidebar-->--%>
    <!--Main Content-->
    <div id="main_content">
      <div class="inner_col">
        <div class="box_ct padd10 whiteBg list_products">
          <div class="title_page">
            <h1><asp:Label ID="Lbtitle" runat="server" Text="Kết quả tìm kiếm"></asp:Label></h1>
            <%--<div class="sort_area">
              <asp:DropDownList ID="ddlSort" runat="server">
                <asp:ListItem Value="0" Text="Sắp xếp theo"></asp:ListItem>
                <asp:ListItem Value="1" Text="Tên: A-Z"></asp:ListItem>
                <asp:ListItem Value="2" Text="Tên: Z-A"></asp:ListItem>
                <asp:ListItem Value="3" Text="Giá: Cao đến thấp"></asp:ListItem>
                <asp:ListItem Value="4" Text="Giá: Thấp đến cao"></asp:ListItem>
                <asp:ListItem Value="5" Text="Mức giảm giá: Cao đến thấp"></asp:ListItem>
                <asp:ListItem Value="6" Text="Mức giảm giá: Thấp đến cao"></asp:ListItem>
              </asp:DropDownList>
            </div>--%>
          </div>
          <ul>
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="product">
                        <div class="img_product"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt=" <%#Eval("NEWS_TITLE") %>"  /> </a></div>
                        <div class='reducephantram'><%#Getgiamgia(Eval("News_Price1"), Eval("News_Price2"))%></div>
                        <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"><%#Eval("NEWS_TITLE") %></a></h3>
                        <div class="price"><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></div>
                        <div class="f_price"><%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></div>
                        <a href="<%# "../Pages/addtocart.aspx?id=" + Eval("NEWS_ID") %>" class="addtocart">Mua hàng</a>
                        </div>
                    </li>
                </ItemTemplate>
            </asp:Repeater>
          </ul>
        </div>
        <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
		<!--Info SEO-->
<%--        <div class="box">
          <div class="box_ct whiteBg padd10" id="SEO_home">          
              <uc3:cate_seo ID="cate_seo1" runat="server" />          
          </div>
        </div>--%>
        <!--end Info SEO-->
      </div>
    </div>
    <!--end Main Content-->
  </div>
