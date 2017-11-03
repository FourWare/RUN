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
    }
}

/* -------------- Funciones para las calificaciones de ruta ---------------- */
$(document).ready(function() {
  $("#star1").on("mouseover", function() {
    ratingEffect("star1", "over")
  });
  $("#star1").on("mouseout", function() {
    ratingEffect("star1", "out")
  });
  
  $("#star2").on("mouseover", function() {
    ratingEffect("star2", "over")
  });
  $("#star2").on("mouseout", function() {
    ratingEffect("star2", "out")
  });
  
  $("#star3").on("mouseover", function() {
    ratingEffect("star3", "over")
  });
  $("#star3").on("mouseout", function() {
    ratingEffect("star3", "out")
  });
  
  $("#star4").on("mouseover", function() {
    ratingEffect("star4", "over")
  });
  $("#star4").on("mouseout", function() {
    ratingEffect("star4", "out")
  });
  
  $("#star5").on("mouseover", function() {
    ratingEffect("star5", "over")
  });
  $("#star5").on("mouseout", function() {
    ratingEffect("star5", "out")
  });
});

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

function star1Action(){
    $('#myRatingText').html('1 <small>/5</small>');
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $('#countStar1').text(' ' + (parseInt($('#countStar1').text()) + 1 ));
    updateBars();
}

function star2Action(){
    $('#myRatingText').html('2 <small>/5</small>');
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $('#countStar2').text(' ' + (parseInt($('#countStar2').text()) + 1 ));
    updateBars();
}

function star3Action(){
    $('#myRatingText').html('3 <small>/5</small>');
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $('#countStar3').text(' ' + (parseInt($('#countStar3').text()) + 1 ));
    updateBars();
}

function star4Action(){
    $('#myRatingText').html('4 <small>/5</small>');
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $('#countStar4').text(' ' + (parseInt($('#countStar4').text()) + 1 ));
    updateBars();
}

function star5Action(){
    $('#myRatingText').html('5 <small>/5</small>');
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $('#countStar5').text(' ' + (parseInt($('#countStar5').text()) + 1 ));
    updateBars();
}

function addUserRating(){
    $('#countUsersRating').text(' ' + (parseInt($('#countUsersRating').text()) + 1));
}

function removeUserRating(){
    $('#countUsersRating').text(' ' + (parseInt($('#countUsersRating').text()) - 1));
}

function updateBars(){
    $('#barStar1').css('width', $('#countStar1').text()*100/(parseInt($('#countUsersRating').text())) + '%' );
    $('#barStar2').css('width', $('#countStar2').text()*100/(parseInt($('#countUsersRating').text())) + '%' );
    $('#barStar3').css('width', $('#countStar3').text()*100/(parseInt($('#countUsersRating').text())) + '%' );
    $('#barStar4').css('width', $('#countStar4').text()*100/(parseInt($('#countUsersRating').text())) + '%' );
    $('#barStar5').css('width', $('#countStar5').text()*100/(parseInt($('#countUsersRating').text())) + '%' );
}

function ratingCancel() {
    $('#ratingBtn').slideToggle("slow");
    $('#ratingSaved').slideToggle("slow");
    $("button[id^='star']").css('background-color', "lightgray");
    var myRat = $('#myRatingText').text()[0];
    $('#countStar' + myRat).text(' ' + (parseInt($('#countStar' + myRat).text()) - 1 ));
    updateBars();
    removeUserRating();
    $('#myRatingText').html('- <small>/5</small>');
}