<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="stack.aspx.cs" Inherits="vDIFCapullos.stack" %>

<!DOCTYPE html>

<html lang="en">
   <head> 
      <title>Chart.js Varying Dataset Bar Widths</title> 
      <style>

#container {
   width: 800px;
   height: 400px;
}


      </style> 
   </head> 
   <body translate="no"> 
      <div id="container"> 
         <canvas id="myChart" width="800" height="400"></canvas> 
      </div> 
      <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.js"></script> 
      <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script> 
      <script>
      var data = {
  labels: ["1", "2", "3", "4", "5"],
  datasets: [
    {
      label: "Casado",
      backgroundColor: "rgba(182,127,0,1)",
      borderColor: "rgba(117,61,41,1)",
      borderWidth: 1,
      data: [42, 78, 64, 90, 97],
      stack: "hombres"
    },
    {
      label: "Soltero",
      backgroundColor: "rgba(71,161,65,1)",
      borderColor: "rgba(36,93,56,1)",
      borderWidth: 1,
      data: [27, 63, 46, 64, 43],
        stack: "hombres"
    },
    {
      label: "Divorciado",
      backgroundColor: "rgba(255,141,106,1)",
      borderColor: "rgba(99,60,32,1)",
      borderWidth: 1,
      data: [18, 50, 23, 83, 35],
        stack: "hombres"
    },
    {
      label: "Casado",
      backgroundColor: "rgba(182,127,0,1)",
      borderColor: "rgba(117,61,41,1)",
      borderWidth: 1,
      stack: "mujeres",
      data: [152, 141, 170, 194, 128],
      xAxisID: 'x-axis-2',
      },
    {
      label: "Soltero",
      backgroundColor: "rgba(71,161,65,1)",
      borderColor: "rgba(36,93,56,1)",
      borderWidth: 1,
      stack: "mujeres",
      data: [132, 121, 140, 124, 138],
      xAxisID: 'x-axis-2',
    }
  ]
};
var options = {
  scales: {
    xAxes: [{
      categoryPercentage: 0.6,
      barPercentage: 1,
    }, {
      id: 'x-axis-2',
      type: 'category',
      display: false,
      categoryPercentage: 0.6,
      barPercentage: 1,
      barThickness: 20,
      gridLines: {
        offsetGridLines: true
      }
    }],
  },
  legend: {
    display: false
  }
};
var barChart = new Chart($("#myChart"), {
  type: 'bar',
  data: data,
  options: options
});
      </script>  
   </body>
</html>