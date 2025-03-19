import 'package:form_ejc/domain/entities/teams_entity.dart';

class TeamsModel extends TeamsEntity {
  TeamsModel({
    required super.name,
  });

  factory TeamsModel.fromEntity(TeamsEntity entity) => TeamsModel(
        name: entity.name,
      );

  factory TeamsModel.fromJson(Map<String, dynamic> json) =>
  TeamsModel(
        name: json['name'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
      };
}
