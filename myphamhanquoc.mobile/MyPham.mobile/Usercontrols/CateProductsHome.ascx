<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CateProductsHome.ascx.cs" Inherits="MyPham.Usercontrols.CateProductsHome" %>

<div style="display: none">
  <asp:Repeater ID="Rpmenu1" runat="server">
    <ItemTemplate>
      <div class="box">
        <div class="box_Tab">
          <h2 class="tt_tab"> <span><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>" title="<%# Eval("CAT_NAME") %>"><%# Eval("CAT_NAME") %></a></span></h2>
        </div>
        <div class="submenu_icon submenu_ico_lv_index"> </div>
        <div class="submobile_menu">
          <div class="container">
            <ul>
              <asp:Repeater ID="Repeater1" runat="server" DataSource='<%# Load_Menu2(Eval("CAT_ID"))%>'>
                <ItemTemplate>
                  <li><a href="<%#GetLink(Eval("CAT_URL"),Eval("CAT_SEO_URL"),Eval("CAT_ID")) %>" title="<%# Eval("CAT_NAME") %>"><%# Eval("CAT_NAME") %></a></li>
                </ItemTemplate>
              </asp:Repeater>
            </ul>
          </div>
        </div>
        <div class="box_ct list_products cf">
          <asp:Repeater ID="Repeater3" runat="server" DataSource='<%# sanpham(Eval("CAT_ID"))%>'>
            <ItemTemplate>
              <div class="item_P">
                <div class="s_item">
                  <div class="img_s_item"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> </a> </div>
                  <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                    <div class="first_price"> <del><%# GetPrice(Eval("News_Price2"), Eval("News_Price1"))%></del></div>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                  </div>
                </div>
              </div>
            </ItemTemplate>
          </asp:Repeater>
        </div>
      </div>
    </ItemTemplate>
  </asp:Repeater>
</div>
<!--Bestsell Products-->
<div class="box">
  <div class="box_Tab">SẢN PHẨM BÁN CHẠY</div>
  <div class="box_ct whiteBg home_product_box_list">
    <ul>
        <asp:Repeater ID="rptProBanchay" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a> 
                </div>
                <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
                    <price><%# GetPrice(Eval("News_Price1"), Eval("News_Price2"))%></price>
                </div>
            </div>
        </li>
        </ItemTemplate>
        </asp:Repeater>
    </ul>
  </div>
</div>
<!--end Bestsell Products-->
<!--SaleOff Products-->
<div class="box">
  <div class="box_Tab">SẢN PHẨM GIẢM GIÁ</div>
  <div class="box_ct whiteBg home_product_box_list">
    <ul>
      <asp:Repeater ID="Repeater2" runat="server">
        <ItemTemplate>
        <li>
            <div class="s_item">
                <div class="img_s_item"> 
                    <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"> 
                        <img src="<%# GetImageT(Eval("NEWS_ID"),Eval("NEWS_IMAGE3")) %>" alt="<%# Eval("NEWS_TITLE") %>" /> 
                    </a> 
                </div>
                <div class="info_P">
                    <h2 class="s_item_name"> <a href="<%# GetLinkNews(Eval("NEWS_URL"),Eval("NEWS_SEO_URL"),Eval("CAT_SEO_URL")) %>"><%# Eval("NEWS_TITLE") %></a></h2>
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
<!--end SaleOff Products-->
<!--HomeCategoriesBottom-->
<div class="box">
  <div class="box_Tab tab_home">DANH MỤC SẢN PHẨM</div>
  <div class="box_ct cate_bot">
    <ul>
        
      <li><a href="/danh-muc-san-pham.html?id=274"> <i class="ico_cate"><img src="http://www.websitemypham.com/data/configs/34/logo.png" alt="Thiết Bị Nhà Bếp" /></i>
        <h3>Thiết Bị Nhà Bếp</h3>
        </a></li>
      
    </ul>
  </div>
</div>
<!--end HomeCategoriesBottom-->
<!--Related Products-->
<div class="box">
  <div class="box_Tab">GỢI Ý SẢN PHẨM</div>
  <div class="box_ct home_product_relate_list">
    <ul>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="/data/news/1606/be-foaming-cleanser.jpg" alt="SỮA RỬA MẶT DA THƯỜNG VÀ HỖN HỢP" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html">Kem dưỡng da ngăn ngừa lão hóa -Belamie Wrinkle Clear</a></h2>
            <price>760,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/tinh-chat-can-bang-da-hon-hop-va-nhon.html"> <img src="/data/news/1605/be-mattefying-refiner.jpg" alt="TINH CHẤT CÂN BẰNG DA HỖN HỢP VÀ NHỜN" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/tinh-chat-can-bang-da-hon-hop-va-nhon.html">Kem dưỡng da ngăn ngừa lão hóa -Belamie Wrinkle Clear</a></h2>
            <div class="first_price"> <del>815,000 ₫</del></div>
            <price>715,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/bao-ve-ban-ngay-cho-da-hon-hop-va-nhon.html"> <img src="/data/news/1604/be-day-veil-lotion.jpg" alt="BẢO VỆ BAN NGÀY CHO DA HỖN HỢP VÀ NHỜN" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/bao-ve-ban-ngay-cho-da-hon-hop-va-nhon.html">BẢO VỆ BAN NGÀY CHO DA HỖN HỢP VÀ NHỜN</a></h2>
            <price>1,445,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/duong-dem-cho-da-thuong-va-hon-hop.html"> <img src="/data/news/1603/be-night-nourishing.jpg" alt="DƯỠNG ĐÊM CHO DA THƯỜNG VÀ HỖN HỢP" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/duong-dem-cho-da-thuong-va-hon-hop.html">DƯỠNG ĐÊM CHO DA THƯỜNG VÀ HỖN HỢP</a></h2>
            <div class="first_price"> <del>1,735,000 ₫</del></div>
            <price>1,635,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/kem-cham-soc-mat.html"> <img src="/data/news/1602/be-complete-eye-care.jpg" alt="KEM CHĂM SÓC MẮT" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/kem-cham-soc-mat.html">KEM CHĂM SÓC MẮT</a></h2>
            <div class="first_price"> <del>1,630,000 ₫</del></div>
            <price>1,530,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/serum-tai-tao-da-ban-ngay.html"> <img src="/data/news/1601/serum-tai-tao-da-ban-ngay.jpg" alt="SERUM TÁI TẠO DA BAN NGÀY" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/serum-tai-tao-da-ban-ngay.html">SERUM TÁI TẠO DA BAN NGÀY</a></h2>
            <price>2,030,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="/data/news/1606/be-foaming-cleanser.jpg" alt="SỮA RỬA MẶT DA THƯỜNG VÀ HỖN HỢP" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html">Kem dưỡng da ngăn ngừa lão hóa -Belamie Wrinkle Clear</a></h2>
            <price>760,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/tinh-chat-can-bang-da-hon-hop-va-nhon.html"> <img src="/data/news/1605/be-mattefying-refiner.jpg" alt="TINH CHẤT CÂN BẰNG DA HỖN HỢP VÀ NHỜN" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/tinh-chat-can-bang-da-hon-hop-va-nhon.html">Kem dưỡng da ngăn ngừa lão hóa -Belamie Wrinkle Clear</a></h2>
            <div class="first_price"> <del>815,000 ₫</del></div>
            <price>715,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/bao-ve-ban-ngay-cho-da-hon-hop-va-nhon.html"> <img src="/data/news/1604/be-day-veil-lotion.jpg" alt="BẢO VỆ BAN NGÀY CHO DA HỖN HỢP VÀ NHỜN" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/bao-ve-ban-ngay-cho-da-hon-hop-va-nhon.html">BẢO VỆ BAN NGÀY CHO DA HỖN HỢP VÀ NHỜN</a></h2>
            <price>1,445,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/duong-dem-cho-da-thuong-va-hon-hop.html"> <img src="/data/news/1603/be-night-nourishing.jpg" alt="DƯỠNG ĐÊM CHO DA THƯỜNG VÀ HỖN HỢP" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/duong-dem-cho-da-thuong-va-hon-hop.html">DƯỠNG ĐÊM CHO DA THƯỜNG VÀ HỖN HỢP</a></h2>
            <div class="first_price"> <del>1,735,000 ₫</del></div>
            <price>1,635,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/kem-cham-soc-mat.html"> <img src="/data/news/1602/be-complete-eye-care.jpg" alt="KEM CHĂM SÓC MẮT" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/kem-cham-soc-mat.html">KEM CHĂM SÓC MẮT</a></h2>
            <div class="first_price"> <del>1,630,000 ₫</del></div>
            <price>1,530,000 ₫</price>
          </div>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/serum-tai-tao-da-ban-ngay.html"> <img src="/data/news/1601/serum-tai-tao-da-ban-ngay.jpg" alt="SERUM TÁI TẠO DA BAN NGÀY" /> </a> </div>
          <div class="info_P">
            <h2 class="s_item_name"> <a href="/my-pham-unicity/serum-tai-tao-da-ban-ngay.html">SERUM TÁI TẠO DA BAN NGÀY</a></h2>
            <price>2,030,000 ₫</price>
          </div>
        </div>
      </li>
    </ul>
  </div>
</div>
<!--end Related Products-->
<!--News Home-->
<div class="box">
  <h3 class="box_Tab">Tin tức mới nhất</h3>  
  <div class="box_ct whiteBg home_product_box_list newsHome">
	<article class="hotNews">
	    <figure class="img_news">
	    	<a href=""><img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/14/200/qji1444790810.png" alt="Trải nghiệm Samsung Galaxy Tab S2: Màn hình đẹp, hiệu năng tốt"></a>
	    </figure>
	    <h2><a href="" title="Trải nghiệm Samsung Galaxy Tab S2: Màn hình đẹp, hiệu năng tốt">Trải nghiệm Samsung Galaxy Tab S2: Màn hình đẹp, hiệu năng tốt</a></h2>
	    <p> Samsung Galaxy Tab S2 mang đến cho người dùng những trải nghiệm tốt hơn cùng thiết kế mỏng, nhẹ ấn tượng nhất trên thị trường hiện nay. Cũng giống như các sản phẩm trước đây của Samsung, Galaxy Tab S2 mang lại một màn hình tuyệt đẹp cùng hiệu năng vô cùng ấn tượng. Vào thời điểm đầu tháng 9 năm 2015, Samsung đã trình làng bộ đôi máy tính bảng thuộc thế hệ thứ hai dòng Galaxy Tab S với những sự thay đổi ấn tượng về thiết kế cùng với đó là hiệu năng mạnh mẽ, màn hình tốt như những ...</p>
  	</article>
    <ul>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
      <li>
        <div class="s_item">
          <div class="img_s_item"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html"> <img src="http://img3.vatgia.vn/pictures/picsmall/2015/10/15/200/lwp1444875007.jpg" alt="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng" /> </a> </div>
          <h2 class="s_item_name"> <a href="/my-pham-unicity/sua-rua-mat-da-thuong-va-hon-hop.html" title="Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng">Mở hộp Xperia Z5 bản thu gọn, giá 13 triệu đồng</a></h2>
        </div>
      </li>
    </ul>
  </div>
</div>
<!--end News Home-->
