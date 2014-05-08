function GaController($scope) {


    console.log("GaController READY");


    //$scope.collection = db.collection;

    $scope.pushState = function(name) {
        window.history.pushState({}, name, name);
        $("title").html("GA | " + name);
    }


    setTimeout(function() {
        drawGACollections($(".ga-collections-container"), db.collection);
    }, 1000);


    bindReadyBehaviours();
    bindNavMenuLinkActiveOnClick(true);
    bindSmothScroll();
}