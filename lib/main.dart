import 'package:flutter/material.dart';
import 'package:mimpedir/tela_login.dart';
import 'usuario.dart';
import 'tipo.dart';
import 'restaurante.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   /* Usuario u = Usuario(
      cd_user: 1,
      nome: "Lucas",
      login: "lucas20katolik",
      senha: "senha"
    );

    Tipo t = Tipo(
      codigo: 11,
      nome: "Italiana"
    );

    Restaurante r = Restaurante(
    nome: "A Moda Da Casa",
    cd_rest: 111,
    latitude: 38.49,
    longitude: 52.35,
      cd_user: u,
      cd_tipo: t
    );*/


    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TelaLogin(),
    );
  }
}