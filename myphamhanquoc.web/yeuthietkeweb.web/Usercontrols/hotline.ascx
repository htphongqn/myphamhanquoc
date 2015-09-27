<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="hotline.ascx.cs" Inherits="yeuthietkeweb.web.Usercontrols.hotline" %>

<asp:Repeater ID="rptHotline" runat="server">
    <ItemTemplate>
        <div class="hline fl"> <%# Eval("ONLINE_DESC") %> <span> <%# Eval("ONLINE_NICKNAME")%></span></div>
    </ItemTemplate>
</asp:Repeater>

    