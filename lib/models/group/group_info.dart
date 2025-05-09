import '../../enum/conversation_type.dart';
import '../../enum/group_type.dart';

/// 群组信息
class GroupInfo {
  /// 群组 ID
  String groupID;

  /// 群组名称
  String? groupName;

  /// 群组公告
  String? notification;

  /// 群组介绍
  String? introduction;

  /// 群组头像
  String? faceURL;

  /// 群主 ID
  String? ownerUserID;

  /// 创建时间
  int? createTime;

  /// 群组成员数
  int? memberCount;

  /// 群组状态：0 - 正常，1 - 被封禁，2 - 解散，3 - 静音
  int? status;

  /// 创建者 ID
  String? creatorUserID;

  /// 群组类型 [GroupType]
  int? groupType;

  /// 扩展信息
  String? ex;

  /// 入群验证方式 [GroupVerification]
  int? needVerification;

  /// 是否允许通过群聊查看成员信息：0 - 禁用，1 - 启用
  int? lookMemberInfo;

  /// 是否允许通过群聊添加好友：0 - 禁用，1 - 启用
  int? applyMemberFriend;

  /// 公告更新时间
  int? notificationUpdateTime;

  /// 公告发布者 ID
  String? notificationUserID;

  GroupInfo({
    required this.groupID,
    this.groupName,
    this.notification,
    this.introduction,
    this.faceURL,
    this.ownerUserID,
    this.createTime,
    this.memberCount,
    this.status,
    this.creatorUserID,
    this.groupType,
    this.ex,
    this.needVerification,
    this.lookMemberInfo,
    this.applyMemberFriend,
    this.notificationUpdateTime,
    this.notificationUserID,
  });

  GroupInfo.fromJson(Map<String, dynamic> json) : groupID = json['groupID'] {
    groupName = json['groupName'];
    notification = json['notification'];
    introduction = json['introduction'];
    faceURL = json['faceURL'];
    ownerUserID = json['ownerUserID'];
    createTime = json['createTime'];
    memberCount = json['memberCount'];
    status = json['status'];
    creatorUserID = json['creatorUserID'];
    groupType = json['groupType'];
    ex = json['ex'];
    needVerification = json['needVerification'];
    lookMemberInfo = json['lookMemberInfo'];
    applyMemberFriend = json['applyMemberFriend'];
    notificationUpdateTime = json['notificationUpdateTime'];
    notificationUserID = json['notificationUserID'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['groupID'] = groupID;
    data['groupName'] = groupName;
    data['notification'] = notification;
    data['introduction'] = introduction;
    data['faceURL'] = faceURL;
    data['ownerUserID'] = ownerUserID;
    data['createTime'] = createTime;
    data['memberCount'] = memberCount;
    data['status'] = status;
    data['creatorUserID'] = creatorUserID;
    data['groupType'] = groupType;
    data['ex'] = ex;
    data['needVerification'] = needVerification;
    data['lookMemberInfo'] = lookMemberInfo;
    data['applyMemberFriend'] = applyMemberFriend;
    data['notificationUpdateTime'] = notificationUpdateTime;
    data['notificationUserID'] = notificationUserID;
    return data;
  }

  /// 群组类型对应的会话类型
  int get sessionType => ConversationType.superGroup;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is GroupInfo && runtimeType == other.runtimeType && groupID == other.groupID;

  @override
  int get hashCode => groupID.hashCode;
}