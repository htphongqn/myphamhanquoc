<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="dathangthanhcong.aspx.cs" Inherits="yeuthietkeweb.dathangthanhcong" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="#">Thanh toán</a></div>
    <!--Order Success-->
    <div class="box">
      <div class="box_ct whiteBg padd15">
        <div id="orderInfo"> <img src="/Resources/images/body.png" alt="" width="217" class="img_general" />
          <div class="row">
            <p> 
            <%--<img alt="" class="left-15" src="/Images/star.png"> --%>
            <strong>Xin chào Anh/Chị Đào!</strong></p>
            <p> Em là trưởng bộ phận quản lý đơn hàng của website: websitemypham.com</p>
            <p> Cảm ơn Anh/Chị đã đặt mua sản phẩm</p>
            <p> Em xin phép gửi thông tin đơn hàng của Anh/Chị như sau:</p>
            <p>&nbsp;</p>
            <p>
            <%--<img class="left-15" src="/Images/star.png" alt=""> --%>
            <b>Mã đơn hàng: <asp:Literal ID="lbCode" runat="server"></asp:Literal></b></p>
            <p><b>Họ tên:</b> <asp:Literal ID="lbName" runat="server"></asp:Literal></p>
            <p><b>Hình thức thanh toán:</b> <asp:Literal ID="lbHinhthuc" runat="server"></asp:Literal></p>
            <p><b>Tổng giá trị đơn hàng:</b> <span class="price"><asp:Literal ID="lbTotal" runat="server"></asp:Literal></span></p>
            <p>&nbsp;</p>
            <p> <b>Lưu ý:</b> Sau khi chuyển khoản Anh/Chị vui lòng gọi lại theo số máy bên dưới để xác nhận đã thanh toán và được hướng dẫn để nhận sản phẩm trong thời gian sớm nhất.</p>
            <p><b>Điện thoại: <asp:Repeater ID="rptHotline" runat="server">
    <ItemTemplate> <%# Eval("ONLINE_DESC") %> <%# Eval("ONLINE_NICKNAME")%> </ItemTemplate>
  </asp:Repeater></b></p>
            <p style="color: blue"> * Một lần nữa cám ơn và chúc Anh/Chị một ngày làm việc vui vẻ!</p>
          </div>
          <div class="row"> <a href="/" class="btn_web btn-primary btn-sm">Trở về trang chủ >></a> </div>
        </div>
      </div>
    </div>
    <!--end Order Success-->
  </div>
</asp:Content>
