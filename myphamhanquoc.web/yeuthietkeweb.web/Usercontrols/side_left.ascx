<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="side_left.ascx.cs" Inherits="yeuthietkeweb.UIs.side_left" %>

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
      <div class="box_ct whiteBg most-viewed"> <%-- id="filter_trademark"--%>
        <h3>Thương hiệu</h3>
        <asp:CheckBoxList ID="chklBrand" runat="server" AutoPostBack="true" 
              onselectedindexchanged="chklBrand_SelectedIndexChanged">
        </asp:CheckBoxList>
      </div>
      <div class="box_ct whiteBg most-viewed" id="search_price">
        <h3>Tìm theo giá</h3>
        <ul class="list_field">
          <li><a id="lid200" runat="server" href="gia-dung-noi-that.html?page=0&price=200000&typepri=3" class="active">Dưới 200.000 VNĐ</a> </li>
          <li><a id="li200" runat="server" href="gia-dung-noi-that.html?page=0&price=200000,500000&typepri=1">200.000 - 500.000 VNĐ</a> </li>
          <li><a id="li500" runat="server" href="gia-dung-noi-that.html?page=0&price=500000,1000000&typepri=1">500.000 - 1.000.000 VNĐ</a> </li>
          <li><a id="li1000" runat="server" href="gia-dung-noi-that.html?page=0&price=1000000,2000000&typepri=1">1.000.000 - 2.000.000 VNĐ</a> </li>
          <li><a id="li2000" runat="server" href="gia-dung-noi-that.html?page=0&price=2000000&typepri=2">Trên 2.000.000 VNĐ</a> </li>
        </ul>
      </div>
    </div>
    

