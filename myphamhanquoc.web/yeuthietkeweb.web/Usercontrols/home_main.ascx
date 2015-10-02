<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="home_main.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.home_main" %>

  <!-- Jquery Top Banner -->
  <div class="homebanners bannerSingle">
    <div class="slide twelve columns">
      <div class="slide_in">
        <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <div class='slide_item hvr-rectangle-out' id='sl<%= getIdAuto() %>'> <a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>" class='img_slide'><img src="<%#GetImage_Cat(Eval("CAT_ID"),Eval("CAT_IMAGE2"))%>" /></a>
                  <h2 class='hvr-underline-from-center'><a href="<%#GetLink_Cat(Eval("cat_url"),Eval("cat_seo_url"))%>" title="<%#Eval("cat_name")%>"><%#Eval("cat_name")%></a></h2>
                </div>
            </ItemTemplate>
        </asp:Repeater>
      </div>
    </div>
    <!-- This is for the custom paging -->
    <!--Right 300-->
    <div class="bannerC four columns">
      <div class="banner300x250"> 
        <asp:Repeater ID="rptAds" runat="server">
            <ItemTemplate>                 
                    <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%>
            </ItemTemplate>
        </asp:Repeater>
      </div>
      <!--Brand Logo--> 
      <div class="wysiwyg-content">
        <div id="nk-brand-2015">
          <!--Slide Brand-->
          <div id="slider-2015">
            <div class="viewport logoslider">
              <ul class="bxslides">
                <asp:Repeater ID="rptBrands" runat="server">
                    <ItemTemplate>
                        <li><a href="<%#Eval("Url")%>" class="img_brand"> <img src="<%#Eval("ImageUrl")%>" alt="<%#Eval("Name")%>" title="<%#Eval("Name")%>"></a></li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
            </div>
          </div>
          <!--end Slide Brand-->
          <div id="brand-2015">
            <h2> Mua sắm</h2>
            <span>theo thương hiệu</span>            
            <asp:DropDownList ID="ddlBrand" runat="server" AppendDataBoundItems="true" onchange="changeweb(this);">
                <asp:ListItem Value="0" Text="Chọn thương hiệu"></asp:ListItem>
            </asp:DropDownList> 
            <script>
                function changeweb(e) {
                    if (e.value != 0) {
                        window.open(e.value, "_blank");
                    }
                }
            </script> 
          </div>
        </div>
      </div>
      <!--end Brand Logo-->
    </div>
    <!--End Right 300-->
  </div>
  <!--End Jquery Top Banner -->
  <!-- #Main -->
  <div class="main cf">
    <!--Tab Products 01-->
    <div class="box">
      <div id="tabs-container">
        <ul class="tabs_menu">
          <li class="active" rel="tab-1"><span>Sản phẩm nổi bật</span></li>
          <li rel="tab-2"><span>Sản phẩm bán chạy</span></li>
          <li rel="tab-3"><span>Sản phẩm được mua nhiều</span></li>
        </ul>
        <div class="tab_container whiteBg">
          <div id="tab-1" class="tab_content">
            <!--Slide Products-->
            <div class="sl_pro slide_tab_Pro">
              <ul>                
                <asp:Repeater ID="rptProNoibat" runat="server">
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
                </asp:Repeater>
              </ul>
              <a id="prev" class="prev sl_ctrol" href="#">&lt;</a> <a id="next" class="next sl_ctrol" href="#">&gt;</a> </div>
            <!--end Slide Products-->
          </div>
          <div id="tab-2" class="tab_content">
            <!--Slide Products-->
            <div class="sl_pro slide_tab_Pro">
              <ul>                
                <asp:Repeater ID="rptProBanchay" runat="server">
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
                </asp:Repeater>
              </ul>
              <a id="prev" class="prev sl_ctrol" href="#">&lt;</a> <a id="next" class="next sl_ctrol" href="#">&gt;</a> </div>
            <!--end Slide Products-->
          </div>
          <div id="tab-3" class="tab_content">
            <!--Slide Products-->
            <div class="sl_pro slide_tab_Pro">
              <ul>                
                <asp:Repeater ID="rptPromuanhieu" runat="server">
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
                </asp:Repeater>
              </ul>
              <a id="prev" class="prev sl_ctrol" href="#">&lt;</a> <a id="next" class="next sl_ctrol" href="#">&gt;</a> </div>
            <!--end Slide Products-->
          </div>
        </div>
      </div>
    </div>
    <!--End Tab Products 01-->
    <div class="list_cate_home">
      <asp:Repeater ID="rptCatHome" runat="server">
        <ItemTemplate>
        <div class="box box_category box_category_home whiteBg">
            <div class="category_item">
              <div class="categoryhead"> <a class="main_cate" href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>">
                <h2><%#Eval("CAT_NAME")%></h2>
                </a> </div>
              <div class="mtf columns">
                <div class="vertical_menu">
                  <div class="boxscroll">
                    <ul>
                      <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                            <ItemTemplate>
                                <%--<li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"> <%#Eval("CAT_NAME") %></a> </li>--%>
                                <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'> <a href="javascript:void(0)" onclick="showProducts(<%# Eval("CAT_ID")%>,3,<%# getidcapcha(Eval("CAT_PARENT_PATH"))%>);" title="<%#Eval("CAT_NAME") %>"> <%#Eval("CAT_NAME") %></a> </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                  </div>
                </div>
              </div>
              <div class="mtt columns">
                <div class="menu_lv3">
                  <ul>                
                    <asp:Repeater ID="Repeater3" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID"), 5) %>'>
                        <ItemTemplate>
                            <li class='<%#GetStyleActive(Eval("cat_seo_url"),Eval("cat_url")) %>'> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"> <%#Eval("CAT_NAME") %></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                  </ul>
                </div>
                <div class="homesubcatcontainer">
                  <div class="sl_pro slide_cate_Pro" id='showcat_<%# Eval("CAT_ID") %>'>
                    <ul>
                      <asp:Repeater ID="Repeater2" runat="server" DataSource='<%#Load_proindex(Eval("CAT_ID"), 20) %>'>
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
                        </asp:Repeater>
                    </ul>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </ItemTemplate>
    </asp:Repeater>
    </div>
  </div>
  <!--End Main-->
  <script type="text/javascript">
      function showProducts(catid, position, idcapcha) {
          $.ajax({
              url: '../Pages/ProductsHome.aspx',
              data: 'catid=' + catid + '&position=' + position + '',
              success: function (e) {
                  if (position == 3) {
                      $("#showcat_" + idcapcha + "").html(e);
                  }
              }
          });
      }
</script>