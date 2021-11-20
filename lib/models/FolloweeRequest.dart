class FolloweeRequest {
  final String accessToken;
  final String secretAccessToken;
  final String userId;
  FolloweeRequest({
    required this.accessToken,
    required this.secretAccessToken,
    required this.userId
  });
  Map<String, dynamic> toJson() => {
    'access_token': accessToken,
    'secret_access_token': secretAccessToken,
    'user_id': userId
  };
}