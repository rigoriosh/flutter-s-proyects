import 'package:flutter/material.dart';
import 'package:karaoke_app/src/pages/homepage.dart';
import 'package:karaoke_app/src/sidebar/sidebar.dart';

class SideBarLayaout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[HomePage(), SideBar()],
        ),
      ),
    );
  }
}
