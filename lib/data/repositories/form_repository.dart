import 'package:form_ejc/data/models/form_model.dart';
import 'package:form_ejc/data/models/teams_model.dart';
import 'package:form_ejc/domain/repositories/i_form_repository.dart';
import 'package:result_dart/result_dart.dart';
import 'package:supabase/supabase.dart';

class FormRepository implements IFormRepository {
  final SupabaseClient _supabaseClient;

  FormRepository({required SupabaseClient supabaseClient})
      : _supabaseClient = supabaseClient;
  @override
  AsyncResult<List<TeamsModel>> getTeams() async {
    try {
      final response = await _supabaseClient.from('teams').select();

      return Success(response //
          .map((e) => TeamsModel.fromJson(e))
          .toList());
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }

  @override
  AsyncResult<Unit> submitForm(FormModel user) async {
    try {
      final result = await _supabaseClient
          .from('users')
          .insert(user.toJson())
          .select()
          .single();

      if (user.teams.isNotEmpty) {
        final teamData = user.teams
            .map((equipe) => {
                  'user_id': result['id'],
                  'encontro': equipe.encontro,
                  'equipe': equipe.team,
                })
            .toList();

        await _supabaseClient.from('user_teams').insert(teamData);
      }

      return const Success(unit);
    } catch (e) {
      return Failure(Exception(e.toString()));
    }
  }
}
