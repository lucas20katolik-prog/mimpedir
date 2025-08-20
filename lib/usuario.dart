class Usuario {
  int? _cd_user;
  String? _nome;
  String? _login;
  String? _senha;

  Usuario({String? nome, int? cd_user, String? senha, String? login}) {
    _senha = senha;
    _cd_user = cd_user;
    _nome = nome;
    _login = login;
  }

  String? get login {
    return _login;
  }


  String? get nome => _nome;

  int? get cd_user => _cd_user;

  String? get senha => _senha;


  set login(String? login){
    _login = login;
  }

  set nome (String? nome) => _nome = nome;
  set senha (String? senha) => _senha = senha;
  set codigo (int? codigo) => _cd_user = cd_user;

}
