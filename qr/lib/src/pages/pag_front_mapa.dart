import 'package:flutter/material.dart';

import 'package:flutter_map/flutter_map.dart';

import 'package:qr/src/models/scan_model.dart';

class MapaFront extends StatefulWidget {
  @override
  _MapaFrontState createState() => _MapaFrontState();
}

class _MapaFrontState extends State<MapaFront> {
  final map = new MapController();

  String tipoMapa = 'satellite';

  @override
  Widget build(BuildContext context) {
    final ScanModel scan = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      appBar: AppBar(
        title: Text('Coordenadas QR'),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.my_location),
              onPressed: () {
                print('121212');
                map.move(scan.getLatLon(), 15);
              })
        ],
      ),
      body: _creacionFlutterMApa(context, scan),
      floatingActionButton: _crearBtnFlotante(context),
    );
  }

  Widget _creacionFlutterMApa(BuildContext context, ScanModel scan) {
    return FlutterMap(
      mapController: map,
      options: MapOptions(center: scan.getLatLon(), zoom: 15),
      layers: [
        _crearMapa(),
        _crearMarcadores(scan),
      ],
    );
  }

  _crearMapa() {
    print(11111);
    print(tipoMapa);
    return TileLayerOptions(
        urlTemplate: 'https://api.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
          'accessToken':
              'pk.eyJ1Ijoia2xlcml0aCIsImEiOiJjanY2MjF4NGIwMG9nM3lvMnN3ZDM1dWE5In0.0SfmUpbW6UFj7ZnRdRyNAw',
          //pk.eyJ1Ijoicmlnb3Jpb3NoIiwiYSI6ImNrYXpza2N1ejAwcWYyc211Y2JuYXg4YTEifQ.DxyOVZbHC6NRrI0CLH0vaA
          'id': 'mapbox.$tipoMapa' //streets, light, outdoors, satellite, dark
        });
  }

  _crearMarcadores(ScanModel scan) {
    return MarkerLayerOptions(markers: <Marker>[
      Marker(
          width: 100.0,
          height: 100.0,
          point: scan.getLatLon(),
          builder: (context) => Container(
                child: Icon(
                  Icons.location_on,
                  size: 45.0,
                  color: Theme.of(context).primaryColor,
                ),
              ))
    ]);
  }

  Widget _crearBtnFlotante(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.repeat),
      backgroundColor: Theme.of(context).primaryColor,
      onPressed: () {
        print("5555");
        if (tipoMapa == 'streets') {
          tipoMapa = 'light';
        } else if (tipoMapa == 'light') {
          tipoMapa = 'outdoors';
        } else if (tipoMapa == 'outdoors') {
          tipoMapa = 'satellite';
        } else if (tipoMapa == 'satellite') {
          tipoMapa = 'dark';
        } else {
          tipoMapa = 'streets';
        }
        setState(() {
          print(tipoMapa);
        });
      },
    );
  }
}
