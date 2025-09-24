import 'package:flutter/material.dart';

class CardCustom extends StatelessWidget {
  final String nome;
  final String pagina;
  final Function()? voltar;

  const CardCustom({
    super.key,
    required this.nome,
    required this.pagina,
    this.voltar,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(pagina, style: TextStyle(fontSize: 35)),
        Text("Nome: $nome", style: TextStyle(fontSize: 40)),
        voltar != null
            ? TextButton(onPressed: voltar, child: Text("Voltar"))
            : Container(),
      ],
    );
  }
}
