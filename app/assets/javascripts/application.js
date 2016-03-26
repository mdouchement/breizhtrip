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
  var myMap = L.map('mapId').setView([48.7455, -3.4696], 13);
  mapLink =
    '<a href="http://openstreetmap.org">OpenStreetMap</a>';
  L.tileLayer(
    'http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
      attribution: 'Map data &copy; ' + mapLink,
      maxZoom: 18,
    }).addTo(myMap);


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
        console.log(data);
        displayMarkers(data);
      }
    });

    e.preventDefault();

  });

});
