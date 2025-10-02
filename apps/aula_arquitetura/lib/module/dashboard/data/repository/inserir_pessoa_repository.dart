import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/inserir_pessoa_repository.dart';
import 'package:aula_arquitetura/util/database.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: InserirPessoaRepository)
class InserirPessoaRepositoryImpl implements InserirPessoaRepository {
  final Database database;

  InserirPessoaRepositoryImpl({required this.database});

  @override
  Future<void> call(Pessoa pessoa) async {
    await Future.delayed(Duration(seconds: 1));
    database.insert(pessoa);
  }
}
