import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  //final IconData icon;
  final String title;
  final IconData icon;
  final Function onTap;

  const MenuItem({Key key, this.title, this.icon, this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            Icon(
              icon,
              color: Colors.cyan,
              size: 30,
            ),
            SizedBox(
              width: 20,
            ),
            Text(
              title,
              style: TextStyle(
                  fontWeight: FontWeight.w300,
                  fontSize: 26,
                  color: Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
