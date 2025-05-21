// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:form_ejc/data/models/teams_model.dart';
import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/presentation/viewmodels/form_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class TeamSelector extends StatefulWidget {
  const TeamSelector({
    super.key,
    required this.form,
  });

  final FormEntity form;

  @override
  State<TeamSelector> createState() => _TeamSelectorState();
}

class _TeamSelectorState extends State<TeamSelector> {
  bool isCoordinator = false;
  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<FormViewModel>();
    const maxEncounters = int.fromEnvironment('MAX_ENCOUNTERS');

    return Consumer<FormViewModel>(builder: (context, viewmodel, _) {
      return viewmodel.state.when(
        initial: (value) {
          if (viewmodel.ejcNumber.isNotEmpty) {
            final totalEncounter =
                maxEncounters - int.parse(viewmodel.ejcNumber);

            if (totalEncounter == 0) {
              return const Text('Preencha as aptidões abaixo.');
            }
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: totalEncounter,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final encounter = (index + 1) + int.parse(viewmodel.ejcNumber);
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    spacing: 10,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selecione a equipe em que '
                          'você serviu no $encounterº encontro.'),
                      const Center(
                          child: Text('Você foi coordenador nesse encontro?')),
                      Center(
                        child: ShadRadioGroupFormField<bool>(
                          onChanged: (value) {
                            isCoordinator = value!;
                          },
                          axis: Axis.horizontal,
                          items: const [
                            ShadRadio(
                              value: true,
                              label: Text('Sim'),
                            ),
                            ShadRadio(
                              value: false,
                              label: Text('Não'),
                            ),
                          ],
                        ),
                      ),
                      ShadRadioGroupFormField<TeamsModel>(
                        autovalidateMode: AutovalidateMode.always,
                        description: const Text('Você deve selecionar '
                            'alguma das opções acima.'),
                        onChanged: (value) {
                          widget.form.teams.add(TeamParticipation(
                            encontro: encounter.toString(),
                            team: value!.uuid,
                            isCoordinator: isCoordinator,
                          ));
                        },
                        items: [
                          ShadRadio(
                            value: TeamsModel(
                              name: 'Não servi nesse encontro',
                            ),
                            label: const Text('Não servi nesse encontro'),
                          ),
                          ...value.map(
                            (e) => ShadRadio(
                              value: e,
                              label: Text(e.name),
                            ),
                          ),
                        ],
                        validator: (value) {
                          if (value == null) {
                            return 'Selecione uma equipe.';
                          }
                          return null;
                        },
                      )
                    ],
                  ),
                );
              },
            );
          }

          return Container();
        },
        loading: () => const CircularProgressIndicator(),
        // error: (error) => Text(error.toString()),
        error: (_) => Container(),
        success: Container.new,
      );
    });
  }
}
