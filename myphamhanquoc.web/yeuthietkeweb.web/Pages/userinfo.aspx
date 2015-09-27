<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true"
    CodeBehind="userinfo.aspx.cs" Inherits="yeuthietkeweb.Pages.userinfo" %>
<%@ Register src="../Usercontrols/left_customer.ascx" tagname="left_customer" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">

  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a></div>
    <!--Sidebar-->
    <uc1:left_customer ID="left_customer1" runat="server" />
    <!--end Sidebar-->
    <!--Main Column-->
    <div class="thirteen columns fr" id="main_content">
      <div class="inner_col">
        <!--User Info-->
        <div class="box whiteBg">
          <div class="box_Tab_main">
            <h1 class="title_page">Thông tin cá nhân</h1>              
          </div>
          <!--Form Login-->
          <div class="box_ct padd15 form_web div_payment">
            <div class="row_account"> <span class="left">Địa chỉ email:</span> <font color="blue"> <asp:Label ID="Lbemail" runat="server" Text="Label"></asp:Label></font> </div>
            <div class="row_account">
              <asp:TextBox ID="Txtname" runat="server" class="inputbox" placeholder="Họ và tên *"></asp:TextBox>
              <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên!"
                            ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>            
            </div>
            <div class="row_account">
              <asp:TextBox ID="Txtadd" runat="server" placeholder="Địa chỉ *" class="inputbox"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                            ControlToValidate="Txtadd" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <asp:TextBox ID="Txtphone" runat="server" class="inputbox" placeholder="Số điện thại *"></asp:TextBox>
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                            ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <asp:Button ID="btnSave" runat="server" ValidationGroup="G5" Cssclass="btn_web btn_payment"
                        OnClick="Lblogins_Click" Text="Lưu" />
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="G5" />
            </div>
          </div>
        </div>
        <!--End User Info-->
      </div>
    </div>
    <!--end Main Column-->
  </div>
</asp:Content>
