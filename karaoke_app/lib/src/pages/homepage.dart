import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('data'),
      ),
      body: Center(
        child: Text('Quede en el desarrollo del menu Item',
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 28)),
      ),
    );
    /* ; */
  }
}
