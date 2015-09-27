<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="footer.ascx.cs" Inherits="yeuthietkeweb.UIs.Footer" %>

<!--Top Footer-->
  <div class="topfooter">
  <asp:Literal ID="Literal_Info" runat="server"></asp:Literal>
  </div>
  <!--Footer-->
  <footer>
    <div class="topmenu_footer">
      <div class="five columns" id="brand_foo">
        <div class="ctentColuMenuFooter">
          <h3><a href="javascript:void(0)">Thương hiệu tiêu biểu</a></h3>
          <div class="rowlistMenuFooter">            
            <asp:Repeater ID="rptBrand" runat="server">
                <ItemTemplate>
                    <a href="/thuong-hieu.html?thuonghieu=<%#Eval("ID") %>"><%#Eval("NAME") %></a> 
                </ItemTemplate>
            </asp:Repeater>
          </div>
        </div>
      </div>
      <!--test-->      
      <asp:Repeater ID="Rpmenu_foot" runat="server">
            <ItemTemplate>
                <div class="three columns" id="introduction">
                    <div class="ctentColuMenuFooter">
                      <h3> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>"><%#Eval("CAT_NAME") %></a></h3>
                      <div class="listMenuFooter">
                          <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                            <ItemTemplate>
                                <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>">
                                    <%#Eval("CAT_NAME") %></a>
                            </ItemTemplate>
                        </asp:Repeater>
                      </div>
                    </div>
                  </div>
            </ItemTemplate>
        </asp:Repeater>
      <div class="three columns" id="visitors">
        <div class="ctentColuMenuFooter">
          <h3> <a href="">Thống kê truy cập</a></h3>
          <div class="listMenuFooter">
            <p> Tổng truy cập: <strong><asp:Literal ID="lbTotal" runat="server"></asp:Literal></strong></p>
            <p> Hôm nay: <strong><asp:Literal ID="lbToday" runat="server"></asp:Literal></strong></p>
            <p> Đang truy cập: <strong><asp:Literal ID="lbOnline" runat="server"></asp:Literal></strong></p>
          </div>
          <h3> <a href="javascript:void(0)">Follow us</a></h3>          
            <div class="listMenuFooter" id="social_network">
            <asp:Repeater ID="rptSocialNetwork" runat="server">
                <ItemTemplate>
                    <%# Bind_SocialNetwork(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
                </ItemTemplate>
            </asp:Repeater>
            </div>
        </div>
      </div>
      <div class="five columns" id="get_email">
        <div class="ctentColuMenuFooter">
            <h3>Đăng ký nhận mail</h3>
            <div class="info_footer">
            <input name="txtEmail" type="text" id="txtEmail" runat="server" class="inputMail" />
            <asp:LinkButton CssClass="submitMail" ID="lbregisemail" runat="server"  ValidationGroup="GRegEmail"
                                OnClick="lbregisemail_Click"><span class="icon_mail">Đăng ký</span></asp:LinkButton>
                <br /><br />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="<br/>Vui lòng nhập Email!" Display="None"
                    Text="Vui lòng nhập e-mail!" ControlToValidate="txtEmail" CssClass="required"  ValidationGroup="GRegEmail"></asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="regexEmailValid" runat="server" ValidationExpression="\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                    ControlToValidate="txtEmail" ErrorMessage="E-mail không đúng định dạng!" CssClass="required"  Display="None"
                     ValidationGroup="GRegEmail"></asp:RegularExpressionValidator>                    
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ShowMessageBox="True" ShowSummary="False" ValidationGroup="GRegEmail" />
            </div>
            <span class="mobileIphone"><a href="http://m.amazona.vn">Mobile App available on iphone &amp; Android</a></span>
        </div>
      </div>
    </div>
  </footer>
  <!--End Footer-->