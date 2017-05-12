# Ukeoppgave: WMS-kart i Open Layers

---

## Introduksjon

Denne oppgaven handler om å få vist sin egen WMS-tjeneste på copernicus i et Open Layers web-kart.
Nedenfor følger en mal som brukes ganske direkte med minimale tilpasninger.

Kartet lages for FKB-data i Horten kommune, i Web Meractor-projeksjon (se ukeoopgave for uke 2).

> Husk at man utenfor NTNU-campus må koble seg opp med VPN først.

Url på egen tjeneste kan hentes ut fra menyvalget __OGC services__ i [ArcGIS Server Manager](https://copernicus.hig.no:6443/arcgis/manager/). Dette er en lang url, og i javascript-koden nedenfor er den delt opp i sine logiske deler.

Lagnavn kan hente ut ved hjelp av getcapabilities-kall, f.eks. slik:

```ini
https://copernicus.hig.no:6443/arcgis/services/sverrsti/Horten_sverrsti/MapServer/WMSServer?
service=wms&
request=getcapabilities&
version=1.3
```

Merk at zoom-nivåene er definert ut fra min- og max-resolutions.

## wms.js

```javascript
var urlarcgis = 'http://copernicus.hig.no:4336/arcgis/services';
var folder = '/sverrsti';
var servicename = '/Horten_sverrsti';
var servicetype = '/MapServer/WmsServer?';
var url = urlarcgis + folder + servicename + servicetype;

var params = {
  'LAYERS': '0',  // Layer-navn kan være numeriske. Bør heller ha et beskrivende navn.
  'STYLES': 'default'
};

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var center = [1167114, 8270694]; // Easting, Northing (Web Mercator)

// Oppløsning pr. pixel i meter - bestemmer min og max zoom
var minResolution = 0.01;
var maxResolution = 50.0;
var resolution = 10.0;

var fkb = new ol.layer.Tile({
  source: new ol.source.TileWMS({
    url: url,
    params: params
  })
});

var map = new ol.Map({
  layers: [fkb],
  target: 'map',
  view: new ol.View({
    center: center,
    minResolution: minResolution,
    maxResolution: maxResolution,
    resolution: resolution
  })
});

```

## wms.html


```c
<!--
<!DOCTYPE html>
<html>

<head>
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://openlayers.org/en/v3.20.1/css/ol.css" type="text/css">
  <style>
    #map {
      height: 500px;
      width: 100%;
      border: solid 1px;
    }
  </style>
  <title>Horten</title>
</head>

<body>

  <div id="map"></div>

  <script src="http://openlayers.org/en/v3.20.1/build/ol-debug.js" type="text/javascript"></script>
  <script src="wms.js" type="text/javascript"></script>

</body>

</html>
-->
```

En komplett, og levende side finnes [her](http://sverres.net/GEO3141/Horten/WMS.html).
