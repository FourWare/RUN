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