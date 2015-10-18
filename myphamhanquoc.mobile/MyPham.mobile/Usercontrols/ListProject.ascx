<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ListProject.ascx.cs" Inherits="MyPham.Usercontrols.ListProject" %>
<%@ Register src="Path.ascx" tagname="Path" tagprefix="uc3" %>

<uc3:Path ID="Path1" runat="server" />
<div class="box">
    <h1 class="box_Tab">
        <asp:Label ID="Lbtitle" runat="server"></asp:Label>
    </h1>
    <div class="box_ct home_product_relate_list">
	<ul id="ajaxload">
        <asp:Repeater ID="Rplistpro" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a>
                </div>
                <div class="info_P">
                    <h3 class="s_item_name"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h3>
                    <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </li>
        </ItemTemplate>
        </asp:Repeater>
	</ul>
    </div>
</div>
<div class="navigation_news" id="divmore">       
    <a onclick="viewmore(<%=getId() %>,<%=getCountList() %>,1);" href="javascript:void(0)" class="btn_web pagination-button" style="cursor:pointer;color:White">Xem thêm sản phẩm »</a>
</div>

<script>
    var skip = 12;
    function viewmore(id, count, code) {
        $.ajax({
            url: '/Pages/ajaxmoreprolist.aspx',
            data: "id=" + id + "&skip=" + skip + "&code=" + code + "" + "",
            success: function (e) {
                skip += 12;
                $("#ajaxload").append(e);
                if (skip >= count)
                    document.getElementById("divmore").style.display = "none";
            }
        });
    }
    window.onload = function () {
        if (skip >= <%=getCountList() %>)
            document.getElementById("divmore").style.display = "none";
    };
</script>