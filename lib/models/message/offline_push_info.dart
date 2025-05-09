/// 离线推送信息
class OfflinePushInfo {
  /// 通知标题
  String? title;

  /// 通知描述
  String? desc;

  /// 扩展内容
  String? ex;

  /// iOS 特有：推送声音
  String? iOSPushSound;

  /// iOS 特有：是否显示角标
  bool? iOSBadgeCount;

  OfflinePushInfo({
    this.title,
    this.desc,
    this.ex,
    this.iOSPushSound,
    this.iOSBadgeCount,
  });

  OfflinePushInfo.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    desc = json['desc'];
    ex = json['ex'];
    iOSPushSound = json['iOSPushSound'];
    iOSBadgeCount = json['iOSBadgeCount'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    data['desc'] = desc;
    data['ex'] = ex;
    data['iOSPushSound'] = iOSPushSound;
    data['iOSBadgeCount'] = iOSBadgeCount;
    return data;
  }
}