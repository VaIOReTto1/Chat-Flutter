import 'dart:developer';

import 'package:flutter/services.dart';

import '../../models/group/group_application_info.dart';
import '../../models/group/group_info.dart';
import '../../models/group/group_invite_result.dart';
import '../../models/group/group_members_info.dart';
import '../../models/set_group_member_info.dart';
import '../../utils/utils.dart';
import '../listener/group_listener.dart';

/// 群组管理器
class GroupManager {
  final MethodChannel _channel;
  late OnGroupListener listener;

  GroupManager(this._channel);

  /// 设置群组关系监听器
  Future setGroupListener(OnGroupListener listener) {
    this.listener = listener;
    return _channel.invokeMethod(
      'setGroupListener',
      _buildParam({}),
    );
  }

  /// 邀请用户入群（无需审批）
  /// [groupID] 群组 ID
  /// [userIDList] 用户 ID 列表
  Future<List<GroupInviteResult>> inviteUserToGroup({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'inviteUserToGroup',
        _buildParam({
          'groupID': groupID,
          'userIDList': userIDList,
          'reason': reason,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupInviteResult.fromJson(map)));

  /// 踢出群成员
  /// [groupID] 群组 ID
  /// [userIDList] 用户 ID 列表
  /// [reason] 踢出原因
  Future kickGroupMember({
    required String groupID,
    required List<String> userIDList,
    String? reason,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'kickGroupMember',
        _buildParam({
          'groupID': groupID,
          'userIDList': userIDList,
          'reason': reason,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 查询群成员信息
  /// [groupID] 群组 ID
  /// [userIDList] 用户 ID 列表
  Future<List<GroupMembersInfo>> getGroupMembersInfo({
    required String groupID,
    required List<String> userIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupMembersInfo',
        _buildParam({
          'groupID': groupID,
          'userIDList': userIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 分页获取群成员列表
  /// [groupID] 群组 ID
  /// [filter] 成员筛选（0: 全部, 1: 群主, 2: 管理员, 3: 普通成员, 4: 管理员+普通成员, 5: 群主+管理员）
  /// [offset] 起始索引
  /// [count] 获取数量
  Future<List<GroupMembersInfo>> getGroupMemberList({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupMemberList',
        _buildParam({
          'groupID': groupID,
          'filter': filter,
          'offset': offset,
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 分页获取群成员列表（返回 Map）
  Future<List<dynamic>> getGroupMemberListMap({
    required String groupID,
    int filter = 0,
    int offset = 0,
    int count = 0,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupMemberList',
        _buildParam({
          'groupID': groupID,
          'filter': filter,
          'offset': offset,
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toListMap(value));

  /// 获取我加入的群列表
  Future<List<GroupInfo>> getJoinedGroupList({String? operationID}) =>
      _channel
          .invokeMethod(
        'getJoinedGroupList',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// 分页获取我加入的群列表
  Future<List<GroupInfo>> getJoinedGroupListPage({
    String? operationID,
    int offset = 0,
    int count = 40,
  }) =>
      _channel
          .invokeMethod(
        'getJoinedGroupListPage',
        _buildParam({
          'offset': offset,
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// 获取我加入的群列表（Map）
  Future<List<dynamic>> getJoinedGroupListMap({String? operationID}) =>
      _channel
          .invokeMethod(
        'getJoinedGroupList',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toListMap(value));

  /// 检查是否已加入群
  /// [groupID] 群组 ID
  Future<bool> isJoinedGroup({
    required String groupID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'isJoinGroup',
        _buildParam({
          'groupID': groupID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => value == 'true');

  /// 创建群组
  /// [groupInfo] 群组信息
  /// [memberUserIDs] 初始成员 ID 列表
  /// [adminUserIDs] 初始管理员 ID 列表
  /// [ownerUserID] 群主用户 ID
  Future<GroupInfo> createGroup({
    required GroupInfo groupInfo,
    List<String> memberUserIDs = const [],
    List<String> adminUserIDs = const [],
    String? ownerUserID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createGroup',
        _buildParam({
          'groupInfo': groupInfo.toJson(),
          'memberUserIDs': memberUserIDs,
          'adminUserIDs': adminUserIDs,
          'ownerUserID': ownerUserID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toObj(value, (map) => GroupInfo.fromJson(map)));

  /// 设置群组信息
  Future<dynamic> setGroupInfo(
      GroupInfo groupInfo, {
        String? operationID,
      }) =>
      _channel.invokeMethod(
        'setGroupInfo',
        _buildParam({
          'groupInfo': groupInfo.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 查询多个群信息
  Future<List<GroupInfo>> getGroupsInfo({
    required List<String> groupIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupsInfo',
        _buildParam({
          'groupIDList': groupIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// 申请加入群（需审批）
  /// [joinSource] 加入来源：2 邀请, 3 搜索, 4 扫码
  Future<dynamic> joinGroup({
    required String groupID,
    String? reason,
    String? operationID,
    int joinSource = 3,
    String? ex,
  }) =>
      _channel.invokeMethod(
        'joinGroup',
        _buildParam({
          'groupID': groupID,
          'reason': reason,
          'joinSource': joinSource,
          'ex': ex,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 退出群组
  Future<dynamic> quitGroup({
    required String groupID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'quitGroup',
        _buildParam({
          'groupID': groupID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 转移群主
  Future<dynamic> transferGroupOwner({
    required String groupID,
    required String userID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'transferGroupOwner',
        _buildParam({
          'groupID': groupID,
          'userID': userID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取群申请列表（作为接收者）
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsRecipient({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupApplicationListAsRecipient',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toList(
          value, (map) => GroupApplicationInfo.fromJson(map)));

  /// 获取群申请列表（作为申请者）
  Future<List<GroupApplicationInfo>> getGroupApplicationListAsApplicant({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupApplicationListAsApplicant',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toList(
          value, (map) => GroupApplicationInfo.fromJson(map)));

  /// 同意群申请
  Future<dynamic> acceptGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'acceptGroupApplication',
        _buildParam({
          'groupID': groupID,
          'userID': userID,
          'handleMsg': handleMsg,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 拒绝群申请
  Future<dynamic> refuseGroupApplication({
    required String groupID,
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'refuseGroupApplication',
        _buildParam({
          'groupID': groupID,
          'userID': userID,
          'handleMsg': handleMsg,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 解散群组
  Future<dynamic> dismissGroup({
    required String groupID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'dismissGroup',
        _buildParam({
          'groupID': groupID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 修改群组全体禁言状态
  Future<dynamic> changeGroupMute({
    required String groupID,
    required bool mute,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'changeGroupMute',
        _buildParam({
          'groupID': groupID,
          'mute': mute,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 禁言/取消禁言群成员
  /// [seconds] 禁言时长，0 则取消禁言
  Future<dynamic> changeGroupMemberMute({
    required String groupID,
    required String userID,
    int seconds = 0,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'changeGroupMemberMute',
        _buildParam({
          'groupID': groupID,
          'userID': userID,
          'seconds': seconds,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 设置群成员昵称（已废弃，使用 setGroupMemberInfo）
  @Deprecated('Use [setGroupMemberInfo] instead')
  Future<dynamic> setGroupMemberNickname({
    required String groupID,
    required String userID,
    String? groupNickname,
    String? operationID,
  }) {
    final req = SetGroupMemberInfo(
        groupID: groupID, userID: userID, nickname: groupNickname);
    return setGroupMemberInfo(groupMembersInfo: req, operationID: operationID);
  }

  /// 搜索群组
  Future<List<GroupInfo>> searchGroups({
    List<String> keywordList = const [],
    bool isSearchGroupID = false,
    bool isSearchGroupName = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'searchGroups',
        _buildParam({
          'searchParam': {
            'keywordList': keywordList,
            'isSearchGroupID': isSearchGroupID,
            'isSearchGroupName': isSearchGroupName,
          },
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupInfo.fromJson(map)));

  /// 设置群成员角色（已废弃，使用 setGroupMemberInfo）
  @Deprecated('Use [setGroupMemberInfo] instead')
  Future<dynamic> setGroupMemberRoleLevel({
    required String groupID,
    required String userID,
    required int roleLevel,
    String? operationID,
  }) {
    final req = SetGroupMemberInfo(
        groupID: groupID, userID: userID, roleLevel: roleLevel);
    return setGroupMemberInfo(groupMembersInfo: req, operationID: operationID);
  }

  /// 按加入时间分页获取群成员
  Future<List<GroupMembersInfo>> getGroupMemberListByJoinTime({
    required String groupID,
    int offset = 0,
    int count = 0,
    int joinTimeBegin = 0,
    int joinTimeEnd = 0,
    List<String> filterUserIDList = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupMemberListByJoinTimeFilter',
        _buildParam({
          'groupID': groupID,
          'offset': offset,
          'count': count,
          'joinTimeBegin': joinTimeBegin,
          'joinTimeEnd': joinTimeEnd,
          'excludeUserIDList': filterUserIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 设置群组验证方式（已废弃，使用 setGroupInfo）
  @Deprecated('Use [setGroupInfo] instead')
  Future<dynamic> setGroupVerification({
    required String groupID,
    required int needVerification,
    String? operationID,
  }) {
    final req = GroupInfo(groupID: groupID, needVerification: needVerification);
    return setGroupInfo(req, operationID: operationID);
  }

  /// 设置是否允许通过群聊查看成员信息（已废弃，使用 setGroupInfo）
  @Deprecated('Use [setGroupInfo] instead')
  Future<dynamic> setGroupLookMemberInfo({
    required String groupID,
    required int status,
    String? operationID,
  }) {
    final req = GroupInfo(groupID: groupID, lookMemberInfo: status);
    return setGroupInfo(req, operationID: operationID);
  }

  /// 设置是否允许通过群聊添加好友（已废弃，使用 setGroupInfo）
  @Deprecated('Use [setGroupInfo] instead')
  Future<dynamic> setGroupApplyMemberFriend({
    required String groupID,
    required int status,
    String? operationID,
  }) {
    final req = GroupInfo(groupID: groupID, applyMemberFriend: status);
    return setGroupInfo(req, operationID: operationID);
  }

  /// 获取群主和管理员列表
  Future<List<GroupMembersInfo>> getGroupOwnerAndAdmin({
    required String groupID,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getGroupMemberOwnerAndAdmin',
        _buildParam({
          'groupID': groupID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 搜索群成员
  Future<List<GroupMembersInfo>> searchGroupMembers({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'searchGroupMembers',
        _buildParam({
          'searchParam': {
            'groupID': groupID,
            'keywordList': keywordList,
            'isSearchUserID': isSearchUserID,
            'isSearchMemberNickname': isSearchMemberNickname,
            'offset': offset,
            'count': count,
          },
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => GroupMembersInfo.fromJson(map)));

  /// 搜索群成员列表（Map）
  Future<List<dynamic>> searchGroupMembersListMap({
    required String groupID,
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchMemberNickname = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'searchGroupMembers',
        _buildParam({
          'searchParam': {
            'groupID': groupID,
            'keywordList': keywordList,
            'isSearchUserID': isSearchUserID,
            'isSearchMemberNickname': isSearchMemberNickname,
            'offset': offset,
            'count': count,
          },
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toListMap(value));

  /// 设置群成员信息 ex 字段
  Future<dynamic> setGroupMemberInfo({
    required SetGroupMemberInfo groupMembersInfo,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'setGroupMemberInfo',
        _buildParam({
          'info': groupMembersInfo.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取群内指定用户信息
  Future<dynamic> getUsersInGroup(
      String groupID,
      List<String> userIDs, {
        String? operationID,
      }) =>
      _channel.invokeMethod(
        'getUsersInGroup',
        _buildParam({
          'groupID': groupID,
          'userIDs': userIDs,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 构建调用参数，自动添加 ManagerName 并清理空值
  static Map _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'groupManager';
    param = Utils.cleanMap(param);
    log('param: $param');
    return param;
  }
}
