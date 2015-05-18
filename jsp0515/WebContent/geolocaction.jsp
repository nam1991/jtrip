<%@ page language="java" contentType="text/html; charset=EUC-KR"
 pageEncoding="EUC-KR"%>


<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="initial-scale=1.0, user-scalable=no" />
<title>HTML5 Geolocation</title>
<style type="text/css">
html {
 height: 100%
}


body {
 font-family: sans-serif;
 background-color: #f5f5f5
}


#map-canvas {
 height: 250px
}
</style>
<script type="text/javascript"
 src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
 var map = null;
 function showlocation() {
  navigator.geolocation.getCurrentPosition(callback);
 }
 function callback(position) {
  var lat = position.coords.latitude;
  var lon = position.coords.longitude;
  document.getElementById('latitude').innerHTML = lat; //위도
  document.getElementById('longitude').innerHTML = lon; //경도
  var latLong = new google.maps.LatLng(lat, lon); //위치 기반
  var marker = new google.maps.Marker({
   position : latLong
  }); //마크 객체를 위도와 경도로 맞춰서 세팅
  marker.setMap(map); //마크맵에 세팅
  map.setZoom(15);// 확대
  map.setCenter(marker.getPosition()); // 마크를 중앙에 위치
 }
 google.maps.event.addDomListener(window, 'load', initMap);
 function initMap() {
  var mapOptions = {
   center : new google.maps.LatLng(0, 0),
   zoom : 1,
   mapTypeId : google.maps.MapTypeId.ROADMAP
  };
  map = new google.maps.Map(document.getElementById("map-canvas"),
    mapOptions);
 }
</script>
</head>
<body>
 <center>
  <input type="button" value="Show my location on Map"
   onclick="javascript:showlocation()" /> <br />
 </center>


 Latitude:
 <span id="latitude"></span>
 <br /> Longitude:
 <span id="longitude"></span>
 <br />
 <br />
 <div id="map-canvas" />
</body>
</html>