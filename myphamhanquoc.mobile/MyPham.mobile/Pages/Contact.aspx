<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="yeuthietkeweb.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path"> <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Liên hệ</a> </div>
      <!--Contact-->
      <div id="account" class="box">
        <h1 class="box_Tab">Liên hệ</h1>
        <!--Form Contact-->
        <div class="box_ct form_web">
          <div class="row_account">
            <input type="text" placeholder="Họ và tên *" class="input-text" id="Txtname" name="Txtname" runat="server">
            <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ và tên!"
                ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <input type="text" placeholder="Địa chỉ *" class="input-text" id="Txtaddress" name="Txtaddress" runat="server">
          </div>
          <div class="row_account">
            <input type="text" placeholder="Số điện thoại *" class="input-text" id="txtPhone" name="txtPhone" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <input type="text" placeholder="Email *" class="input-text" id="txtEmail" name="txtEmail" runat="server">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
          </div>
          <div class="row_account">
            <input type="text" placeholder="Tiêu đề *" class="input-text" id="txttitle" name="txttitle" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập tiêu đề!"
                ControlToValidate="txttitle" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <textarea placeholder="Nội dung liên hệ *" class="input-text" rows="10" cols="45" id="txtContent" name="txtContent" runat="server"></textarea>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung!"
                ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
          </div>
          <div class="row_account">
            <input type="text" placeholder="Mã bảo vệ *" class="input-text" id="txtCapcha" name="txtCapcha" runat="server">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ!"
                ControlToValidate="txtCapcha" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
           
          </div>
          <div class="row_account">
            <label class="left_row"> </label>
             <script type="text/javascript"  language="Javascript">
                 function Catpc() {
                     var img = document.getElementById("icp");
                     img.src = "/Pages/captchr.ashx?query=" + Math.random();
                 }
            </script>                    
            <img id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" style="width:150px;"/>
            <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/Images/reloadpaf.png" /></a>
          </div>
          <div class="row_account">
            <label class="left_row"> </label>
            <asp:LinkButton ID="Lbthanhtoan" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn_web send_cmt btn_payment">Gửi</asp:LinkButton>
          </div>
        </div>
      </div>
      <div style="text-align: center">
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
            ShowSummary="False" ValidationGroup="G40" />                 
        <asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label>
    </div>
      <!--End Form Contact-->
</asp:Content>
