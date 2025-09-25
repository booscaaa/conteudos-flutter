import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/util/database.dart';

class InserirPessoaRepository {
  final Database database;

  InserirPessoaRepository({required this.database});

  Future<void> call(Pessoa pessoa) async {
    await Future.delayed(Duration(seconds: 1));
    database.insert(pessoa);
  }
}
