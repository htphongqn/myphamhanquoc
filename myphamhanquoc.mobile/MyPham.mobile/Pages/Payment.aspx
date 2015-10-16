<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="Payment.aspx.cs" Inherits="MyPham.Pages.Payment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="path"> <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Thông tin giao hàng</a> </div>
      <!--Step 2-->
      <div class="box">
        <h1 class="box_Tab">Thông tin giao hàng</h1>       
        <div class="box_ct form_web" id="pay_form">
          <!--Section-->
          <div class="section">
            <div class="row_account">
              <asp:DropDownList ID="ddlPayment" runat="server" class="input-text">
                    <asp:ListItem Value="0">Chọn hình thức thanh toán</asp:ListItem>
                    <asp:ListItem Value="1">Thanh toán trước (Đối với khách hàng ở Tỉnh)</asp:ListItem>
                    <asp:ListItem Value="2">Thanh toán khi nhận hàng</asp:ListItem>
                </asp:DropDownList>
            </div>
            <div class="row_account">
              <input type="text" id="txtName" class="input-text" placeholder="Họ và tên của bạn" runat="server">
              <asp:RequiredFieldValidator ID="rfvHoVaTen" runat="server" ErrorMessage="Vui lòng nhập họ và tên"
                ControlToValidate="txtName" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <input type="text" id="txtPhone" class="input-text" placeholder="Số điện thoại - Ví dụ: 0909123456" runat="server">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Chưa nhập số điện thoại!"
                ControlToValidate="txtPhone" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <input type="text" id="txtEmail" class="input-text" placeholder="Email - Ví dụ: name@gmail.com" runat="server">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Chưa nhập e-mail!"
                ControlToValidate="txtEmail" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <input type="text" id="txtAddress" name="txtAddress" class="input-text" placeholder="Địa chỉ" runat="server">
              <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ!"
                ControlToValidate="txtAddress" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator>
            </div>
            <div class="row_account">
              <textarea class="input-text" placeholder="Lời nhắn" id="txtDesc" style="height: 100px" runat="server"></textarea>
            </div>
            <div class="row_account btn_payment">
                <asp:LinkButton ID="Lbthanhtoan" runat="server" class="btn_web btn_payment" OnClick="Lbthanhtoan_Click"
                    ValidationGroup="G40">Tiếp tục >></asp:LinkButton>
            </div>
          </div>
          <!--End Section-->
        </div>
      </div>
      <!--Mini Cart-->
      <div class="box">
        <div class="tab_menu">Thông tin đơn hàng</div>
        <div class="box_ct">
          <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand">
          <ItemTemplate>
          <!--Item Cart-->
          <div class="item_cart">
            <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
            <a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL")) %>"> 
                <img alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" class="img_cart" /></a>
            <div class="detail_cart fleft">
              <div class="cell name"> <span><a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"), Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></span></div>
              <div class="cell unit"> <span class="new"><%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
            </div>
            <div class="fright">
              <div class="cell amount dropdown_list">
                Số lượng: <%# Eval("Basket_quantity")  %>
              </div>
              <a id="ContentPlaceHolder1_Rpgiohang_LinkXoa_0" class="close" href="javascript:__doPostBack(&#39;ctl00$ContentPlaceHolder1$Rpgiohang$ctl00$LinkXoa&#39;,&#39;&#39;)">Xóa</a> 
              <asp:LinkButton ID="LinkXoa" CssClass="close" runat="server" CommandName="delete" CommandArgument='<%# Eval("news_id") %>'>Xóa</asp:LinkButton>
              </div>
          </div>
          <!--end Item Cart-->
          </ItemTemplate>
          </asp:Repeater>
          <div class="foo-cart">
            <div class="total-cart"> Tổng tiền:<span id="total-money"> <span id="ContentPlaceHolder1_Lbtotal"><asp:Label ID="Lbtotal" runat="server" Text=""></asp:Label></span> </span> </div>
          </div>
        </div>
      </div>
      <!--end Mini Cart-->
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
</asp:Content>
