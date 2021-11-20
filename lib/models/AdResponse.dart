import 'package:finalspajam/models/AdModel.dart';

class AdResponse {
  final List<AdModel> ads;

  AdResponse({required this.ads});

  factory AdResponse.fromJson(List<dynamic> json) {
    List<AdModel> data =
        json.map((item) => AdModel.fromJson(item)).toList();
    return AdResponse(ads: data);
  }
}
