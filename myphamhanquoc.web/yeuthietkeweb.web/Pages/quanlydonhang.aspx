<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="quanlydonhang.aspx.cs" Inherits="yeuthietkeweb.Pages.quanlydonhang" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<%@ Register src="../Usercontrols/left_customer.ascx" tagname="left_customer" tagprefix="uc1" %>
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/don-hang-cua-toi.html">Đơn hàng của tôi</a></div>
    <!--Sidebar-->
    <uc1:left_customer ID="left_customer1" runat="server" />
    <!--end Sidebar-->
    <!--Main Column-->
    <div class="thirteen columns fr" id="main_content">
      <div class="inner_col">
        <!--History Order-->
        <div class="box whiteBg marg_bot20">
          <div class="box_Tab_main">
            <h1 class="title_page">Đơn hàng của tôi</h1>
          </div>
          <div class="box_ct padd10">
            <!--Buying History-->
            <table width="100%" cellspacing="0" cellpadding="4" style="color:#0066FF;width:100%%;border-collapse:collapse" id="ContentPlaceHolder1_GridItemList" class="tdGridTable">
              <tbody>
                <tr style="line-height: 22px;color:#000333;background-color:#F3F3F3;font-size:12px;font-weight:700">
                  <td style="width:18%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl00','')">Mã đơn hàng</a></td>
                  <td style="width:10%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl01','')">Ngày đặt hàng</a></td>
                  <td style="width:30%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl01','')">Địa chỉ</a></td>
                  <td style="width:22%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl04','')">Thanh toán</a></td>
                  <td style="width:10%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl03','')">Trạng thái</a></td>
                  <td style="width:10%;white-space:nowrap;" class="tdGridHeader"><a style="color:#000333;" href="javascript:__doPostBack('ctl00$ContentPlaceHolder1$GridItemList$ctl01$ctl02','')">Tổng tiền</a></td>
                </tr>
                <asp:Repeater ID="rptOrders" runat="server"  OnItemCommand="rptOrders_ItemCommand">
                    <ItemTemplate>
                        <tr class="box_cargo">
                          <td align="left " style="white-space:nowrap;" class="tdGridRow"><img width="16" height="16" alt="Xem chi tiết" src="/Resources/Images/view_icon.png" class="img_general" /><%# Eval("ORDER_CODE")%></td>
                          <td align="left" style="white-space:nowrap;" class="tdGridRow"><%# getPublishDate(Eval("ORDER_PUBLISHDATE"))%></td>
                          <td align="left" style="white-space:nowrap;" class="tdGridRow"><%# Eval("ORDER_ADDRESS")%></td>
                          <td align="left" class="tdGridRow"><font color="#0c5cd4"><%# getOrderPayment(Eval("ORDER_PAYMENT"))%></font></td>
                          <td align="left" class="tdGridRow"><font color="#FF0000"><%# getOrderStatus(Eval("ORDER_STATUS"))%></td>
                          <td align="left" class="tdGridRow"><%# GetTongtien(Eval("ORDER_ID"))%></td>
                        </tr>                     
                        <tr class="box_cargo_item hidden">
                          <td colspan="6"><!--Chi tiết đơn hàng-->
                            <div class="cart_page_user">
                              <table width="100%" class="page_cart">
                                <tr>
                                  <th style="width: 80px"> Hình ảnh </th>
                                  <th> Tên Sản phẩm </th>
                                  <th style="width: 120px"> Đơn giá (VNĐ) </th>
                                  <th style="width: 100px"> Số lượng </th>
                                  <th style="width: 120px"> Thành tiền (VNĐ) </th>
                                </tr>                        
                                <asp:Repeater ID="rptOrdertails" runat="server" DataSource='<%# LoadGridItems(Eval("ORDER_ID")) %>' >
                                    <ItemTemplate>
                                    <tr>
                                      <td align="center"><img style="max-width: 60px" src='<%# GetImageT(Eval("ESHOP_NEW.NEWS_ID"),Eval("ESHOP_NEW.NEWS_IMAGE3")) %>' /> </td>
                                      <td align="center"><span class="name_P"><%# Eval("ESHOP_NEW.NEWS_TITLE")%></span> </td>
                                      <td align="center"> <%# Getprice( Eval("ITEM_PRICE") )%></td>
                                      <td align="center"><input type="text" value="<%# Eval("ITEM_QUANTITY")%>" id="Txtquantity" onkeyup="this.value=formatNumeric(this.value);" onblur="this.value=formatNumeric(this.value);" class="quantity" style="text-align: center" />
                                      </td>
                                      <td align="center"> <%# GetThanhtien(Eval("ITEM_PRICE"), Eval("ITEM_QUANTITY")) %> </td>
                                    </tr>
                                    </ItemTemplate>
                                </asp:Repeater>                                
                                    <tr>
                                        <td colspan="3" align="right"><strong>Tổng tiền:</strong> </td>
                                        <td colspan="2" align="center" style="font-weight: bold; color: #FF0000; font-size: 1.3em"><%# GetTongtien(Eval("ORDER_ID"))%></td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="right"><strong>Phí vận chuyển:</strong> </td>
                                        <td colspan="2" align="center" style="font-weight: bold; color: #FF0000; font-size: 1.3em">Miễn phí </td>
                                    </tr>
                                    <tr>
                                        <td colspan="3" align="right"><strong>Tổng cộng:</strong> </td>
                                        <td colspan="2" align="center" style="font-weight: bold; color: #FF0000; font-size: 1.3em"><%# GetTongtien(Eval("ORDER_ID"))%></td>
                                    </tr>
                              </table>
                              <div class="cf"></div>
                            </div>
                            <!--end Chi tiết đơn hàng--></td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater> 
              </tbody>
            </table>
          </div>
        </div>
        <!--end History Order-->
      </div>
    </div>
    <!--end Main Column-->
  </div>
</asp:Content>
