import 'package:flutter/material.dart';
import 'package:flutter_listas/src/pages/alert_page.dart';
import 'package:flutter_listas/src/pages/avatar_page.dart';
import 'package:flutter_listas/src/pages/home_page.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => HomePage(),
    'alert': (BuildContext context) => AlertPage(),
    AvatarPage.pageName: (BuildContext context) => AvatarPage(),
    /*'card': (BuildContext context) => CardPage(),
    'rutaContAnimado': (BuildContext context) => ContenedorAnimado(),
    'rutaInputs': (BuildContext context) => PaginaDeEntradas(),
    'rutaPageSlider': (BuildContext context) => PaginaSlider(),
    'rutaPageListView': (BuildContext context) => PaginaListView(), */
  };
}
