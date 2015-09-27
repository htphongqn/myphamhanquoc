<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Statistics.ascx.cs" Inherits="MyPham.Usercontrols.Statistics" %>

<div class="row_menu_f">
<h3 class="title_col_footer">Thống kê truy cập</h3>
<div class="col_F_ct">
    <p> Tổng truy cập: <strong><span id="footer4_footer2_lblSum"><asp:Literal ID="lbTotal" runat="server"></asp:Literal></span></strong></p>
    <p> Hôm nay: <strong><span id="footer4_footer2_Lbonline_date"><asp:Literal ID="lbToday" runat="server"></asp:Literal></span></strong></p>
    <p> Đang truy cập: <strong><span id="footer4_footer2_lblOnline"><asp:Literal ID="lbOnline" runat="server"></asp:Literal></span></strong></p>
</div>
</div>

<div class="row_menu_f">
    <h3 class="title_col_footer">Follow us</h3>
    <div class="col_F_ct" id="social_network">
        <asp:Repeater ID="rptSocialNetwork" runat="server">
            <ItemTemplate>
                <%# Bind_SocialNetwork(Eval("ONLINE_TYPE"), Eval("ONLINE_DESC"), Eval("ONLINE_NICKNAME"))%>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>