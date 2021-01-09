import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  const AvatarPage({Key key}) : super(key: key);
  final _avatar = 'Jefe Maestro 117';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Avatar Page'),
        actions: [
          Container(
            margin: EdgeInsets.all(5.0),
            child: CircleAvatar(
              child: Text(
                'MC',
                style: TextStyle(color: Colors.white),
              ),
              backgroundColor: Colors.grey,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          FadeInImage(
              placeholder: AssetImage('assets/jar-loading.gif'),
              image: NetworkImage(
                  'https://howdoigame.files.wordpress.com/2013/08/master_chief_in_halo_4-1920x1200.jpg'),
              fadeInDuration: Duration(milliseconds: 200)),
          Padding(padding: EdgeInsets.only(top: 10.0)),
          Text('Username: $_avatar',
              style: TextStyle(color: Colors.green, fontSize: 20))
        ],
      ),
      // body: Center(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       Text(
      //         '¡Hola, mundo!',
      //         // style: TextStyle(color: Colors.blue),
      //       ),
      //     ],
      //   ),
      // ),
    );
  }
}
