<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchResult.ascx.cs" Inherits="yeuthietkeweb.UIs.SearchResult" %>
            
    <div class="eleven columns" id="main_content">
      <!--Breadcrumbs-->
      <ul class="breadcrumbs">
        <li class="home"><a href="/trang-chu.html">Trang chủ</a></li>
        <li class="current">Tìm kiếm</li>
      </ul>
      <!--end Breadcrumbs-->
      <h2 class="page_title">
      <asp:Label ID="lbTitle" runat="server" Text="Kết quả tìm kiếm"></asp:Label>
      </h2>
      <!--List News-->
      <section id="list_news_page" class="news_body">
       <asp:Repeater ID="Rplistnews" runat="server">
                <ItemTemplate>
                    <article>
                      <figure class="img_post fl"> <a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><img alt="<%# Eval("NEWS_TITLE") %>" src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" /></a> </figure>
                      <h3><a href="<%# GetLink(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>" title="<%# Eval("NEWS_TITLE") %>"><%# Eval("NEWS_TITLE") %></a></h3>
                      <span class="date_post"><%# getDate(Eval("NEWS_PUBLISHDATE"))%></span> 
                      <p class="text"> <%# Eval("NEWS_DESC") %></p>
                      </article>                  
                </ItemTemplate>
            </asp:Repeater>
      </section>
      <div class="pagination"><asp:Literal ID="ltrPage" runat="server"></asp:Literal></div>
      <!--end List News-->
    </div>
