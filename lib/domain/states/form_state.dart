import 'package:form_ejc/data/models/teams_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';



part 'form_state.freezed.dart';

@freezed
class FormState with _$FormState {
  const factory FormState.initial(List<TeamsModel> teams) = Initial;
  const factory FormState.loading() = FormLoading;
  const factory FormState.success() = FormSuccess;
  const factory FormState.error(String message) = FormError;
}
