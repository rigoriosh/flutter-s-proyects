import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';

class SideBar extends StatefulWidget {
  @override
  _SideBarState createState() => _SideBarState();
}

class _SideBarState extends State<SideBar>
    with SingleTickerProviderStateMixin<SideBar> {
  AnimationController _animationController;
  StreamController<bool> isSidebarOpenedStreamController;
  Stream<bool> isSidebarOpenedStream;
  StreamSink<bool> isSidebaropenedSink;

  final _animationDuration = const Duration(milliseconds: 500);

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: _animationDuration);
    isSidebarOpenedStreamController = PublishSubject<bool>();
    isSidebarOpenedStream = isSidebarOpenedStreamController.stream;
    isSidebaropenedSink = isSidebarOpenedStreamController.sink;
  }

  @override
  void dispose() {
    _animationController.dispose();
    isSidebarOpenedStreamController.close();
    isSidebaropenedSink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    int colorFondo = 0xFF262AAA;
    int firstColor = 0xFF1BB5FD;
    final screenWidth = MediaQuery.of(context).size.width;
    return StreamBuilder<bool>(
      initialData: false,
      stream: isSidebarOpenedStream,
      builder: (context, isSidebarOpnendAsync) {
        return AnimatedPositioned(
          duration: _animationDuration,
          top: 0,
          bottom: 0,
          left: isSidebarOpnendAsync.data ? 0 : -screenWidth,
          right: isSidebarOpnendAsync.data ? 0 : screenWidth - 45,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                color: Color(colorFondo),
                child: Column(
                  children: [
                    SizedBox(
                      height: 100,
                    ),
                    ListTile(
                      title: Text(
                        "Thiago",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text('thiago@gmail.com',
                          style: TextStyle(
                              color: Color(firstColor),
                              fontSize: 20,
                              fontWeight: FontWeight.w800)),
                      leading: CircleAvatar(
                        child: Icon(Icons.perm_identity, color: Colors.white),
                        radius: 40,
                      ),
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Color(firstColor),
                      indent: 30,
                      endIndent: 30,
                    ),
                  ],
                ),
              )),
              Align(
                alignment: Alignment(0, -0.9),
                child: GestureDetector(
                  onTap: () {
                    onIconPressed();
                  },
                  child: Container(
                    width: 35,
                    height: 110,
                    color: Color(colorFondo),
                    alignment: Alignment.centerLeft,
                    child: AnimatedIcon(
                      progress: _animationController.view,
                      icon: AnimatedIcons.menu_close,
                      color: Color(firstColor),
                      size: 25,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void onIconPressed() {
    final animationStatus = _animationController.status;
    final isAnimatedCompleted = animationStatus == AnimationStatus.completed;
    if (isAnimatedCompleted) {
      isSidebaropenedSink.add(false);
      _animationController.reverse();
    } else {
      isSidebaropenedSink.add(true);
      _animationController.forward();
    }
  }
}

//
