import 'dart:async';

import 'package:flutter/material.dart';
import 'package:karaoke_app/src/pages/myaccountpage.dart';
/* 
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:karaoke_app/bloc.navigation_bloc/navigation_bloc.dart'; */
import 'package:karaoke_app/src/sidebar/menu_item.dart';
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
          right: isSidebarOpnendAsync.data ? 0 : screenWidth - 35,
          child: Row(
            children: [
              Expanded(
                  child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 20),
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
                    MenuItem(
                      icon: Icons.home,
                      title: "Home",
                      onTap: () => {Navigator.pushNamed(context, 'homePage')},
                      /* onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigatioEvents.HomePageClickedEvent);
                      }, */
                    ),
                    MenuItem(
                        icon: Icons.person,
                        title: "My Account",
                        onTap: () {
                          final route =
                              MaterialPageRoute(builder: builderRoutBasic);
                          Navigator.push(context, route);
                        }
                        /* onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigatioEvents.AccountClickedEvent);
                      }, */
                        ),
                    MenuItem(
                      icon: Icons.shopping_basket,
                      title: "Orders",
                      onTap: () => {Navigator.pushNamed(context, 'orders')},
                      /* onTap: () {
                        onIconPressed();
                        BlocProvider.of<NavigationBloc>(context)
                            .add(NavigatioEvents.OrdersClickedEvent);
                      }, */
                    ),
                    MenuItem(
                      icon: Icons.card_giftcard,
                      title: "Wishlist",
                    ),
                    Divider(
                      height: 64,
                      thickness: 0.5,
                      color: Color(firstColor),
                      indent: 30,
                      endIndent: 30,
                    ),
                    MenuItem(
                      icon: Icons.settings,
                      title: "Settings",
                    ),
                    MenuItem(
                      icon: Icons.exit_to_app,
                      title: "Logout",
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
                  child: ClipPath(
                    clipper: CustomMenuClipper(),
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
              ),
            ],
          ),
        );
      },
    );
  }

  void onIconPressed() {
    print('onIconPressed');
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

  Widget builderRoutBasic(BuildContext context) {
    return AccountPage();
  }
}

class CustomMenuClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Paint paint = Paint();
    paint.color = Colors.white;

    final width = size.width;
    final height = size.height;

    Path path = Path();
    path.moveTo(0, 0);
    path.quadraticBezierTo(0, 8, 10, 16);
    path.quadraticBezierTo(width - 1, height / 2 - 20, width, height / 2);
    path.quadraticBezierTo(width + 1, height / 2 + 20, 10, height - 16);
    path.quadraticBezierTo(0, height - 8, 0, height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}

//
