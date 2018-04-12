function geocode(e) {
  // preent actual submit
  e.preventDefault();

  // let location = "764 E Sunnyside Avenue Libertyville, IL 60048";
  let location = document.getElementById("location-input").value;

  axios
    .get("https://maps.googleapis.com/maps/api/geocode/json", {
      params: {
        address: location,
        key: "AIzaSyCFOoKmxKkNSeiWOI83C8fdiplgoCQiMuQ"
      }
    })
    .then(function(response) {
      // Log full response
      console.log(response);

      // Formatted Address
      let formattedAddress = response.data.results[0].formatted_address;
      let formattedAddressOutput = `
        <ul class="list-group">
          <li class="list-group-item">${formattedAddress}</li>
        </ul>
      `;

      // Address Components
      let addressComponents = response.data.results[0].address_components;
      let addressComponentsOutput = '<ul class="list-group">';

      addressComponents.forEach(function(addrComponent) {
        addressComponentsOutput += `
          <li class="list-group-item"><strong>${
            addrComponent.types[0]
          }</strong>: ${addrComponent.long_name}</li>
        `;
      });

      addressComponentsOutput += "</ul>";

      // Geometry
      let lat = response.data.results[0].geometry.location.lat;
      let lng = response.data.results[0].geometry.location.lng;

      let geometryOutput = `
        <ul class="list-group">
          <li class="list-group-item"><strong>Latitude: </strong>${lat}</li>
          <li class="list-group-item"><strong>Longitude: </strong>${lng}</li>
        </ul>
      `;

      // output to app
      document.getElementById(
        "formatted-address"
      ).innerHTML = formattedAddressOutput;
      document.getElementById(
        "address-components"
      ).innerHTML = addressComponentsOutput;
      document.getElementById("geometry").innerHTML = geometryOutput;
    })
    .catch(function(err) {
      console.log(err);
    });
}

// get location form
let locationForm = document.getElementById("location-form");

// listen for submit
locationForm.addEventListener("submit", geocode);
