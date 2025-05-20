import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/presentation/viewmodels/form_viewmodel.dart';

class EncounterSelector extends StatelessWidget {
  const EncounterSelector({
    super.key,
    required this.form,
  });
  final FormEntity form;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<FormViewModel>();
    const maxEncounters = int.fromEnvironment('MAX_ENCOUNTERS');

    return ShadSelect<int>(
      placeholder: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text('Selecione o encontro que você fez'),
      ),
      selectedOptionBuilder: (context, value) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text('${value + 1}º encontro'),
      ),
      onChanged: (value) {
        form.ejcNumber = (value! + 1).toString();
        viewmodel.setEjcNumber = (value + 1).toString();
      },
      options: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .026),
          child: const Text('Selecione o encontro que você fez'),
        ),
        ...List.generate(

          maxEncounters,
          (index) => ShadOption(
            value: index,
            child: Text('${index + 1}º encontro'),
          ),
        )
      ],
    );
  }
}
