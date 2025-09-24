import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart';

class DashboardController {
  List<Pessoa> pessoas = [];
  Function setState;
  final ListarPessoasUsecase listarPessoasUseCase;

  DashboardController({
    required this.listarPessoasUseCase,
    required this.setState,
  });

  Future listarPessoas() async {
    pessoas = await listarPessoasUseCase();
    setState(() {});
  }
}
