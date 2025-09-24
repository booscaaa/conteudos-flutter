import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';

class Database {
  final List<Pessoa> _pessoas = [
    Pessoa(nome: "Vinícius", sobrenome: "Boscardin", cpf: "000.000.000-00"),
    Pessoa(
      nome: "Lorenzo",
      sobrenome: "Nied",
      cpf: "000.000.000-00",
      telefone: "11999999999",
      genero: "Masculino",
      dataNascimento: "01/01/2000",
    ),
  ];

  List<Pessoa> select() {
    // SELECT * FROM pessoa
    return _pessoas;
  }

  Pessoa insert(Pessoa pessoa) {
    // INSERT INTO pessoa (nome, sobrenome, cpf) VALUES (?, ?, ?) RETURNING *
    _pessoas.add(pessoa);
    return pessoa;
  }

  Pessoa? update(String cpf, Pessoa pessoa) {
    // UPDATE pessoa SET nome = ?, sobrenome = ? WHERE cpf = ? RETURNING *
    for (var i = 0; i < _pessoas.length; i++) {
      if (_pessoas[i].cpf == cpf) {
        _pessoas[i] = pessoa;
        return _pessoas[i];
      }
    }
    return null;
  }

  Pessoa? delete(String cpf) {
    // DELETE FROM pessoa WHERE cpf = ? RETURNING *
    for (var i = 0; i < _pessoas.length; i++) {
      if (_pessoas[i].cpf == cpf) {
        return _pessoas.removeAt(i);
      }
    }

    return null;
  }
}
