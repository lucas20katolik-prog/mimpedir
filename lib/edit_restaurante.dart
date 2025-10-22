import 'package:flutter/material.dart';
import 'package:mimpedir/banco/restaurante_dao.dart';
import 'package:mimpedir/restaurante.dart';
import 'package:mimpedir/tipo.dart';
import 'package:mimpedir/banco/tipo_dao.dart';


class EditRestaurante extends StatefulWidget {
//restaurante que será exibido na tela
  static Restaurante restaurante = Restaurante();

  @override
  State<StatefulWidget> createState() {
    return EditRestauranteState();
  }
}

  class EditRestauranteState extends State <EditRestaurante> {

    final TextEditingController cdController = TextEditingController();
    final TextEditingController nomeController = TextEditingController();
    final TextEditingController latitudeController = TextEditingController();
    final TextEditingController longitudeController = TextEditingController();
    String? culinariaSelecionada;
    List <Tipo> tiposCulinaria = [];
    int? tipoCulinaria;
    int? codigo  = EditRestaurante.restaurante.cd_rest;


    void initState() {
      super.initState();
      carregarTipos();
      cdController.text = EditRestaurante.restaurante.cd_rest.toString()!;
      nomeController.text = EditRestaurante.restaurante.nome!;
      latitudeController.text =  EditRestaurante.restaurante.latitude!;
      longitudeController.text = EditRestaurante.restaurante.longitude!;
      tipoCulinaria = EditRestaurante.restaurante.cd_tipo?.codigo!;
      culinariaSelecionada =  EditRestaurante.restaurante.cd_tipo?.nome!;

    }


    Future<void> carregarTipos() async {
      final lista = await TipoDAO.listarTipos();
      setState(() {
        tiposCulinaria = lista;
      });
    }


    Widget build(BuildContext) {
      return Scaffold(
          appBar: AppBar(title: const Text ("Editar Restaurante")),
          body: Padding(padding: const EdgeInsets.all(30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(),
                Text("Edite aqui as informações do seu restaurante: "),

                SizedBox(height: 30),
                Text("Código do restaurante"),
                TextFormField(
                  decoration: InputDecoration(hintText: "Código" ),
                  validator: (String? value){},
                  controller: cdController,
                  enabled: false,
                ),

                SizedBox(height: 25),
                TextFormField(
                  decoration: const InputDecoration(
                      hintText: 'Nome do Restaurante'),
                  validator: (String?value){},
                  controller: nomeController
                ),

                SizedBox(height: 25),
                DropdownButtonFormField<String>(
                    value: culinariaSelecionada,
                    items: tiposCulinaria.map((tipo){
                      return DropdownMenuItem <String>(
                          value: tipo.nome,
                          child: Text ("${tipo.nome}")
                      );
                    }).toList(),
                    onChanged: (String? value) {
                      setState(() {
                        culinariaSelecionada = value;
                        Tipo tipoSelecionado = tiposCulinaria.firstWhere(
                              (tipo) => tipo.nome == value,
                        );
                        tipoCulinaria = tipoSelecionado.codigo;
                      });
                    }
                ),

                SizedBox(height: 25),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Longitude'),
                  validator: (String? value){},
                  controller: longitudeController,
                ),

                SizedBox(height: 25),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Latitude'),
                  validator: (String? value){},
                  controller: latitudeController,
                ),
                SizedBox(height: 100),
                ElevatedButton(onPressed: ()async{
                  final sucesso = await RestauranteDAO.atualizar(cdController.text, nomeController.text, latitudeController.text, longitudeController.text,
                      tipoCulinaria);
                  String msg = 'Foi impossível atualizar. Tente novamente.';

                }, child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.save),
                    Text("Salvar alterações")
                  ],
                ))
              ],
            ),
          )
      );
    }
  }