import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PhoneList extends StatelessWidget {
  final List<String> phones;
  final Function(List<String>) onPhonesChanged;

  const PhoneList({
    required this.phones,
    required this.onPhonesChanged,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Telefones', style: Theme.of(context).textTheme.titleMedium),
        ...phones.asMap().entries.map((entry) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 4),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ShadInputFormField(
                    initialValue: entry.value,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      _PhoneMaskFormatter(),
                    ],
                    description: const Text(
                        'Informe seu telefone no formato (00) 00000-0000'),
                    onChanged: (value) {
                      final newPhones = List<String>.from(phones);
                      newPhones[entry.key] = value;
                      onPhonesChanged(newPhones);
                    },
                  ),
                ),
                ShadButton.outline(
                  leading: const Icon(Icons.remove_circle),
                  onPressed: () {
                    final newPhones = List<String>.from(phones);
                    newPhones.removeAt(entry.key);
                    onPhonesChanged(newPhones);
                  },
                ),
              ],
            ),
          );
        }),
        ShadButton.ghost(
          leading: const Icon(Icons.add),
          child: const Text('Adicionar telefone'),
          onPressed: () {
            onPhonesChanged([...phones, '']);
          },
        ),
      ],
    );
  }
}

class _PhoneMaskFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    final text = newValue.text.replaceAll(RegExp(r'\D'), '');
    final formatted = text.length <= 11
        ? text.replaceAllMapped(
            RegExp(r'^(\d{2})(\d{5})(\d{4})$'),
            (m) => '(${m[1]}) ${m[2]}-${m[3]}',
          )
        : text;
    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}
