<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product_list.ascx.cs"
    Inherits="yeuthietkeweb.UIs.product_list" %>

<%@ Register src="path.ascx" tagname="path" tagprefix="uc1" %>
<%@ Register src="side_left.ascx" tagname="side_left" tagprefix="uc2" %>
<%@ Register src="cate_seo.ascx" tagname="cate_seo" tagprefix="uc3" %>

  <div class="main cf">
    <uc1:path ID="path1" runat="server" />      
    <!--Sidebar-->
    <uc2:side_left ID="side_left1" runat="server" />
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="thirteen columns">
      <div class="inner_col">
        <div class="box_ct padd10 whiteBg list_products">
          <div class="title_page">
            <h1><asp:Literal ID="Lbtitle" runat="server" ></asp:Literal></h1>
            <div class="sort_area">
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
            </div>
          </div>
          <ul>
            <asp:Repeater ID="rptProducts" runat="server">
                <ItemTemplate>
                    <li class="mtf columns">
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
            </asp:Repeater>
          </ul>
        </div>
        <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
		<!--Info SEO-->
        <div class="box">
          <div class="box_ct whiteBg padd10" id="SEO_home">          
              <uc3:cate_seo ID="cate_seo1" runat="server" />          
          </div>
        </div>
        <!--end Info SEO-->
      </div>
    </div>
    <!--end Main Content-->
  </div>
