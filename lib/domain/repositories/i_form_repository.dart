import 'package:form_ejc/data/models/form_model.dart';
import 'package:result_dart/result_dart.dart';
import 'package:form_ejc/data/models/teams_model.dart';

abstract class IFormRepository {
  AsyncResult submitForm(FormModel form);
  AsyncResult<List<TeamsModel>> getTeams();
}
