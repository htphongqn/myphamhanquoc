<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="BrandsFooter.ascx.cs" Inherits="MyPham.Usercontrols.BrandsFooter" %>

<div class="row_menu_f">
<h3 class="title_col_footer">THƯƠNG HIỆU TIÊU BIỂU</h3>
<ul class="list_menu_footer" id="brands">
    <asp:Repeater ID="rptBrand" runat="server">
        <ItemTemplate>
            <li><a href="/thuong-hieu.html?thuonghieu=<%#Eval("ID") %>"><%#Eval("NAME") %></a></li>
        </ItemTemplate>
    </asp:Repeater>
</ul>
</div>