import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  static var pageName = 'avatar';

  const AvatarPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        /* actions: <Widget>[
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              backgroundImage: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTx5RJqXZUSzQ5KWegPT4wGQv_23bC6ki3Z7VUljGBM6HoICpu90A&s'),
              radius: 25.0,
            ),
          ),
          Container(
            padding: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text('RH'),
              backgroundColor: Colors.brown,
              radius: 25.0,
            ),
          ),
        ], */
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      body: Center(
          /* child: FadeInImage(
          placeholder: AssetImage('imagenes/original.gif'),
          image: NetworkImage(
              'https://ae01.alicdn.com/kf/HTB1exd.QFXXXXXwaXXXq6xXFXXX0.jpg'),
          fadeInDuration: Duration(milliseconds: 200),
        ), */
          ),
    );
  }
}
