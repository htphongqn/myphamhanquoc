<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true"
    CodeBehind="change_pass.aspx.cs" Inherits="yeuthietkeweb.Pages.change_pass" %>
<%@ Register src="../Usercontrols/left_customer.ascx" tagname="left_customer" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">

  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/doi-mat-khau.html">Đổi mật khẩu</a></div>
    <!--Sidebar-->
    <uc1:left_customer ID="left_customer1" runat="server" />
    <!--end Sidebar-->
    <!--Main Column-->
    <div class="thirteen columns fr" id="main_content">
      <div class="inner_col">
        <!--Forget Pass-->
        <div class="box whiteBg">
          <div class="box_Tab_main">
            <h1 class="title_page">Đổi mật khẩu</h1>
          </div>
          <div class="box_ct whiteBg padd15 form_web div_payment">
            <div class="row_account"> <span class="item_title fl">Mật khẩu cũ: <span class="required">*</span></span>
              <input name="Txtpassold" id="Txtpassold" runat="server" type="password" class="inputbox"/>
              <asp:RequiredFieldValidator ID="rfvPassold" runat="server" ErrorMessage="Chưa nhập mật khẩu củ"
                            ControlToValidate="Txtpassold" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>

            <div class="row_account"> <span class="item_title fl">Mật khẩu mới: <span class="required">*</span></span>
              <input name="Txtpassnew" id="Txtpassnew" runat="server" type="password" class="inputbox" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập nhập mật khẩu mới"
                            ControlToValidate="Txtpassnew" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>

            <div class="row_account"> <span class="item_title fl">Nhập lại mật khẩu: <span class="required">*</span></span>
              <input name="Txtrepass" id="Txtrepass" runat="server" type="password" class="inputbox" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập nhập lại mật khẩu mới"
                            ControlToValidate="Txtrepass" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" Display="None"  ValidationGroup="G5"
                    ErrorMessage="Nhập lại mật khẩu không đúng" ControlToCompare="Txtpassnew"  ForeColor="Red" 
                    ControlToValidate="Txtrepass">*</asp:CompareValidator> </div>

            <div class="row_account div_payment">
                <asp:LinkButton ID="Lblogins" runat="server" ValidationGroup="G5" CssClass="btn_web btn_payment"
                        OnClick="Lblogins_Click">Lưu</asp:LinkButton> 
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G5" />                    
            </div>
          </div>
        </div>
        <!--end Forget Pass-->
      </div>
    </div>
    <!--end Main Column-->
  </div>
</asp:Content>
