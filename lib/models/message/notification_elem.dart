/// 通知消息内容
class NotificationElem {
  /// 详情
  String? detail;

  /// 默认提示
  String? defaultTips;

  NotificationElem({this.detail, this.defaultTips});

  NotificationElem.fromJson(Map<String, dynamic> json) {
    detail = json['detail'];
    defaultTips = json['defaultTips'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['detail'] = detail;
    data['defaultTips'] = defaultTips;
    return data;
  }
}