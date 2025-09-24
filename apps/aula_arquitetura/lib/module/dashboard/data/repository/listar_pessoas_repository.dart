import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/util/database.dart';

class ListarPessoasRepository {
  final Database database;

  ListarPessoasRepository({required this.database});

  Future<List<Pessoa>> call() async {
    await Future.delayed(Duration(seconds: 1));
    return database.select();
  }
}
