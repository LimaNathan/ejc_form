class FormEntity {
  String name;
  String? photo;
  String circle;
  DateTime aniversario;
  String ejcNumber;
  List<String> skills;
  List<TeamParticipation> teams;
  List<String> phones;

  FormEntity({
    required this.name,
    this.photo,
    required this.aniversario,
    required this.circle,
    required this.ejcNumber,
    required this.skills,
    required this.teams,
    required this.phones,
  });
}

class TeamParticipation {
  final String encontro;
  final String? team;
  final bool isCoordinator;

  TeamParticipation({
    required this.encontro,
    this.team,
    required this.isCoordinator,
  });
}
