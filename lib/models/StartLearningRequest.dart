class StartLearningRequest {
  final int id;
  StartLearningRequest({
    required this.id,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
  };
}