import 'package:flutter/material.dart';
import 'package:karaoke_app/src/pages/homepage.dart';
import 'package:karaoke_app/src/routes/routs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      /* theme: ThemeData(
          scaffoldBackgroundColor: Colors.white, primaryColor: Colors.white), */
      initialRoute: '/',
      routes: getRutas(),
      onGenerateRoute: (settings) {
        //print('Ruta ${settings.arguments}');
        return MaterialPageRoute(builder: builderRout);
      },
    );
  }

  Widget builderRout(BuildContext context) {
    return HomePage();
  }
}
