<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true"
    CodeBehind="Payment.aspx.cs" Inherits="yeuthietkeweb.Pages.Payment" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="server">
    
  <div class="main cf">
    <div class="path"><a href="/trang-chu.html">Trang chủ</a> » <a href="/thanh-toan.html">Giỏ hàng</a></div>
    <!--Payment page-->
    <div class="box">
      <!--Form Payment-->
      <div class="eight columns whiteBg form_web form_payment">
        <div class="box_Tab_main">
          <h1 class="title_page">Thông tin thanh toán</h1>
        </div>
        <div class="box_ct padd15">
          <div class="row_account">
            <label class="item_title fl">Hình thức thanh toán:<span class="required">*</span></label>
            <div class="dropdown_list">
              <asp:DropDownList ID="ddlPayment" runat="server" class="inputbox">
                    <asp:ListItem Value="0">--- Chọn hình thức thanh toán ---</asp:ListItem>
                    <asp:ListItem Value="1">Nhận hàng tại cửa hàng</asp:ListItem>
                    <asp:ListItem Value="2">Giao hàng tại nhà</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn hình thức thanh toán!"
                    ControlToValidate="ddlPayment" Display="None" ForeColor="Red" ValidationGroup="G5"
                    InitialValue="0">*</asp:RequiredFieldValidator>
              </div>
          </div>
          <div class="row_account">
            <label class="item_title fl"> Họ tên:<span class="required">*</span></label>
            <input type="text" name="txtName" id="txtName" runat="server" class="inputbox" />
                    <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Chưa nhập họ tên!"
                        ControlToValidate="txtName" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>
          <div class="row_account">
            <label class="item_title fl"> Email:<span class="required">*</span></label>
            <input type="text" name="txtEmail" id="txtEmail" runat="server" class="inputbox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập e-mail!"
                        ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>
          <div class="row_account">
            <label class="item_title fl"> Địa chỉ:<span class="required">*</span></label>
            <input type="text" class="inputbox" id="txtAddress" runat="server" />            
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                        ControlToValidate="txtAddress" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>
          <div class="row_account">
            <label class="item_title fl">Số Điện thoại:<span class="required">*</span></label>
            <input type="text" name="txtPhone" id="txtPhone" runat="server" class="inputbox" />
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                        ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator></div>
          <div class="row_account">
            <label class="item_title fl">Ghi chú:</label>
            <textarea type="text" name="txtDesc" id="txtDesc" runat="server"  class="inputbox" style="height: 100px"></textarea></div>
          <div class="row_account row_button"> 
            <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web btn_payment fl" OnClick="Lbthanhtoan_Click" ValidationGroup="G5">Thanh toán</asp:LinkButton>
            <a href="javascript:void(0)" onclick="reset();" class="btn_web btn_payment reset_btn fl">Làm lại</a>
          </div>
        </div>
      </div>
      <!--end Form Payment-->
      <!--Info Cart-->
      <div class="eight columns" id="info_cargo">
        <div class="inner_col whiteBg">
          <div class="box_Tab_main">
            <div class="title_page">Thông tin đơn hàng</div>
          </div>
          <div class="box_ct padd15">
             <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
                <ItemTemplate>
                    <!--Item Cart-->
                    <div class="item_cart">
                      <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
                      <a target="_parent" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL")) %>'> <img alt="" src='<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>' class="img_cart" /></a>
                      <div class="detail_cart fl">
                        <div class="cell name"> <span><a target="_parent" href='<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL")) %>'> <%# Eval("NEWS_TITLE") %></a></span></div>
                        <div class="cell unit"> <span class="new"> <%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
                      </div>
                      <div class="info_item_cart fr">
                        <div class="cell amount dropdown_list"> Số lượng: <%# Eval("Basket_quantity")  %> </div>
                        <asp:LinkButton ID="LinkXoa" CssClass="close fr cf" runat="server" CommandName="delete" CommandArgument='<%# Eval("news_id") %>'><img src="/Resources/Images/remove_cart.png" alt="Xóa" /></asp:LinkButton> </div>
                    </div>
                    <!--end Item Cart-->
                </ItemTemplate>
            </asp:Repeater>
            <div class="foo-cart">
              <div class="total-cart"> Tổng tiền:<span id="total-money"> <asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label> </span> </div>
            </div>
          </div>
        </div>
      </div>
      <!--End Info Cart-->
    </div>
    <!--End Payment Page-->
  </div>


  <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G5" />
  <div style="text-align: center">
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtEmail"
            ErrorMessage="E-mail định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
            ForeColor="Red" Display="None" ValidationGroup="G5"></asp:RegularExpressionValidator>
        <br />
        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtPhone"
            ErrorMessage="Số điện thoại định dạng chưa đúng!" SetFocusOnError="True" ValidationExpression="^\+?(\d[\d-. ]+)?(\([\d-. ]+\))?[\d-. ]+\d$"
            ForeColor="Red" Display="None" ValidationGroup="G5"></asp:RegularExpressionValidator>
    </div>
  <script type="text/javascript">
      function reset() {
          var name = document.getElementById("<%= txtName.ClientID %>");
          var email = document.getElementById("<%= txtEmail.ClientID %>");
          var add = document.getElementById("<%= txtAddress.ClientID %>");
          var desc = document.getElementById("<%= txtDesc.ClientID %>");
          var phone = document.getElementById("<%= txtPhone.ClientID %>");
          name.value = email.value = add.value = desc.value = phone.value = "";
      }
    </script>
</asp:Content>
