<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="NewsDetail.ascx.cs" Inherits="MyPham.Usercontrols.NewsDetail" %>

<div class="box">
    <div class="box_ct whiteBg padd10" id="detail_news">
    <h1 class="h1Title"><asp:Literal ID="lbNewsTitle" runat="server" Text="" /></h1>
    <p class="date">Cập nhật: <asp:Literal ID="lbNewsDate" runat="server" Text="" /></p>
    <div class="info_g">
        <asp:Literal ID="liHtml" runat="server"></asp:Literal>
    </div>
    <div class="function">
        <div class="addthis_toolbox addthis_default_style like_face">
            <a class="addthis_button_preferred_1"></a><a class="addthis_button_preferred_2">
            </a><a class="addthis_button_preferred_3"></a><a class="addthis_button_preferred_4">
            </a><a class="addthis_button_compact"></a><a class="addthis_counter addthis_bubble_style">
            </a>
            <script type="text/javascript">
                var addthis_config = { "data_track_addressbar": true };
                addthis_config = addthis_config || {};
                addthis_config.data_track_addressbar = false;
            </script>
            <script type="text/javascript" src="//s7.addthis.com/js/300/addthis_widget.js#pubid=ra-50d418ab2d45f0aa"></script>
        </div>
        <%--<div class="toolbar"> 
            <a href="#" id="hplPrint" target="_blank" runat="server" class="print"> Bản in</a> 
            <a href="#" id="hplSendEmail" runat="server" class="email"> Gửi email</a> 
            <a href="#" id="hplFeedback" runat="server" class="opinion">Phản hồi</a>
        </div>--%>
    </div>
    <!--Other News-->
    <div class="other_news_sub" id="dvOtherNews" runat="server">
        <div class="other_newsT">Tin bài khác</div>
        <ul>
        <asp:Repeater ID="RpNewsOther" runat="server">
            <ItemTemplate>
                <li> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %><span class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE"))%>)</span></a> </li>
            </ItemTemplate>
        </asp:Repeater>
        </ul>
        <a id="hplViewmore" runat="server" class="view_all" href="">Xem tất cả &raquo;</a> </div>
    <!--Other News-->
    <div class="cf"></div>
    </div>
</div>