<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListProject.ascx.cs" Inherits="MyPham.Usercontrols.ListProject" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc3" %>

<uc3:Path ID="Path1" runat="server" />
<div class="box">
    <div class="box_Tab">
        <h1 class="tt_tab"><span><asp:Label ID="Lbtitle" runat="server"></asp:Label></span></h1>
    </div>
    <div class="box_ct list_products" id="ajaxload">
        <asp:Repeater ID="Rplistpro" runat="server">
        <ItemTemplate>
        <div class="item_P">
            <div class="product">
                <div class="img_product"> 
                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a>
                </div>
                <div class="info_P">
                    <h3 class="product_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                    <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </div>
        </ItemTemplate>
        </asp:Repeater>
    </div>
</div>
<div class="navigation_news">       
    <a onclick="viewmore(<%=getId() %>,<%=getCountList() %>,1);" href="javascript:void(0)" class="btn_web pagination-button" style="cursor:pointer;color:White">Xem thêm sản phẩm »</a>
</div>

<script>
    var skip = 10;
    function viewmore(id, count, code) {
        $.ajax({
            url: '/MOBILE/vi-vn/ajaxmoreprolist.aspx',
            data: "id=" + id + "&skip=" + skip + "&code=" + code + "" + "",
            success: function (e) {
                skip += 10;
                $("#ajaxload").append(e);
                if (skip >= count)
                    document.getElementById("divmore").style.display = "none";
            }
        });
    }
</script>