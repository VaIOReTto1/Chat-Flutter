/// 群组申请信息
class GroupApplicationInfo {
  /// 群组 ID
  String? groupID;

  /// 群组昵称
  String? groupName;

  /// 群组公告
  String? notification;

  /// 群组介绍
  String? introduction;

  /// 群组头像
  String? groupFaceURL;

  /// 群组创建时间
  int? createTime;

  /// 群组状态
  int? status;

  /// 创建者 ID
  String? creatorUserID;

  /// 群组类型
  int? groupType;

  /// 群主 ID
  String? ownerUserID;

  /// 成员数
  int? memberCount;

  /// 发起加入请求的用户 ID
  String? userID;

  /// 发起加入请求的用户昵称
  String? nickname;

  /// 发起加入请求的用户头像
  String? userFaceURL;

  /// 发起加入请求的用户性别
  int? gender;

  /// 处理结果：-1 - 拒绝，1 - 接受
  int? handleResult;

  /// 请求描述
  String? reqMsg;

  /// 处理结果描述
  String? handledMsg;

  /// 请求时间
  int? reqTime;

  /// 处理人 ID
  String? handleUserID;

  /// 处理时间
  int? handledTime;

  /// 扩展信息
  String? ex;

  /// 加入来源：2 - 被邀请，3 - 搜索，4 - 扫码
  int? joinSource;

  /// 邀请者用户 ID
  String? inviterUserID;

  GroupApplicationInfo({
    this.groupID,
    this.groupName,
    this.notification,
    this.introduction,
    this.groupFaceURL,
    this.createTime,
    this.status,
    this.creatorUserID,
    this.groupType,
    this.ownerUserID,
    this.memberCount,
    this.userID,
    this.nickname,
    this.userFaceURL,
    this.gender,
    this.handleResult,
    this.reqMsg,
    this.handledMsg,
    this.reqTime,
    this.handleUserID,
    this.handledTime,
    this.ex,
    this.inviterUserID,
    this.joinSource,
  });

  GroupApplicationInfo.fromJson(Map<String, dynamic> json) {
    groupID = json['groupID'];
    groupName = json['groupName'];
    notification = json['notification'];
    introduction = json['introduction'];
    groupFaceURL = json['groupFaceURL'];
    createTime = json['createTime'];
    status = json['status'];
    creatorUserID = json['creatorUserID'];
    groupType = json['groupType'];
    ownerUserID = json['ownerUserID'];
    memberCount = json['memberCount'];
    userID = json['userID'];
    nickname = json['nickname'];
    userFaceURL = json['userFaceURL'];
    gender = json['gender'];
    handleResult = json['handleResult'];
    reqMsg = json['reqMsg'];
    handledMsg = json['handledMsg'];
    reqTime = json['reqTime'];
    handleUserID = json['handleUserID'];
    handledTime = json['handledTime'];
    ex = json['ex'];
    inviterUserID = json['inviterUserID'];
    joinSource = json['joinSource'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupID'] = groupID;
    data['groupName'] = groupName;
    data['notification'] = notification;
    data['introduction'] = introduction;
    data['groupFaceURL'] = groupFaceURL;
    data['createTime'] = createTime;
    data['status'] = status;
    data['creatorUserID'] = creatorUserID;
    data['groupType'] = groupType;
    data['ownerUserID'] = ownerUserID;
    data['memberCount'] = memberCount;
    data['userID'] = userID;
    data['nickname'] = nickname;
    data['userFaceURL'] = userFaceURL;
    data['gender'] = gender;
    data['handleResult'] = handleResult;
    data['reqMsg'] = reqMsg;
    data['handledMsg'] = handledMsg;
    data['reqTime'] = reqTime;
    data['handleUserID'] = handleUserID;
    data['handledTime'] = handledTime;
    data['ex'] = ex;
    data['inviterUserID'] = inviterUserID;
    data['joinSource'] = joinSource;
    return data;
  }
}