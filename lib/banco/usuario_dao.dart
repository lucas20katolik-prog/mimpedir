import 'database_helper.dart';
import 'package:mimpedir/usuario.dart';

class UsuarioDao{
  static Future<bool> autenticar (String login, String senha) async{
    final db = await DatabaseHelper.getDataBase();

    final resultado = await db.query(
      'tb_usuario',
        where: 'nm_login = ? and ds_senha = ?',
      whereArgs: [login, senha]
    );
    return resultado.isNotEmpty;
  }
}