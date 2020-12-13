import 'package:flutter/material.dart';

class CardPage extends StatelessWidget {
  const CardPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cards'),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        //padding: EdgeInsets.symmetric(horizontal: 50.0, vertical: 10.0),
        children: [
          _cardTipo1(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
          SizedBox(height: 30.0),
          _cardTipo2(),
        ],
      )
    );
  }

  _cardTipo1() {
    return Card(
      elevation: 10.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      child: Column(
        children: [
          ListTile(
            leading: Icon(Icons.photo_album, color: Colors.blue),
            title: Text('Card Title'),
            subtitle: Text('Este es un ejemplo de la funcion de subtitulo para cada uno del card.'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              FlatButton(
                child: Text('Cancelar'),
                onPressed: () {},
              ),
              FlatButton(
                child: Text('OK'),
                onPressed: () {},
              ),
            ],
          )
        ],
      )
    );
  }

  _cardTipo2() {
    
    final card = Container(
      //clipBehavior: Clip.antiAlias,

      child: Column(
        children: <Widget>[

          FadeInImage(
            image: NetworkImage('https://libreshot.com/wp-content/uploads/2019/10/green-hills-landscape.jpg'),
            placeholder: AssetImage('assets/jar-loading.gif'),
            fadeInDuration: Duration(milliseconds: 200),
            height: 300.0,
            fit: BoxFit.cover,
          ),
          // Image(
          //   image: NetworkImage('https://libreshot.com/wp-content/uploads/2019/10/green-hills-landscape.jpg'),
          // ),
          Container(
            padding: EdgeInsets.all(10.0),
            child: Text('Titulo de imagen')
            ),
        ],
      ),
    );

    return Container(
      
      child: ClipRRect(
        child: card,
        borderRadius: BorderRadius.circular(30.0),),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30.0),
        color: Colors.white,
        boxShadow: <BoxShadow> [
          BoxShadow(
            color: Colors.black26,
            blurRadius: 10.0,
            spreadRadius: 2.0,
            offset: Offset(2.0, 10.0)
          )
        ]
      ),
    );
  }
}