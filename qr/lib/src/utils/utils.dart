






























import 'package:flutter/material.dart';
import 'package:qr/src/models/scan_model.dart';
import 'package:url_launcher/url_launcher.dart';

abrirScan(BuildContext context, ScanModel scan) async {
  print("yes here");
  if (scan.tipo == 'http') {
    if (await canLaunch(scan.valor)) {
    await launch(scan.valor);
  } else {
    throw 'Could not launch $scan.valor';
  }  
  } else {
    print("Geo....");
    Navigator.pushNamed(context, 'mapa', arguments: scan);
  }
  
}



/* return TileLayerOptions(
        urlTemplate: 'https://api.tiles.mapbox.com/v4/'
            '{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}',
        additionalOptions: {
        'accessToken':'pk.eyJ1Ijoiam9yZ2VncmVnb3J5IiwiYSI6ImNrODk5aXE5cjA0c2wzZ3BjcTA0NGs3YjcifQ.H9LcQyP_-G9sxhaT5YbVow',
        'id': 'mapbox.streets'
        }
); */