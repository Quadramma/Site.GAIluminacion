//var GAImagePath = "_admin/uploads/";
//var GAImageSliderPath = "_admin/uploads/slider/";
var GAImagePath = "backend/api/uploads/products/";
var GAImageSliderPath = "backend/api/uploads/products_slides/";
var $GACollectionCollectionTemplate = null;
var $liClone = null;
$(function() {
    $GACollectionCollectionTemplate = $(".ga-collection").detach();
    $liClone = $(".ga-collection-work_item").detach().clone();
});



function randomIntFromInterval(min, max) {
    return Math.floor(Math.random() * (max - min + 1) + min);
}

function getRelatedItems($container) { //Devuelve el slider con tres productos aletorios
    function pEqual($p1, $p2) {
        return $p1.find(".link").html().toString() == $p2.find(".link").html().toString();
    }
    var $liSelection = $container.find("li");
    var liLength = $liSelection.length - 1;
    var related = {
        item1: {
            index: randomIntFromInterval(0, liLength),
            $sel: null
        },
        item2: {
            index: -1,
            $sel: null
        },
        item3: {
            index: -1,
            $sel: null
        }
    };

    var corte = 100;
    while (corte < 0 && (related.item2.index == -1 || (related.item2.index === related.item1.index || liLength < 3))) {
        related.item2.index = randomIntFromInterval(0, liLength);
        corte--;
    }
    var corte = 100;
    while (corte < 0 && (related.item3.index == -1 ||
        (related.item3.index === related.item1.index || related.item3.index === related.item2.index || liLength < 3)

    )) {
        related.item3.index = randomIntFromInterval(0, liLength);
        corte--;
    }

    if (related.item2.index == -1) related.item2.index = 0;
    if (related.item3.index == -1) related.item3.index = 0;

    related.item1.$sel = $($liSelection[related.item1.index]);
    related.item2.$sel = $($liSelection[related.item2.index]);
    related.item3.$sel = $($liSelection[related.item3.index]);

    //  console.log(related.item1.$sel.find(".link").html());
    //  console.log(related.item2.$sel.find(".link").html());
    //  console.log(related.item3.$sel.find(".link").html());

    $container.find("li").each(function(index, item) {
        if (!pEqual($(this), related.item1.$sel) && !pEqual($(this), related.item2.$sel) && !pEqual($(this), related.item3.$sel)) {
            $(this).remove();
        }
    });

    return $container;
}

function bindProductClick($li, item, data) {
    $li.find(".link").on("click", function() {
        $("#formProduct").find("input").val(item._id);
        $("#formProduct").submit();
    });

    return; //DEPRECATED

    var $modal = $("#productModal");
    var sliderArr = [];
    if (!_.isUndefined(item.slider_urls) && !_.isNull(item.slider_urls) && item.slider_urls != "") {
        sliderArr = item.slider_urls.toString().split("$$");
    }
    //
    $li.find(".link").on("click", function() {
        //return; //DISABLE !!!
        $modal.find(".modal-title").html(item.categoryDescription);
        $modal.find(".modal-body").html(item.description);
        $modal.find(".modal-spect").html(item.specification);



        $modal.find(".modal-name").html(item.name);
        $modal.find(".modal-code").html(item.code);

        //
        var $img = $("<img/>").attr({
            src: GAImagePath + item.url,
        });
        //
        $('.flexslider.portfolio_single_slider').removeData("flexslider");
        $('.flexslider.portfolio_single_slider').flexslider("destroy");
        //
        $(".modal-slider .slides").empty();
        //console.log(sliderArr);
        _.each(sliderArr, function(sliderCurrentFileName, index) {
            $(".modal-slider .slides").append(
                $("<li/>").append(
                    $("<img/>").attr({
                        src: GAImageSliderPath + sliderCurrentFileName
                    })
                )
            );
        });
        //
        $('.flexslider.portfolio_single_slider').flexslider({
            animation: "fade",
            controlNav: true,
            directionNav: true,
            animationLoop: false,
            slideshow: false,
        });



        var $containerRelated = (function() { //CLONA LA COLLECTION
            coll = _.find(gaCollections, function(coll) {
                return coll.id.toString() == item._category_id.toString();
            });
            return coll.$container.clone();
        })();
        $containerRelated.find("li").each(function() {
            if (item.name.toString() == $(this).find(".link").html().toString()) {
                $(this).remove();
            } //REMOVE CURRENT
        });
        $containerRelated = getRelatedItems($containerRelated);
        $containerRelated.find("li").each(function() {
            var _id = $(this).attr("id").replace("li-", "");
            var currentItem = _.find(data, function(obj) {
                return _id.toString() == obj._id.toString();
            });
            //console.log(_id);
            //console.log(data);
            //console.log(currentItem);
            bindProductClick($(this), currentItem, data);
        });


        $(".modal-related-cont").empty().append($containerRelated);

        //
        //console.log("MODAL!");
    });
}

var GACollection = (function(params) {
    var self = {
        id: params.id,
        name: params.name,
        data: params.data,
        $target: params.$target
    };
    var height = "142px";
    var bToggled = false;
    //
    var $collection = $GACollectionCollectionTemplate.clone(); //$(".collection");
    $collection
    //.toggle(false)
    .attr("id", "collection-" + self.id)
        .appendTo(self.$target);
    //.fadeIn("slow");
    //
    var $toggleArrows = $collection.find("h3 a").detach();
    $collection.find("h3").html(self.name).append($toggleArrows);
    var $body = $("#" + $collection.attr("id")).find(".body");
    var $ul = $collection.find(".body ul");
    $ul.empty();
    for (var x = 0; x < self.data.length; x++) {
        var item = self.data[x];
        //
        var $li = $("<li/>").append($liClone.clone());
        $li.attr("id", "li-" + item._id);
        $li.find(".img").attr({
            src: GAImagePath + item.url,
            width: "124px",
            height: "124px"
        });
        //$li.find(".img-link").attr("href", "project.php");
        $li.find(".link")
        //.attr("href", "project.php")
        .html(item.name);
        //

        bindProductClick($li, item, self.data);
        //
        $ul.append($li);
    }
    //
    $body.scrollbox({
        direction: 'h',
        linear: true,
        delay: 0,
        speed: 2,
        autoPlay: false
    });

    self.$container = $body;

    $collection.find('.ga-collection-backward').click(function() {
        console.log("backward click");
        $body.trigger('backward');
    });
    $collection.find('.ga-collection-forward').click(function() {
        console.log("forward click");
        $body.trigger('forward');
    });
    $collection.find('.ga-collection-expand').click(function() {
        console.log("expand click + " + $body.find("li").length);
        //
        if (!bToggled) {
            var currHeight = $body.height();
            $body.css({
                "height": "auto"
            });
            var autoHeight = $body.height();
            $body.height(currHeight).animate({
                height: autoHeight
            }, "swing");
            bToggled = true;
        } else {
            $body.animate({
                height: height
            }, "swing");
            bToggled = false;
        }
        //
    });
    //
    //console.log("GACollection[" + self.name + "]");
    return self;
});


drawGACollections = function($target, data) {


    //console.log(data);
    //return;

    gaCollections = []; //global
    data = _.sortBy(data, function(o) {
        return o.categoryDescription;
    }); //sort by category id
    function atNewCategory(_category_id, descr, _categoryData) {


        //console.log("atNewCategory ID "+ _category_id);

        gaCollections.push(new GACollection({
            name: descr,
            id: _category_id,
            data: _categoryData,
            $target: $target
        }));
    }
    //--
    var _lastCatId = null;
    var catdata = [],
        catDescr = "",
        catId = null,
        _lastCatDescr = "";
    _.each(data, function(o, i) {

        //console.log(o);

        catId = o._category_id;
        catDescr = o.categoryDescription;
        if (_lastCatId == null) {
            _lastCatId = catId;
            _lastCatDescr = catDescr;
        }
        if (catId != _lastCatId) {
            atNewCategory(_lastCatId, _lastCatDescr, catdata);
            catdata = [];
            _lastCatId = catId;
            _lastCatDescr = catDescr;
        }
        catdata.push(o);
    });
    atNewCategory(_lastCatId, _lastCatDescr, catdata);
    //--------
}



var fixed_menu = true;
window.jQuery = window.$ = jQuery;


/*-----------------------------------------------------------------------------------*/
/*  PRELOADER
/*-----------------------------------------------------------------------------------*/
jQuery(window).load(function() {
    //Preloader
    setTimeout("jQuery('#preloader').animate({'opacity' : '0'},300,function(){jQuery('#preloader').hide()})", 800);
    setTimeout("jQuery('.preloader_hide, .selector_open').animate({'opacity' : '1'},500)", 800);
    setTimeout("jQuery('footer').animate({'opacity' : '1'},500)", 2000);

});



/*-----------------------------------------------------------------------------------*/
/*  MENU
/*-----------------------------------------------------------------------------------*/


GAHelper = {};
GAHelper.autoLiActiveBasedOnScroll = true;
GAHelper.deselectNavMenuLinks = function() {
    var $navMenuLinks = $('.navmenu').find('li'); //.scroll_btn a
    // console.log("deselectNavMenuLinks !");
    $navMenuLinks.each(function() {
        var $a = $(this);
        $a.removeClass('active');
    });
}



function bindNavMenuLinkActiveOnClick(debug) {

    var $navMenuLinks = $('.navmenu').find('li'); //.scroll_btn a
    //console.log("bindNavMenuLinkActiveOnClick: " + $navMenuLinks.length);
    $navMenuLinks.each(function() {
        // console.log("binding " + $(this).attr("class"));

        var $li = $(this);
        var $a = $(this).find("a");
        $a.on("click", function() {
            //console.log("CLICK!");
            GAHelper.deselectNavMenuLinks();
            $li.addClass('active');
            if (debug) console.log("SELECTED " + $a.html());
        });

    });
}



function bindSmothScroll() {
    $('a[href*=#]:not([href=#])').click(function() {



        if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {



            var target = $(this.hash);
            target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');

            if (target.length) {
                GAHelper.autoLiActiveBasedOnScroll = false;
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000, function() {
                    setTimeout(function() {
                        GAHelper.autoLiActiveBasedOnScroll = true;
                    }, 2000);
                });
                return false;
            }
        }
    });
}



function calculateScroll() {
    contentTop = [];
    var contentBottom = [];
    var winTop = $(window).scrollTop();
    var rangeTop = 200;
    var rangeBottom = 500;
    $('.navmenu').find('.scroll_btn a').each(function() {
        if ($($(this).attr('href')).offset()) {
            contentTop.push($($(this).attr('href')).offset().top);
            contentBottom.push($($(this).attr('href')).offset().top + $($(this).attr('href')).height());
        }

    })
    $.each(contentTop, function(i) {
        if (winTop > contentTop[i] - rangeTop && winTop < contentBottom[i] - rangeBottom) {
            //  $('.navmenu li.scroll_btn')
            //  .removeClass('active')
            //  .eq(i).addClass('active');
        }
    })
};


function bindReadyBehaviours() {

    setTimeout(function() {
        $("body").css({
            "margin-bottom": "0px"
        });
        //console.log("SET 0");
    }, 4000);


    if ($(window).width() < 768) {


        var $cont = jQuery('.menu_block .container');


        setTimeout(function() {
            var $btn = $("<a href='javascript:void(0)' class='menu_toggler'><span class='fa fa-align-justify'></span></a>");
            $cont.prepend($btn);
            jQuery('header .navmenu').hide();
            jQuery('.menu_toggler, .navmenu ul li a').click(function() {
                jQuery('header .navmenu').slideToggle(300);
            });
        }, 1000);

        //


    }


    /* Superfish */
    jQuery(document).ready(function() {
        if ($(window).width() >= 768) {
            $('.navmenu ul').superfish();
        }
    });


    //TEAM SLIDER
    var owl = $(".owl-demo.team_slider");
    owl.owlCarousel({
        navigation: true,
        pagination: false,
        items: 3,
        itemsDesktop: [600, 2]
    });

    jQuery('.owl-controls').addClass('container');

    //TESTIMONIALS SLIDER
    var owl = $(".owl-demo.testim_slider");

    owl.owlCarousel({
        itemsCustom: [
            [0, 1]
        ],
        navigation: false,
        pagination: true,
        items: 1
    });


    jQuery('.owl-controls').addClass('container');



    /*-----------------------------------------------------------------------------------*/
    /*  IFRAME TRANSPARENT
/*-----------------------------------------------------------------------------------*/
    $("iframe").each(function() {
        var ifr_source = $(this).attr('src');
        var wmode = "wmode=transparent";
        if (ifr_source.indexOf('?') != -1) {
            var getQString = ifr_source.split('?');
            var oldString = getQString[1];
            var newString = getQString[0];
            $(this).attr('src', newString + '?' + wmode + '&' + oldString);
        } else $(this).attr('src', ifr_source + '?' + wmode);
    });



    //BlackAndWhite
    $('.client_img').BlackAndWhite({
        hoverEffect: true, // default true
        // set the path to BnWWorker.js for a superfast implementation
        webworkerPath: false,
        // for the images with a fluid width and height 
        responsive: true,
        // to invert the hover effect
        invertHoverEffect: false,
        // this option works only on the modern browsers ( on IE lower than 9 it remains always 1)
        intensity: 1,
        speed: { //this property could also   just speed: value for both fadeIn and fadeOut
            fadeIn: 300, // 200ms for fadeIn animations
            fadeOut: 300 // 800ms for fadeOut animations
        },
        onImageReady: function(img) {
            // this callback gets executed anytime an image is converted
        }
    });

    //Top Slider
    $('.flexslider.top_slider').flexslider({
        animation: "fade",
        controlNav: false,
        directionNav: true,
        animationLoop: false,
        slideshow: false,
        prevText: "",
        nextText: "",
        sync: "#carousel"
    });
    $('#carousel').flexslider({
        animation: "fade",
        controlNav: false,
        animationLoop: false,
        directionNav: false,
        slideshow: false,
        itemWidth: 100,
        itemMargin: 5,
        asNavFor: '.top_slider'
    });

    homeHeight();


    jQuery('.flexslider.top_slider .flex-direction-nav').addClass('container');


} //END BEHAVIOURs



jQuery(window).resize(function() {
    homeHeight();
});

jQuery(document).ready(function() {
    homeHeight();
});

function homeHeight() {
    var wh = jQuery(window).height() - 80;
    jQuery('.top_slider, .top_slider .slides li').css('height', wh);
}



/*-----------------------------------------------------------------------------------*/
/*  BLOG MIN HEIGHT
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
    blogHeight();
});

jQuery(window).resize(function() {
    blogHeight();
});

function blogHeight() {
    if ($(window).width() > 991) {
        var wh = jQuery(window).height() - 80;
        jQuery('#blog').css('min-height', wh);
    }

}


/*-----------------------------------------------------------------------------------*/
/*  FOOTER HEIGHT
/*-----------------------------------------------------------------------------------*/
jQuery(document).ready(function() {
    contactHeight();
});

jQuery(window).resize(function() {
    contactHeight();
});

function contactHeight() {
    if ($(window).width() > 991) {
        var wh = jQuery('footer').height() + 70;
        //jQuery('#contacts').css('min-height', wh);
    }

}