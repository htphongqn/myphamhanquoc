$(document).ready(function () {	
			//Owl Carousel Assets
            $("#owl-slidebanner").owlCarousel({
                navigation: false,
                autoPlay: 5000, //Set AutoPlay to 3 seconds
                items: 1,
                singleItem: true,
                rewindNav: true,
                pagination: true
            });

            $("#owl-slidebanner_dtp").owlCarousel({
                navigation: true,
                autoPlay: 8000, //Set AutoPlay to 3 seconds
                items: 1,
                singleItem: true,
                rewindNav: true,
                pagination: false,
                animateOut: 'fadeOut'
            });							

            $(".slide_products").owlCarousel({
                navigation: true,
                autoPlay: 3000,
                items: 5,
                rewindNav: false,
                itemsCustom: [
				[0, 2],
				[480, 2],
				[768, 3],
				[980, 4],
				[1200, 5]
			  ]
            });
			
//Mobile menu
$('li.cat-header ul').each(function(index) {
 $(this).prev().addClass('idCatSubcat')});
 $('li.cat-header a').after('<span></span>'); 
 $('li.cat-header ul').css('display','none');
 $('li.cat-header ul.active').css('display','block');
 $('li.cat-header ul').each(function(index) {
   $(this).prev().addClass('close').click(function() {
  if (
   $(this).next().css('display') == 'none') {
   $(this).next().slideDown(400, function () {
   $(this).prev().removeClass('collapsed').addClass('expanded');
    });
  }else {
    $(this).next().slideUp(400, function () {
   $(this).prev().removeClass('expanded').addClass('collapsed');
   $(this).find('ul').each(function() {
    $(this).hide().prev().removeClass('expanded').addClass('collapsed');
   });
    });
  }
  return false;
   });
});							
	
	$('.menu_icon').click(function () {
        $(this).parents().find('.fly_menu').toggleClass('active');
        $(this).parents().find('#wrap_outer').toggleClass('tran_wp');		  
    })   
	
		
	$('.mobile_menu .main_nav>ul>li>ul').hide(); 	

    $('.mobile_menu .main_nav>ul.nav>li>span').click(function(e) {
        $('.mobile_menu .main_nav ul ul').slideUp('normal'); 		

     // if the moreInfo div is a sibling of the li
        if($(this).next().is(':hidden') == true) {
          $(this).next().slideDown('normal').siblings('.mobile_menu .main_nav>ul.nav>li>span').addClass('active');
		} else {
		  $(this).next().slideUp('normal').siblings('.mobile_menu .main_nav>ul.nav>li>span').removeClass('active');			  
        }     			
    });
	
	$('.close_menu').click(function () {
        $(this).parents().find('.fly_menu').toggleClass('active');
        $(this).parents().find('#wrap_outer').toggleClass('tran_wp');
    })		
		
	$('#all_cate_sidebar').click(function () {
        $('#box_category').slideToggle('medium');	  
    })  
	$(".submenu_ico_lv_index").click(function(){
    	$(this).next(".submobile_menu").slideToggle("fast");		
		$(this).toggleClass("subclose_ico");
  	});
	$(".submenu_ico_lv").click(function(){
    	$(".submobile_menu").slideToggle("fast");		
		$(this).toggleClass("subclose_ico");
  	});
});