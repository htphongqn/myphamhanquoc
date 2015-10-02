<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="forgetpass.ascx.cs"
    Inherits="yeuthietkeweb.web.Usercontrols.forgetpass" %>
<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc2" %>
<asp:Panel ID="Panel3" runat="server" CssClass="hidden panelforget">
    <div style="width: 2349px; height: 15347px; display: block;" id="dShadow" class="shadows">
    </div>
    <div style="top: 70px; position: absolute; left: 27%; z-index: 99999" class="popup"
        id="dPopUp">
        <div class="popup-bg" style="height: 350px">
            <div class="popup-title">               
                <h3 style="font-size: 20px; margin-top: 20px; margin-left: 20px;">  Cấp lại mật khẩu</h3>
            </div>
            <div class="popup-form">
                <div id="div3" runat="server">
                    <p class="text input-text">
                        <label>
                            E-mail * :</label>
                        <input type="text" name="txtemail" id="Txtmailforget" runat="server" style="width: 230px" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa nhập e-mail!"
                            ControlToValidate="Txtmailforget" Display="Dynamic" ForeColor="Red" ValidationGroup="G7"
                            CssClass="tlp-error">*</asp:RequiredFieldValidator>
                    </p>
                    <p class="text input-text">
                    <label>
                            Captcha :</label>
                        <script type="text/javascript"  language="Javascript">
                            function Catpc() {
                                var img = document.getElementById("icp");
                                img.src = "/Pages/captchr.ashx?query=" + Math.random();
                            }
                    </script>                    
                    <img style="float: left; margin-left: 10px; width: 100px; height:32px" id="icp" src='/Pages/captchr.ashx?query=<%= querys() %>' alt="Mã  an toàn" />
                    <a href="javascript:void(0)" onclick="javascript:Catpc();"><img title="Refresh" src="/Resources/images/reloadpaf.png" /></a>
                    </p>
                    <p class="text input-text">
                        <label>
                            Nhập captcha :</label>
                        <asp:TextBox ID="Textcapchaforget" runat="server" Width="235px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa nhập mã captcha!"
                            ControlToValidate="Textcapchaforget" Display="Dynamic" ForeColor="Red" ValidationGroup="G7">*</asp:RequiredFieldValidator>
                    </p>
                    <div class="button">
                        <asp:LinkButton ID="Lbforgetpass" runat="server" OnClick="Lbforgetpass_Click" ValidationGroup="G7"
                            Style="background: #f17800; -webkit-border-radius: 5px; -moz-border-radius: 5px;
                            border-radius: 5px;"><b>Gửi</b></asp:LinkButton>
                        <p id="P2" class="text-error">
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="Txtmailforget"
                                ErrorMessage="E-mail định dạng chưa đúng!" ForeColor="Red" SetFocusOnError="True"
                                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="G8"></asp:RegularExpressionValidator>
                            <br />
                            <asp:Label ID="Lbforgeterrors" runat="server" Text=""></asp:Label>
                            <br />
                            <asp:Label ID="Label1" runat="server" ForeColor="#FF3300" Text="Mã Xác Nhận Không Đúng"></asp:Label>
                        </p>
                    </div>
                    <p class="text-note">
                    </p>
                </div>
                <div id="div5" runat="server" style="text-align: center; margin-top: 100px">
                    <span>Chúng Tôi Đã Gửi Yêu Cầu Mật Khẩu Của Bạn Về Hộp Thư </span><a href="/"
                        style="font-size: 14px; color: Red">Về Trang Chủ</a>
                </div>
            </div>
            <i class="popup-close" onclick="tatquyenmk()"></i>
        </div>
    </div>
</asp:Panel>
<script type="text/javascript">
    function showquyenmk() {
        $('.login_div').addClass("hidden");
        $('.panelforget').removeClass("hidden");
    }
    function tatquyenmk() {
        $('.panelforget').addClass("hidden");
    }
</script>
