// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:aula_arquitetura/module/dashboard/controller/dashboard_controller.dart'
    as _i597;
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/inserir_pessoa_repository.dart'
    as _i1028;
import 'package:aula_arquitetura/module/dashboard/core/domain/contract/listar_pessoas_repository.dart'
    as _i253;
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/inserir_pessoa_usecase.dart'
    as _i363;
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart'
    as _i856;
import 'package:aula_arquitetura/module/dashboard/data/repository/inserir_pessoa_repository.dart'
    as _i956;
import 'package:aula_arquitetura/module/dashboard/data/repository/listar_pessoas_repository.dart'
    as _i29;
import 'package:aula_arquitetura/util/database.dart' as _i264;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i264.Database>(() => _i264.Database());
    gh.factory<_i253.ListarPessoasRepository>(
      () => _i29.ListarPessoasRepositoryImpl(database: gh<_i264.Database>()),
    );
    gh.factory<_i1028.InserirPessoaRepository>(
      () => _i956.InserirPessoaRepositoryImpl(database: gh<_i264.Database>()),
    );
    gh.factory<_i856.ListarPessoasUsecase>(
      () => _i856.ListarPessoasUsecase(
        listarPessoasRepository: gh<_i253.ListarPessoasRepository>(),
      ),
    );
    gh.factory<_i363.InserirPessoaUsecase>(
      () => _i363.InserirPessoaUsecase(
        inserirPessoaRepository: gh<_i1028.InserirPessoaRepository>(),
      ),
    );
    gh.factory<_i597.DashboardController>(
      () => _i597.DashboardController(
        listarPessoasUseCase: gh<_i856.ListarPessoasUsecase>(),
        inserirPessoaUsecase: gh<_i363.InserirPessoaUsecase>(),
      ),
    );
    return this;
  }
}
