import 'Message.dart';

/// 引用消息（回复某条消息）
class QuoteElem {
  /// 回复内容
  String? text;

  /// 被回复的消息
  Message? quoteMessage;

  QuoteElem({this.text, this.quoteMessage});

  QuoteElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    if (json['quoteMessage'] is Map) {
      quoteMessage = Message.fromJson(json['quoteMessage']);
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['quoteMessage'] = quoteMessage?.toJson();
    return data;
  }
}