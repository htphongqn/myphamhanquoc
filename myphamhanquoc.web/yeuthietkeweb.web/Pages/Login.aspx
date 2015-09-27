<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="yeuthietkeweb.Pages.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<script src="../Resources/Ajax/login.js" type="text/javascript"></script>
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="container">
  <div class="box">
<div class="thirteen columns" id="main_content">
      <div class="inner_col">
        <!--Thong tin tai khoan-->
        <link rel="stylesheet" href="../Styles/account.css" type="text/css">
        <asp:Panel ID="pnel123" runat="server" DefaultButton="bt_login">
        <div class="box">
          <h1 class="box_Tab">Đăng nhập hệ thống</h1>
          <div class="inner_user_info">
            <div class="inner_2col">
              <div class="profile-row"> <span class="left">Email:</span>
                <div class="text">
                  <input class="input-txt" type="text" name="formUsername" id="txtEmail" runat="server"/>
                </div>
              </div>
              <div class="profile-row"> <span class="left">Mật khẩu:</span>
                <div class="text">
                  <input class="input-txt" type="password" name="formPassword" id="Txtpass" runat="server" />
                </div>
              </div>
              <div class="profile-row button_account">
              <asp:LinkButton id="bt_login" runat="server" OnClientClick="ajaxlogin();" CssClass="btn_web" href="javascript:void(0)"><b>Đăng nhập</b></asp:LinkButton>
              <%--<a href="/quen-mat-khau.html" class="forget_pass">Quên mật khẩu?</a>--%>
              <p class="text-error">
                <span id="loading-errors"></span></p>
                <p class="text-error"><span class="errors" style="color: #FF0000;"></span>
            </p>
              </div>
            </div>
          </div>
        </div>
        </asp:Panel>
        <!--End Thong tin tai khoan-->
      </div>
    </div>
</div>
</div>
</asp:Content>
