import 'package:http/http.dart' as http; //httpリクエスト用
import 'dart:async'; //非同期処理用
import 'dart:convert'; //httpレスポンスをJSON形式に変換用
import 'package:finalspajam/functions/getTimelines.dart';
import 'package:finalspajam/functions/getAds.dart';
import 'package:finalspajam/models/TimelineResponse.dart';
import 'package:finalspajam/models/TimelineAndAd.dart';
import 'package:finalspajam/models/AdResponse.dart';

Future<List<TimelineAndAd>> getTimelinesAndAds(String id) async {
  //Future xxx async{} という記法
  TimelineResponse timelines = await getTimelines(id);
  AdResponse ads = await getAds(id);
  List<TimelineAndAd> timelinesAndAds = [];
  for (int i = 0; i < timelines.timelines.length; i++) {
    timelinesAndAds.add(TimelineAndAd(
        timeline: timelines.timelines[i],
        ad: ads.ads[i ~/ 4 ~/ ads.ads.length]));
    if (i % 4 == 3) {
      timelinesAndAds.add(TimelineAndAd(
          timeline: timelines.timelines[i],
          ad: ads.ads[i ~/ 4 ~/ ads.ads.length]));
    }
  }
  return timelinesAndAds;
}
