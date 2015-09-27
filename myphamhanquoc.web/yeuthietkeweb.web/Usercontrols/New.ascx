<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="New.ascx.cs" Inherits="yeuthietkeweb.UIs.New" %>
<%@ Register Src="Toolbar.ascx" TagName="Toolbar" TagPrefix="uc2" %>
<uc2:Toolbar ID="Toolbar1" runat="server" />

<section class="main-content">
    <p class="tt-main"><span><asp:Literal ID="lbTitle" runat="server" Text="" /></span></p>
    <article class="iblock detail-news">
    <h1 class="tt-detail-news"><asp:Literal ID="lbNewsTitle" runat="server" Text="" /></h1>
    <asp:Literal ID="liHtml" runat="server"></asp:Literal>
    </article>
    <div class="clearfix function">
        <div class="addthis_toolbox addthis_default_style shareBox">
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
        <div class="toolbarBox"> 
            <a href="#" id="hplPrint" target="_blank" runat="server"> <i class="fa fa-print"></i>Bản in</a> 
            <a href="#" id="hplSendEmail" runat="server"> <i class="fa fa-envelope"></i>Gửi email</a> 
            <a href="#" id="hplFeedback" runat="server"> <i class="fa fa-edit"></i>Phản hồi</a>
        </div>
    </div>
    <div class="clearfix otherNews" id="dvOtherNews" runat="server">
    <p class="tt-main"><span>Tin bài khác</span></p>
    <ul>
        <asp:Repeater ID="RpNewsOther" runat="server">
            <ItemTemplate>
                <li> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %><small class="date">(Ngày đăng <%# getDate(Eval("NEWS_PUBLISHDATE"))%>)</small></a> </li>
            </ItemTemplate>
        </asp:Repeater>
    </ul>
    </div>    
    <div class="feedback">
        <div class="feedback_content">
        <div class="feed_head">
        <p class="tt-main"><span>Ý kiến bạn đọc</span></p>
        <div>
            <asp:Literal ID="lbCommentFace" runat="server"></asp:Literal>
        </div>
        </div>
        </div>
    </div>  
</section>