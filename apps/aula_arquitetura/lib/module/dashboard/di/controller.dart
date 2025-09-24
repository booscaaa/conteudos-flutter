import 'package:aula_arquitetura/module/dashboard/controller/dashboard_controller.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart';
import 'package:aula_arquitetura/module/dashboard/data/repository/listar_pessoas_repository.dart';
import 'package:aula_arquitetura/util/database.dart';

class DashboardControllerDI {
  static DashboardController? dashboardController;

  static DashboardController getInstance({required Function setState}) {
    final Database database = Database();
    final ListarPessoasRepository listarPessoasRepository =
        ListarPessoasRepository(database: database);

    final ListarPessoasUsecase listarPessoasUseCase = ListarPessoasUsecase(
      listarPessoasRepository: listarPessoasRepository,
    );

    dashboardController ??= DashboardController(
      listarPessoasUseCase: listarPessoasUseCase,
      setState: setState,
    );

    return dashboardController!;
  }
}
