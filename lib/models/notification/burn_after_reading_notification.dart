/// 阅读后焚毁通知
class BurnAfterReadingNotification {
  /// 接收者
  String? recvID;

  /// 发送者
  String? sendID;

  /// 是否启用
  bool? isPrivate;

  BurnAfterReadingNotification({this.recvID, this.sendID, this.isPrivate});

  BurnAfterReadingNotification.fromJson(Map<String, dynamic> json) {
    recvID = json['recvID'];
    sendID = json['sendID'];
    isPrivate = json['isPrivate'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['recvID'] = recvID;
    data['sendID'] = sendID;
    data['isPrivate'] = isPrivate;
    return data;
  }
}