import 'package:finalspajam/models/TimelineModel.dart';

class TimelineResponse {
  final List<TimelineModel> timelines;

  TimelineResponse({required this.timelines});

  factory TimelineResponse.fromJson(Map<String, dynamic> json) {
    var timelines = json['timelines'] as List;
    return TimelineResponse(
        timelines: timelines
            .map<TimelineModel>((item) {
              print("hoge");
              print(TimelineModel.fromJson(item));
              return TimelineModel.fromJson(item);})
            .toList());
  }
}
