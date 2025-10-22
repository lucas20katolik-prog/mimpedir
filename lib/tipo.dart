class Tipo{
  int? _cd_tipo;
  String? _nome;

  Tipo({int? codigo, String? nome}){
    _cd_tipo = codigo;
    _nome = nome;
  }

  // metodo classico para metodo get
  int? get codigo{
    return _cd_tipo;
  }

  //metodo para dart
String? get nome => _nome;

  //metodo classico
  set codigo(int? valor){
    _cd_tipo = valor;
  }

  //metodo adaptado para dart
set nome(String?valor) => _nome = valor;
















}