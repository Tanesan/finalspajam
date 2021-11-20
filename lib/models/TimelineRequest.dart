class TimelineRequest {
  final int id;
  final String name;
  TimelineRequest({
    required this.id,
    required this.name,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
    'name': name,
  };
}