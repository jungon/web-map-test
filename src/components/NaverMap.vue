<template>
  <div class="container">
    <button id="btn" @click="cycleMarker">
      Marker {{ state.markers.length }}
    </button>
    <div id="map"></div>
  </div>
</template>

<script>
import { onMounted, reactive } from "vue";

export default {
  name: "NaverMap",

  setup() {
    const state = reactive({
      map: null,
      markers: [],
    });

    onMounted(() => {
      initMap();
    });

    const initMap = () => {
      const naver = window.naver;

      const mapContainer = document.getElementById("map");

      var mapOptions = {
        center: new naver.maps.LatLng(37.6322, 126.87333),
        zoom: 13,
        minZoom: 7,
        scaleControl: true,
        logoControl: true,
        mapDataControl: true,
        mapTypeControl: true,
        zoomControl: true,
        zoomControlOptions: {
          position: naver.maps.Position.RIGHT_CENTER,
        },
      };

      const map = new naver.maps.Map(mapContainer, mapOptions);

      const size = {
        width: window.innerWidth || document.body.clientWidth,
        height: window.innerHeight || document.body.clientHeight,
      };
      map.setSize(size);

      state.map = map;
    };

    return { state, initMap };
  },

  methods: {
    cycleMarker() {
      let length = this.state.markers.length + 100;
      if (length > 1000) {
        length = 0;
      }

      this.state.markers = [];

      const naver = window.naver;

      const latExtent = 0.1;
      const lngExtent = 0.1;

      for (let i = 0; i < length; i++) {
        this.state.markers[i] = new naver.maps.Marker({
          position: new naver.maps.LatLng(
            Math.random() * latExtent + 37.579675,
            Math.random() * lngExtent + 126.827243
          ),
          map: this.state.map,
        });
      }
    },
  },
};
</script>

<style>
.container #btn {
  position: absolute;
  overflow: visible;
  z-index: 100;
}
</style>
