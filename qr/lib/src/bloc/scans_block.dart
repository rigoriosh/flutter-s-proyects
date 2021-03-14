



















import 'dart:async';

import 'package:qr/src/bloc/validaciones.dart';
import 'package:qr/src/providers/db_provider.dart';

class ScansBloc with Validaciones {
  static final ScansBloc _singleton = new ScansBloc._internal();

    factory ScansBloc(){
      return _singleton;
    }

    ScansBloc._internal(){
      // obteneer scan de la base de datos
      obtenerScans();
    }

    final _scansController = StreamController<List<ScanModel>>.broadcast();

    Stream<List<ScanModel>> get scansStream     => _scansController.stream.transform(validarGeo);//stream de geolocations
    Stream<List<ScanModel>> get scansStreamHttp => _scansController.stream.transform(validarHttp);

    cerrarInstancia(){
      _scansController?.close();
    }

    obtenerScans() async {
      _scansController.sink.add(await DBprovider.db.getScanAll());
    }

    agregarScan(ScanModel nuevoScan) async{
      await DBprovider.db.nuevoScan(nuevoScan);
      obtenerScans();
    }

    borrarScan(int id) async {
      await DBprovider.db.deleteScan(id);
      obtenerScans();
    }

    borrarTodosScans() async {
      await DBprovider.db.deleteAll();
      obtenerScans(); 
    }

}