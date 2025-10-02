import 'package:aula_arquitetura/core/injection.dart';
import 'package:aula_arquitetura/module/dashboard/controller/dashboard_controller.dart';
import 'package:aula_arquitetura/module/dashboard/state/dashboard_state.dart';
import 'package:aula_arquitetura/module/dashboard/core/domain/model/pessoa.dart';
import 'package:aula_arquitetura/module/manutencao_dashboard/view/manutencao_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DashboardView extends StatelessWidget {
  final controller = getIt<DashboardController>();

  DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => controller,
      child: BlocBuilder<DashboardController, DashboardState>(
        builder: (context, state) {
          return Scaffold(
            body: Builder(
              builder: (context) {
                if (state is DashboardLoading) {
                  return Center(child: CircularProgressIndicator());
                } else if (state is DashboardLoaded) {
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      return Text(state.pessoas[index].nome);
                    },
                    itemCount: state.pessoas.length,
                  );
                }
                return Center(child: Text('Estado inicial'));
              },
            ),
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                final pessoa = await Navigator.push<Pessoa>(
                  context,
                  MaterialPageRoute(builder: (_) => ManutencaoDashboard()),
                );

                if (pessoa != null && context.mounted) {
                  controller.adicionarPessoa(pessoa);
                }
              },
              child: Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
