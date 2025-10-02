import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/listar_pessoas_repository.dart';
import 'package:injectable/injectable.dart';

@injectable
class ListarPessoasUsecase {
  final ListarPessoasRepository listarPessoasRepository;

  ListarPessoasUsecase({required this.listarPessoasRepository});

  Future<List<Pessoa>> call() async {
    return await listarPessoasRepository();
  }
}
