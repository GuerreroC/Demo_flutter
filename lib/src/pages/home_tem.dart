import 'package:flutter/material.dart';

class HomePageTemp extends StatelessWidget {
  //const HomePageTemp({Key key}) : super(key: key);

  final opciones = ['Uno', 'Dos', 'Tres','Cuatro', 'Cinco'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Widgets App Menu'),
      ),
      body: ListView(
        //children: _crearItems()
        children: _crearItems()
      ),
    );
  }

  List<Widget> _crearItems() {  
    return opciones.map( ( item ) {
      return Column(
        children: [
          ListTile(
            title: Text( item ),
            //leading:  Icon(Icons.circle, size: 10,color: Colors.blue,),
            trailing: Icon(Icons.navigate_next_rounded, color: Colors.blue),
            onTap: () {},
          ),
          Divider()
        ],
      );
    }).toList();
  }
  /*
  List<Widget> _crearItems() {
    List<Widget> lista = new List<Widget>();
    for ( String opt in opciones) {
      final tempWidget = ListTile(
        title: Text( opt ),
      );
      lista..add(tempWidget)..add(Divider());

      //lista.add(Divider());
    }
    return lista;
  }
  */
}