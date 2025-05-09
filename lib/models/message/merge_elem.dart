import 'Message.dart';

/// 合并消息体
class MergeElem {
  /// 标题
  String? title;

  /// 摘要列表
  List<String>? abstractList;

  /// 需要合并的具体消息列表
  List<Message>? multiMessage;

  MergeElem({this.title, this.abstractList, this.multiMessage});

  MergeElem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['abstractList'] is List) {
      abstractList = (json['abstractList'] as List).cast<String>();
    }
    if (json['multiMessage'] is List) {
      multiMessage = (json['multiMessage'] as List)
          .map((e) => Message.fromJson(e))
          .toList();
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['abstractList'] = abstractList;
    data['multiMessage'] =
        multiMessage?.map((e) => e.toJson()).toList();
    return data;
  }
}