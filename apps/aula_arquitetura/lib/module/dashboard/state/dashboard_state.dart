import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';

abstract class DashboardState {}

class DashboardInitial extends DashboardState {}

class DashboardLoading extends DashboardState {}

class DashboardLoaded extends DashboardState {
  final List<Pessoa> pessoas;

  DashboardLoaded(this.pessoas);
}
