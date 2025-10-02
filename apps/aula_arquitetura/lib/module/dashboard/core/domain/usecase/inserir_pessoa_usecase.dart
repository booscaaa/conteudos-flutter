import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/inserir_pessoa_repository.dart';

import 'package:injectable/injectable.dart';

@injectable
class InserirPessoaUsecase {
  final InserirPessoaRepository inserirPessoaRepository;

  InserirPessoaUsecase({required this.inserirPessoaRepository});

  Future<void> call(Pessoa pessoa) async {
    await inserirPessoaRepository(pessoa);
  }
}
