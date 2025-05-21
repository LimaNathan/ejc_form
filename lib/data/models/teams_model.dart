import 'package:form_ejc/domain/entities/teams_entity.dart';

class TeamsModel extends TeamsEntity {
  TeamsModel({
    super.uuid,
    required super.name,
  });

  factory TeamsModel.fromEntity(TeamsEntity entity) => TeamsModel(
        name: entity.name,
        uuid: entity.uuid,
      );

  factory TeamsModel.fromJson(Map<String, dynamic> json) => TeamsModel(
        name: json['name'],
        uuid: json['id'],
      );

  Map<String, dynamic> toJson() => {
        'name': name,
        'uuid': uuid,
      };
}
