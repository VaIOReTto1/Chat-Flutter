/// 群组消息已读信息
class GroupHasReadInfo {
  /// 已读人数
  int? hasReadCount;

  /// 未读人数
  int? unreadCount;

  GroupHasReadInfo.fromJson(Map<String, dynamic> json) {
    hasReadCount = json['hasReadCount'] ?? 0;
    unreadCount = json['unreadCount'] ?? 0;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['hasReadCount'] = hasReadCount;
    data['unreadCount'] = unreadCount;
    return data;
  }
}