<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
  <head>
    <title>Jarvis</title>
    <meta http-equiv="Content-Type" content="text/html;charset=utf-8"/>
    <meta http-equiv="Content-Language" content="Fr"/>
    <meta name="Author" lang="fr" content="Torna"/>
    <meta name="Copyright" content="© Torna"/>
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="Pragma" content="no-cache">
    <meta http-equiv="Expires" content="0">
    <meta http-equiv="refresh" content="3600;url=index.php">
    <script type="text/javascript" src="//ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
    <script type="text/javascript" src="javascript.js"></script>
    <link rel="stylesheet" type="text/css" href="style.css"/>
  </head>
  <body>

    <div id="main">
      <!--div id="etalon">Jarvis <?php //echo date("Y-m-d H:i:s"); ?></div-->
      <div id="horloge"></div>
      <div id="meteo"></div>
      <div id="meteo_black"></div>
      <div id="ts3"></div>
      <div id="ping"></div>
      <div id="analytics"></div>
      <div id="vpn"></div>
      <div id="latency"></div>
      <div id="earth"><img id="img_earth" src="pict/blank.png"></div>
      <div id="moon"><img id="img_moon" src="pict/blank.png"></div>
      <div id="ifstat_oberon_up"><img id="img_oberon_up" src="pict/blank.png"></div>
      <div id="ifstat_oberon_down"><img id="img_oberon_down" src="pict/blank.png"></div>
    </div>

    <?php include('inc.php'); echo analytics(); ?>

  </body>
</html>
