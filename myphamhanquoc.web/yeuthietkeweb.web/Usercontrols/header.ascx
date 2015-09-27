<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="yeuthietkeweb.UIs.header" %>

<header>
  <div class="container">  
    <asp:Repeater ID="rptLogo" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
    <div id="header_m" class="info_header trans eight columns">
      <!--Function Web-->
      <div class="info_item"><i class="ico delivery_icon"></i><span>Giao hàng<br />
        tận nơi</span></div>
      <div class="info_item"><i class="ico payment_icon"></i><span>Thanh toán<br />
        khi nhận hàng</span></div>
      <div class="info_item"><i class="ico pay_online_icon"></i><span>Thanh toán<br />
        online</span></div>
      <!--end Function Web-->
    </div>
    <!--Cart Head-->
    <div class="four columns">
      <div class="cart_head fr"><i class="ico cart_icon"></i><a href="/gio-hang.html">Giỏ hàng (<asp:Literal ID="lbCountCart" runat="server" Text="0"></asp:Literal>) sản phẩm</a><em class="arr_down"></em></div>
    </div>
    <!--end Cart Head-->
  </div>
</header>