<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="sanphamtheothuonghieu.aspx.cs" Inherits="yeuthietkeweb.Pages.sanphamtheothuonghieu" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    
  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/san-pham-yeu-thich.html">Sản phẩm yêu thích</a></div>
    <!--Sidebar-->
    <div id="sidebar" class="three columns">            
      <div class="box_ct whiteBg most-viewed">
        <h3>Thương hiệu</h3>
        <ul>
          <asp:Repeater ID="rptBrands" runat="server">
                <ItemTemplate>
                    <li><a href="<%#Eval("Url")%>" class="img_brand"> <%#Eval("NameCount")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
      </div>
    </div>
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="thirteen columns">
      <div class="inner_col">
        <div class="box_ct padd10 whiteBg list_products">
          <div class="title_page">
            <h1><asp:Literal ID="Lbtitle" runat="server" Text="" ></asp:Literal></h1>
            <%--<div class="sort_area">
              <asp:DropDownList ID="ddlSort" runat="server" AutoPostBack="True" 
                    onselectedindexchanged="ddlSort_SelectedIndexChanged">
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
                    <li class="mtf columns">
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
      </div>
    </div>
    <!--end Main Content-->
  </div>
</asp:Content>
