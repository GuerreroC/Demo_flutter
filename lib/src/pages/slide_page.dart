import 'package:flutter/material.dart';

class SliderPage extends StatefulWidget {
  SliderPage({Key key}) : super(key: key);

  @override
  _SliderPageState createState() => _SliderPageState();
}

class _SliderPageState extends State<SliderPage> {
  double _valorSlider = 80.0;
  bool _bloquearTamano = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Slider'),
      ),
      body: Container(
        padding: EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            _crearSlider(),
            _checkbox(),
            _crearSwitch(),
            Expanded(
              child: _crearImagen(),
            )
          ],
        ),
      ),
    );
  }

  _crearSlider() {
    return Slider(
      activeColor: Colors.indigoAccent,
      label: 'Tamaño de la imagen',
      //divisions: 50,
      value: _valorSlider,
      min: 40.0,
      max: 300.0,
      onChanged: (_bloquearTamano)
          ? null
          : (valor) {
              // print('Valor');
              setState(() {
                _valorSlider = valor;
              });
            },
    );
  }

  _crearImagen() {
    return Image(
      image: NetworkImage(
          'https://static.wikia.nocookie.net/halo/images/a/ae/John-117_infobox_HI.png/revision/latest/scale-to-width-down/340?cb=20200815053035&path-prefix=es'),
      width: _valorSlider,
      fit: BoxFit.contain,
    );
  }

  _checkbox() {
    // return Checkbox(
    //     value: _bloquearTamano,
    //     onChanged: (valor) {
    //       setState(() {
    //         _bloquearTamano = valor;
    //       });
    //     });
    return CheckboxListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearTamano,
        onChanged: (valor) {
          setState(() {
            _bloquearTamano = valor;
          });
        });
  }

  _crearSwitch() {
    return SwitchListTile(
        title: Text('Bloquear Slider'),
        value: _bloquearTamano,
        onChanged: (valor) {
          setState(() {
            _bloquearTamano = valor;
          });
        });
  }
}
