<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="left_cate.ascx.cs" Inherits="yeuthietkeweb.UIs.left_cate" %>

<div id="sidebar" class="three columns">
      <div class="box_ct whiteBg most-viewed" id="cate_left">
        <asp:Repeater ID="Rpmenu" runat="server">
            <ItemTemplate>
                <h2><%#Eval("CAT_NAME") %></h2>
                <ul class="list_field">          
                    <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("Cat_ID")) %>'>
                        <ItemTemplate>
                            <li> <a href="<%#GetLink_Cat(Eval("Cat_Url"),Eval("Cat_Seo_Url")) %>" title="<%#Eval("CAT_NAME") %>"><%#Eval("CAT_NAME") %></a> </li>
                        </ItemTemplate>
                    </asp:Repeater>
                </ul>
            </ItemTemplate>
        </asp:Repeater>
      </div>      
      <div class="box_ct whiteBg most-viewed">
        <h3>Thương hiệu</h3>
        <ul>
          <asp:Repeater ID="rptBrands" runat="server">
                <ItemTemplate>
                    <li><a href="<%#Eval("Url")%>" class="img_brand"> <%#Eval("NameCount")%></a></li>
                </ItemTemplate>
            </asp:Repeater>
        </ul>
      </div>
    </div>
