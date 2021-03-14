//statelessW => snippe

import 'package:flutter/material.dart';

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
    return ListView(
      children: _crearListItems(),
    );
  }

  List<Widget> _crearListItems() {
    return [
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
    ];
  }
}
