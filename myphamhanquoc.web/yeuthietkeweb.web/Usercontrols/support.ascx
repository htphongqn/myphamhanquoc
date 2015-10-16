<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="support.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.support" %>
<!--Support Special Order-->

<div id="support_online" class="popup-hide"> <a href="javascript:;" id="buttonAdv"><i class="ico support_ico"></i>HỖ TRỢ ĐƠN HÀNG ĐẠI LÝ</a>
  <div class="content">
    <p>Đối với những đơn hàng lớn từ 30 triệu đồng. Để được báo giá đặc biệt. Hãy gửi cho chúng tôi tại đây</p>
    <div class="form_web cf" id="spp_cargo">
      <div class="row_account">
        <textarea rows="2" cols="20" id="txtDesc" runat="server" class="input-txt textarea-txt" placeholder="Nhập nội dung đơn hàng hoặc đính kèm file" style="height:70px; margin-bottom: 10px"></textarea>
          <asp:FileUpload ID="FileUpload1" runat="server" />
          <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập nội dung!"
                                    ControlToValidate="txtDesc" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
      </div>
      <div class="row_account">
        <input type="text" id="txtName" runat="server" class="input-txt" placeholder="Tên bạn" />
        <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên!"
                                    ControlToValidate="txtName" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
      </div>
      <div class="row_account">
        <input type="text" id="txtEmail" runat="server" class="input-txt" placeholder="Email" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập e-mail!"
                                    ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
      </div>
      <div class="row_account">
        <input type="text" id="Txtphone" runat="server" class="input-txt" placeholder="Số điện thoại" />
        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                                    ControlToValidate="Txtphone" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
      </div>
      <div class="row_account">
          <asp:LinkButton ID="lnkbtnGui" runat="server" CssClass="btn_web send_cmt"  ValidationGroup="G40" 
              onclick="lnkbtnGui_Click"><span>Gửi</span></asp:LinkButton>
              <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="G40" />
      </div>
    </div>
  </div>
</div>
<!--End Support Special Order-->
<div id="hotline_fix"> <span>
  <asp:Repeater ID="rptHotline" runat="server">
    <ItemTemplate> <%# Eval("ONLINE_DESC") %> <%# Eval("ONLINE_NICKNAME")%> </ItemTemplate>
  </asp:Repeater>
  </span>
</div>
