/*
 * Pyxis main js
 * by www.girlscancode.com
 */
/*--------------------------------------------------------------
>>> TABLE OF CONTENTS:
----------------------------------------------------------------
1.0 Add a class to the header on scroll
2.0 BXSlider
3.0 Scroll to top button
4.0 Isotope Filtering
5.0 jQuery viewport
6.0 Maker background scroll (instead of fixed) on mobile
7.0 Include Snazzy Maps

--------------------------------------------------------------*/



/*--------------------------------------------------------------
1.0 ADD CLASS TO HEADER ON SCROLL
--------------------------------------------------------------*/
function init() {
    window.addEventListener('scroll', function(e){
        var distanceY = window.pageYOffset || document.documentElement.scrollTop,
            shrinkOn = 300,
            header = document.querySelector("#page-header");
        if (distanceY > shrinkOn) {
            classie.add(header,"smaller");
        } else {
            if (classie.has(header,"smaller")) {
                classie.remove(header,"smaller");
            }
        }
    });
}
window.onload = init();

/*--------------------------------------------------------------
2.0 BXSLIDER
--------------------------------------------------------------*/
jQuery(document).ready(function(){
  jQuery('.bxslider').bxSlider({
        mode: 'fade',
        controls: true,
        nextSelector: '#slider-next',
        prevSelector: '#slider-prev',
        nextText: '<i class="fa fa-angle-right"></i>',
        prevText: '<i class="fa fa-angle-left"></i>',
        pager: false,
        slideWidth: 0
  });

  jQuery('.bxslider-homepage').bxSlider({
      mode: 'fade',
      auto: 'false',
      speed: 2500,
      controls: false,
      nextText: '<i class="fa fa-angle-right"></i>',
      prevText: '<i class="fa fa-angle-left"></i>',
      pager: false,
      slideWidth: 0
  });

    jQuery('.bxslider-team').bxSlider({
        minSlides: 1,
        maxSlides: 4,
        slideWidth: 285,
        slideMargin: 10,
        moveSlides: 1,
        pager: false,
        controls: true,
        nextSelector: '#team-next',
        prevSelector: '#team-prev',
        nextText: '<i class="fa fa-angle-right"></i>',
        prevText: '<i class="fa fa-angle-left"></i>',
        
    });

    jQuery('.bxslider-product').bxSlider({
        mode: 'fade',
        controls: false,
        nextText: '<i class="fa fa-angle-right"></i>',
        prevText: '<i class="fa fa-angle-left"></i>',
        pager: true,
        slideWidth: 0
    });

});


/*--------------------------------------------------------------
3.0 SCROLL TO TOP BUTTON
--------------------------------------------------------------*/
jQuery(function(){
 
    jQuery(document).on( 'scroll', function(){
 
        if (jQuery(window).scrollTop() > 100) {
            jQuery('.scroll-top-wrapper').addClass('show');
        } else {
            jQuery('.scroll-top-wrapper').removeClass('show');
        }
    });
});

jQuery(function(){
 
    jQuery(document).on( 'scroll', function(){
 
        if (jQuery(window).scrollTop() > 100) {
            jQuery('.scroll-top-wrapper').addClass('show');
        } else {
            jQuery('.scroll-top-wrapper').removeClass('show');
        }
    });
 
    jQuery('.scroll-top-wrapper').on('click', scrollToTop);
});
 
function scrollToTop() {
    verticalOffset = typeof(verticalOffset) != 'undefined' ? verticalOffset : 0;
    element = jQuery('body');
    offset = element.offset();
    offsetTop = offset.top;
    jQuery('html, body').animate({scrollTop: offsetTop}, 500, 'linear');
}

/*--------------------------------------------------------------
4.0 ISOTOPE FILTERING
--------------------------------------------------------------*/
jQuery(document).ready(function () {

    //substr so there isn't a '#'
    var hashFilter = location.hash.substr(1);

    var mainEl = jQuery('#mainstorepage');
    var transitionDuration = 800;
    //var columnWidth = 570;
    var columnWidth = 380;

    mainEl.isotope({
        filter: hashFilter,
        animationEngine: 'best-available', //CSS3 if browser supports it, jQuery otherwise
        animationOptions: {
            duration: transitionDuration
        },
        containerStyle: {
            position: 'relative',
            overflow: 'visible'
        },
        masonry: {
            columnWidth: columnWidth
        }
    });


    function setSizes() {
        var availableSpace = jQuery('.container').width();
        var potentialColumns = availableSpace / columnWidth;
        potentialColumns = Math.floor(potentialColumns);

        var newWidth = potentialColumns * columnWidth;

        jQuery('.product-container').width(newWidth);
    }

    setSizes();


    function layoutTimer() {

        setTimeout(function () {
            mainEl.isotope('layout');
        }, transitionDuration);

    }

    layoutTimer();


    jQuery(window).resize(function () {

        setSizes();

        layoutTimer();

    });


    var currentCats = hashFilter.split(".");
    //splice because the first element will be just an empty '', so we get rid of it
    currentCats.splice(0, 1);

    for (current in currentCats) {
        currentCat = currentCats[current];

        //Since it splices based on the '.', each '.' disappears, so we need to re-add it
        currentCats[current] = '.' + currentCat;

        //Find each link that has a 'href' attribute currently present in the hash
        jQuery('#controls a[href=#' + currentCat + ']').parent().addClass('active');



    }

    jQuery('#controls a').click(function () {
        //Change '#cat1' into '.cat1'
        var catClass = '.' + jQuery(this).attr('href').substr(1);

        //If the current category is not in the array, add it and make the link active
        if (jQuery.inArray(catClass, currentCats) == -1) {
            currentCats.push(catClass);
            jQuery(this).parent().addClass('active');
        }
            //If the current category is in the array, get rid of it and remove the 'active' class
        else {
            //position of the current category in the array
            position = jQuery.inArray(catClass, currentCats);
            currentCats.splice(position, 1);
            jQuery(this).parent().removeClass('active');
        }

        var newFilter = "";

        //generate a 'newFilter' string that will be saved into the hash
        for (current in currentCats) {
            currentCat = currentCats[current];
            newFilter = newFilter + currentCat;
        }

        location.hash = newFilter;

        mainEl.isotope({
            filter: newFilter
        });

        return false;

    });

/*--------------------------------------------------------------
5.0 JQUERY VIEWPORT CHECK, ONLY ON DESKTOP
--------------------------------------------------------------*/
    
    if( !device.tablet() && !device.mobile() ) {
    
        jQuery('.animation1').addClass("itshidden").viewportChecker({
            classToAdd: 'itsvisible animated fadeInUp',
            offset: 200
        });

        jQuery('.animation2').addClass("itshidden").viewportChecker({
            classToAdd: 'itsvisible animated zoomIn',
            offset: 200
        });
        jQuery('.animation3').addClass("itshidden").viewportChecker({
            classToAdd: 'itsvisible animated fadeIn',
            offset: 200
        });
    }
   
/*--------------------------------------------------------------
6.0 MAKE BACKGROUND SCROLL (INSTEAD OF FIXED) ON MOBILE (AVOID ANNOYING EFFECT)
--------------------------------------------------------------*/

    if( device.tablet() && device.mobile() ) { 
        jQuery('.second-cta, .team, .testimonials, .jumbotron').css("background-attachment", "scroll");
    }

    //console.log (jQuery("#over-map").height());
    var footerHeight = jQuery("#over-map").height();
    jQuery("#mapwrapper").css("height", footerHeight+50);

});
