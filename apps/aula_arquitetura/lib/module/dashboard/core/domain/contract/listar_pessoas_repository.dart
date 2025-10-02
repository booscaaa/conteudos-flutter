import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';

abstract class ListarPessoasRepository {
  Future<List<Pessoa>> call();
}
