<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CatesFooter.ascx.cs" Inherits="MyPham.Usercontrols.CatesFooter" %>

<asp:Repeater ID="Rpmenu_foot" runat="server">
    <ItemTemplate>
        <div class="row_menu_f">
            <h3 class="title_col_footer"><%#Eval("CAT_NAME") %></h3>
            <ul class="list_menu_footer">
                <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                    <ItemTemplate>
                        <li><a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>"><%#Eval("CAT_NAME") %></a></li>
                    </ItemTemplate>
                </asp:Repeater>
            </ul>
        </div>
    </ItemTemplate>
</asp:Repeater>