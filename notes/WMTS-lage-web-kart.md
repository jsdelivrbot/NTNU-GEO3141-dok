# WMTS: arbeidsgang for webkart i Open Layers

## Forutsetninger

- WMTS-tjeneste er opprettet fra før.
- Metadata fra WMTS-tjenesten er hentet ut.

## Arbeidsoperasjoner

- Legge inn WMTS-verdier i javascript-mal:
  - url til tjeneste
  - projeksjon (hvis det er noe annet enn Web Mercator)
  - extent for tilematrix
  - resolutions - disse må beregnes ut fra ScaleDenominator
  - zoom-nivåer
  - lagnavn
- Legge til eventuelle WMS-lag


## WMTS.js

```javascript
var urlarcgis= 'http://copernicus.hig.no:6080/arcgis/rest/services';
var folder = '/sverrsti';
var servicename = '/Horten_sverrsti';
var servicetype = '/MapServer/WMTS?';
var url = urlarcgis + folder + servicename + servicetype;

var layer = '0';

var attribution = new ol.Attribution({
  html: 'Kartgrunnlag: <a href="http://kartverket.no">Kartverket</a>'
});

var extent = [
  1150445,  8255000, // lower left:  Easting, Northing
  1173000,  8279009 // upper right: Easting, Northing
];

// Oppløsning pr. pixel i meter pr. tileMatrix (zoom-nivå)
var resolutions = [  // = ScaleDenominator * 0.00028
  66.14596562525627, // = 236235.59151877242 * 0.00028
  33.07298281262813, // = 118117.79575938621 * 0.00028
  16.933367200065604, // = 60476.31142880573 * 0.00028
  8.466683600032802, // = 30238.155714402867 * 0.00028
  4.233341800016401 // = 15119.077857201433 * 0.00028
];

var matrixSet = 'default028mm'; // standard-verdi for ArcGIS
var matrixIds = [0, 1, 2, 3, 4];

var center = [1167114, 8270694]; // Easting, Northing
var zoom = 0;

var fkb = new ol.layer.Tile({
  source: new ol.source.WMTS({
    attributions: [attribution],
    url: url,
    layer: layer,
    matrixSet: matrixSet,
    format: 'image/png',
    tileGrid: new ol.tilegrid.WMTS({
      extent: extent,
      resolutions: resolutions,
      matrixIds: matrixIds
    }),
    style: 'default',
  })
});

var topo2 = new ol.layer.Tile({
  source: new ol.source.TileWMS({
    url: 'http://openwms.statkart.no/skwms1/wms.topo2?',
    params: {
      'LAYERS': 'topo2_WMS',
      'STYLES': 'default'
    },
  })
});

var map = new ol.Map({
  layers: [topo2, fkb],
  target: 'map',
  view: new ol.View({
    center: center,
    resolutions: resolutions,
    zoom: zoom
  })
});
```

## WMTS.html

```html
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
  <script src="wmts.js" type="text/javascript"></script>

</body>

</html>
```

## Hvis projeksjonen er noe annet enn Web Mercator

Informasjon om hvilken projeksjon som brukes må legges inn. Open Layers-API'et vil da erstatte standardverdien EPSG:3857 i WMS- og WMTS-kall med det som er lagt inn.


```javascript
// Datum og projeksjon: EUREF89, UTM zone 32
var projection = new ol.proj.Projection({
  code: 'EPSG:25832',
  extent: extentKartverket
});
```

Extent i denne sammenheng kan være en annen extent enn flislagenes extent. F.eks. så kan man bruke Kartverkets standardverdier.

```javascript
var extentKartverket = [-2000000, 3500000, 3545984, 9045984];
```

For at dette skal bli aktivert må projection-variabelen legges inn i det aktuelle view'et (kartvindu):

```javascript
var map = new ol.Map({
  layers: [topo2, fkb],
  target: 'map',
  view: new ol.View({
    projection: projection,   // her! Denne linjen
    center: center,
    resolutions: resolutions,
    zoom: zoom
  })
});
```

For et eksempel der dette er brukt, se løypekart for Liatoppen skisenter:

- http://sverres.net/liatoppen/liatoppen.js
- http://sverres.net/liatoppen/

Eller kart over Lillehammer med kartfliser fra copernicus. Det er et enklere eksempel:

- http://sverres.net/GEO3141/Lillehammer/WMTS.html
