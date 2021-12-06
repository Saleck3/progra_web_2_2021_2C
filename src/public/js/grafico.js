// Load the Visualization API and the corechart package.
google.charts.load('current', {'packages':['corechart']});

// Set a callback to run when the Google Visualization API is loaded.
google.charts.setOnLoadCallback(drawChart);

// Callback that creates and populates a data table,
// instantiates the pie chart, passes in the data and
// draws it.
function drawChart() {

    // Create the data table.
    var data = new google.visualization.DataTable();
    data.addColumn('string', 'tipo_vuelo');
    data.addColumn('number', 'pasajes');


    // Set chart options
    var options = {'title':'Cantidad de vuelos por tipos:',
        'width':350,
        'height':280,
        'is3D':true,

        }
        ;

    // Instantiate and draw our chart, passing in some options.


    $.ajax({

        url:'/reportes/datos',
        type: 'get',
        success: function (response){
            var datos = JSON.parse(response);
            console.log(datos);
            data.addRows([['suborbital',datos.suborbital],['tour',datos.tour],['entreDestinos',datos.entreDestinos]]);


            var chart = new google.visualization.PieChart(document.getElementById('chart_div'));
            chart.draw(data, options);
            var chart1 = new google.visualization.PieChart(document.getElementById('chart_div1'));
            chart1.draw(data, options);
            var chart2 = new google.visualization.PieChart(document.getElementById('chart_div2'));
            chart2.draw(data, options);
            var chart3 = new google.visualization.PieChart(document.getElementById('chart_div3'));
            chart3.draw(data, options);
        }

    });


}