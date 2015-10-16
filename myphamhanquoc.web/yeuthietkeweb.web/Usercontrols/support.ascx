<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="support.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.support" %>
<!--Support Special Order-->

<div id="support_online" class="popup-hide"> <a href="javascript:;" id="buttonAdv"><i class="ico support_ico"></i>HỖ TRỢ ĐƠN HÀNG ĐẠI LÝ</a>
  <div class="content">
    <p>Đối với những đơn hàng lớn từ 30 triệu đồng. Để được báo giá đặc biệt. Hãy gửi cho chúng tôi tại đây</p>
    <div class="form_web cf" id="spp_cargo">
      <div class="row_account">
        <textarea name="ctl00$TopPage1$txtDesc" rows="2" cols="20" id="TopPage1_txtDesc" class="input-txt textarea-txt" placeholder="Nhập nội dung đơn hàng hoặc đính kèm file" style="height:70px; margin-bottom: 10px"></textarea>
        <input type="file" name="ctl00$TopPage1$FileUpload1" id="TopPage1_FileUpload1" />
      </div>
      <div class="row_account">
        <input name="ctl00$TopPage1$txtName" type="text" id="TopPage1_txtName" class="input-txt" placeholder="Tên bạn" />
      </div>
      <div class="row_account">
        <input name="ctl00$TopPage1$txtEmail" type="text" id="TopPage1_txtEmail" class="input-txt" placeholder="Email" />
      </div>
      <div class="row_account">
        <input name="ctl00$TopPage1$Txtphone" type="text" id="TopPage1_Txtphone" class="input-txt" placeholder="Số điện thoại" />
      </div>
      <div class="row_account"> <a id="ContentRight_LinkButton1" class="btn_web send_cmt" href="javascript:WebForm_DoPostBackWithOptions(new WebForm_PostBackOptions(&quot;ctl00$ContentRight$LinkButton1&quot;, &quot;&quot;, true, &quot;G40&quot;, &quot;&quot;, false, true))"><span>Gửi</span></a> </div>
    </div>
  </div>
</div>
<!--End Support Special Order-->
<div id="hotline_fix"> <span>
  <asp:Repeater ID="rptHotline" runat="server">
    <ItemTemplate> <%# Eval("ONLINE_DESC") %> <%# Eval("ONLINE_NICKNAME")%> </ItemTemplate>
  </asp:Repeater>
  </span>
  <div style="display: none">
    <asp:Repeater ID="rptSupport" runat="server">
      <ItemTemplate> <%# Eval("ONLINE_NICKNAME")%>&nbsp;</span> <a href="skype:<%# Eval("ONLINE_FIELD1") %>?chat" title="Nhấp chuột để chát với <%# Eval("ONLINE_DESC") %>" class="iconSkype"><%# Eval("ONLINE_DESC") %><img alt="" src="/Resources/images/iconSkype.jpg"> </a> </ItemTemplate>
    </asp:Repeater>
  </div>
</div>
