class AdModel {
  final String html;

  AdModel({
    required this.html,
  });

  factory AdModel.fromJson(Map<String, dynamic> json) {
    return AdModel(
        html: json['html']
    );
  }
}