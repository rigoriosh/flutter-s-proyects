import 'package:flutter/material.dart';
import 'package:karaoke_app/src/pages/homepage.dart';
import 'package:karaoke_app/src/pages/myaccountpage.dart';
import 'package:karaoke_app/src/pages/myorderspage.dart';
import 'package:karaoke_app/src/sidebar/sidebar_layout.dart';

Map<String, WidgetBuilder> getRutas() {
  return <String, WidgetBuilder>{
    '/': (BuildContext context) => SideBarLayaout(),
    'homePage': (BuildContext context) => HomePage(),
    'account': (BuildContext context) => AccountPage(),
    'orders': (BuildContext context) => OrderPage(),
  };
}
