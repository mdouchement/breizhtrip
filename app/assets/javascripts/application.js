// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require turbolinks
//= require leaflet
//= require_tree .

$(function() {
  $(document).foundation();

  // Map init
  var myMap = L.map('mapId').setView([48.7455, -3.4696], 13);
  mapLink =
    '<a href="http://openstreetmap.org">OpenStreetMap</a>';

  L.tileLayer(
    'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; ' + mapLink,
      maxZoom: 18,
    }).addTo(myMap);

  var markers = [];

  //events
  myMap.on('click', onMapClick);
  $('.clear-markers').on('click', clearMarkers);

  $('form').on('submit', function(e) {

    var formData = $("#form :input")
      .filter(function(index, element) {
        return $(element).val() !== "";
      })
      .serialize();

    var url = "/legacies?" + formData;

    $.ajax({
      type: "GET",
      url: url,
      success: function(data) {
        clearMarkers();
        displayMarkers(data);
      }
    });

    e.preventDefault();

  });

  // functions
  function displayMarkers(data) {

    data.forEach(function(element, index, array) {
      var marker = L.marker([element.latitude, element.longitude]);
      var info = element.lieu_dit !== "" ? element.lieu_dit : element.titre_courant;
      var text = parseInfo(element);

      marker.addTo(myMap)
        .bindPopup(text);
      markers.push(marker);
    });
  }

  function parseInfo(element) {
    var text = "";

    if (element.adresse !== null)
      text += "Adresse: " + element.adresse + "<br>";

    if (element.cadre_etude !== null)
      text += "Cadre d'etude: " + element.cadre_etude + "<br>";

    if (element.commune !== null)
      text += "Commune: " + element.commune + "<br>";

    if (element.datations_principales !== null)
      text += "Datations: " + element.datations_principales + "<br>";

    if (element.date_enquete !== null)
      text += "Date Enquete: " + element.date_enquete + "<br>";

    if (element.denomination !== null)
      text += "Denomination: " + element.denomination + "<br>";

    if (element.lieu_dit !== null)
      text += "Lieu dit: " + element.lieu_dit + "<br>";

    if (element.phase !== null)
      text += "Phase: " + element.phase + "<br>";

    if (element.statut !== null)
      text += "Statut: " + element.statut + "<br>";

    if (element.lien_image !== null)
      text += '<img src=' + element.lien_image + ' alt=""><br>';

    return text;
  }

  function clearMarkers() {
    markers.forEach(function(element, index, array) {
      myMap.removeLayer(element);
    });
  }

  function onMapClick(e) {
    var formData = $("#form :input")
      .filter(function(index, element) {
        return $(element).val() !== "";
      })
      .serialize();

    var radius = parseInt($("#radius").val());
    var url = "/legacies?" + formData + "&latitude=" + e.latlng.lat +
      "&longitude=" + e.latlng.lng + "&radius=" + radius;

    $.ajax({
      type: "GET",
      url: url,
      success: function(data) {
        clearMarkers();
        var circle = L.circle([e.latlng.lat, e.latlng.lng], radius, {
          color: 'orange',
          fillColor: '#FFA500',
          fillOpacity: 0.2
        }).addTo(myMap);
        markers.push(circle);
        displayMarkers(data);
      }
    });
  }

});
