// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/presentation/viewmodels/form_viewmodel.dart';

class CircleSelector extends StatefulWidget {
  const CircleSelector({
    required this.form,
    super.key,
  });
  final FormEntity form;

  @override
  State<CircleSelector> createState() => _CircleSelectorState();
}

class _CircleSelectorState extends State<CircleSelector> {
  late final FormViewModel viewmodel;

  @override
  void initState() {
    super.initState();
    viewmodel = context.read<FormViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    final circulos = ['Azul', 'Vermelho', 'Amarelo', 'Verde', 'Rosa'];

    return ListenableBuilder(
      listenable: viewmodel,
      builder: (context, child) {
        return viewmodel.state.when(
            loading: () => const CircularProgressIndicator(),
            error: (_) => Container(),
            success: Container.new,
            initial: (value) {
              if (viewmodel.ejcNumber.isNotEmpty) {
                return ShadSelect<String>(
                  placeholder: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: const Text('Selecione o seu círculo'),
                  ),
                  selectedOptionBuilder: (context, value) => SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: Text('${widget.form.circle} ${viewmodel.ejcNumber}'),
                  ),
                  onChanged: (value) {
                    widget.form.circle = value ?? 'Não informado';
                  },
                  options: [
                    Padding(
                      padding: EdgeInsets.all(
                          MediaQuery.of(context).size.width * .026),
                      child: const Text('Selecione o encontro que você fez'),
                    ),
                    ...List.generate(
                      circulos.length,
                      (index) => ShadOption(
                        value: circulos[index],
                        child:
                            Text('${circulos[index]} ${viewmodel.ejcNumber}'),
                      ),
                    )
                  ],
                );
              }
              return Container();
            });
      },
    );
  }
}
