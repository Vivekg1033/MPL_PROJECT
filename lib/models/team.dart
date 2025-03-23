class Team {
  final String id;
  final String name;
  final String sport;
  final String creatorId;
  final List<String> members;

  Team({
    required this.id,
    required this.name,
    required this.sport,
    required this.creatorId,
    required this.members,
  });

  factory Team.fromMap(Map<String, dynamic> map) {
    return Team(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      sport: map['sport'] ?? '',
      creatorId: map['creatorId'] ?? '',
      members: List<String>.from(map['members'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'sport': sport,
      'creatorId': creatorId,
      'members': members,
    };
  }
}
