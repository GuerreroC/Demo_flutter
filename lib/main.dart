import 'package:flutter/material.dart';

import 'package:demo_flutter/src/routes/routes.dart';
import 'src/pages/alert_page.dart';
//import 'package:demo_flutter/src/pages/home_tem.dart';

 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Widgets App',
      //home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
      onGenerateRoute: ( settings ) {
        print('Ruta llamada: ${ settings.name }');
        return MaterialPageRoute(
          builder: (BuildContext context) => AlertPage()
        );

      },
    );
  }
}
