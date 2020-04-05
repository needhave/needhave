export function getCoords() {
  return new Promise((resolve, reject) => {
    navigator.geolocation.getCurrentPosition(resolve, reject);
  });
}

export async function getState() {
  const loc = await getCoords();
  const { latitude: lat, longitude: lng } = loc.coords;

  // // Google geocoder
  // const state = await geocodeComponent(lat, lng, 'administrative_area_level_1');
  // return { code: state.short_name, name: state.long_name };

  // // PositionStack geocoder
  // const place = await PositionStack.geocode(lat, lng);
  // return { code: place.region_code, name: place.region };

  return {
    code: "CO",
    name: "Colorado",
  };
}

const POSITIONSTACK_ACCESS_KEY = '<YOUR_ACCESS_KEY>';
class PositionStack {
  static geocode(lat, lng) {
    const url = `https://api.positionstack.com/v1/reverse?access_key=${POSITIONSTACK_ACCESS_KEY}&query=${lat},${lng}`;
    return fetch(url).then((resp) => resp.json()).then((json) => json.data[0]);
  }
}

let GOOGLE_GEOCODER;
class GoogleGeocoder {
  static initialize() {
    if (!GOOGLE_GEOCODER) {
      GOOGLE_GEOCODER = new google.maps.Geocoder();
    }
  }

  static geocodeComponent(lat, lng, componentType) {
    GoogleGeocoder.initialize();

    const latlng = new google.maps.LatLng(lat, lng);
    return new Promise((resolve, reject) => {
      GOOGLE_GEOCODER.geocode({'latLng': latlng}, function(results, status) {
        if (status == google.maps.GeocoderStatus.OK) {
          if (results[1]) {
            for (let component of results[0].address_components) {
              for (let type of component.types) {
                if (type === componentType) {
                  resolve(component);
                }
              }
            }
          }
        }
        reject(status);
      });
    })
  }
}