<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Slide.ascx.cs" Inherits="MyPham.Usercontrols.Slide" %>

<div id="div_slider">
    <div id="owl-slidebanner" class="owl-carousel">
        <asp:Repeater ID="Rpslider" runat="server">
            <ItemTemplate>
                <div class="item"> <%# GetImageAd(Eval("AD_ITEM_ID"), Eval("AD_ITEM_FILENAME"), Eval("AD_ITEM_TARGET"), Eval("AD_ITEM_URL"), Eval("AD_ITEM_DESC"))%></div>
            </ItemTemplate>
        </asp:Repeater>
    </div>
</div>