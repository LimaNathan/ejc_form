// ignore_for_file: unused_local_variable

import 'dart:developer';

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
  late final FormViewModel viewmodel;
  bool isCoordinator = false;

  @override
  void initState() {
    super.initState();
    viewmodel = context.read<FormViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<FormViewModel>();
    const maxEncounters = int.fromEnvironment('MAX_ENCOUNTERS');

    return ListenableBuilder(
        listenable: viewmodel,
        builder: (context, child) {
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
                    final encounter =
                        (index + 1) + int.parse(viewmodel.ejcNumber);
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        spacing: 10,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Selecione a equipe em que '
                              'você serviu no $encounterº encontro.'),
                          const Center(
                              child:
                                  Text('Você foi coordenador nesse encontro?')),
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
                              final team = TeamParticipation(
                                encontro: encounter.toString(),
                                team: value!.uuid,
                                isCoordinator: isCoordinator,
                              );

                              bool condition(TeamParticipation e) =>
                                  int.parse(e.encontro) == encounter;

                              if (widget //
                                  .form
                                  .teams
                                  .any(condition)) {
                                widget //
                                    .form
                                    .teams
                                    .removeWhere(condition);
                              }

                              widget.form.teams.add(team);
                              log('breakpoint');
                            },
                            items: [
                              ShadRadio(
                                value: TeamsModel(
                                  name: 'Não servi nesse encontro',
                                  uuid: '0',
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
            error: (_) => Container(),
            success: Container.new,
          );
        });
  }
}
