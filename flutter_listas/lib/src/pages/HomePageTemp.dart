import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  final opciones = ['uno', 'dos', ' tres', 'cuatro', 'cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Componentsss'),
      ),
      body: ListView(
        children: _crearItemsSimplificado()

        //  children: _crearItems()
        /*
        children: <Widget>[
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
        ] */
        ,
      ),
    );
  }

  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();
    for (String opcion in opciones) {
      final tempWidget = ListTile(
        title: Text(opcion),
      );
      lista
        ..add(tempWidget) //operador de cascada aplicado a la variable lista
        ..add(Divider());
    }
    return lista;
  }

  List<Widget> _crearItemsSimplificado() {
    return opciones.map((opt) {
      return Column(
        children: <Widget>[
          ListTile(
            title: Text(opt + ' !'),
            subtitle: Text('descripcion'),
            leading: Icon(Icons.ac_unit),
            trailing: Icon(Icons.arrow_forward_ios),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList(); //el toList es para cumplir con lo q se debe retornar, en este caso una lista de widgets
  }
}
