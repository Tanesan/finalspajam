class TimelineRequest {
  final String id;

  TimelineRequest({
    required this.id,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
      };
}
