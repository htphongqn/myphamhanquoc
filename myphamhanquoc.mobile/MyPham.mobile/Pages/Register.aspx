<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="MyPham.Pages.Register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="path"> <a href="/">Trang chủ</a> &gt; <a href="#" class="aLink1">Đăng nhập</a> </div>
<!--Register Page-->
<div class="box" id="account">
<div class="box_Tab">
    <h1 class="tt_tab"><span>Đăng ký</span></h1>
</div>
<!--Form Login-->
<div class="box_ct regis_form form_web">
    <div class="row_account">
        <input type="text" id="txtEmail" class="input-text" placeholder="Địa chỉ email *" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
            ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="password" id="txtPassword1" class="input-text" placeholder="Mật khẩu *" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Vui lòng nhập mật khẩu"
            ControlToValidate="txtPassword1" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="password" id="txtRePassword" class="input-text" placeholder="Nhập lại mật khẩu *" runat="server"/>
        <asp:RequiredFieldValidator ID="rfvRePassword" runat="server" ErrorMessage="Vui lòng nhập xác nhận mật khẩu"
            ControlToValidate="txtRePassword" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="text" id="txtName" class="input-text" placeholder="Họ và tên *" runat="server"/>
        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên"
            ControlToValidate="txtName" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="text" id="txtadd" class="input-text" placeholder="Địa chỉ *" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ"
            ControlToValidate="txtadd" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="text" id="txtphone" class="input-text" placeholder="Số điện thoại *" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập số điện thoại"
            ControlToValidate="txtphone" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="text" id="txtcode" class="input-text" placeholder="Mã bảo vệ *" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Vui lòng nhập mã bảo vệ"
            ControlToValidate="txtcode" Display="Dynamic" ForeColor="Red" ValidationGroup="G8">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account"> 
        <script type="text/javascript"  language="Javascript">
            function Catpc() {
                var img = document.getElementById("icp");
                img.src = "/Resources/captchr.ashx?query=" + Math.random();
            }
            </script>                    
            <img id="icp" src='/Resources/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" style="width:170px;"/>
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/Images/reloadpaf.png" /></a>
    </div>
    <div class="row_account text">
          <asp:LinkButton ID="Lbregis" runat="server" class="btn_web btn_payment" OnClick="Lbregis_Click"
                        ValidationGroup="G8">Đăng ký</asp:LinkButton>
    </div>
    <div style="text-align: center"> <span id="ContentPlaceHolder1_Labelerrors"></span> </div>
    <!--End Form Login-->
</div>
</div>
<!--End Register Page-->
<div style="text-align: center">
    <asp:Label ID="Labelerrors" runat="server" Text=""></asp:Label>
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
        ShowSummary="False" ValidationGroup="G8" />
    <asp:CompareValidator ID="comparePasswords" runat="server" ControlToCompare="txtPassword1"
        ControlToValidate="txtRePassword" ErrorMessage="Mật khẩu xác nhận nhập không đúng!"
        Display="Dynamic" ForeColor="Red" />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone"
        ErrorMessage="Số điện thoại ít nhất 10 số và không khoảng trống" SetFocusOnError="True"
        ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" ForeColor="Red"
        ValidationGroup="G8"></asp:RegularExpressionValidator>
    <br />
    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="txtemail"
        ErrorMessage="Địa chỉ email nhập không đúng định dạng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
        ForeColor="Red" ValidationGroup="G8"></asp:RegularExpressionValidator>
</div>
</asp:Content>
