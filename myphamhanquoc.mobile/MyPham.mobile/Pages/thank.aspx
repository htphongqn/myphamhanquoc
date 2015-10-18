<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="thank.aspx.cs" Inherits="MyPham.Pages.thank" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="box" id="thanks">
<div class="box">
    <div class="box_ct whiteBg padd15">
    <div id="orderInfo"> <img src="http://www.hoasaigon.com.vn/images/body.png" alt="" width="217" class="img_general" />
        <div class="row">
        <p> <img alt="" class="left-15" src="/Resources/Images/star.png"> <strong>Xin chào Anh/Chị <asp:Label ID="lblName" runat="server"></asp:Label>!</strong></p>
        <p> Em là trưởng bộ phận quản lý đơn hàng của website: websitemypham.com</p>
        <p> Cảm ơn Anh/Chị đã đặt mua sản phẩm</p>
        <p> Em xin phép gửi thông tin đơn hàng của Anh/Chị như sau:</p>
        <p>&nbsp;</p>
        <p><img class="left-15" src="/Resources/Images/star.png" alt=""> <b>Mã đơn hàng: <asp:Label ID="lblCode" runat="server" Text="" ForeColor="Blue"></asp:Label></b></p>
        <p><b>Họ tên:</b> <asp:Label ID="lblName1" runat="server"></asp:Label></p>
        <p><b>Hình thức thanh toán:</b> <asp:Label ID="lblPayment" runat="server"></asp:Label></p>
        <p><b>Tổng giá trị đơn hàng:</b> <span class="price"><asp:Label ID="lblPayAll" runat="server"></asp:Label></span></p>
        <p>&nbsp;</p>
        <p> <b>Lưu ý:</b> Sau khi chuyển khoản Anh/Chị vui lòng gọi lại theo số máy bên dưới để xác nhận đã thanh toán và được hướng dẫn để nhận sản phẩm trong thời gian sớm nhất.</p>
        <p><b>Điện thoại: 0948 010 414 - 0988 111 414</b></p>
        <p style="color: blue"> * Một lần nữa cám ơn và chúc Anh/Chị một ngày làm việc vui vẻ!</p>
        </div>
        <div class="row"> <a href="/" class="btn_web btn-primary btn-sm">Trở về trang chủ >></a> </div>
    </div>
    </div>
</div>
</div>
</asp:Content>
