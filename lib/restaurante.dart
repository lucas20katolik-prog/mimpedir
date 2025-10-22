import 'usuario.dart';
import 'tipo.dart';


class Restaurante{
  String? _nome;
  int? _cd_rest;
  String? _latitude;
  String? _longitude;
  Usuario? _cd_user;
  Tipo? _cd_tipo;

Restaurante({String? nome, int? cd_rest, String? latitude,
String? longitude, Usuario? cd_user, Tipo? cd_tipo}){
  _nome = nome;
  _cd_rest = cd_rest;
  _latitude = latitude;
  _longitude = longitude;
  _cd_user= cd_user;
  _cd_tipo = cd_tipo;
}

  String? get nome => _nome;
  set nome (String? valor) => _nome = valor;

  int? get cd_rest => _cd_rest;
  set cd_rest(int? valor) => _cd_rest = valor;

  String? get latitude => _latitude;
  set latitude(String? valor) => _latitude = valor;

  String? get longitude => _longitude;
  set longitude (String? valor) => _longitude = valor;

  Usuario? get cd_user => _cd_user;
  set cd_user(Usuario? valor) => _cd_user = valor;

  Tipo? get cd_tipo => _cd_tipo;
  set cd_tipo (Tipo? valor) => _cd_tipo = valor;

}

