function a(){
    var val = $('#searchSelect').val();
    if(val != "all"){
        $("#searchInput").removeAttr('disabled');
        if(val == "type"){
            $("#searchInput").attr('type', 'text');
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Carro, Moto, ...");
        }
        else if(val == "brand"){
            $("#searchInput").attr('type', 'text');
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Renault, Mazda, ...");
        }
        else if(val == "color"){
            $("#searchInput").attr('type', 'text');
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Rojo, Azul, ...");
        }
        else if(val == "capacity"){
            $("#searchInput").attr('type', 'number');
            $("#searchInput").attr('min', 1);
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. 3, 4, ...");
        }
        else if(val == "date"){
            $("#searchInput").attr('type', 'date');
            $("#searchInput").val("");
        }
        else if(val == "cost"){
            $("#searchInput").attr('type', 'number');
            $("#searchInput").attr('min', 100);
            $("#searchInput").attr('step', 100);
            $("#searchInput").val("");
        $("#searchInput").attr("placeholder", "ej. 2000, 1500, ...");
        }
        else if(val == "keyWord"){
            $("#searchInput").attr('type', 'text');
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Calle 45, Universidad, ...");
        }
    }else{
        $("#searchInput").val("");
        $("#searchInput").attr('disabled','disabled');
        $("#searchInput").attr('placeholder','');
    }
}

function restartSearch(){
    $("#searchInputKeyword").val("");
    $("#searchInputDate").val("");
    $("#searchInputCost").val("");
    $("#searchInputCapacity").val("");
    $("#searchInputType").val("");
    $("#searchInputBrand").val("");
}

function activateAdvancedSearch(){
    $("#searchDiv").show(1000);
    $("#deactivateAdvSearchBtn").show();
    $("#activateAdvSearchBtn").hide();
}

function deactivateAdvancedSearch(){
    $("#searchDiv").hide(1000);
    $("#deactivateAdvSearchBtn").hide();
    $("#activateAdvSearchBtn").show();
}

/* -------------- Funciones para las calificaciones de ruta ---------------- */
function ratingEffect(star, option){
    if(option == "over"){
        if(star == "star1")
            $("#star1").css('background-color', "#F3C921");
        else if(star == "star2"){
            $("#star1").css('background-color', "#F3C921");
            $("#star2").css('background-color', "#F3C921");
        }
        else if(star == "star3"){
            $("#star1").css('background-color', "#F3C921");
            $("#star2").css('background-color', "#F3C921");
            $("#star3").css('background-color', "#F3C921");
        }
        else if(star == "star4"){
            $("#star1").css('background-color', "#F3C921");
            $("#star2").css('background-color', "#F3C921");
            $("#star3").css('background-color', "#F3C921");
            $("#star4").css('background-color', "#F3C921");
        }
        else if(star == "star5"){
            $("#star1").css('background-color', "#F3C921");
            $("#star2").css('background-color', "#F3C921");
            $("#star3").css('background-color', "#F3C921");
            $("#star4").css('background-color', "#F3C921");
            $("#star5").css('background-color', "#F3C921");
        }
    }else if(option == "out"){
        $("#star1").css('background-color', "lightgray");
        $("#star2").css('background-color', "lightgray");
        $("#star3").css('background-color', "lightgray");
        $("#star4").css('background-color', "lightgray");
        $("#star5").css('background-color', "lightgray");
    }
}