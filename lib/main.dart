import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mendez/datos.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Usuarios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Registro de Usuarios'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var user, email, esp, tel, contra, pais;
  create() async {
    DocumentReference documentReference = await FirebaseFirestore.instance.collection("Registro").add({
      'User': user,
      'Email': email,
      'Especialidad': esp,
      'Telefono': tel,
      'Contraseña': contra,
      'Nacionalidad': pais,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF006064),
        automaticallyImplyLeading: false,
        leading: Padding(
          padding: EdgeInsetsDirectional.fromSTEB(5, 5, 5, 5),
          child: Image.asset(
            'assets/logo.png',
            width: 50,
            height: 50,
            fit: BoxFit.cover,
          ),
        ),
        title: Text(
          'Registro',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: false,
        elevation: 4,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              "Ingresa tus datos",
              style: TextStyle(
                color: Color(0xFF083131),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Usuario',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Usuario',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    user = x;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Correo',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Correo',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    email = x;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Especialidad',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Especialidad',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    esp = x;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Telefono',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Telefono',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    tel = x;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
              child: TextField(
                decoration: InputDecoration(
                  labelText: 'Nacionalidad',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Nacionalidad',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    pais = x;
                  });
                },
              ),
            ),
            Padding(
              padding: EdgeInsetsDirectional.fromSTEB(20, 10, 20, 10),
              child: TextField(
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Contraseña',
                  labelStyle: TextStyle(color: Color(0xFF757575)),
                  hintText: 'Contraseña',
                  filled: true,
                  fillColor: Color(0xFFB2DFDB),
                ),
                onChanged: (x) {
                  setState(() {
                    contra = x;
                  });
                },
              ),
            ),
            Container(
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                width: double.infinity,
                height: 70,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_left),
                  label: Text("REGISTRAR DATOS"),
                  onPressed: () {
                    create();
                  },
                  style: ElevatedButton.styleFrom(
                    onPrimary: Color(0xFF083131),
                    primary: Colors.white,
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
            Container(
                width: double.infinity,
                padding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 10),
                height: 70,
                child: ElevatedButton.icon(
                  icon: Icon(Icons.arrow_left),
                  label: Text("VER DATOS"),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Datos()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    onPrimary: Colors.white,
                    primary: Color(0xFF083131),
                    textStyle: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontFamily: 'Oswald',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
