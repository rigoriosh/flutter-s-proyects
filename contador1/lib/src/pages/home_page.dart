import 'package:flutter/material.dart';

import 'contador_page.dart';

//import 'contador_page.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
/* 
    TextStyle estiloTexto = new TextStyle(fontSize: 30);
    int count = 10;
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi titulo'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('Numero de clicks', style: estiloTexto),
            Text('$count', style: estiloTexto)
          ],
          mainAxisAlignment: MainAxisAlignment.center,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print('hi w');
          count = count + 1;
        },
        child: Icon(Icons.add),
      ),
      //floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );

     */
/* 
    var mA = MaterialApp(
      home: Center(child: ContadorPage()),
      debugShowCheckedModeBanner: false,
    );
 */
    return ContadorPage();
  }
}
