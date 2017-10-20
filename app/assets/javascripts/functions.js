function a(){
    var val = $('#searchSelect').val();
    if(val != "all"){
        $("#searchDiv").slideDown("slow");
        if(val == "type"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Carro, moto, ...");
        }
        else if(val == "brand"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Renault, Mazda, ...");
        }
        else if(val == "color"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Rojo, Azul, ...");
        }
        else if(val == "capacity"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. 3, 4, ...");
        }
        else if(val == "date"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Carro, moto, ...");
        }
        else if(val == "cost"){
            $("#searchInput").val("");
        $("#searchInput").attr("placeholder", "ej. 2000, 1500, ...");
        }
        else if(val == "keyWord"){
            $("#searchInput").val("");
            $("#searchInput").attr("placeholder", "ej. Calle 45, Fontibon, ...");
        }
    }else{
        $("#searchDiv").slideUp("slow");
    }
}

function searchAction(variable){
    var input, filter, table, tr, td, i;
    input = document.getElementById("searchInput");
    filter = input.value.toUpperCase();
    table = document.getElementById("myRoutesTable");
    tr = table.getElementsByTagName("tr");
    
    if($('#searchSelect').val() == "keyWord"){
        for (i = 0; i < tr.length; i++) {
            td = tr[i].getElementsByTagName("td")[0];
            if (td) {
                if (td.innerHTML.toUpperCase().indexOf(filter) > -1) {
                    tr[i].style.display = "";
                } else {
                    tr[i].style.display = "none";
                }
            }       
        }   
    }
}