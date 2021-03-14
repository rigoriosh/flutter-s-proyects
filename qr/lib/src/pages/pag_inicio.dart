import 'dart:io';

import 'package:flutter/material.dart';
import 'package:qr/src/bloc/scans_block.dart';
import 'package:qr/src/models/scan_model.dart';
import 'package:qr/src/pages/pag_directions.dart';
import 'package:qr/src/pages/pag_mapa.dart';
import 'package:qr/src/utils/utils.dart' as utils;
//import 'package:qrcode_reader/qrcode_reader.dart';
import 'package:barcode_scan/barcode_scan.dart';

class PaginaInicio extends StatefulWidget {
  PaginaInicio({Key key}) : super(key: key);

  @override
  _PaginaInicioState createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  int paginaActual = 0;
  final scanBloc = new ScansBloc();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("QR Scanner"),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.delete_forever),
              onPressed: scanBloc.borrarTodosScans)
        ],
      ),
      body: _cargarPagina(paginaActual),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.filter_center_focus),
        onPressed: () => _scanQR(context),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _creacionBTNnavigation(),
    );
  }

  Widget _creacionBTNnavigation() {
    return BottomNavigationBar(
      currentIndex: 0,
      onTap: (index) {
        setState(() {
          paginaActual = index;
        });
      },
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.map), title: Text('Mapas')),
        BottomNavigationBarItem(
            icon: Icon(Icons.brightness_5), title: Text('Directins')),
      ],
    );
  }

  Widget _cargarPagina(int paginaActual) {
    print("object");
    switch (paginaActual) {
      case 0:
        return PaginaMapa();
        break;
      case 1:
        return PaginaDirectios();
        break;
      default:
        return PaginaInicio();
    }
  }

  _scanQR(BuildContext context) async {
    var futureString;
    //var futureString = 'https://soft-hard-design.com';
    //var futureString2 = "geo:40.717988192775195,-74.07185926875003";

  try {
      print("luiiissaaaaaa");
      futureString = await BarcodeScanner.scan();
       //print(futureString.rawContent);
    } catch (e) {
      print("erroorrrrrr");
      futureString = e.toString();
    }

    if (futureString != null) {
      final nuevoScan = ScanModel(valor: futureString.rawContent);      
      print('Id: ${nuevoScan.id}, Tipo: ${nuevoScan.tipo}, Valor: ${nuevoScan.valor}');
      scanBloc.agregarScan(nuevoScan);

      //final nuevoScan2 = ScanModel(valor: futureString2);
      //scanBloc.agregarScan(nuevoScan2);
      if (Platform.isIOS) {
        Future.delayed(Duration(milliseconds: 750),(){
          utils.abrirScan(context, nuevoScan);
        });
      } else {
        utils.abrirScan(context, nuevoScan);
      }
    }
/*
    

    print('Future string: $futureString');
    */
    /* setState(() {
      if (futureString != null) {
       final scan = ScanModel(valor: futureString);
       print('Id: ${scan.id}, Tipo: ${scan.tipo}, Valor: ${scan.valor}');
       DBprovider.db.nuevoScan(scan);
    }  
    }); */
  }
}
