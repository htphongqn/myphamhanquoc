<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="thong-tin-ca-nhan.aspx.cs" Inherits="MyPham.Pages.thong_tin_ca_nhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="path"> <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Thông tin cá nhân</a> </div>
<!--User Info-->
<div class="box" id="account">
<h1 class="box_Tab">Thông tin cá nhân</h1>
<!--Form Login-->
<div class="box_ct form_web">
    <div class="row_account"> 
        <span class="left">Địa chỉ email:</span> <font color="blue"> <span id="ContentPlaceHolder1_Lbemail"><asp:Label ID="Lbemail" runat="server"></asp:Label></span></font> </div>
    <div class="row_account">
        <asp:TextBox ID="Txtname" runat="server" class="input-text" 
                placeholder="Họ và tên *"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Họ và tên không được để trống!"
                    ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <asp:TextBox ID="Txtadd" runat="server" class="input-text" 
                placeholder="Địa chỉ *"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Địa chỉ không được để trống!"
                    ControlToValidate="Txtadd" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <asp:TextBox ID="Txtphone" runat="server" class="input-text" 
                placeholder="Số điện thoại *"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Số điện thoại không được để trống!"
                    ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
    </div>
    <div class="row_account">
        <asp:Button ID="btnFinish" runat="server" Text="Lưu" class="btn_web btn_payment" OnClick="btnFinish_Click" ValidationGroup="G5"/>
    </div>
</div>
</div>
<!--End User Info-->
<asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
    ShowSummary="False" ValidationGroup="G5" />
<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="Txtphone"
    ErrorMessage="Số điện thoại ít nhất 10 số và không khoảng trống" SetFocusOnError="True"
    ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d{9,40}$" ForeColor="Red"
    ValidationGroup="G5"></asp:RegularExpressionValidator>
</asp:Content>
