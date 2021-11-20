import 'package:finalspajam/models/FolloweeModel.dart';

class FolloweeResponse {
  final List<FolloweeModel> followees;

  FolloweeResponse({required this.followees});

  factory FolloweeResponse.fromJson(List<dynamic> json) {
    List<FolloweeModel> data =
        json.map((item) => FolloweeModel.fromJson(item)).toList();
    return FolloweeResponse(followees: data);
  }
}
