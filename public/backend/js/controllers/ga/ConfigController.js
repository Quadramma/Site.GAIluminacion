function ConfigNewsletterController($scope, $state, AppConfig, $resource, $timeout) {
    console.info('ConfigNewsletterController');

    $scope.passwordSaveMessage = "";
    $scope.userDeletedMessage = "";

    function copyToClipboard(s) {
        // ie
        if (window.clipboardData && clipboardData.setData) {
            clipboardData.setData('text', s);
        }
        // others
        else {
            var flashcopier = 'flashcopier';
            if (!document.getElementById(flashcopier)) {
                var divholder = document.createElement('div');
                divholder.id = flashcopier;
                document.body.appendChild(divholder);
            }
            document.getElementById(flashcopier).innerHTML = '';
            var divinfo = '<embed src="_clipboard.swf" FlashVars="clipboard=' + encodeURIComponent(s) + '" width="0" height="0" type="application/x-shockwave-flash"></embed>';
            document.getElementById(flashcopier).innerHTML = divinfo;
        }
    }

    $scope.copyemail = function() {
        _.each($scope.items, function(val) {
            if (val.checked) {

                $timeout(function() {
                    copyToClipboard(val.email);
                    console.info(val.email + ' copied to clipboard!');
                });

            }
        });
    }

    $scope.deleteSelected = function() {

        var item = null;
        _.each($scope.items, function(val) {
            if (val.checked) {
                item = val;
            }
        });

        if (item == null) {
            console.info('deleteSelected nothing to delete !');
            return;
        }


        $api.save({
            controller: "newsletter",
            action: "delete"
        }, {
            _id: item._id
        }, function(data) {
            console.info('deleteSelected success');
            updateFromDB();
            $scope.userDeletedMessage = "suscriptor eliminado";
            setTimeout(function() {
                $scope.userDeletedMessage = "";
            }, 3000);

        });

        console.info('deleteSelected;');
    };

    $scope.updatepass = function() {


        $api.save({
            controller: "file",
            action: "savenewsletterdata"
        }, {
            password: $scope.password
        }, function(data) {
            console.info('updatepass success');

            $scope.passwordSaveMessage = "Password actualizada";
            setTimeout(function() {
                $scope.passwordSaveMessage = "";
                console.info('updatepass success timeout over');
            }, 3000);

        });

        console.info('updatepass');
    }

    $scope.check = function(item) {
        _.each($scope.items, function(val) {
            if (item.email.toString().toLowerCase() !== val.email.toString().toLowerCase()) {
                val.checked = false;
                console.info("uncheck! " + val.email);
            }
        });
        // console.info($scope.items);
    };

    var $api = $resource(AppConfig.apiGAProduccion + '/:controller/:action/:id', {}, {
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

    function updateFromDB() {
        $api.get({
            controller: "newsletter"
        }, function(data) {
            _.each(data.items, function(val) {
                val.checked = false;
            });
            $scope.items = data.items;
            // console.info(data.items);
        });
    }
    updateFromDB();

    $api.get({
        controller: "file",
        action: "getnewsletterdata"
    }, function(res) {
        console.info(res.data);
        $scope.password = res.data.password;
    });

}



function GaUploadsController($scope, AppConfig, $timeout) {
    console.log("GaUploadsController");
    $scope.file = null;

    $scope.file = {
        name: "",
        ext: ""
    };


    function setFile(name, ext) {
        $timeout(function() {
            $scope.$apply(function() {
                console.info("[Settings filename ->" + name + "]")
                $scope.file.name = name;
                $scope.file.ext = ext;
            }, 500)
        });
    }
     function showFileError(error) {
        $scope.file.invalid = error;
        $timeout(function() {
            $scope.$apply(function() {
                $scope.file.invalid = "";
            }, 500)
        },5000);
    }



    //Ajax para enviar formdata
    function send(type, formData, callback) {
        $.ajax(AppConfig.apiGAProduccion + '/upload/' + type, {
            type: "POST",
            dataType: "json",
            contentType: false,
            processData: false,
            data: formData
        }).always(function(arg1, arg2, arg3) {
            callback(arg1)
        }).error(function(jqXHR, status, error) {
            log("Ajax Status -> " + (status));
            log("Ajax Error -> " + (error));
        });
    }



    $scope.tryupload = function() {

        var ext = $scope.file.ext || "qwe";
        var notAnImage = (ext !== "jpg") && (ext !== "png") && (ext !== "gif");
        console.info(notAnImage);
        console.info(ext);
        var resFunction = $("#destinoDropdown").find("input").val();
        console.info(resFunction);
        if(notAnImage && ext!== "pdf"){
            showFileError("Archivo invalido. Debe ser JPG,PNG o un PDF");
            return;
        }

        if(ext == "pdf" && resFunction !== "newsletter"){
            showFileError("La extension PDF solo acepta como destino newsletter");
            return;   
        }


        $('.ui.form').form('validate form');
    }
    $scope.upload = function() {
        console.log("GaUploadsController.upload");
        if ($scope.file == null) {
            //console.log("GaUploadsController.upload file empty nothing happens");
            $scope.message("Warning: No se detecto ninguna archivo para subir", 3000);
        } else {
            var fd = new FormData();
            fd.append("file", $scope.file);
            var resFunction = $("#destinoDropdown").find("input").val();

            send(resFunction, fd, function(res) {
                console.log("GaUploadsController upload response");
                console.log(res);
                if (res.ok) {
                    $scope.message("Archivo " + res.fileName + " cargada.", 2000);
                } else {
                    $scope.message("Error: " + res.saveResponse.error, 10000);
                }
            })

        }
    }

    //HTML FILE DROP 
    var holder = document.getElementById('holder'),
        state = document.getElementById('status');

    if (typeof window.FileReader === 'undefined') {
        state.className = 'fail';
    } else {
        state.className = 'success';
        state.innerHTML = '';
    }

    holder.ondragover = function() {
        this.className = 'hover';
        return false;
    };
    holder.ondragend = function() {
        this.className = '';
        return false;
    };
    holder.ondrop = function(e) {
        this.className = '';
        e.preventDefault();

        var file = e.dataTransfer.files[0],
            reader = new FileReader();

        var ext = file.name.split(".")[file.name.split(".").length - 1];
        setFile(file.name, ext);

        reader.onload = function(event) {
            console.info("reader onload");
            console.info(event.target.result);
            console.info(event.target);
            holder.style.background = 'url(' + event.target.result + ') no-repeat center';


            var notAnImage = (ext !== "jpg") && (ext !== "png") && (ext !== "gif");
            console.info(ext);
            if (notAnImage) {
                holder.style.background = 'url(' + "../images/file_placeholder.png" + ') no-repeat center';
            }
        };
        console.log(file);



        reader.readAsDataURL(file);
        $scope.file = file;
        return false;
    };

    //SEMANTIC INIT
    $('.ui.form')
        .form({
            destino: {
                identifier: 'destino',
                rules: [{
                    type: 'empty',
                    prompt: 'Destino requerido'
                }]
            }
        }, {
            onSuccess: function() {
                $scope.upload();
            },
            onFailure: function() {
                $(".ui.error.message").focus();
            }
        });
    $('.ui.dropdown')
        .dropdown();

    //message
    $scope.message = function(msg, time) {
        $('.ui.error.message').fadeIn();
        $('.ui.form')
            .form("add errors", [msg]);
        setTimeout(function() {
            $('.ui.error.message').fadeOut();
        }, time);
    }

}


function ConfigController() {

}

function ConfigSliderController($scope, $state, GAFile, AppConfig) {

    console.log("ConfigSliderController");

    $scope.fullslidesPath = AppConfig.apiGAProduccion + "/uploads/home_slides/";

    $scope.slide1Click = function() {
        $scope.slide1 = $('#slide1Dropdown').find("input").val();
    }
    $scope.slide2Click = function() {
        $scope.slide2 = $('#slide2Dropdown').find("input").val();
    }
    $scope.slide3Click = function() {
        $scope.slide3 = $('#slide3Dropdown').find("input").val();
    }

    //SLIDES SELECTED GET
    GAFile.getHomeSlides({}, {
        slide1: $scope.slide1 || "",
        slide2: $scope.slide2 || "",
        slide3: $scope.slide3 || ""
    }, function(data) {
        $scope.slide1 = data.files.slide1;
        $scope.slide2 = data.files.slide2;
        $scope.slide3 = data.files.slide3;
        $('#slide1Dropdown').find("input").val($scope.slide1);
        $('#slide2Dropdown').find("input").val($scope.slide2);
        $('#slide3Dropdown').find("input").val($scope.slide3);
    });

    //SLIDES DISPONIBLES GET
    GAFile.getAvailableHomeSlides(function(data) {
        console.log("ConfigSliderController.getAvailableHomeSlides");
        $scope.availablesSlides = data.files;
        setTimeout(function() {
            $scope.$apply(function(scope) {
                setTimeout(function() {
                    $('.ui.dropdown')
                        .dropdown();
                }, 1000)
            }, 1000)

        });

    });


    //TEXTOS GET
    GAFile.getHomeText({}, function(data) {
        console.log(data);
        $scope.slide1Title = data.files.slide1.title;
        $scope.slide1Text = data.files.slide1.text;
        $scope.slide2Title = data.files.slide2.title;
        $scope.slide2Text = data.files.slide2.text;
        $scope.slide3Title = data.files.slide3.title;
        $scope.slide3Text = data.files.slide3.text;
    });

    $scope.save = function() {
        console.log("ConfigSliderController.save.homeslides");
        GAFile.saveHomeSlides({}, {
            slide1: $scope.slide1 || "",
            slide2: $scope.slide2 || "",
            slide3: $scope.slide3 || ""
        }, function(data) {

            console.log("ConfigSliderController.save.homeslides.success");

            //SUCCESS
            $('.ui.error.message').fadeIn();
            $('.ui.form')
                .form("add errors", ["Slides actualizados"]);
            setTimeout(function() {
                $('.ui.error.message').fadeOut();
            }, 5000);

        });

        console.log("ConfigSliderController.save.hometext");
        GAFile.saveHomeText({}, {
            slide1Title: $scope.slide1Title || "",
            slide1Text: $scope.slide1Text || "",
            slide2Title: $scope.slide2Title || "",
            slide2Text: $scope.slide2Text || "",
            slide3Title: $scope.slide3Title || "",
            slide3Text: $scope.slide3Text || "",
        }, function(data) {
            console.log("ConfigSliderController.save.hometext.success");
            //SUCCESS
            $('.ui.error.message').fadeIn();
            $('.ui.form')
                .form("add errors", ["Textos actualizados"]);
            setTimeout(function() {
                $('.ui.error.message').fadeOut();
            }, 5000);
        });

    } //END SAVE



}



function ConfigDestacadosController($scope, GAFile, AppConfig, Product) {

    console.log("ConfigDestacadosController");

    $scope.fulldestacadosPath = AppConfig.apiGAProduccion + "/uploads/products/";

    $scope.getById = function($_id) {
        var rta = _.find($scope.items, function(item) {
            return item._id.toString() == $_id.toString();
        });
        console.log(rta);
        return rta;
    }

    $scope.destacado1Click = function() {
        var rta = $scope.getById($('#destacado1Dropdown').find("input").val());
        $scope.destacado1 = rta.url;
        $scope.item1id = rta._id;
    }
    $scope.destacado2Click = function() {
        var rta = $scope.getById($('#destacado2Dropdown').find("input").val());
        $scope.destacado2 = rta.url;
        $scope.item2id = rta._id;
    }
    $scope.destacado3Click = function() {
        var rta = $scope.getById($('#destacado3Dropdown').find("input").val());
        $scope.destacado3 = rta.url;
        $scope.item3id = rta._id;
    }


    //1. items
    Product.getForCombo(function(data) {

        console.log("ConfigDestacadosController.getForCombo");

        $scope.items = data.items;

        //2. destacados
        GAFile.getDestacados({}, {
            destacado1: $scope.destacado1 || "",
            destacado2: $scope.destacado2 || "",
            destacado3: $scope.destacado3 || ""
        }, function(data) {
            if (_.isNull(data.files)) return;
            $scope.destacado1 = ($scope.getById(data.files.destacado1)).url;
            $scope.destacado2 = ($scope.getById(data.files.destacado2)).url;
            $scope.destacado3 = ($scope.getById(data.files.destacado3)).url;

            $('#destacado1Dropdown').find("input").val(data.files.destacado1);
            $('#destacado2Dropdown').find("input").val(data.files.destacado2);
            $('#destacado3Dropdown').find("input").val(data.files.destacado3);
            $scope.item1id = data.files.destacado1;
            $scope.item2id = data.files.destacado2;
            $scope.item3id = data.files.destacado3;
        });



        setTimeout(function() {
            $scope.$apply(function(scope) {
                setTimeout(function() {
                    $('.ui.dropdown')
                        .dropdown();
                }, 1000)
            }, 1000)

        });

    });

    $scope.save = function() {
        console.log("ConfigDestacadosController.save");
        GAFile.saveDestacados({}, {
            destacado1: $scope.item1id || "",
            destacado2: $scope.item2id || "",
            destacado3: $scope.item3id || ""
        }, function(data) {

            console.log("ConfigDestacadosController.save.success");

            //SUCCESS
            $('.ui.error.message').fadeIn();
            $('.ui.form')
                .form("add errors", ["Cambios guardados"]);
            setTimeout(function() {
                $('.ui.error.message').fadeOut();
            }, 2000);

        });
    }



}