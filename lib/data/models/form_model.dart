import '../../domain/entities/form_entity.dart';

class FormModel extends FormEntity {
  FormModel({
    required super.name,
    super.photo,
    required super.circle,
    required super.ejcNumber,
    required super.skills,
    required super.teams,
    required super.phones,
    required super.aniversario,
  });

  factory FormModel.fromEntity(FormEntity entity) => FormModel(
        name: entity.name,
        photo: entity.photo,
        circle: entity.circle,
        ejcNumber: entity.ejcNumber,
        skills: entity.skills,
        teams: entity.teams,
        phones: entity.phones,
        aniversario: entity.aniversario,
      );

  factory FormModel.fromJson(Map<String, dynamic> json) => FormModel(
        name: json['nome'],
        photo: json['foto'],
        circle: json['circulo'],
        ejcNumber: json['ejc_fez'],
        aniversario: json['aniversario'],
        skills: List<String>.from(json['aptidoes']),
        teams: List<TeamParticipation>.from(
          json['equipes'].map((x) => TeamParticipation(
                encontro: x['encontro'],
                team: x['equipe'],
                isCoordinator: x['is_coordinator'],
              )),
        ),
        phones: List<String>.from(json['telefones']),
      );

  Map<String, dynamic> toJson() => {
        'nome': name,
        'foto': photo,
        'circulo': circle,
        'ejc_fez': ejcNumber,
        'aptidoes': skills,
        'aniversario': aniversario.toIso8601String(),

        // 'user_teams': teams
        //     .map((x) => {
        //           'encontro': x.encontro,
        //           'equipe': x.team,
        //           'is_coordinator': x.isCoordinator,
        //         })
        //     .toList(),

        'telefones': phones,
      };
}

class TeamParticipationModel extends TeamParticipation {
  TeamParticipationModel({
    required super.encontro,
    required super.team,
    required super.isCoordinator,
  });

  factory TeamParticipationModel.fromEntity(TeamParticipation entity) =>
      TeamParticipationModel(
        encontro: entity.encontro,
        team: entity.team,
        isCoordinator: entity.isCoordinator,
      );

  factory TeamParticipationModel.fromJson(Map<String, dynamic> json) =>
      TeamParticipationModel(
        encontro: json['encontro'],
        team: json['equipe'],
        isCoordinator: json['is_coordinator'],
      );

  Map<String, dynamic> toJson() => {
        'encontro': encontro,
        'equipe': team,
        'is_coordinator': isCoordinator,
      };
}
