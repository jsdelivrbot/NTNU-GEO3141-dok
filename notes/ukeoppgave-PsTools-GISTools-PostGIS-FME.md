# Ukeoppgave for Modul 4 - GML og WFS - PSTools, GISTools, Postgis og FME

***


## Mål for oppgaven

Få erfaring og trening med å lage produktspesifikasjoner i PSTools, opprette databaseskjema i PostGIS i samsvar med dette og laste opp data i databasen.

Dette forutsetter bruk av programvarene som er listet opp nedenfor.



## Beskrivelse av oppgaven

Oppgaven baseres på arealressursdata - AR5. Du skal opprette en produktspesifikasjon for et utvalg av AR5-data - arealer med produktiv skog. Det er ingen eksakt fasit for hvordan dette skal gjøres, men videoen nedenfor viser hvordan det kan gjøres.

For ukeoppgaven bruker alle samme datasett - AR5-data for Hjelmeland kommune.

Oppgaven vil lede deg gjennom arbeidsoppgavene som skal gjøres i form av korte videosnutter. Det er mange detaljer i disse, så se nøye på de.

Oppgaven forutsetter at riktig programvare er installert på egen PC.

Les om Arealressurskart og AR5 spesielt her:

- [Oversikt over arealressurskart](http://www.skogoglandskap.no/filearchive/arealressurskart_brosjyre.pdf)
- [Nærmere om AR5](http://www.skogoglandskap.no/filearchive/brosjyre_fra_skog_og_landskap_02_10_arealressurskart_rev_utg.pdf)
- [Produktark AR5](https://register.geonorge.no/data/documents/FKB-AR5_Produktark_S-L_FKB-AR5.pdf)
- [Produktspesifikasjon AR5](http://www.kartverket.no/globalassets/standard/sosi-kap3-produktspesifikasjoner/fkb-4.5/4-ar5-2014-03-01.pdf)


## Nødvendig programvare

Linker for nedlasting ligger i programvaretabellen.

- PSTools  Brukernavn og passord - se Forumet i Blackboard
- Sparx Enterprise Architect (EA) - du trenger bare easetupfull.msi samt informasjonen i activation.pdf og activation.txt.
- GISTools (tillegg til EA)
- 64-bit PostgreSQL/PostGIS
- FME og GeoSOSI Professional

## Datafil

- [AR5-data for Hjelmeland kommune](https://filesender.uninett.no/beta/?s=download&token=9e313352-5bb6-914b-4a18-7e5686c15095)


## Arbeidsoppgaver

1. Lage produktspesifikasjon i PSTools [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/341333/GEO3141_PSTools_-_20160225_070529_39.html) (5:41)
1. Hente ned prosjektfil for Enterprise Architect [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/146600/GEO3141_-_Hente_Produktspesifikasjon_-_20160225_071412_39.html) (2:27) (dårlig lyd på denne)
1. Klargjøre PostGIS-database [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/127333/GEO3141_Klargjre_database_-_20160225_072754_39.html) (2:07)
1. Lage SQL-script som kan opprette skjema i PostGIS-database [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/505733/GEO3141_-_GISTools_-_20160225_074416_39.html) (8:26)
1. Lage workspace i FME Workbench for opplasting av data [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/836000/GEO3141_-_Lage_FME_Workspace_-_20160225_081830_39.html) (13:56) __**(Feil i video fra 11:30, men fra 12:17 vises riktig kobling)**__
1. Kjøre workspace-fil med aktuelle data [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/140333/GEO3141_-_FME_-_kjre_workspace-fil_-_20160225_082529_39.html) (2:20)
1. Sjekke innholdet i databasen med QGIS [opptak](https://screencast.uninett.no/relay/ansatt/sverreshig.no/2016/25.02/285667/GEO3141_-_Sjekke_database_med_QGIS_-_20160225_083451_39.html) (4:46)


Lykke til!

16.02.17 / Sverre Stikbakke
