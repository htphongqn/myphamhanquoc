<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="yeuthietkeweb.Contact" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/lien-he.html">Liên hệ</a></div>
    <!--Contact-->
    <div class="box whiteBg">
      <div class="box_Tab_main">
        <h1 class="title_page">Liên hệ</h1>
      </div>
      <div class="box_ct padd15">
        <!--Info Contact-->
        <div class="eight columns">
          <div id="info_contact">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
          </div>
          <!--Form Contact-->
          <div class="form_web cf" id="contactus">
            <div><asp:Label ID="lblresult" runat="server" ForeColor="Red"></asp:Label></div>
            <div class="row_account">
              <label class="item_title fl">Họ và tên:<span class="required">*</span></label>
              <div class="row_right">
                <input type="text" class="inputbox" id="Txtname" runat="server">
                <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên!"
                                    ControlToValidate="Txtname" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="row_account">
              <label class="item_title fl">Địa chỉ:<span class="required">*</span></label>
              <div class="row_right">
                <input type="text" class="inputbox" id="Txtaddress" runat="server"> 
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                                    ControlToValidate="Txtaddress" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="row_account">
              <label class="item_title fl">Email:<span class="required">*</span></label>
              <div class="row_right">
                <input type="text" class="inputbox" id="txtEmail" runat="server">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập e-mail!"
                                    ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
                ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" Display="None"
                ForeColor="Red" ValidationGroup="G40"></asp:RegularExpressionValidator>
              </div>
            </div>
            <div class="row_account">
              <label class="item_title fl">Điện thoại:</label>
              <div class="row_right">
                <input type="text" class="inputbox" id="txtPhone" runat="server" />
              </div>
            </div>
            <div class="row_account">
              <label class="item_title fl">Nội dung liên hệ:<span class="required">*</span></label>
              <div class="row_right">
                <textarea rows="10" cols="45" id="txtContent" runat="server" class="inputbox"></textarea>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập nội dung!"
                                    ControlToValidate="txtContent" Display="None" ForeColor="Red" ValidationGroup="G40">*</asp:RequiredFieldValidator>
              </div>
            </div>
            <div class="row_account">
              <label class="item_title fl">Mã an toàn:<span class="required">*</span></label>
              <div class="row_right">
                    <input type="text" class="inputbox" id="txtCapcha" runat="server" style="float: left; width: 140px"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã bảo vệ!"
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
            </div>
            <div class="row_account row_button">
              <div class="required">* Thông tin bắt buộc nhập.</div>
              <asp:LinkButton ID="LinkButton1" runat="server" OnClick="Lbthanhtoan_Click" ValidationGroup="G40" CssClass="btn_web send_cmt"><span>Gửi</span></asp:LinkButton>
              <a class="btn_web send_cmt reset_btn" onclick="reset();" href="javascript:void(0)"><span>Làm lại</span></a>                
            </div>
          </div>
          <!--End Form Contact-->
        </div>
        <!--Map-->
        <div class="eight columns" id="map"><div class="inner_col">
          <asp:Literal ID="Literal2" runat="server"></asp:Literal>
        </div>
        <!--End Map-->
      </div>
    </div>
    <!--End Contact-->
  </div>

  <div style="text-align: center">
    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="G40" />
  </div>
</asp:Content>
