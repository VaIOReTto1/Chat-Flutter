import 'package:flutter/services.dart';

import '../../models/search/search_friends_info.dart';
import '../../models/update_friends_req.dart';
import '../../models/user/black_list_info.dart';
import '../../models/user/friend_appliction_info.dart';
import '../../models/user/friend_info.dart';
import '../../models/user/friend_ship_info.dart';
import '../../utils/utils.dart';
import '../listener/friendship_listener.dart';

/// 好友关系管理器
class FriendshipManager {
  final MethodChannel _channel;
  late OnFriendshipListener listener;

  FriendshipManager(this._channel);

  /// 设置好友关系监听器
  Future setFriendshipListener(OnFriendshipListener listener) {
    this.listener = listener;
    return _channel.invokeMethod(
      'setFriendListener',
      _buildParam({}),
    );
  }

  /// 查询好友信息列表
  /// [userIDList] 用户 ID 列表
  /// [filterBlack] 是否过滤黑名单中的好友
  Future<List<FriendInfo>> getFriendsInfo({
    required List<String> userIDList,
    bool filterBlack = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getFriendsInfo',
        _buildParam({
          'userIDList': userIDList,
          'filterBlack': filterBlack,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)),
      );

  /// 发送好友申请
  /// [userID] 要添加的用户 ID
  /// [reason] 申请说明
  Future<dynamic> addFriend({
    required String userID,
    String? reason,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'addFriend',
        _buildParam({
          'toUserID': userID,
          'reqMsg': reason,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取我收到的好友申请列表
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsRecipient({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getFriendApplicationListAsRecipient',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) =>
            Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)),
      );

  /// 获取我发出的好友申请列表
  Future<List<FriendApplicationInfo>> getFriendApplicationListAsApplicant({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getFriendApplicationListAsApplicant',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) =>
            Utils.toList(value, (v) => FriendApplicationInfo.fromJson(v)),
      );

  /// 获取好友列表（可包含黑名单好友）
  /// [filterBlack] 是否过滤黑名单中的好友
  Future<List<FriendInfo>> getFriendList({
    String? operationID,
    bool filterBlack = false,
  }) =>
      _channel
          .invokeMethod(
        'getFriendList',
        _buildParam({
          'filterBlack': filterBlack,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)),
      );

  /// 分页获取好友列表
  Future<List<FriendInfo>> getFriendListPage({
    bool filterBlack = false,
    int offset = 0,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getFriendListPage',
        _buildParam({
          'offset': offset,
          'count': count,
          'filterBlack': filterBlack,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) => Utils.toList(value, (v) => FriendInfo.fromJson(v)),
      );

  /// 设置好友备注（已废弃，使用 updateFriends）
  @Deprecated('Use [updateFriends] instead')
  Future<dynamic> setFriendRemark({
    required String userID,
    required String remark,
    String? operationID,
  }) {
    final req = UpdateFriendsReq(friendUserIDs: [userID], remark: remark);
    return updateFriends(req, operationID: operationID);
  }

  /// 添加到黑名单
  Future<dynamic> addBlacklist({
    required String userID,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'addBlacklist',
        _buildParam({
          'userID': userID,
          'ex': ex,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取黑名单列表
  Future<List<BlacklistInfo>> getBlacklist({String? operationID}) =>
      _channel
          .invokeMethod(
        'getBlacklist',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) => Utils.toList(value, (v) => BlacklistInfo.fromJson(v)),
      );

  /// 从黑名单移除
  Future<dynamic> removeBlacklist({
    required String userID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'removeBlacklist',
        _buildParam({
          'userID': userID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 检查好友关系
  /// [userIDList] 用户 ID 列表
  Future<List<FriendshipInfo>> checkFriend({
    required List<String> userIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'checkFriend',
        _buildParam({
          'userIDList': userIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then(
            (value) =>
            Utils.toList(value, (v) => FriendshipInfo.fromJson(v)),
      );

  /// 删除好友
  Future<dynamic> deleteFriend({
    required String userID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'deleteFriend',
        _buildParam({
          'userID': userID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 接受好友申请
  Future<dynamic> acceptFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'acceptFriendApplication',
        _buildParam({
          'toUserID': userID,
          'handleMsg': handleMsg,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 拒绝好友申请
  Future<dynamic> refuseFriendApplication({
    required String userID,
    String? handleMsg,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'refuseFriendApplication',
        _buildParam({
          'toUserID': userID,
          'handleMsg': handleMsg,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 搜索好友
  Future<List<SearchFriendsInfo>> searchFriends({
    List<String> keywordList = const [],
    bool isSearchUserID = false,
    bool isSearchNickname = false,
    bool isSearchRemark = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'searchFriends',
        _buildParam({
          'searchParam': {
            'keywordList': keywordList,
            'isSearchUserID': isSearchUserID,
            'isSearchNickname': isSearchNickname,
            'isSearchRemark': isSearchRemark,
          },
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => SearchFriendsInfo.fromJson(map)));

  @Deprecated('Use [updateFriends] instead')
  Future setFriendsEx(
      List<String> friendIDs, {
        String? ex,
        String? operationID,
      }) {
    final req = UpdateFriendsReq(friendUserIDs: friendIDs, ex: ex);
    return updateFriends(req, operationID: operationID);
  }

  /// 更新好友信息（备注/置顶等）
  Future<dynamic> updateFriends(
      UpdateFriendsReq updateFriendsReq, {
        String? operationID,
      }) =>
      _channel
          .invokeMethod(
        'updateFriends',
        _buildParam({
          'req': updateFriendsReq.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => value);

  /// 构建调用参数，自动添加 ManagerName 并清理空值
  static Map _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'friendshipManager';
    return Utils.cleanMap(param);
  }
}
