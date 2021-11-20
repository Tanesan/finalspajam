class FolloweeModel {
  final String id;
  final String iconUrl;
  final String screenName;
  final String name;
  final String description;

  FolloweeModel(
      {required this.id,
      required this.iconUrl,
      required this.screenName,
      required this.name,
      required this.description});

  factory FolloweeModel.fromJson(Map<String, dynamic> json) {
    return FolloweeModel(
        id: json['id'],
        iconUrl: json['profile_image_url'],
        screenName: json['screen_name'],
        name: json['name'],
        description: json['description']);
  }
}
