import 'package:flutter/material.dart';

class EditRestaurante extends StatelessWidget{
EditRestaurante({super.key});

@override
  Widget build (BuildContext){
  return Scaffold(
    appBar: AppBar(title: const Text ("Editar Restaurante")),
    body: Padding(padding: const EdgeInsets.all(30),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(),
          Text("Edite aqui as informações do seu restaurante: "),

SizedBox(height:30),
          Text("Código do restaurante"),
DropdownButtonFormField(
    items:[
      DropdownMenuItem(value: "cd",child: Text("cd")),
    ],
 onChanged: (value){}),
          SizedBox(height:25),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Nome do Restaurante'),
          ),
          SizedBox(height:25),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Tipo'),
          ),
          SizedBox(height:25),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Longitude'),
          ),
          SizedBox(height:25),
          TextFormField(
            decoration: const InputDecoration(hintText: 'Latitude'),
          ),
          SizedBox (height: 100),
        ElevatedButton(onPressed: (){}, child: Row(
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