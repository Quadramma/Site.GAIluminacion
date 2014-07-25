angular.module('GApp', [
    'GApp.controllers'
]);

angular.module('GApp.controllers', ["ngResource"])

.controller('NewsletterList', function($scope, $resource) {
    console.log("NewsletterList");
    $scope.pdfList = db.newsletterFiles;
})

.controller('SubscribeController', function($scope, $resource) {
    console.log("SubscribeController");

    var $api = $resource("backend/api" + '/:controller/:action/:id', {}, {
        query: {
            method: "GET",
            isArray: true
        },
        get: {
            method: "GET",
            isArray: false
        },
        save: {
            method: 'POST',
            isArray: false
        },
        update: {
            method: 'POST',
            isArray: false
        },
        delete: {
            method: "DELETE",
            isArray: false
        }
    });

    $scope.subscribe = function() {


        var name = $(".subscribe.name").val();
        var email = $(".subscribe.email").val();
        if (name === "" || email === "") {
            console.log("subscribe failure: complete fields");
            show("Datos requeridos");
        } else {
            console.log("subscribe");

            $api.save({
                controller: "newsletter",
                action: "save"
            }, {
                name: name,
                email: email
            }, function(data) {
                if (data.ok) {
                    console.info('subscribe success');
                    show("Datos enviados");
                } else {
                    show(data.error || "Error inesperado, itente mas tarde");
                }

            });

        }



    };

    function show(text) {
        $(".newsletter.form.subscribe.events").html(text);
        $(".newsletter.form.subscribe.events").fadeIn();
        setTimeout(function() {
            $(".newsletter.form.subscribe.events").fadeOut();
        }, 5000);
    }
})


.controller('GaController', function($scope) {
    //console.log("GaController READY");


    var newsletter = db.newsletter;

    $scope.clickLogin = function() {
        var pass = $(".form-signin input").val();
        if (pass == newsletter.password) {
            //window.location.href = "sample.pdf";

            $(".newsletter.login").fadeOut();
            $(".newsletter.list").fadeIn();

        } else {
            $(".form-signin p").fadeIn();
            setTimeout(function() {
                $(".form-signin p").fadeOut();
            }, 5000);
        }
    };
    $scope.hideLogin = function() {
        $("#descargasModal").fadeOut();
    }

    $scope.clickDescargas = function() {
        var name = "newsletter"
        window.history.pushState({}, name, name);
        $("title").html(name + " | GA");
        $("#descargasModal").fadeIn("slow");
    };


    $scope.pushState = function(name) {
        $scope.hideLogin();
        window.history.pushState({}, name, name);
        $("title").html(name + " | GA");
    }
    setTimeout(function() {
        drawGACollections($(".ga-collections-container"), db.collection);
    }, 1000);


    //PROJECTS
    $scope.projects = _.sortBy(db.projects, function(item) {
        return item.categoryDescription;
    });


    $scope.projectsFromCategoryDescription = function(currentCategory) {
        //console.log("i need the projects for category " + currentCategory);
        return _.filter($scope.projects, function(item) {
            return item.categoryDescription.toString() == currentCategory.toString();
        });
    };


    $scope.projectCategories = (function() {
        var rta = [];
        _.each($scope.projects, function(item) {
            if (_.find(rta, function(curr) {
                return curr.categoryDescription.toString() == item.categoryDescription.toString()
            }) == null) {
                rta.push({
                    categoryDescription: item.categoryDescription,
                    projects: null
                });
            }
        });
        _.each(rta, function(i) {
            i.projects = $scope.projectsFromCategoryDescription(i.categoryDescription);
        });
        return rta;
    })();



    db.scope = $scope;

    setTimeout(function() {
        $scope.$apply(function() {
            var owl = $(".owl-demo.projects_slider"); //WORKS SLIDER
            owl.owlCarousel({
                navigation: true,
                pagination: false,
                responsive: true,
                items: 4,
                itemsDesktop: [1000, 4],
                itemsDesktop: [600, 3]
            });
        });
        //PrettyPhoto
        $("a[rel^='prettyPhoto']").prettyPhoto();
    }, 1000);

    $scope.slide1 = db.hometexts.slide1;
    $scope.slide2 = db.hometexts.slide2;
    $scope.slide3 = db.hometexts.slide3;


    function setHomeSlides() {
        var $path = "backend/api/uploads/home_slides/";
        var homeSlide1 = db.homeslides.slide1 || "slide1_bg.jpg";
        var homeSlide2 = db.homeslides.slide2 || "slide2_bg.jpg";
        var homeSlide3 = db.homeslides.slide3 || "slide3_bg.jpg";
        $(".slide1").css("background-image", "url('" + $path + homeSlide1 + "')");
        $(".slide2").css("background-image", "url('" + $path + homeSlide2 + "')");
        $(".slide3").css("background-image", "url('" + $path + homeSlide3 + "')");

        // console.log($path + homeSlide1);
        // console.log("HOME SLIDES SET");

        $lis = $("#carousel .slides");
        $lis.find("img").each(function(index, i) {
            //console.log(index);
            if (index == 0) {
                $(this).attr("src", $path + homeSlide1);
            }
            if (index == 1) {
                $(this).attr("src", $path + homeSlide2);
            }
            if (index == 2) {
                $(this).attr("src", $path + homeSlide3);
            }
        });
        

        //adjust slider control
        $(".flex-direction-nav.container").detach().prependTo("#carousel");
    }


    bindReadyBehaviours();
    bindNavMenuLinkActiveOnClick(true);
    bindSmothScroll();

    $scope.projectClick = function(item) {

        $("#formProject").find("input").val(item._id);
        $("#formProject").submit();

    }


    jQuery(window).load(function() {

        setHomeSlides();

        setTimeout(function() {

            //console.log("scroll " + db.scrollTo);

            //SCROLL TO
            if (db.scrollTo == "") return;
            var target = $("#" + db.scrollTo);
            if (target.length) {
                $('html,body').animate({
                    scrollTop: target.offset().top
                }, 1000, function() {
                    //FINISH
                });
                return false;
            }

        }, 800);
    });



    //console.info(db.product);

});

/*

    var owl = $(".owl-demo.projects_slider"); //WORKS SLIDER
    //console.log(owl.length);
    owl.owlCarousel({
        navigation: false,
        pagination: false,
        responsive: true,
        items: 4,
        itemsDesktop: [1000, 4],
        itemsDesktop: [600, 3]
    });

*/


function ProductSingleSlider() {
    $('.flexslider.portfolio_single_slider').flexslider({
        animation: "fade",
        controlNav: true,
        directionNav: true,
        animationLoop: false,
        slideshow: false,
    });

}

function SingleProductController($scope) {
    console.log("SingleProductController");



    if (db.product) {

        $scope.item = db.product[0];


        var name = 'producto/' + $scope.item._id;
        window.history.pushState({}, name, name);


        var cuts = $scope.item.slider_urls.toString().split("$$");
        $scope.slides = cuts;
        console.log($scope.slides);
        setTimeout(function() {
            ProductSingleSlider();
        }, 2000);
    }
}

function SingleProjectController($scope) {
    console.log("SingleProjectController");

    if (db.project) {
        $scope.item = db.project[0];

        var name = 'proyecto/' + $scope.item._id;
        window.history.pushState({}, name, name);

        var cuts = $scope.item.slider_urls.toString().split("$$");
        $scope.slides = cuts;
        console.log($scope.slides);
        setTimeout(function() {
            ProductSingleSlider();
        }, 2000);
    }
}

function ContactController($scope) {

    console.log("ContactController");


    $scope.clickDestacado = function(item) {
        console.log("clickDestacado");
        console.info(item);
        $("#formProduct").find("input").val(item._id);
        $("#formProduct").submit();
    }

    if (!db.destacados) {
        console.log("Destacados: Error interno");
        return;
    }

    if (!db.collection) {
        console.log("Collection: Error interno");
        return;
    }

    $scope.getById = function($_id) {
        var rta = _.find(db.collection, function(item) {
            return item._id.toString() == $_id.toString();
        });
        return rta;
    }

    $scope.items = [
        $scope.getById(db.destacados.destacado1),
        $scope.getById(db.destacados.destacado2),
        $scope.getById(db.destacados.destacado3)
    ];


    setTimeout(function() {
        $scope.$apply(function() {
            //    console.log("ContactController END");
        });
    }, 1000);


}