<%@ Page Title="" Language="C#" MasterPageFile="~/Masterpages/Default.Master" AutoEventWireup="true" CodeBehind="cart-result.aspx.cs" Inherits="yeuthietkeweb.vi_vn.cart_result" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
<asp:Literal ID="ltrFavicon" runat="server" EnableViewState="false"></asp:Literal>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
<div class="path"> <a href="/">Trang chủ</a> &gt; <a class="aLink1" href="#">Giỏ hàng</a> </div>
<!--Cart-->
<div class="box">
<div class="box_Tab">
    <h1 class="tt_tab"><span>Giỏ hàng của bạn</span></h1>
</div>
<div class="box_ct">
    <asp:Repeater ID="Rpgiohang" runat="server" OnItemCommand="Rpgiohang_ItemCommand" OnItemDataBound="Rpgiohang_OnItemDataBound">
    <ItemTemplate>
    <div class="item_cart">
    <input type="hidden" value='<%# Eval("news_id") %>' id="newsid" runat="server" />
    <a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>">
            <img alt="" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" class="img_cart" /></a>
    <div class="detail_cart fleft">
        <div class="cell name"> <span><a target="_parent" href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></span></div>
        <div class="cell unit"> <span class="new"><%# String.Format("{0:0,0 VNĐ}", Eval("Basket_Price")).Replace(",",".")%></span></div>
    </div>
    <div class="fright">
        <div class="cell amount dropdown_list">
        <asp:DropDownList ID="ddlQuanTiTy" runat="server" OnSelectedIndexChanged="ddlQuanTiTy_SelectedIndexChanged" AutoPostBack="true">
            <asp:ListItem Value="1">1</asp:ListItem>
            <asp:ListItem Value="2">2</asp:ListItem>
            <asp:ListItem Value="3">3</asp:ListItem>
            <asp:ListItem Value="4">4</asp:ListItem>
            <asp:ListItem Value="5">5</asp:ListItem>
            <asp:ListItem Value="6">6</asp:ListItem>
            <asp:ListItem Value="7">7</asp:ListItem>
            <asp:ListItem Value="8">8</asp:ListItem>
            <asp:ListItem Value="9">9</asp:ListItem>
            <asp:ListItem Value="10">10</asp:ListItem>
            <asp:ListItem Value="11">11</asp:ListItem>
            <asp:ListItem Value="12">12</asp:ListItem>
            <asp:ListItem Value="13">13</asp:ListItem>
            <asp:ListItem Value="14">14</asp:ListItem>
            <asp:ListItem Value="15">15</asp:ListItem>
            <asp:ListItem Value="16">16</asp:ListItem>
            <asp:ListItem Value="17">17</asp:ListItem>
            <asp:ListItem Value="18">18</asp:ListItem>
            <asp:ListItem Value="19">19</asp:ListItem>
            <asp:ListItem Value="20">20</asp:ListItem>
        </asp:DropDownList>
        </div>
        <asp:LinkButton ID="LinkXoa" runat="server" CommandName="delete" CommandArgument='<%# Eval("BASKET_ID") %>' class="close">Xóa</asp:LinkButton>
        </div>
    </div>
    </ItemTemplate>
    </asp:Repeater>
    <div class="foo-cart">
    <div class="total-cart"> Tổng tiền:<span id="total-money"> <span id="ContentPlaceHolder1_Lbtotal"><asp:Label ID="Lbtotal" runat="server" ></asp:Label></span> </span> </div>
    </div>
    <div class="button_cart" style="float:left;width:100%">
        <a href="/thanh-toan.html" class="btn_web btn_payment">Tiến hành đặt hàng »</a> 
        <a href="/" class="btn_web btn_payment">Mua thêm sản phẩm khác</a>
    </div>
</div>
</div>
<!--End Cart-->
</asp:Content>
