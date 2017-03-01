# Ukeoppgave om WFS - Oppsett og bruk av WFS i GeoServer
---

## Mål for oppgaven

- Lære og få erfaring med oppsett av WFS-tjenester

- Lære å bruke WFS-tjenester ved hjelp av XML-filer


# Forutsetninger

Oppgaven forutsetter at tidligere ukeoppgaver er gjort:
- Workshop om OpenGeo Suite fra Boundless med delene
  - Part 1: OpenGeo Suite
  - Part 2: PostGIS
  - Part 3: GeoServer
- Ukeoppgave om PsTools, GISTools, Postgis og FME

Du skal dermed ha Geoserver installert og og en PostGIS-database med AR5-data for Hjelmeland kommune tilgjengelig på egen PC.

## Oppretting av WFS-tjeneste

Se også informasjon i Boundless-workshop, men framgangsmåten kan avvike noe (vi bruker f.eks. ikke "Import Data"- linken).

- Opprett egen workspace for AR5-dataene. Bruk kortnavn "ar5", og Namespace URI "http://ntnu.no/GEO3141/ar5".

- Opprett forbindelse til dataene i PostGIS-databasen ved å lage en ny "Store".

Pass på å velge riktig workspace - den som ble laget i forrige punkt. Data Source Name er et beskrivende navn du velger selv. Samme navn som workspace kan brukes.

Pass på å velge riktige database-parametre. Vær obs. på at du har dine data i en annen database enn den du brukte i workshopen.
Kryss *ikke* av for expose primary keys.

Etter lagring av dette oppsettet hopper du direkte videre til:

- Opprett nytt lag

Her velger du det aktuelle "Layer name" - det vil si tabell fra PostGIS - ved å trykke på Publish.
Du skal ikke ta med kodeliste-tabellene her, bare hovedtabellen - antageligvis arealressursflate.


## Teste ut WFS-tjenesten

Last ned XML-filer og Python-script som kan modifiseres for bruk mot egen tjeneste: [WFS-ukeoppgave_2017.zip](docs/WFS-ukeoppgave_2017.zip)

Se opptak fra forelesning 27.03 for å se hvordan disse filene brukes.

Prøv å lage filter som bruker BBOX. Du må finne passende parametre for BBOX tilpasset de dataene du har i databasen. (Se WFS-veilederen for info om hvordan dette kan gjøres).

## Hent inn GML-fil i QGIS

Produserte GML-filer kan dras rett inn i QGIS, men de vil ikke få riktig koordinatsystem umiddelbart. Gå inn på egenskaper under lag-navnet for å rette opp på dette.

## Hente inn WFS-tjenesten i QGIS

Du kan også teste ut å legge til din WFS-tjeneste i QGIS. Et av globus-ikonene i venstre marg gjelder WFS. Du trenger url til tjenesten, som du finner i WFSGetCapabilitiesResponse.xml.
