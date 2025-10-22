import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_dao.dart';
import 'package:mimpedir/edit_restaurante.dart';
import 'package:mimpedir/tela_cad_restaurante.dart';
import 'restaurante.dart';

class TelaHome extends StatefulWidget {
  TelaHome({super.key});

  @override
  State<TelaHome> createState() => TelaHomeState();
}

class TelaHomeState extends State<TelaHome>{
  List <Restaurante> restaurantes = [];

  @override
  void initState(){
    super.initState();
    carregarRestaurantes();
  }


  Future<void>carregarRestaurantes()async{
    final lista = await RestauranteDAO.listarTodos();
    setState(() {
      restaurantes = lista;
    });
  }


  @override
  Widget build(BuildContext context) {
  return Scaffold(
  appBar: AppBar(title: const Text ("Lista de restaurantes"),
  actions: [
  IconButton(onPressed: (){
    final t = Navigator.push(context,
    MaterialPageRoute(builder:(context) => TelaCadRestaurante())
    );

    if(t == false || t == null){
      setState(() {
        carregarRestaurantes();
      });
    }

  }, icon: Icon(Icons.add))
  ],),
  body: Padding(padding: const EdgeInsets.all(20),
  child: ListView.builder(
  itemCount: restaurantes.length,
  itemBuilder: (context, index){
    final r = restaurantes[index];
  return Card(
  margin: EdgeInsets.symmetric(vertical: 8),
  child: ListTile(
  title: Text(r.nome ?? 'sem nome'),
  subtitle: Text ('ID:${r.cd_rest}'),
  trailing: Row(
  mainAxisSize: MainAxisSize.min,
  children: [
  IconButton(
    icon: const Icon(Icons.edit, color: Colors.blue),
    onPressed: ()async{
      //botão editar
      EditRestaurante.restaurante = await RestauranteDAO.listar(r.cd_rest);
      Navigator.push(context, MaterialPageRoute(builder: (context)=> EditRestaurante()));
    },
  ),
  IconButton(
      icon: const Icon(Icons.delete, color: Colors.red),
  onPressed:(){
        showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
  title: Text ('ATENÇÃO!'),
  content: Text("Confirmar exclusão?"),
  actions: [
    TextButton(onPressed: (){
      Navigator.pop(context);
  }, child: Text("cancelar")),
  TextButton(onPressed: (){
    //aqui foi confirmado, pode exluir
  RestauranteDAO.excluir(r);
  setState(() {
  });
  //fecha o alerta
  Navigator.pop(context);

  }, child: Text("sim"))
  ],
  )
  );
  }),
  ],
  ),
  ),
  );
  }
  )
  ),
  floatingActionButton: FloatingActionButton(onPressed: (){
  Navigator.push(context,
  MaterialPageRoute(builder: (context) => TelaCadRestaurante())
  );
  },
  child: Icon(Icons.add),
  ),
    bottomNavigationBar: BottomNavigationBar(
      items: const <BottomNavigationBarItem>[
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Adicionar"),
        BottomNavigationBarItem(icon: Icon(Icons.add), label: "Adicionar"),
      ],
    ),
  );
  }
  }
