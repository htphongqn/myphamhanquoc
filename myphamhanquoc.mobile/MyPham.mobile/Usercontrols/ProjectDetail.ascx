<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectDetail.ascx.cs" Inherits="MyPham.Usercontrols.ProjectDetail" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc1" %>
<uc1:Path ID="Path1" runat="server" />
<!--Slider banner-->

<div class="box slide_dtp">
  <div id="owl-slidebanner_dtp" class="owl-carousel">
    <asp:Repeater ID="Rpalbumimg" runat="server">
      <ItemTemplate>
        <div class="item"> <%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMG_IMAGE1")) %> </div>
      </ItemTemplate>
    </asp:Repeater>
  </div>
</div>
<!-- End Slider banner -->
<!--Detail Products-->
<div class="box">
  <div id="dtp_info">
    <h1 class="h1Title">
      <asp:Label ID="LabelNEWS_TITLE" runat="server"></asp:Label>
    </h1>
    <div class="fl" id="info_dtp_product">
      <div class="dtp_status shortInfoPro">
        <asp:Literal ID="LiteralNEWS_DESC" runat="server"></asp:Literal>
        </span> </div>
      <!--end: .dtp_status-->
      <div class="dtp_status" id="code_P"> <span class="title_status">Mã sản phẩm:</span><b class="txtMSP">
        <asp:Label ID="lblCodeProduct" runat="server"></asp:Label>
        </b> </div>
      <div class="dtp_status"> <span class="title_status">Thương hiệu</span><b class="txtMSP"> <a id="ContentPlaceHolder1_ctl00_Hyperthuonghieu" href="/etude-house.html">ETUDE HOUSE</a></b> </div>
      <div class="dtp_status"> <span class="title_status">Tình trạng:</span><b><span id="ContentPlaceHolder1_ctl00_lbtinhtrang">Còn hàng</span></b></div>
      <!--end: .dtp_status-->
      <div class="dtp_status" id="viewed_count"> <span class="title_status">Lượt xem: </span><b class="numberView">
        <asp:Label ID="lblView" runat="server"></asp:Label>
        </b> </div>
      <div class="dtp_status"> <span class="title_status">Giá bán:</span><b>
        <asp:Label ID="lblGiaKm" runat="server"></asp:Label>
        </b></div>
      <!--end: .dtp_status-->
      <div class="btn_addtocart">
        <asp:Repeater ID="Rpttintuc" runat="server">
          <ItemTemplate> <a href="<%# GetBuyButton(Eval("NEWS_ID"), Eval("NEWS_PRICE2"), Eval("NEWS_PRICE1"))%>" class="btn_web cart_btn"><span>Mua ngay</span></a> </ItemTemplate>
        </asp:Repeater>
        <asp:Literal ID="liLoadBuy" runat="server"></asp:Literal>
      </div>
    </div>
  </div>
</div>
<!--End Detail Products-->
<!--Thong_tin_chi_tiet-->
<div class="box">
  <div class="tab_menu">Chi tiết sản phẩm</div>
  <div class="box_ct info_g">
    <asp:Literal ID="liShowHtmChiTiet" runat="server"></asp:Literal>
  </div>
</div>
<!--end Thong_tin_chi_tiet-->
<div class="box">
  <div class="tab_menu">B&Igrave;NH LUẬN</div>
</div>
<div class="box" id="thesame_P" runat="server">
  <div class="box_Tab">Sản phẩm tương tự</div>
  <div class="box_ct whiteBg home_product_box_list">
    <ul>
      <asp:Repeater ID="Rptinkhac" runat="server">
        <ItemTemplate>
          <li>
            <div class="s_item">
              <div class="img_s_item"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %></a> </div>
              <div class="info_P">
                <h3 class="s_item_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
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
