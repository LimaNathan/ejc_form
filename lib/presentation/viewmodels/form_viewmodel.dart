import 'package:flutter/material.dart' as material;
import 'package:form_ejc/data/models/form_model.dart';
import 'package:form_ejc/domain/entities/form_entity.dart';
import 'package:form_ejc/domain/repositories/i_form_repository.dart';
import 'package:form_ejc/domain/states/form_state.dart';
import 'package:result_dart/result_dart.dart';

class FormViewModel extends material.ChangeNotifier {
  FormState _state = const FormState.initial([]);
  FormState get state => _state;
  final IFormRepository _formRepository;

  String? photoUrl;
  String _ejcNumber = '';
  set setEjcNumber(String value) {
    _ejcNumber = value;
    notifyListeners();
  }

  get ejcNumber => _ejcNumber;

  FormViewModel({
    required IFormRepository formRepository,
  }) : _formRepository = formRepository {
    _init();
  }

  void updatePhoto(String photoData) {
    photoUrl = photoData;
    notifyListeners();
  }

  resetState() {
    _init();
  }

  void submitForm(FormEntity form) async {
    await _setState(const FormState.loading())
        .flatMap((_) => _formRepository //
            .submitForm(FormModel.fromEntity(form)))
        .fold(
          (_) => _setState(const FormState.success()),
          (error) => _setState(FormState.error(error.toString())),
        );
  }

  AsyncResult _init() async {
    return await _setState(const FormState.loading()) //
        .flatMap((value) => _formRepository.getTeams())
        .flatMap((value) => _setState(FormState.initial(value)));
  }

  AsyncResult<Unit> _setState(FormState state) async {
    _state = state;
    notifyListeners();
    return const Success(unit);
  }
}
