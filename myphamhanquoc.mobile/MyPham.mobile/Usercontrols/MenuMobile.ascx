<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MenuMobile.ascx.cs" Inherits="MyPham.Usercontrols.MenuMobile" %>

<div class="mobile_menu">
  <div class="fly_menu">
    <div class="main_nav">
      <ul>
        <li><a href="/"> <img src="/Resources/Images/home_icon.png" alt="" />Trang chủ</a> </li>
        <li><a id="all_cate_sidebar"><img alt="" src="/Resources/Images/all_menu_icon.png">Tất cả danh mục</a>
          <div class="main_nav" id="box_category">
            <ul>
              <asp:Repeater ID="Rpmenu" runat="server">
                <ItemTemplate>
                    <li class="cat-header"> <a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a>
                    <ul>
                        <asp:Repeater ID="rptItems" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <ItemTemplate>
                        <li> 
                            <a title="<%# Eval("CAT_NAME") %>" href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a>
                            <ul>
                                <asp:Repeater ID="rptItems1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                <ItemTemplate>
                                    <li><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a></li>
                                </ItemTemplate>
                                </asp:Repeater>
                            </ul>
                        </li>
                        </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                    </li>
                </ItemTemplate>
                </asp:Repeater>
            </ul>
          </div>
        </li>
        <li id="Dangnhap" runat="server"><a href="/dang-nhap-mobile.html"><img alt="" src="/Resources/Images/login_icon.png">Đăng nhập</a> </li>
        <li id="DangXuat1" runat="server"><a href="/quan-ly-tai-khoan-mobile.html"><img alt="" src="/Resources/Images/key_icon.png">Tài khoản của tôi</a> </li>
        <li><a href="regis.html"><img alt="" src="/Resources/Images/key_icon.png">Đăng ký</a> </li>
        <li id="DangXuat2" runat="server"><asp:LinkButton ID="lbtnDangXuat" runat="server" CausesValidation="False" OnClick="lbtnDangXuat_Click"><img alt="" src="/MOBILE/vi-vn/Images/logout-icon.png">Đăng xuất</asp:LinkButton></li>
      </ul>
      <div class="close_menu"> Đóng lại</div>
    </div>
  </div>
</div>