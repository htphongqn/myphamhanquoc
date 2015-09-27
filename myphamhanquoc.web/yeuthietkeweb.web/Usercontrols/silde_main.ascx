<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="silde_main.ascx.cs" Inherits="yeuthietkeweb.UIs.silde_main" %>

<div class="slide_banner cf">
  <ul class="bxslider">
    <asp:Repeater ID="rptAds" runat="server">
        <ItemTemplate>                 
                <li><%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("Ad_Item_Desc"))%></li>
        </ItemTemplate>
    </asp:Repeater>
  </ul>
</div>