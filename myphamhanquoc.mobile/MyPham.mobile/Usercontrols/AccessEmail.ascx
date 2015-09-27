<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AccessEmail.ascx.cs" Inherits="MyPham.Usercontrols.AccessEmail" %>
<script src="/Ajax/Email.js" type="text/javascript"></script>
<div class="row_menu_f">
    <div class="title_col_footer">Đăng ký nhận mail</div>
    <div class="col_F_ct">
        <input name="Txtemail" type="text" id="Txtemail" class="inputMail" placeholder="Nhập email nhận tin..." style="color:#000;"/>
        <a href="javascript:void(0)" onclick="regis_mail()" class="submitMail">Đăng ký</a>
        <a id="loadingemail"></a>
    </div>
</div>