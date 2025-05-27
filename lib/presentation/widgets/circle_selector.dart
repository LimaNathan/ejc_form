import 'package:flutter/material.dart';
import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/presentation/viewmodels/form_viewmodel.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class CircleSelector extends StatelessWidget {
  const CircleSelector({
    super.key,
    required this.form,
  });
  final FormEntity form;

  @override
  Widget build(BuildContext context) {
    final viewmodel = context.read<FormViewModel>();
    final circulos = ['Azul', 'Vermelho', 'Amarelo', 'Verde', 'Rosa'];

    return ShadSelect<String>(
      placeholder: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: const Text('Selecione o seu círculo'),
      ),
      selectedOptionBuilder: (context, value) => SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Text('${form.circle} ${viewmodel.ejcNumber}'),
      ),
      onChanged: (value) {
        form.circle = value ?? 'Não informado';
      },
      options: [
        Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * .026),
          child: const Text('Selecione o encontro que você fez'),
        ),
        ...List.generate(
          circulos.length,
          (index) => ShadOption(
            value: index,
            child: Text('${circulos[index]} ${viewmodel.ejcNumber}}'),
          ),
        )
      ],
    );
  }
}
