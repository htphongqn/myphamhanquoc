<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="cart-result.aspx.cs" Inherits="yeuthietkeweb.Pages.cart_result" %>
<%@ Register src="../Usercontrols/left_cate.ascx" tagname="left_cate" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/gio-hang.html">Giỏ hàng</a></div>
    <!--Sidebar-->
    <uc1:left_cate ID="left_cate1" runat="server" />
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="thirteen columns">
      <div class="inner_col">
        <!--Cart-->
        <div class="box">
          <div class="box_Tab_main">
              <h1>Giỏ hàng của bạn</h1>
          </div>
          <table width="100%" class="page_cart">
            <tr>
              <th style="width: 80px"> Hình ảnh </th>
              <th> Tên Sản phẩm </th>
              <th style="width: 120px"> Đơn giá (VNĐ) </th>
              <th style="width: 100px"> Số lượng </th>
              <th style="width: 120px"> Thành tiền (VNĐ) </th>
              <th> Xóa </th>
            </tr>
            <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
                <ItemTemplate>                    
                   <tr>
                      <td align="center">
                        <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                        <img style="max-width: 60px" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /> </td>
                      <td align="center"><span class="name_P"><%# Eval("NEWS_TITLE") %></span> </td>
                      <td align="center">  <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",", ".")%> </td>
                      <td align="center"><input value='<%# Eval("Basket_quantity") %>' id="Txtquantity" runat="server" onkeyup="this.value=formatNumeric(this.value);" onblur="this.value=formatNumeric(this.value);" class="quantity" style="text-align: center" />
                      </td>
                      <td align="center"><%# String.Format("{0:0,0 VNĐ}", Eval("BasketSum_Price")).Replace(",", ".")%></td>
                      <td align="center">
                        <asp:LinkButton ID="lnkRemove" runat="server" CommandName="Remove" class="close" CommandArgument='<%# Eval("news_id") %>'><img src="/Resources/Images/remove_cart.png"></asp:LinkButton>
                      </td>
                    </tr>
              </ItemTemplate>
            </asp:Repeater>
            <tr>
              <td colspan="4" align="right"><strong>Tổng thanh toán:</strong> </td>
              <td colspan="2" align="center" style="font-weight: bold; color: #FF0000; font-size: 1.3em"><asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label> </td>
            </tr>
          </table>
          <div class="div_btnpayment"> 
            <a href="/thanh-toan.html" class="btn_web btn_payment fr"><span>Thanh toán</span></a> 
            <asp:LinkButton ID="Lbcapnhap" runat="server" CssClass="btn_web btn_payment fr" OnClick="Lbcapnhap_Click">Cập nhật giỏ hàng</asp:LinkButton>
            <a href="/" class="btn_web btn_payment fr"><span>Tiếp tục mua hàng</span></a>
          </div>
        </div>
        <!--End Cart-->
      </div>
    </div>
    <!--end Main Content-->
  </div>
</asp:Content>
