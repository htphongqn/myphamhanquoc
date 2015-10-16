<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchTool.ascx.cs" Inherits="MyPham.Usercontrols.SearchTool" %>

<div id="search_box">
    <div id="menu_button" class="fleft">
        <div class="menu_icon fa fa-fw fa-list"> </div>
    </div>
    <div class="text">
        <div id="search_form">
        <div class="input_bar">
            <input name="txtsearch" type="text" id="txtsearch" runat="server" class="input_Search" onblur="if (this.value==&#39;&#39;) this.value=&#39;Từ khóa tìm kiếm&#39;;" onfocus="if (this.value==&#39;Từ khóa tìm kiếm&#39;) this.value=&#39;&#39;;" value="Từ khóa tìm kiếm" onkeypress="if(event.which || event.keyCode || event.charCode){if ((event.charCode == 13) || (event.which == 13) || (event.keyCode == 13)) {document.getElementById(&#39;vi7_lbtnSearch&#39;).click();return false;}} else {return true}; " />
        </div>
        <div class="search_icon_wrapper">
            <asp:Button ID="btnSearch" runat="server" class="search_btn" Text="" 
                onclick="btnSearch_Click" />
        </div>
        </div>
    </div>
    <a href="/gio-hang.html" id="cart" class="fright"><b class="itemNumber"><asp:Literal ID="Lbtotalcart" runat="server"></asp:Literal></b></a> 
</div>