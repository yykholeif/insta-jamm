$(document).ready(function () {
  loginEventListener();
});
console.log('called4');
jQuery(function($) {
    // Asynchronously Load the map API
    var script = document.createElement('script');
    script.src = "//maps.googleapis.com/maps/api/js?sensor=false&callback=initialize&key=AIzaSyACSVfoZXjO2JKkgmYdp9ITIAeOEc8xm7Y";
    document.body.appendChild(script);
    console.log('called');
});

function initialize() {
  var call = $.ajax({
      url: '/musicians/locations',
      method: 'GET'
    })

    call.done(function(response){
      console.log('call done');
      drawMap(response);
    });

    call.fail(function(error){
      console.log(error)
    })
}

function drawMap(markers) {
  console.log('called2');
  console.log(markers);
    var map;
    var bounds = new google.maps.LatLngBounds();
    var mapOptions = {
        mapTypeId: 'roadmap'
    };

    // Display a map on the page
    map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
    map.setTilt(45);

    // Info Window Content
    var infoWindowContent = markers.map(function(musician) {
      console.log(musician);
      return ['<div class="info_content"><h3>' + musician[0] + '</h3></div>'];
    })

    console.log(infoWindowContent);

    // Display multiple markers on a map
    var infoWindow = new google.maps.InfoWindow(), marker, i;

    // Loop through our array of markers & place each one on the map
    for( i = 0; i < markers.length; i++ ) {
        var position = new google.maps.LatLng(markers[i][1], markers[i][2]);
        bounds.extend(position);
        marker = new google.maps.Marker({
            position: position,
            map: map,
            title: markers[i][0]
        });

        // Allow each marker to have an info window
        google.maps.event.addListener(marker, 'click', (function(marker, i) {
            return function() {
                infoWindow.setContent(infoWindowContent[i][0]);
                infoWindow.open(map, marker);
            }
        })(marker, i));

        // Automatically center the map fitting all markers on the screen
        map.fitBounds(bounds);
    }

    // Override our map zoom level once our fitBounds function runs (Make sure it only runs once)
    var boundsListener = google.maps.event.addListener((map), 'bounds_changed', function(event) {
        this.setZoom(10);
        google.maps.event.removeListener(boundsListener);
    });

}

    var loginEventListener = function() {
        $('#log-in').on('click', function(e) {
            e.preventDefault();

            var link = $(this)
            var url = link.attr('href')


            var call = $.ajax({
            url: url,
            method: 'get'
            })

            call.done(function(response) {
                $('#main-body').append(response)
            })

            call.fail(function(error) {
                console.log(error)
            })

        })
    }

