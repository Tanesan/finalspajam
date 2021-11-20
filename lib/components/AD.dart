import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:finalspajam/models/TimelineModel.dart';
import 'package:finalspajam/functions/calculateElapsedTime.dart';

WebViewController? _controller; // WebVewコントローラー

class Ad extends StatelessWidget {
  final String html;
  Ad({required this.html});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: WebView(
        // onWebViewCreatedはWebViewが生成された時に行う処理を記述できます
        onWebViewCreated: (WebViewController webViewController) async {
          _controller = webViewController; // 生成されたWebViewController情報を取得する
          await _loadHtmlFromAssets(); // HTMLファイルのURL（ローカルファイルの情報）をControllerに追加する処理
        },
        javascriptMode: JavascriptMode.unrestricted,
      ),
    );
  }
  /// HTMLファイルを読み込む処理
  Future _loadHtmlFromAssets() async {
    //　HTMLファイルを読み込んでHTML要素を文字列で返す
    // String fileText = await rootBundle.loadString('assets/test.html');
    // <WebViewControllerのloadUrlメソッドにローカルファイルのURI情報を渡す>
    // WebViewControllerはWebViewウィジェットに情報を与えることができます。
    // <Uri.dataFromStringについて>
    // パラメータで指定されたエンコーディングまたは文字セット（指定されていないか認識されない場合はデフォルトでUS-ASCII）
    // を使用してコンテンツをバイトに変換し、結果のデータURIにバイトをエンコードします。
    _controller?.loadUrl( Uri.dataFromString(
        html, mimeType: 'text/html',
        encoding: Encoding.getByName('utf-8')
    ).toString());
  }
}
