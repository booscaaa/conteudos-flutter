import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/inserir_pessoa_usecase.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart';
import 'package:aula_arquitetura/module/dashboard/state/dashboard_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class DashboardController extends Cubit<DashboardState> {
  final ListarPessoasUsecase listarPessoasUseCase;
  final InserirPessoaUsecase inserirPessoaUsecase;

  DashboardController({
    required this.listarPessoasUseCase,
    required this.inserirPessoaUsecase,
  }) : super(DashboardInitial()) {
    listarPessoas(); // Carrega automaticamente ao criar o cubit
  }

  Future<void> listarPessoas() async {
    emit(DashboardLoading());
    final pessoas = await listarPessoasUseCase();
    emit(DashboardLoaded(pessoas));
  }

  Future<void> adicionarPessoa(Pessoa pessoa) async {
    emit(DashboardLoading());
    await inserirPessoaUsecase(pessoa);
    await listarPessoas();
  }
}
