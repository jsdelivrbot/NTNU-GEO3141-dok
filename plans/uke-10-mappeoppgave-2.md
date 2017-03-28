# GEO3141 - Vår 2017 - uke 10
---

# Mappeoppgave 2 - WFS

## Målsetting

Målet med arbeidet denne uka blir å få kontroll på produksjonsløypa for WFS-tjenester.

## Samling på mandag

- Arbeid med Ukeoppgave om WFS anbefales.
- Ingen forelesning
- Ellers - arbeid med mappeoppgave 2

## Samling på torsdag

- Demonstrasjon noen måter å bruke Filter Encoding på
- Quiz om GML og WFS
- Arbeid med mappeoppgave 2

## Presentasjoner og opptak

Dato |Tema |Format
---|---|---
09.03 |WFS-GML-Kahoot |[PC](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2017/09.03/767667/GEO3141_GML-WFS-Kahoot_-_20170309_123346_39.html) [Pad](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2017/09.03/767667/GEO3141_GML-WFS-Kahoot_-_20170309_123346_36.html)
|  |WFS/Filter Encoding-demo |[PC](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2017/09.03/2373000/GEO3141_-_WFS-Filter_Encoding_-_20170309_131527_39.html) [Pad](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2017/09.03/2373000/GEO3141_-_WFS-Filter_Encoding_-_20170309_131527_36.html)

## WFSGetFeature.xml - eksempel brukt i demoen

```xml
<?xml version="1.0" encoding="utf-8"?>
<wfs:GetFeature
  xmlns:wfs = "http://www.opengis.net/wfs/2.0"
  xmlns:fes = "http://www.opengis.net/fes/2.0"
  xmlns:hig = "http://hig.no/geo3141">
  <wfs:Query typeNames = "hig:sentrum2016">
    <fes:Filter>
      <fes:PropertyIsEqualTo>
        <fes:ValueReference>tettnr</fes:ValueReference>
        <fes:Literal>1023</fes:Literal>
      </fes:PropertyIsEqualTo>
    </fes:Filter>
  </wfs:Query>
</wfs:GetFeature>
```

## WFSGetFeatureWithin.xml - eksempel brukt i demoen

```xml
<?xml version="1.0" encoding="utf-8"?>
<wfs:GetFeature
  xmlns:wfs = "http://www.opengis.net/wfs/2.0"
  xmlns:fes = "http://www.opengis.net/fes/2.0"
  xmlns:hig = "http://hig.no/geo3141">  
  <wfs:Query typeNames = "hig:byggflate">
    <fes:Filter
      xmlns:gml = "http://www.opengis.net/gml/3.2"
      xmlns:xsi = "http://www.w3.org/2001/XMLSchema-instance"
      xsi:schemaLocation = "http://www.opengis.net/fes/2.0
                                  http://schemas.opengis.net/filter/2.0.0/filterAll.xsd
                                  http://www.opengis.net/gml/3.2
                                  http://schemas.opengis.net/gml/3.2.1/gml.xsd">
      <fes:Within>
        <fes:ValueReference>geom</fes:ValueReference>
        <gml:Polygon
          gml:id = "P1"
          srsName = "urn:ogc:def:crs:EPSG::32633">
          <gml:exterior>
            <gml:LinearRing>
              <gml:posList>267056.775 6762755.1225 ...

                 ..... (alle koordinatene som danner utvalgs-polygonet skal ligge her)

                 ... 6762755.1229 267056.775 6762755.1225</gml:posList>
            </gml:LinearRing>
          </gml:exterior>
        </gml:Polygon>
      </fes:Within>
    </fes:Filter>
  </wfs:Query>
</wfs:GetFeature>
```

## Resultat: bygninger innenfor 2013-sentrumssonen i Moelv

Det grønne polygonet er sentrumssonen i 2016. Fiolett er sentrumssonen i 2013. De utvalgte bygningne ligger innenfor 2013-sonen.

![moelv_sentrum_2013-2016.png](images/moelv_sentrum_2013-2016.png)
