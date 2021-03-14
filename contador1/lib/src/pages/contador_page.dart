import 'package:flutter/material.dart';

class ContadorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ContadorPageState();
}

class _ContadorPageState extends State<ContadorPage> {
  final miEstilo = new TextStyle(fontSize: 25);
  int cont = 0;

  get wz => 20.0;

  @override
  Widget build(BuildContext context) {
    print(5555);

    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: _myBar(),
      body: _myBody(),
      backgroundColor: Color(0xffaaeebb),
      floatingActionButton: _crearBotones(),
    );
  }

  Widget _myBar() {
    return AppBar(
      title: Text("Titulo Rigoooo"),
      centerTitle: true,
      backgroundColor: Color(0xFFFF9000),
      toolbarOpacity: 0.9,
    );
  }

  Widget _myBody() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Numero de clicks:",
            style: miEstilo,
          ),
          Text(
            '$cont',
            style: miEstilo,
          )
        ],
      ),
    );
  }

  Widget _crearBotones() {
    return Row(
      children: <Widget>[
        SizedBox(width: wz),
        FloatingActionButton(
          onPressed: _reset,
          child: Icon(Icons.exposure_zero),
        ),
        Expanded(child: SizedBox()),
        FloatingActionButton(
          onPressed: _remove,
          child: Icon(Icons.remove),
        ),
        //Expanded(child: SizedBox()),
        SizedBox(width: 5.0),
        FloatingActionButton(
          onPressed: _add,
          child: Icon(Icons.add),
        ),
        SizedBox(width: wz),
      ],
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  void _reset() => setState(() => cont = 0);

  void _remove() => setState(() => cont--);

  void _add() => setState(() => cont++);
}
