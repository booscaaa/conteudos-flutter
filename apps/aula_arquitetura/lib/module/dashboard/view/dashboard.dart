import 'package:aula_arquitetura/module/dashboard/controller/dashboard_controller.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/usecase/listar_pessoas_usecase.dart';
import 'package:aula_arquitetura/module/dashboard/data/repository/listar_pessoas_repository.dart';
import 'package:aula_arquitetura/module/dashboard/di/controller.dart';
import 'package:aula_arquitetura/util/database.dart';
import 'package:flutter/material.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({super.key});

  @override
  State<DashboardView> createState() => _DashboardViewState();
}

class _DashboardViewState extends State<DashboardView> {
  late DashboardController dashboardController;

  @override
  initState() {
    super.initState();
    dashboardController = DashboardControllerDI.getInstance(setState: setState);

    dashboardController.listarPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Text(dashboardController.pessoas[index].nome);
        },
        itemCount: dashboardController.pessoas.length,
      ),
    );
  }
}
