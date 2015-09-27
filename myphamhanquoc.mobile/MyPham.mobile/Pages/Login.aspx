<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MyPham.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="path"> <a href="/">Trang chủ</a> &gt; <a href="#" class="aLink1">Đăng nhập</a> </div>
<!--Login Page-->
<div class="box" id="account">
<div class="box_Tab">
    <h1 class="tt_tab"><span>Đăng nhập</span></h1>
</div>
<!--Form Login-->
<div class="box_ct login_form form_web">
    <div class="row_account">
        <input type="text" id="txtEmail" class="input-text" placeholder="Địa chỉ email" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Vui lòng nhập địa chỉ email"
            ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G45">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <input type="password" id="txtPassword" class="input-text" placeholder="Mật khẩu" runat="server"/>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Vui lòng nhập mật khẩu"
            ControlToValidate="txtPassword" Display="None" ForeColor="Red" ValidationGroup="G45">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account text"> 
        <asp:LinkButton ID="btnFinish" class="btn_web btn_payment" runat="server" 
                 ValidationGroup="G45" onclick="btnFinish_Click" >Đăng nhập</asp:LinkButton>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G45" />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail" Display="None"
                ErrorMessage="Địa chỉ email nhập không đúng định dạng" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G45"></asp:RegularExpressionValidator>
        <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
    </div>
    <div class="row_account text"> <a class="forgot_pass" href="/dang-ky.html">Bạn chưa có tài khoản?</a> </div>
</div>
<!--End Form Login-->
</div>
<!--End Login Page-->
</asp:Content>
