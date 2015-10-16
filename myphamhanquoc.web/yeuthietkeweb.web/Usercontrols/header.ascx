<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="header.ascx.cs" Inherits="yeuthietkeweb.UIs.header" %>

<header>
  <div class="container">  
    <asp:Repeater ID="rptLogo" runat="server">
        <ItemTemplate>
            <%# Getbanner(Eval("BANNER_TYPE"),Eval("BANNER_FIELD1"), Eval("BANNER_ID"), Eval("BANNER_FILE"))%>
        </ItemTemplate>
    </asp:Repeater>
    <div id="header_m" class="info_header nine columns">
      <!--Function Web-->
      <div class="info_item"><i class="ico delivery_icon"></i><span><b>Miễn phí giao hàng</b><br />
        Nhanh chóng</span></div>
      <div class="info_item"><i class="ico payment_icon"></i><span><b>Thanh toán thuận tiện</b><br />
        Tại nhà - Qua ngân hàng</span></div>
      <div class="info_item"><i class="ico pay_online_icon"></i><span><b>07 ngày đổi hàng</b><br />
        Miễn phí đổi hàng</span></div>
      <!--end Function Web-->
    </div>
    <!--Cart Head-->
    <div class="three columns">
      <div class="cart_head fr"><i class="ico cart_icon"></i><a href="/gio-hang.html">Giỏ hàng (<asp:Literal ID="lbCountCart" runat="server" Text="0"></asp:Literal>)</a><em class="arr_down"></em></div>
    </div>
    <!--end Cart Head-->
  </div>
</header>