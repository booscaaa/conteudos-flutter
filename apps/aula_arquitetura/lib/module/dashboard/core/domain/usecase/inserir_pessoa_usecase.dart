import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/data/repository/inserir_pessoa_repository.dart';

class InserirPessoaUsecase {
  final InserirPessoaRepository inserirPessoaRepository;

  InserirPessoaUsecase({required this.inserirPessoaRepository});

  Future<void> call(Pessoa pessoa) async {
    await inserirPessoaRepository(pessoa);
  }
}
