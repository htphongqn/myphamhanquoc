<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="product_detail.ascx.cs"
    Inherits="yeuthietkeweb.UIs.product_detail" %>
<%@ Register src="path.ascx" tagname="path" tagprefix="uc1" %>
  <div class="main cf">
    <uc1:path ID="path1" runat="server" />
    <!--Detail Products-->
    <div class="box">
      <div class="box_ct whiteBg padd10">
        <div class="pro_left five columns">
          <!--Image Product-->
          <div class="img_dtp"> 
            <asp:Repeater ID="Rpimg" runat="server">
                <ItemTemplate>                    
                    <a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" title="<%# Eval("NEWS_IMG_DESC") %>" class="main_img imagezoom"> <img itemprop="image" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" id="image"  data-zoom-image="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" class="product-image-zoom img-responsive"/> </a>
                </ItemTemplate>
            </asp:Repeater>
            <div id="image-additional-carousel">
              <ul>                
                <asp:Repeater ID="Rpimgsmall" runat="server">
                    <ItemTemplate>
                        <li><a href="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" class="imagezoom" data-zoom-image="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" data-image="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" title="<%# Eval("NEWS_IMG_DESC") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" data-zoom-image="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %>" class="product-image-zoom img-responsive" /> </a></li>
                    </ItemTemplate>
                </asp:Repeater>
              </ul>
              <a id="prev" class="prev sl_ctrol" href="#">&lt;</a> <a id="next" class="next sl_ctrol" href="#">&gt;</a> </div>
          </div>
          <!--end: #dp-thumb-->
        </div>
        <!-- end zoom-->
        <div id="dtp_info" class="seven columns">
          <div class="inner_col">
            <h1 class="h1Title"> <asp:Label ID="Lbtitle_details" runat="server" Text=""></asp:Label> </h1>            
            <div class="dtp_row_infoP"> <span id="ContentPlaceHolder1_ctl00_Lbdesc_details"><asp:Label ID="Lbdesc_details" runat="server" Text=""></asp:Label></span> </div>
            <div class="dtp_row_infoP"> <b class="tt_info">Mã sản phẩm:</b> <asp:Label ID="Lbcode" runat="server" Text=""></asp:Label> </div>
            <div class="dtp_row_infoP"> <b class="tt_info">Thương hiệu:</b> <asp:Literal ID="lbThuonghieu" runat="server" Text=""></asp:Literal></div>
            <div class="dtp_row_infoP"> <b class="tt_info">Tình trạng:</b> <asp:Label ID="lbTinhtrang" runat="server" Text=""></asp:Label> </div>
            <div class="dtp_row_infoP"> <b class="tt_info">Giá bán:</b> <del> <asp:Label ID="Lbprice2" runat="server" Text=""></asp:Label> </del> <br />
              <b class="new_price"> <span style="color:Red;"><asp:Literal ID="Lbprice1" runat="server" Text=""></asp:Literal></span> </b> </div>
            <div class="dtp_row_infoP"> Chọn số lượng:
                <asp:DropDownList ID="ddlQuantity" runat="server" CssClass="quantity">
                    <asp:ListItem Value="1" Text="1"></asp:ListItem>
                    <asp:ListItem Value="2" Text="2"></asp:ListItem>
                    <asp:ListItem Value="3" Text="3"></asp:ListItem>
                    <asp:ListItem Value="4" Text="4"></asp:ListItem>
                    <asp:ListItem Value="5" Text="5"></asp:ListItem>
                    <asp:ListItem Value="6" Text="6"></asp:ListItem>
                    <asp:ListItem Value="7" Text="7"></asp:ListItem>
                    <asp:ListItem Value="8" Text="8"></asp:ListItem>
                    <asp:ListItem Value="9" Text="9"></asp:ListItem>
                    <asp:ListItem Value="10" Text="10"></asp:ListItem>
                    <asp:ListItem Value="11" Text="11"></asp:ListItem>
                    <asp:ListItem Value="11" Text="12"></asp:ListItem>
                    <asp:ListItem Value="12" Text="13"></asp:ListItem>
                    <asp:ListItem Value="13" Text="14"></asp:ListItem>
                    <asp:ListItem Value="14" Text="15"></asp:ListItem>
                    <asp:ListItem Value="15" Text="16"></asp:ListItem>
                    <asp:ListItem Value="16" Text="17"></asp:ListItem>
                    <asp:ListItem Value="17" Text="18"></asp:ListItem>
                    <asp:ListItem Value="19" Text="19"></asp:ListItem>
                    <asp:ListItem Value="20" Text="20"></asp:ListItem>
                </asp:DropDownList>              
                <%--<span class="status_product available">Còn hàng</span>--%>
              <!--unavailable-->
            </div>
            <div class="dtp_row_infoP">
              <div class="fl">
                <asp:LinkButton ID="Lbaddtocart" runat="server" CssClass="btn_web btn_addtocart" OnClick="Lbaddtocart_Click"><i class="cart_icon"></i>Đặt mua ngay</asp:LinkButton>                
              </div>
              <div class="dtp_row links_more">
                <asp:LinkButton ID="Lbaddlike" runat="server" CssClass="addlike like_pr" style="cursor: pointer" OnClick="Lbaddlike_Click"><span class="heart_icon"></span>Tôi thích sản phẩm này</asp:LinkButton>
              </div>
            </div>
          </div>
        </div>
        <div id="ads_support" class="four columns fr">
            <asp:Repeater ID="rptAds" runat="server">
                <ItemTemplate>                 
                    <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%>
                </ItemTemplate>
            </asp:Repeater>
        </div>
      </div>
      <!--end: .dtp_addcart-->
    </div>
    <!--End Detail Products-->
    <!--#Main col-->
    <div class="twelve columns" id="l_col_dtp">
      <div class="inner_col">
        <div class="box">
          <div class="box_ct whiteBg padd10">
            <div class="section_title_dt">Thông tin sản phẩm</div>
            <!--Detail Text-->
            <div class="info_detailP">
              <asp:Literal ID="liHtml_info" runat="server"></asp:Literal>
            </div>
            <div class="dtp_row_infoP btn_bottom">  
            <asp:LinkButton ID="LinkButton1" runat="server" CssClass="btn_web btn_addtocart" OnClick="Lbaddtocart_Click"><i class="cart_icon"></i>Đặt mua ngay</asp:LinkButton></div>
            <!--Comment-->
            <div class="comment_part cf">
              <div class="section_title_dt">Bình luận</div>
              <div id="fb-root"> </div>
              <script>(function (d, s, id) {
                      var js, fjs = d.getElementsByTagName(s)[0];
                      if (d.getElementById(id)) return;
                      js = d.createElement(s); js.id = id;
                      js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=183250451825564&version=v2.0";
                      fjs.parentNode.insertBefore(js, fjs);
                  } (document, 'script', 'facebook-jssdk'));</script>
                <asp:Literal ID="lbCommentFace" runat="server"></asp:Literal>
            </div>
            <!--End Comment-->
          </div>
          <!--box_ct-->
        </div>
        <!--End box-->
        <!--same p-->
        <div class="box">
          <div class="box_ct padd10 whiteBg sl_pro" id="thesame_products">
            <div class="section_title_dt"><span>Sản phẩm tương tự</span></div>
            <ul>
              <asp:Repeater ID="rp_sanphamcungloai" runat="server">
                <ItemTemplate>
                    <li>
                        <div class="product">
                        <div class="img_product"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt=" <%#Eval("NEWS_TITLE") %>"  /> </a></div>
                        <%#Getgiamgia(Eval("News_Price1"), Eval("News_Price2"))%>
                        <h2 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"><%#Eval("NEWS_TITLE") %></a></h2>
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
        <!--End same p-->
      </div>
    </div>
    <!--end main col-->
    <div class="sidebar four columns">
      <div class="sticky box_ct whiteBg padd10">
        <div class="section_title_dt">Có thể bạn quan tâm</div>
        <div id="other_products">
          <ul>
            <asp:Repeater ID="rp_sanphamquantam" runat="server">
                <ItemTemplate>
                    <li>
                      <!--Start Product-->
                      <div class="product"> <a class="img_product" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt=" <%#Eval("NEWS_TITLE") %>" ></a>
                        <h2 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title=" <%#Eval("NEWS_TITLE") %>"> <%#Eval("NEWS_TITLE") %></a></h2>
                        <div class="info_price"> <span class="price"><del><%#GetPrice2(Eval("News_Price1"), Eval("News_Price2"))%></del></span> <span class="f_price"> <%#GetPrice1(Eval("News_Price1"), Eval("News_Price2"))%></span> </div>
                      </div>
                      <!--End Product-->
                    </li>
                </ItemTemplate>
            </asp:Repeater>
          </ul>
        </div>
        <!--End product Row -->
      </div>
      <!--end box-->
    </div>
    <!--end sidebar right-->
  </div>

