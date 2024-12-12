<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="select2.aspx.cs" Inherits="vDIFCapullos.select2" %>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>JS Bin</title>
  
  <link href="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/css/select2.min.css" rel="stylesheet" />
  
  <style>
    select {
      width: 200px;
    }
  </style>
</head>
<body>


  <select id="first">
    <option></option>
  </select>
  
  <select id="second">
    <option></option>
  </select>

  <select id="third">
    <option>111111111111111111111111111111111111111111</option>
    <option>2</option>
  </select>

  <select id="fourth">
    <option>3</option>
    <option>4</option>
  </select>

  <select id="fifth">
    <option>5</option>
    <option>6</option>
  </select>

  <select id="sixth">
    <option>7</option>
    <option>8</option>
  </select>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.4/jquery.min.js"></script>
  <script src="//cdnjs.cloudflare.com/ajax/libs/select2/4.0.0/js/select2.min.js"></script>
  
  <script>
      var options = [];

      for (var i = 0; i < 100; i++) {
          var start = i * 100;
          var end = start + 100 - 1;

          var range = start + " - " + end;

          var option = new Option(range, start);

          options.push(option);
      }

      $("#first").append(options);

      $("#first").select2({
          placeholder: 'Select a number range'
      });

      $("#second").select2({
          placeholder: 'Select a number'
      });

      $("#third").select2({
          placeholder: 'meh'
      });

      $("#fourth").select2({
          placeholder: 'meh'
      });

      $("#fifth").select2({
          placeholder: 'meh'
      });

      $("#sixth").select2({
          placeholder: 'meh'
      });

      $("#first").on("change", function () {
          var rangeStart = +$(this).val();

          var rangeEnd = rangeStart + 100;

          var rangeOptions = [];

          for (var i = rangeStart; i < rangeEnd; i++) {
              var option = new Option(i, i);

              rangeOptions.push(option);
          }

          $("#second option[value]").remove();

          $("#second").append(rangeOptions).val("").trigger("change");
      });
  </script>
</body>
</html>