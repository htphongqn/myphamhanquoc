<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="news_list.ascx.cs" Inherits="yeuthietkeweb.UIs.news_list" %>
<%@ Register src="path.ascx" tagname="path" tagprefix="uc1" %>
<%@ Register src="left_news.ascx" tagname="left_news" tagprefix="uc2" %>

<div class="main cf">    
    <uc1:path ID="path1" runat="server" />
    <!--Sidebar-->
    <uc2:left_news ID="left_news1" runat="server" />
    <!--end Sidebar-->
    <!--Main Content-->
    <div id="main_content" class="thirteen columns">
      <div class="inner_col">
        <!--List News-->
        <div class="box_ct padd10 whiteBg" id="list_news">
          <div class="title_page">
            <h1><asp:Literal ID="lbTitle" runat="server"></asp:Literal></h1>
          </div>
          <ul>
            <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>                    
                    <li><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"> <img class="img_general" alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" ></a>
                      <h2> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>" class="link_title"><%# Eval("NEWS_TITLE") %></a></h2>
                      <p><%# Eval("NEWS_DESC") %></p>
                      <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" class="view_more"> Chi tiết...</a> </li>                 
                </ItemTemplate>
            </asp:Repeater> 
          </ul>
          <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
        </div>
        <!--End List News-->
      </div>
    </div>
    <!--end Main Content-->
  </div>
