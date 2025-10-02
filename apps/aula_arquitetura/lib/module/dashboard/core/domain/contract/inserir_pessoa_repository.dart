import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';

abstract class InserirPessoaRepository {
  Future<void> call(Pessoa pessoa);
}
