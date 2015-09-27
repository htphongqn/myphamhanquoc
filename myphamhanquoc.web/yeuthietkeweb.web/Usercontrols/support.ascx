<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="support.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.support" %>

<div id="support_online" class="popup-hide"> 
<asp:Repeater ID="rptHotline" runat="server">
    <ItemTemplate>
        <a href="javascript:;" id="buttonAdv"><i class="ico support_ico"></i><%# Eval("ONLINE_DESC") %> <%# Eval("ONLINE_NICKNAME")%></a>
    </ItemTemplate>
</asp:Repeater>
  <div class="content">
    <div class="title"> <b>Gọi mua hàng</b> </div>    
    <asp:Repeater ID="rptSupport" runat="server">
        <ItemTemplate>
        <div class="row_spp"><span class="name"><%# Eval("ONLINE_NICKNAME")%>&nbsp;</span> <a href="skype:<%# Eval("ONLINE_FIELD1") %>?chat" title="Nhấp chuột để chát với <%# Eval("ONLINE_DESC") %>" class="iconSkype"><%# Eval("ONLINE_DESC") %><img alt="" src="/Resources/images/iconSkype.jpg"> </a></div>
        </ItemTemplate>
    </asp:Repeater>
  </div>
</div>