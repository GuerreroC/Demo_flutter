import 'package:flutter/material.dart';

class InputPage extends StatefulWidget {
  InputPage({Key key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  //String _nombre;
  String _fechaRaw = '';
  String _dia = '';
  String _mes = '';
  String _year = '';
  String _fecha = '';
  String _opcion = 'Seleccionar Estado';
  String _opcion1 = '';
  TextEditingController _inputField = TextEditingController();

  List<String> _estado = [
    'Seleccionar Estado',
    'Chihuahua',
    'CDMX',
    'Tlaxcala',
    'Edo Mex'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inputs de texto'),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        children: [
          _crearInput(),
          Divider(), //_crearPersona(false)
          _crearEmail(),
          Divider(),
          _crearPassword(),
          Divider(),
          _crearFecha(context),
          Divider(),
          _crearDropdown(),
        ],
      ),
    );
  }

  _crearInput() {
    return TextField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
          filled: true,
          //fillColor: Color(0x0a0a0a),
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras ${_nombre.length}'),
          hintText: 'Nombre',
          labelText: 'Nombre',
          helperText: 'Escribe tu nombre',
          suffixIcon: Icon(Icons.accessibility),
          prefixIcon: Icon(Icons.account_circle)),
      showCursor: true,
      onSubmitted: (value) {
        setState(() {
          //_nombre = value;
          //_crearPersona(true);
        });
      },
      //enabled: false,
      //autofocus: true, //Activa el teclado automaticamente.
    );
  }

  Widget _crearEmail() {
    return TextField(
      //autofocus: true, //Activa el teclado automaticamente.
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
        //counter: Text('Letras ${_nombre.length}'),
        hintText: 'Email',
        labelText: 'Correo',
        helperText: 'Escribe tu correo',
        suffixIcon: Icon(Icons.alternate_email),
        prefixIcon: Icon(Icons.email),
        filled: true,
        //hoverColor: Color(0x0a0a0a)
        //disabledBorder: OutlineInputBorder(borderRadius: )
      ),

      onSubmitted: (value) {
        setState(() {
          print('Valor guardado');
          //_crearPersona(true);
        });
      },
    );
  }

  _crearPassword() {
    return TextField(
      obscureText: true,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras ${_nombre.length}'),
          hintText: 'Contraseña',
          labelText: 'Contraseña',
          helperText: 'Escribe tu contraseña',
          suffixIcon: Icon(Icons.lock_open),
          prefixIcon: Icon(Icons.lock)),
      onSubmitted: (value) {
        setState(() {
          print('Valor guardado');
          //_crearPersona(true);
        });
      },
    );
  }

  _crearFecha(BuildContext context) {
    return TextField(
      enableInteractiveSelection: false,
      controller: _inputField,
      decoration: InputDecoration(
          filled: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
          //counter: Text('Letras ${_nombre.length}'),
          hintText: 'Fecha de nacimiento',
          labelText: 'Fecha de nacimiento',
          helperText: 'Escribe tu fecha de nacimiento',
          suffixIcon: Icon(Icons.perm_contact_calendar),
          prefixIcon: Icon(Icons.calendar_today)),
      onTap: () {
        setState(() {
          FocusScope.of(context).requestFocus(new FocusNode());
          _selectDate(context);
        });
      },
    );
  }

  void _selectDate(BuildContext context) async {
    DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1950),
      lastDate: DateTime.now(),
      locale: Locale('es', 'MX'),
    );

    if (picked != null) {
      setState(() {
        _fechaRaw = picked.toString(); //Modificar el text
        _dia = _fechaRaw.substring(8, 10);
        _mes = _fechaRaw.substring(5, 7);
        _year = _fechaRaw.substring(0, 4);
        _fecha = '$_dia/$_mes/$_year';
        //print(_fechaOnly);
        _inputField.text = _fecha;
      });
    }
  }

  List<DropdownMenuItem<String>> getOpciones() {
    List<DropdownMenuItem<String>> lista = new List();
    _estado.forEach((estado) {
      lista.add(DropdownMenuItem(child: Text(estado), value: estado));
    });
    return lista;
  }

  Widget _crearDropdown() {
    return Center(
      child: DropdownButton(
          value: _opcion,
          items: getOpciones(),
          onChanged: (opt) {
            setState(() {
              _opcion = opt;
            });
          }),
    );
  }

  // _crearPersona(enable) {
  //   if (enable == true) {
  //     return ListTile(
  //       title: Text('El nombre es: $_nombre'),
  //     );
  //   } else {
  //     return ListTile(
  //       title: Text(
  //         'El nombre es: $_nombre',
  //         style: TextStyle(color: Colors.white),
  //       ),
  //     );
  //   }
  // }
}
