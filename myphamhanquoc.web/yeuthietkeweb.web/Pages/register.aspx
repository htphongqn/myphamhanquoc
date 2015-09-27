<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="yeuthietkeweb.Pages.register" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
<div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/dang-ky.html">Đăng ký</a></div>
    <!--Form Account-->
    <div class="box whiteBg">
      <div class="box_Tab_main">
        <h1 class="title_page">Đăng ký</h1>
      </div>
      <div class="box_ct padd15">
        <div class="signup form_web">
          <div class="row_account">
            <label class="item_title fl">Địa chỉ email:<span class="required">*</span></label>
            <input class="inputbox" type="text" id="txtEmail" runat="server" />
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập Email!"
                    ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="Email định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                ForeColor="Red" ValidationGroup="G401" Display="None">*</asp:RegularExpressionValidator>
          </div>
          <div class="row_account">
            <label class="item_title fl">Mật khẩu:<span class="required">*</span></label>
            <input class="inputbox" type="password" id="txtPassword" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập mật khẩu!"
                    ControlToValidate="txtPassword" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <label class="item_title fl">Nhập lại mật khẩu:<span class="required">*</span></label>
            <input class="inputbox" type="password" id="txtRepassword" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập xác nhận mật khẩu!"
                    ControlToValidate="txtRepassword" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToCompare="txtPassword" ControlToValidate="txtRepassword" ValidationGroup="G401"
                    ErrorMessage="Xác nhận mật khẩu chưa đúng!" ForeColor="Red" Display="None">*</asp:CompareValidator>
          </div>
          <div class="row_account">
            <label class="item_title fl">Họ tên:<span class="required">*</span></label>
            <input class="inputbox" type="text" id="txtFullname" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập họ tên!"
                    ControlToValidate="txtFullname" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <label class="item_title fl">Địa chỉ:</label>
            <input class="inputbox" type="text" id="txtAddress" runat="server">
          </div>
          <div class="row_account">
            <label class="item_title fl">Số di động:<span class="required">*</span></label>
            <input class="inputbox" type="text" id="txtPhone" runat="server" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                    ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G401">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <label class="item_title fl"> Mã an toàn:<span class="required">*</span></label>
            <input type="text" class="inputbox" id="txtCapcha" runat="server" style="float: left; width: 140px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Chưa nhập mã bảo vệ!"
                            ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
            <script type="text/javascript"  language="Javascript">
                function Catpc() {
                    var img = document.getElementById("icp");
                    img.src = "/Pages/captchr.ashx?query=" + Math.random();
                }
            </script>                    
            <img style="float: left; margin-left: 10px; width: 100px; height:32px" id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" />
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
            </div>
          <div class="row_account text">
              <asp:Label ID="lbMessage" runat="server" Text="" ForeColor="Red"></asp:Label>
            <asp:LinkButton ID="btnDangky" runat="server" CssClass="btn_web btn_payment send_cmt" 
                  Text="Đăng ký" ValidationGroup="G401" onclick="btnDangky_Click"></asp:LinkButton>
            <a class="btn_web btn_payment send_cmt reset_btn" onclick="reset();" href="javascript:void(0)"> Làm lại</a> 
          </div>
        </div>
      </div>
    </div>
    <!--end Form Account-->
  </div>
    
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="G401" />  
    <script type="text/javascript">
        function reset() {
            var email = document.getElementById("<%= txtEmail.ClientID %>");
            var pass = document.getElementById("<%= txtPassword.ClientID %>");
            var repass = document.getElementById("<%= txtRepassword.ClientID %>");
            var name = document.getElementById("<%= txtFullname.ClientID %>");
            var add = document.getElementById("<%= txtAddress.ClientID %>");
            var phone = document.getElementById("<%= txtPhone.ClientID %>");
            var capcha = document.getElementById("<%= txtCapcha.ClientID %>");
            email.value = pass.value = repass.value = name.value = add.value = phone.value = capcha.value = "";
        }
</script>
</asp:Content>
