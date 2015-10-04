<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="top_main.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.top_main" %>
<%@ Register Src="forgetpass.ascx" TagName="forgetpass" TagPrefix="uc2" %>
<link href="../Resources/Styles/login_popup.css" rel="stylesheet" type="text/css" />

<div class="top_main">
  <div class="container">
    <div class="sitenav">
      <ul>
        <li class="homecatalog"><span class="homecataloglabel"><span class="shapes round"><em class="shapes bottom"></em></span>Danh mục sản phẩm</span>
          <ul class="nav_menu">            
            <asp:Repeater ID="Rpmenu" runat="server">
                <ItemTemplate>
                    <li class="m_li">
                        <i class="icon_cate"><img src="<%#GetImage_Cat(Eval("CAT_ID"),Eval("CAT_IMAGE1"))%>" /></i>
                        <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>"  title="<%#Eval("CAT_NAME") %>" class="t_menu"><%#Eval("CAT_NAME") %></a>
                        <div class="list_categories" id="listcate" runat="server" visible='<%# DisplayLoad_Menu2(Eval("Cat_ID")) %>'> 
                            <%--<span class="backgroundMenu"> <img src="<%#GetImage_Cat(Eval("CAT_ID"),Eval("CAT_IMAGE2"))%>" width="100%"> </span>--%>
                            <div class="subcatwrapper">
                                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                    <ItemTemplate>
                                        <div class="pc_menu">
                                            <p> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"><%#Eval("CAT_NAME") %></a> </p>
                                            <div class="cf"> </div>
                                            </div>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </div>
                        </div>
                        </li>
                </ItemTemplate>
            </asp:Repeater>
          </ul>
        </li>
      </ul>
    </div>
    <!--Search Tool-->
    <div class="search_tool fl">
      <div class="allcate_seach fl">
        <div class="dropdown_list">
          <asp:DropDownList ID="ddlSearchCatsProduct" runat="server" CssClass="inputbox" DataTextField="CAT_NAME" DataValueField="CAT_ID"></asp:DropDownList>
        </div>
      </div>   
          <script type="text/javascript">

              function clickButton(e, buttonid) {
                  var evt = e ? e : window.event;
                  var bt = document.getElementById(buttonid);

                  if (bt) {
                      if (evt.keyCode == 13) {
                          bt.click();
                          return false;
                      }
                  }
              }  
        </script>   
      <input id="Txtsearch" runat="server" type="text" value="Từ khóa tìm kiếm" onclick="this.value=''" onblur="if(this.value=='') this.value='Từ khóa tìm kiếm'" onfocus="if(this.value=='Từ khóa tìm kiếm') this.value=''" class="inputSearch" />
      <asp:LinkButton ID="Lbsearch" runat="server" CssClass="submitSearch" OnClick="Lbsearch_Click"><span class="icon_search"></span></asp:LinkButton>
    </div>
    <!--End Search Tool-->
    <!--Account Link-->
    <div id="nav_top" class="fr">
      <!--Login-->
      <div id="div_login" runat="server" class="login_area filter_name"><span class="tt_linktop">Đăng nhập</span>
        <div class="contentEGP popup_login" id="dpop">
          <div class="input_form">
            <label for="LoginForm_email"> Email <span class="required">*</span></label>
            <input type="text" id="txtemail" maxlength="50" class="input identity">
          </div>
          <div class="input_form">
            <label for="LoginForm_password"> Mật khẩu <span class="required">*</span></label>
            <input type="password" id="txtpass" class="input password">
          </div>
          <div class="errors" style="color: Red"> </div>
          <div id="loading-errors"> </div>
          <div class="note_wrapper cf">
            <div class="lost_password"> <a class="link_acount" onclick="showquyenmk();" href="javascript:void(0)">Quên mật khẩu</a> </div>
          </div>
          <div class="input_form"> <a href="javascript:void(0)" onClick="ajaxlogin();" class="button">Đăng nhập</a> </div>          
          <div class="note_wrapper"> Bạn chưa là thành viên? <a rel="nofollow" href="/dang-ky.html" class="link_acount">Đăng ký ngay</a></div>
        </div>
      </div>
      <!--end Login-->
      <!--Login-->
      <div id="div_login2" runat="server"  class="link_register">
        <a href="/dang-ky.html" title="Đăng ký làm thành viên"> | Đăng ký</a>
      </div>
      <!--end Login-->
      <!--Login-->
      <div id="div_logout" runat="server" class="login_area filter_name"><span class="tt_linktop"><b style="color: #8f1528">Chào, <asp:Literal ID="lbthanhvien" runat="server" ></asp:Literal></b></span>
        <div class="contentEGP popup_login" id="dpop"> <a class="dropdown_item" target="_parent" href="/thong-tin-ca-nhan.html">Thông tin cá nhân</a> <a class="dropdown_item" target="_parent" href="/don-hang-cua-toi.html">Đơn hàng của tôi</a> <a class="dropdown_item" target="_parent" href="/doi-mat-khau.html"> Đổi mật khẩu</a>
          <asp:LinkButton ID="lbtnDangXuat" runat="server" CausesValidation="False" cssclass="dropdown_item" OnClick="lbtnDangXuat_Click">Đăng xuất</asp:LinkButton></div>
      </div>
      <!--end Login-->
    </div>
    <!--end Account Link-->
  </div>
</div>

<uc2:forgetpass ID="forgetpass1" runat="server" />
<script src="../Ajax/login.js" type="text/javascript"></script>
