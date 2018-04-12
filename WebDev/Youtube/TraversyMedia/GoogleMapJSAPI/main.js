function initMap() {
  // Map options
  let options = {
    zoom: 5,
    mapTypeId: "terrain",
    center: { lat: 35.2271, lng: -80.8431 } // Charlotte, NC
  };

  // New Map
  let map = new google.maps.Map(document.getElementById("map"), options);

  // Listen for click on map
  google.maps.event.addListener(map, "dblclick", function(event) {
    addMarker({ coords: event.latLng });
  });

  // Add Marker function
  function addMarker(props) {
    let marker = new google.maps.Marker({
      position: props.coords,
      map: map,
      animation: google.maps.Animation.DROP
      //icon: props.iconImage
    });

    // check custom icon
    if (props.iconImage) {
      marker.setIcon(props.iconImage);
    }
    // check content
    if (props.content) {
      let infoWindow = new google.maps.InfoWindow({
        content: props.content
      });

      marker.addListener("mouseover", function() {
        infoWindow.open(map, marker);
      });

      marker.addListener("mouseout", function() {
        infoWindow.close(map, marker);
      });

      // toggle bounce
      // I added this code myself by learning google Map documents
      marker.addListener("click", function() {
        if (this.getAnimation() !== null) {
          this.setAnimation(null);
        } else {
          this.setAnimation(google.maps.Animation.BOUNCE);
        }
      });
    }
  }

  let markers = [
    {
      coords: { lat: 42.2831, lng: -87.9531 },
      content: "<h3>My Home - Libertyville,IL</h3>"
    },
    {
      coords: { lat: 42.3601, lng: -71.0589 },
      content: "<h3>My Best Friends - Boston MA</h3>"
    },
    {
      coords: { lat: 26.1224, lng: -80.1373 },
      iconImage:
        "https://developers.google.com/maps/documentation/javascript/examples/full/images/beachflag.png",
      content: "<h3>Cruise Departure</h3>"
    }
  ];

  markers.forEach(function(marker) {
    addMarker(marker);
  });

  // addMarker(libertyville);
  // addMarker(fortLandedale);
  // addMarker(boston);

  // Define the LatLng coordinates for the polygon's path.
  var triangleCoords = [
    { lat: 42.2831, lng: -87.9531 },
    { lat: 42.3601, lng: -71.0589 },
    { lat: 26.1224, lng: -80.1373 },
    { lat: 42.2831, lng: -87.9531 }
  ];

  // Construct the polygon.
  var vacationTriangle = new google.maps.Polygon({
    paths: triangleCoords,
    strokeColor: "#FF0000",
    strokeOpacity: 0.8,
    strokeWeight: 2,
    // fillColor: "#FF0000",
    fillOpacity: 0.1
  });
  vacationTriangle.setMap(map);
}
