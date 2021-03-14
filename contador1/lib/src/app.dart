import 'package:flutter/material.dart';

import 'package:contador1/src/pages/home_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    print(22222);
    var mA = MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Text('Hi rigo'),
      //home: Center(child:Text('Hi rigo!')) ,
      home: Center(child: HomePage()),
    );

    return mA;
  }
}
