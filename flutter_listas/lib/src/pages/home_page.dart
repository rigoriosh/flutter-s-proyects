//statelessW => snippe

import 'package:flutter/material.dart';
import 'package:flutter_listas/src/providers/menu_provider.dart';
import 'package:flutter_listas/src/utils/icono_string_util.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentes'),
      ),
      body: _lista(),
    );
  }

  Widget _lista() {
    //print(menuProvider.opciones);
    /* .then((opciones) {
      print('_lista');
      print(opciones);
    }) 
    return ListView(
      children: _crearListItems(),
    ); */
    return FutureBuilder(
      future: menuProvider.cargarData(),
      initialData: [],
      builder: (context, AsyncSnapshot<List<dynamic>> sanpashot) {
        /* print('builder');
        print(sanpashot.data); */
        return ListView(
          children: _crearListItems(sanpashot.data, context),
        );
      },
    );
  }

  List<Widget> _crearListItems(List data, BuildContext context) {
    print(data[0]);
    final List<Widget> myList = [];
    for (var item in data) {
      myList
        ..add(ListTile(
          title: Text(item['texto']),
          leading: getIcon(item['icon']),
          trailing: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.deepOrange,
          ),
          onTap: () {
            /* final route = MaterialPageRoute(builder: (context) => AlertPage());
            Navigator.push(context, route); */
            print('Ruta: ' + item['ruta']);
            Navigator.pushNamed(context, item['ruta']);
          },
        ))
        ..add(Divider());
    }
    return myList;
    /* [
      ListTile(
        title: Text('List Title'),
      ),
      Divider(),
      ListTile(
        title: Text('List Title'),
      ),
      Divider(),
      ListTile(
        title: Text('List Title'),
      )
    ]; */
  }
}
