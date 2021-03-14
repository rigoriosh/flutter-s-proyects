import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

class _MenuProvider {
  List<dynamic> opciones = [];

  _MenuProvider() {
    print('hiii Rigo');
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    /*
        rootBundle.loadString(
                'data/menu_opts.json') .then((data) {
          print('here here');
          print(data);
        });
     */

    final respuesta = await rootBundle.loadString('data/menu_opts.json');

    Map dataMap = json.decode(respuesta);
    //print(dataMap['rutas']);
    opciones = dataMap['rutas'];
    return opciones;
  }
}

final menuProvider = new _MenuProvider();
