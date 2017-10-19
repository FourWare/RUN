function search() {
  var val = $('#searchSelect').val();
  if(val != "all"){
    $("#searchDiv").slideDown("slow");
    if(val == "type")
        $("#searchInput").attr("placeholder", "ej. Carro, moto, ...");
    else if(val == "brand")
        $("#searchInput").attr("placeholder", "ej. Renault, Mazda, ...");
    if(val == "color")
        $("#searchInput").attr("placeholder", "ej. Rojo, Azul, ...");
    if(val == "capacity")
        $("#searchInput").attr("placeholder", "ej. 3, 4, ...");
    if(val == "date")
        $("#searchInput").attr("placeholder", "ej. Carro, moto, ...");
    if(val == "price")
        $("#searchInput").attr("placeholder", "ej. 2000, 1500, ...");
  }else{
    $("#searchDiv").slideUp("slow");
  }
}

function searchAction(){
    alert($("#searchInput").val());
}