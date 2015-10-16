<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="MyPham.UIs.SearchResult" %>
            
<div class="box">
    <h1 class="box_Tab">Tìm kiếm</h1>
    <div class="box_ct home_product_relate_list" id="ajaxload">
        <ul>
			<asp:Repeater ID="Rplistpro" runat="server">
	        <ItemTemplate>
	        <li>
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
	        </li>
	        </ItemTemplate>
	        </asp:Repeater>
		</ul>
    </div>
</div>
<div class="navigation_news" id="divmore">       
    <a onclick="viewmore(<%=getId() %>,<%=getCountList() %>,2);" href="javascript:void(0)" class="btn_web pagination-button" style="cursor:pointer;color:White">Xem thêm sản phẩm »</a>
</div>

<script>
    var skip = 10;
    function viewmore(id, count, code) {
        $.ajax({
            url: '/Pages/ajaxmoreprolist.aspx',
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