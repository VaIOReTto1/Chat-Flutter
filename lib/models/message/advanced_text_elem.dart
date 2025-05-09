import 'message_entity.dart';

/// 富文本消息内容
class AdvancedTextElem {
  String? text;
  List<MessageEntity>? messageEntityList;

  AdvancedTextElem({this.text, this.messageEntityList});

  AdvancedTextElem.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    messageEntityList = json['messageEntityList'] == null ? null : (json['messageEntityList'] as List).map((e) => MessageEntity.fromJson(e)).toList();
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['text'] = text;
    data['messageEntityList'] = messageEntityList?.map((e) => e.toJson()).toList();
    return data;
  }
}