class AdRequest {
  final String id;
  AdRequest({
    required this.id,
  });
  Map<String, dynamic> toJson() => {
    'id': id,
  };
}