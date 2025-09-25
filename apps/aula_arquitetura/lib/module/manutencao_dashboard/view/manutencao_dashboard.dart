import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:flutter/material.dart';

class ManutencaoDashboard extends StatefulWidget {
  const ManutencaoDashboard({super.key});

  @override
  State<ManutencaoDashboard> createState() => _ManutencaoDashboardState();
}

class _ManutencaoDashboardState extends State<ManutencaoDashboard> {
  final _formKey = GlobalKey<FormState>();
  final _nome = TextEditingController();
  final _sobrenome = TextEditingController();
  final _cpf = TextEditingController();

  late Pessoa pessoa;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Manutenção de Pessoa")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(labelText: "Nome"),
                controller: _nome,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o nome";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "Sobrenome"),
                controller: _sobrenome,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o sobrenome";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              TextFormField(
                decoration: InputDecoration(labelText: "CPF"),
                controller: _cpf,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Preencha o cpf";
                  }

                  return null;
                },
              ),
              SizedBox(height: 20),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      pessoa = Pessoa(
                        nome: _nome.text,
                        sobrenome: _sobrenome.text,
                        cpf: _cpf.text,
                      );
                      Navigator.pop(context, pessoa);
                    }
                  },
                  child: Text(
                    "Salvar",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
