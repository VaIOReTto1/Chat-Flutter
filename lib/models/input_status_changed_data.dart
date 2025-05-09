class InputStatusChangedData {
  /// 用户 ID
  final String userID;

  /// 会话 ID
  final String conversationID;

  /// 平台 ID 列表
  final List<int>? platformIDs;

  InputStatusChangedData({
    required this.userID,
    required this.conversationID,
    this.platformIDs,
  });

  InputStatusChangedData.fromJson(Map<String, dynamic> json)
      : userID = json['userID'],
        conversationID = json['conversationID'],
        platformIDs = List<int>.from(json['platformIDs'] ?? []);

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userID'] = userID;
    data['conversationID'] = conversationID;
    data['platformIDs'] = platformIDs;
    return data;
  }
}