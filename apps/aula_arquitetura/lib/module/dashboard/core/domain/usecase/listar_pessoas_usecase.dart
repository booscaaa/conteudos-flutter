import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/data/repository/listar_pessoas_repository.dart';

class ListarPessoasUsecase {
  final ListarPessoasRepository listarPessoasRepository;

  ListarPessoasUsecase({required this.listarPessoasRepository});

  Future<List<Pessoa>> call() async {
    return await listarPessoasRepository();
  }
}
