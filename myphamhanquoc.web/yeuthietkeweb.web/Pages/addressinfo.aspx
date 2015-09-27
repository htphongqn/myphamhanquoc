<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/SiteVI.Master" AutoEventWireup="true"
    CodeBehind="addressinfo.aspx.cs" Inherits="yeuthietkeweb.Pages.addressinfo" %>
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
        <!--Address-->
        <div class="box whiteBg">
          <div class="box_Tab_main">
            <h1 class="title_page">Địa chỉ giao hàng</h1>
          </div>
          <div class="box_ct padd15 form_web div_payment">
            <div class="row_account"> <span class="item_title fl">Địa chỉ : <span class="required">*</span></span>
              <asp:TextBox ID="Txtadd" runat="server" class="inputbox"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Chưa nhập địa chỉ"
                            ControlToValidate="Txtadd" Display="None" ForeColor="Red" ValidationGroup="G5">*</asp:RequiredFieldValidator> 
              </div>

            <div id="ContentPlaceHolder1_UpdatePanel1">
              <div class="row_account"> <span class="item_title fl">Tỉnh/TP: <span class="required">*</span></span>
                <asp:DropDownList ID="Drcity" runat="server" CssClass="inputbox" AutoPostBack="True" OnSelectedIndexChanged="Drcity_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Chưa chọn thành phố"
                        ControlToValidate="Drcity" Display="None" ForeColor="Red" ValidationGroup="G5"
                        InitialValue="0">*</asp:RequiredFieldValidator>
                <span style="color:Red;display:none;" id="ContentPlaceHolder1_RequiredFieldValidator5">*</span> </div>
              <div class="row_account"> <span class="item_title fl">Quận/Huyện: <span class="required">*</span></span>
                <asp:DropDownList ID="Drdistric" runat="server" CssClass="inputbox">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Chưa chọn quận huyện"
                                    ControlToValidate="Drdistric" Display="None" ForeColor="Red" ValidationGroup="G5"
                                    InitialValue="0">*</asp:RequiredFieldValidator></div>
            </div>
            <div class="row_account div_payment"> 
                <asp:LinkButton ID="Lblogins" runat="server" ValidationGroup="G5" CssClass="btn_web btn_payment"
                        OnClick="Lblogins_Click">Lưu</asp:LinkButton>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True"
                        ShowSummary="False" ValidationGroup="G5" />     
            </div>
          </div>
        </div>
        <!--end Address-->
      </div>
    </div>
    <!--end Main Column-->
  </div>
</asp:Content>
