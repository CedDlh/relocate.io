import 'mapbox-gl/dist/mapbox-gl.css'
import mapboxgl from 'mapbox-gl/dist/mapbox-gl.js';
import { circle, point } from '@turf/turf';

const mapElement = document.getElementById('map');

if (mapElement) { // only build a map if there's a div#map to inject into
  const marker = JSON.parse(mapElement.dataset.marker);

  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  const map = new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10',
    center: [13.41, 52.52], // starting position [lng, lat]
    zoom: 11.25 // starting zoom
  });

  map.addControl(new mapboxgl.NavigationControl());

  map.on('load', function(){

      var centerCircle = [marker.lng, marker.lat];
      var radius = 1;
      var options = {steps: 60, units: 'kilometers'}; // properties: {foo: 'bar'}
      var cir = circle(centerCircle, radius, options);

      map.setZoom(11.5);
      map.setCenter([marker.lng, marker.lat]);

      map.addLayer({
          "id": "circle-fill",
          "type": "fill",
          "source": {
              "type": "geojson",
              "data": cir
          },
          "paint": {
              "fill-color": "pink",
              "fill-opacity": 0.5
          }
      });
      map.addLayer({
          "id": "circle-outline",
          "type": "line",
          "source": {
              "type": "geojson",
              "data": cir
          },
          "paint": {
              "line-color": "#ef9d43",
              "line-opacity": 0.5,
              "line-width": 2,
              // "line-offset": 5
          },
          "layout": {

          }
      });
  });

  // const markers = JSON.parse(mapElement.dataset.markers);
  // console.log(markers)

  // markers.forEach((marker) => {
  //   new mapboxgl.Marker()
  //   .setLngLat([marker.lng, marker.lat])
  //   .addTo(map);
  //   if (markers.length === 0) {
  //     map.setZoom(1);
  //   } else if (markers.length === 1) {
  //     map.setZoom(12);
  //     map.setCenter([markers[0].lng, markers[0].lat]);
  //   } else {
  //     const bounds = new mapboxgl.LngLatBounds();
  //     markers.forEach((marker) => {
  //       bounds.extend([marker.lng, marker.lat]);
  //     });
  //     map.fitBounds(bounds, { duration: 0, padding: 75 })
  //   }
  // })
}

