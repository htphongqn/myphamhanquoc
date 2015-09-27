//All Scripts			   
$(document).ready(function(){  
						   
			// hide #back-top first
			$("body").append("<span class='btn_toTop'></span>");
			$(".btn_toTop").hide();
			// fade in #back-top
			$(function () {
				$(window).scroll(function () {
					if ($(this).scrollTop() > 100) {
						$('.btn_toTop').fadeIn();
					} else {
						$('.btn_toTop').fadeOut();
					}
				});
				// scroll body to 0px on click
				$('.btn_toTop').click(function () {
					$('body,html').animate({
						scrollTop: 0
					}, 800);
					return false;
				});
			});		
			
			//Scripts click Toggle
			var notH = 1,
				$pop = $('.contentEGP').hover(function(){notH^=1;});
			
			$(document).on('mouseup keyup', function( e ){
			  if(notH||e.which==27) $pop.stop().hide();
			});
			/////// CALL POPUP 
			$('.filter_name').click(function(){
				jQuery(this).find('.contentEGP').slideDown("fast").end().siblings().find('.contentEGP').hide('fast');							 
				event.stopPropagation();  
			});		

			//Left Menu		
			var columns    = 3,
			setColumns = function() { columns = $( window ).width() > 750 ? 3 : $( window ).width() > 500 ? 2 : 1; };
			setColumns();
				$( window ).resize( setColumns );	
				$('.m_li').bind('mouseenter', function () {
		
					$(this).find('.list_categories').stop(true, true).fadeIn(200);
						var columns    = 3,
						setColumns = function() { columns = $( window ).width() > 750 ? 3 : $( window ).width() > 500 ? 2 : 1; };
						setColumns();
							$( window ).resize( setColumns );	
						$( '.subcatwrapper' ).masonry(
						{
						itemSelector: '.pc_menu',
						columnWidth:  function( containerWidth ) { return containerWidth / columns; }
					});
				}).bind('mouseleave', function () {
		
					$(this).find('.list_categories').stop(true, true).fadeOut(200, function () {
		
					});
				});									
			
			$("#buttonAdv").click(function(){					
				$('#support_online').toggleClass("popup-show");
				$(this).toggleClass('click_Adv');
			});
			
			//bxSlider
			$('.slide_banner ul').bxSlider({
			  minSlides: 1,
			  maxSlides: 1,
			  moveSlides: 1,
			  slideMargin: 0,
			  pager: true,
			  auto: true,
			  controls: false,
			  pause: 5000,
			  speed: 1000,
			  mode: 'fade'
			});	
			
			$('.logoslider ul').bxSlider({
			  minSlides: 1,
			  maxSlides: 1,
			  moveSlides: 1,
			  slideMargin: 0,
			  pager: false,
			  auto: true,
			  pause: 3000,
			  speed: 1000,
			  mode: 'vertical'
			});	
						
			//Slide Tab Products
			$(".slide_tab_Pro ul").carouFredSel({	
				circular: false,
				infinite: false,
				auto    : false,
				scroll  : {
					items   : 3,
					pauseOnHover    : true,
					duration    : 800
				},
				items: {			
					visible: {
						min: 1,
						max: 6
						}
				},
				prev    : {
					button  : function(){
						return $(this).parents('.slide_tab_Pro').find('.prev');
					},
					key     : "left"
				},
				next    : {
					button  : function(){
						return $(this).parents('.slide_tab_Pro').find('.next');
					},
					key     : "right"
				}			
			});
			$(".tab_content").hide();
			$(".tab_content:first").show();
	
			$("ul.tabs_menu li").click(function () {
				$("ul.tabs_menu li").removeClass("active");
				$(this).addClass("active");
				$(".tab_content").hide();
				var activeTab = $(this).attr("rel");
				$("#" + activeTab).fadeIn();
			});
			
			//Scroll Bar			
			$('.boxscroll').slimscroll({
				height: '275px'
			  });
			
			$('.slide_cate_Pro ul').bxSlider({
			  minSlides: 5,
			  maxSlides: 5,
			  moveSlides: 5,
			  slideWidth: 170,
			  slideMargin: 20,
			  pager: false,
			  auto: false,
			  pause: 3000,
			  speed: 1000,
			  controls: true,
			  infiniteLoop: false
			});		
			
			//Zooom
			var zoomCollection = '#image';
			$( zoomCollection ).elevateZoom({
				lensShape : "basic",
				lensSize    : 150,
				easing:true,
				gallery:'image-additional-carousel',
				cursor: 'pointer',
				galleryActiveClass: "active"
			});
			$('#image-additional .item:first').addClass('active');						
			$("#image-additional-carousel ul").carouFredSel({	
				circular: false,
				infinite: false,
				auto    : false,
				scroll  : {
					items   : 4,
					pauseOnHover    : true,
					duration    : 800
				},
				items: {			
					visible: {
						min: 1,
						max: 4
						}
				},
				prev    : {
					button  : function(){
						return $(this).parents('#image-additional-carousel').find('.prev');
					},
					key     : "left"
				},
				next    : {
					button  : function(){
						return $(this).parents('#image-additional-carousel').find('.next');
					},
					key     : "right"
				}			
			});
			$(zoomCollection).bind("click", function(e) {  
			  var ez =   $(zoomCollection).data('elevateZoom');
			  ez.closeAll(); //NEW: This function force hides the lens, tint and window	
				$.fancybox(ez.getGalleryList());
			  return false;
			}); 	
		
		$('#thesame_products ul').bxSlider({
			  minSlides: 4,
			  maxSlides: 4,
			  moveSlides: 2,
			  slideWidth: 197,
			  slideMargin: 20,
			  pager: false,
			  auto: false,
			  pause: 3000,
			  speed: 1000,
			  controls: true,
			  infiniteLoop: false
			});	
		
		$(".sticky").sticky({ topSpacing: 40 });
		
		$(".box_cargo").click(function () {						
					$(this).next(".box_cargo_item:first").slideToggle();   		     
				});	
});

$(function () {
                var sticky_navigation_offset_top = $('.top_main').offset().top;
                var sticky_navigation = function () {
                    var scroll_top = $(window).scrollTop();
                    if (scroll_top > sticky_navigation_offset_top) {
                        $('.top_main').css({ 'position': 'fixed', 'top': 0, 'width': '100%' });
                    } else {
                        $('.top_main').css({ 'position': 'relative' });
                    }
                };

                sticky_navigation();

                $(window).scroll(function () {
                    sticky_navigation();
                });
            }); // JavaScript Document