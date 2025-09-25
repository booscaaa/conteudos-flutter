import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/inserir_pessoa_usecase.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart';

class DashboardController {
  bool loading = false;
  List<Pessoa> pessoas = [];
  Function setState;
  final ListarPessoasUsecase listarPessoasUseCase;
  final InserirPessoaUsecase inserirPessoaUsecase;

  DashboardController({
    required this.listarPessoasUseCase,
    required this.inserirPessoaUsecase,
    required this.setState,
  });

  Future listarPessoas() async {
    loading = true;
    setState(() {});
    pessoas = await listarPessoasUseCase();
    loading = false;
    setState(() {});
  }

  adicionarPessoa(Pessoa pessoa) async {
    loading = true;
    setState(() {});
    await inserirPessoaUsecase(pessoa);
    await listarPessoas();
  }
}
