import 'package:aula6/card.dart';
import 'package:flutter/material.dart';

class Pagina2 extends StatefulWidget {
  final String nome;

  const Pagina2({super.key, required this.nome});

  @override
  State<Pagina2> createState() => _Pagina2State();
}

class _Pagina2State extends State<Pagina2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Pagina 2"), backgroundColor: Colors.red),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return CardCustom(
            nome: "João",
            pagina: "Pagina 2",
            voltar: () {
              Navigator.pop(context, "Boscardin");
            },
          );
        },
      ),
    );
  }
}
