class FriendApplicationInfo {
  /// 发起人用户 ID
  String? fromUserID;

  /// 发起人用户昵称
  String? fromNickname;

  /// 发起人用户头像 URL
  String? fromFaceURL;

  /// 接收人用户 ID
  String? toUserID;

  /// 接收人用户昵称
  String? toNickname;

  /// 接收人用户头像 URL
  String? toFaceURL;

  /// 处理结果：
  /// 0：待处理
  /// 1：已同意
  /// -1：已拒绝
  int? handleResult;

  /// 请求消息
  String? reqMsg;

  /// 创建时间
  int? createTime;

  /// 处理人用户 ID
  String? handlerUserID;

  /// 处理备注
  String? handleMsg;

  /// 处理时间
  int? handleTime;

  /// 扩展字段
  String? ex;

  FriendApplicationInfo({
    this.fromUserID,
    this.fromNickname,
    this.fromFaceURL,
    this.toUserID,
    this.toNickname,
    this.toFaceURL,
    this.handleResult,
    this.reqMsg,
    this.createTime,
    this.handlerUserID,
    this.handleMsg,
    this.handleTime,
    this.ex,
  });

  FriendApplicationInfo.fromJson(Map<String, dynamic> json) {
    fromUserID = json['fromUserID'];
    fromNickname = json['fromNickname'];
    fromFaceURL = json['fromFaceURL'];
    toUserID = json['toUserID'];
    toNickname = json['toNickname'];
    toFaceURL = json['toFaceURL'];
    handleResult = json['handleResult'];
    reqMsg = json['reqMsg'];
    createTime = json['createTime'];
    handlerUserID = json['handlerUserID'];
    handleMsg = json['handleMsg'];
    handleTime = json['handleTime'];
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['fromUserID'] = fromUserID;
    data['fromNickname'] = fromNickname;
    data['fromFaceURL'] = fromFaceURL;
    data['toUserID'] = toUserID;
    data['toNickname'] = toNickname;
    data['toFaceURL'] = toFaceURL;
    data['handleResult'] = handleResult;
    data['reqMsg'] = reqMsg;
    data['createTime'] = createTime;
    data['handlerUserID'] = handlerUserID;
    data['handleMsg'] = handleMsg;
    data['handleTime'] = handleTime;
    data['ex'] = ex;
    return data;
  }

  /// 是否待处理
  bool get isWaitingHandle => handleResult == 0;

  /// 是否已同意
  bool get isAgreed => handleResult == 1;

  /// 是否已拒绝
  bool get isRejected => handleResult == -1;
}
