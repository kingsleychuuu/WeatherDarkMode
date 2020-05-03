// generator function
function getColor() {
  return (
    "#" +
    Math.random()
      .toString(16)
      .slice(2, 8)
  );
}
// sets background color style
function setBackground() {
  var bgColor = getColor();
  document.body.style.background = bgColor;
}
// runs function on click
document.body.onkeyup = function(e) {
  if (e.keyCode == 32) {
    setBackground();
  }
};

function weather() {
  var location = document.getElementById("location");
  var apiKey = "62d85646d8de5ab46bfbead779eee698";
  var url = "https://api.openweathermap.org/data/2.5/weather?lat=";

  navigator.geolocation.getCurrentPosition(success, error);

  function success(position) {
    latitude = position.coords.latitude;
    longitude = position.coords.longitude;

    location.innerHTML =
      "Latitude is " + latitude + "° Longitude is " + longitude + "°";

    $.getJSON(
      url + latitude + "&lon=" + longitude + "&appid=" + apiKey,
      function(data) {
        $("#temp").html(data.main.temp + "° F");
        $("#minutely").html(data.dt);
      }
    );
  }

  function error() {
    location.innerHTML = "Unable to retrieve your location";
  }

  location.innerHTML = "Locating...";
}

weather();
