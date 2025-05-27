import 'package:flutter/material.dart';
import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/domain/states/form_state.dart';
import 'package:form_ejc/domain/validators/form_validator.dart';
import 'package:form_ejc/presentation/widgets/circle_selector.dart';
import 'package:form_ejc/presentation/widgets/encounter_selector.dart';
import 'package:form_ejc/presentation/widgets/team_selector.dart';
import 'package:form_ejc/utils/formatters/date_formatter.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import '../viewmodels/form_viewmodel.dart';
import '../widgets/phone_list.dart';
import '../widgets/photo_picker.dart';
import '../widgets/skills_selector.dart';

class FormView extends StatefulWidget {
  const FormView({super.key});

  @override
  State<FormView> createState() => _FormViewState();
}

class _FormViewState extends State<FormView> {
  final form = FormEntity(
      circle: '',
      ejcNumber: '',
      name: '',
      photo: '',
      skills: [],
      teams: [],
      aniversario: DateTime(2025),
      phones: []);
  DateTime? initialDateValue = DateTime(2020);

  @override
  Widget build(BuildContext context) {
    final validator = FormValidator();

    void setPhones(phones) => setState(() => form.phones = phones);
    void setSkills(skills) => setState(() => form.skills = skills);
    void setName(name) => form.name = name;
    void setBithdate(String date) {
      final splittedDate = date.split('/');

      form.aniversario = DateTime.parse(
        '${splittedDate[2]}-${splittedDate[1]}-${splittedDate[0]}',
      );
    }

    return Scaffold(
      backgroundColor:
          ShadTheme.of(context).colorScheme.accentForeground.withAlpha(10),
      body: Consumer<FormViewModel>(
        builder: (context, viewModel, _) {
          if (viewModel.state is FormLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (viewModel.state is FormError) {
            final message = (viewModel.state as FormError).message;

            ShadToaster.of(context).show(
              ShadToast.destructive(
                duration: const Duration(seconds: 15),
                title: const Text('Ops! Houve um erro!'),
                description: Text(message),
              ),
            );
          }

          if (viewModel.state is FormSuccess) {
            return const Center(
              child: Text(
                'Formulário enviado com sucesso!'
                '\nAgradecemos por preencher, aguarde o contato!',
                textAlign: TextAlign.center,
              ),
            );
          }

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: ShadCard(
              padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.1,
                vertical: 24,
              ),
              child: Column(
                spacing: 16,
                children: [
                  PhotoPicker(
                    onPhotoSelected: viewModel.updatePhoto,
                    currentPhoto: viewModel.photoUrl,
                  ),
                  ShadInputFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validator.byField(form, 'nome'),
                    onChanged: setName,
                    error: Text.new,
                    label: const Text('Nome'),
                  ),
                  ShadInputFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    validator: validator.byField(form, 'aniversario'),
                    label: const Text('Data de nascimento'),
                    onChanged: setBithdate,
                    description: const Text(
                        'Informe o seu nascimento nesse formato: dd/mm/aaaa'),
                    inputFormatters: [DateInputFormatter()],
                  ),
                  EncounterSelector(form: form),
                  CircleSelector(form: form),
                  TeamSelector(form: form),
                  SkillsSelector(
                    selectedSkills: form.skills,
                    onSkillsChanged: setSkills,
                  ),
                  PhoneList(
                    phones: form.phones,
                    onPhonesChanged: setPhones,
                  ),
                  ShadButton(
                    expands: true,
                    onPressed: () {
                      if (viewModel.photoUrl == null ||
                          (viewModel.photoUrl != null &&
                              viewModel.photoUrl!.isEmpty)) {
                        ShadToaster.of(context).show(
                          const ShadToast.destructive(
                            duration: Duration(seconds: 15),
                            title: Text('Ops! Houve um erro!'),
                            description: Text('A foto não pode ficar vazia!'),
                          ),
                        );
                      } else {
                        viewModel.submitForm(form..photo = viewModel.photoUrl);
                      }
                    },
                    child: const Text('Enviar'),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
