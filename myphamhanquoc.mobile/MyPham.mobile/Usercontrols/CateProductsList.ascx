<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CateProductsList.ascx.cs" Inherits="MyPham.Usercontrols.CateProductsList" %>

<div class="box">
    <div class="box_ct" id="all_categories">
        <!--List All Categories-->
        <div class="box_Tab">
        <h2 class="tt_tab"> <span>Danh mục sản phẩm</span></h2>
        </div>
        <div id="mnu_bot">
        <ul>
            <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <li class="cat-header">
                    <div class="cate_icon"> <span> <img src="<%# GetImageCat(Eval("CAT_ID"),Eval("CAT_IMAGE2")) %>" alt=""></span></div>
                    <a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a>
                    <ul>
                        <asp:Repeater ID="rptItems" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                            <ItemTemplate>
                                <li>
                                    <a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a>
                                    <ul>
                                        <asp:Repeater ID="rptItems1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                                            <ItemTemplate>
                                                <li><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>"><%# Eval("CAT_NAME") %></a></li>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </ul>
                                </li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </li>
            </ItemTemplate>
            </asp:Repeater>
        </ul>
        </div>
    </div>
</div>