import 'package:lucid_validation/lucid_validation.dart';
import '../entities/form_entity.dart';

class FormValidator extends LucidValidator<FormEntity> {
  FormValidator() {
    ruleFor((form) => form.name, key: 'nome')
        .notEmpty(message: 'O nome não pode ficar vazio')
        .minLength(3, message: 'Nome deve ter no mínimo 3 caracteres');

    ruleFor((form) => form.ejcNumber, key: 'ejc')
        .notEmpty(message: 'Não pode ser vazio')
        .matchesPattern(r'^\d+$', message: 'Deve ser um número válido');

    ruleFor((form) => form.phones, key: 'telefones').must(
      (phones) => phones.isNotEmpty,
      'Você deve informar ao menos um telefone',
      '',
    );
    ruleFor((form) => form.aniversario, key: 'aniversario') //
        .isNotNull()
        .must(
          (aniversario) => aniversario.isBefore(DateTime.now()),
          'Data de aniversário deve ser anterior a data atual',
          '',
        );

    ruleFor((form) => form.skills, key: 'aptidões').must(
      (skills) => skills.isNotEmpty,
      'Selecione pelo menos uma aptidão',
      '',
    );

    ruleFor((form) => form.circle, key: 'círculos').must(
      (circle) => circle.isNotEmpty,
      'Selecione o seu círculo de origem',
      '',
    );
  }
}
