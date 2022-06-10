import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mendez/main.dart';

void main() => runApp(Datos());

class Datos extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Registro de Datos',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: DatosPage(title: 'Registro de Datos'),
    );
  }
}

class DatosPage extends StatefulWidget {
  final String title;
  const DatosPage({Key? key, required this.title}) : super(key: key);
  @override
  _DatosPageState createState() => _DatosPageState();
}

class User {
  String user;
  String email;
  String contra;
  String pais;
  String esp;
  String tel;

  User({
    required this.user,
    required this.email,
    required this.tel,
    required this.pais,
    required this.esp,
    required this.contra,
  });

  Map<String, dynamic> toJson() => {
        'User': user,
        'Email': email,
        'Especialidad': esp,
        'Telefono': tel,
        'Contraseña': contra,
        'Nacionalidad': pais,
      };

  static User fromJson(Map<String, dynamic> json) => User(user: json['User'], email: json['Email'], esp: json['Especialidad'], tel: json['Telefono'], pais: json['Nacionalidad'], contra: json['Contraseña']);
}

class _DatosPageState extends State<DatosPage> {
  Stream<List<User>> readRegistro() => FirebaseFirestore.instance.collection('Registro').snapshots().map((snapshot) => snapshot.docs.map((doc) => User.fromJson(doc.data())).toList());

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
          'Usuarios',
          style: TextStyle(
            fontFamily: 'Oswald',
            color: Colors.white,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.login_outlined,
              color: Colors.white,
              size: 30,
            ),
            onPressed: () async {
              await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MyApp(),
                ),
              );
            },
          ),
        ],
        centerTitle: false,
        elevation: 4,
      ),
      body: StreamBuilder<List<User>>(
          stream: readRegistro(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Hay un error');
            } else if (snapshot.hasData) {
              final Registro = snapshot.data!;
              return ListView(
                children: Registro.map(buildUser).toList(),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Widget buildUser(User user) => ListTile(
        isThreeLine: true,
        leading: CircleAvatar(
          backgroundColor: Color(0xFF006064),
          backgroundImage: AssetImage("assets/icon.png"),
        ),
        title: Text(user.user),
        subtitle: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(user.email),
          Text(user.esp)
        ]),
      );
}
