import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/listar_pessoas_repository.dart';
import 'package:aula_arquitetura/util/database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ListarPessoasRepository)
class ListarPessoasRepositoryImpl implements ListarPessoasRepository {
  final Database database;

  ListarPessoasRepositoryImpl({required this.database});

  @override
  Future<List<Pessoa>> call() async {
    await Future.delayed(Duration(seconds: 1));
    return database.select();
  }
}
