import 'package:flutter/services.dart';

import '../../models/user/public_user_info.dart';
import '../../models/user/user_info.dart';
import '../../models/user/user_status_info.dart';
import '../../utils/utils.dart';
import '../listener/user_listener.dart';

class UserManager {
  final MethodChannel _channel;
  late OnUserListener listener;

  UserManager(this._channel);

  /// 设置用户信息变更监听器
  Future setUserListener(OnUserListener listener) {
    this.listener = listener;
    return _channel.invokeMethod('setUserListener', _buildParam({}));
  }

  /// 获取用户信息
  /// [userIDList] 用户 ID 列表
  Future<List<PublicUserInfo>> getUsersInfo({
    required List<String> userIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getUsersInfo',
        _buildParam({
          'userIDList': userIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (v) => PublicUserInfo.fromJson(v)));

  /// 获取当前登录用户信息
  Future<UserInfo> getSelfUserInfo({
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getSelfUserInfo',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toObj(value, (map) => UserInfo.fromJson(map)));

  /// 修改当前登录用户资料
  /// [nickname] 昵称
  /// [faceURL] 头像 URL
  /// [globalRecvMsgOpt] 全局消息接收选项
  /// [ex] 扩展字段
  Future<String?> setSelfInfo({
    String? nickname,
    String? faceURL,
    int? globalRecvMsgOpt,
    String? ex,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'setSelfInfo',
        _buildParam({
          'nickname': nickname,
          'faceURL': faceURL,
          'globalRecvMsgOpt': globalRecvMsgOpt,
          'ex': ex,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 订阅用户状态
  /// [userIDs] 用户 ID 列表
  Future<List<UserStatusInfo>> subscribeUsersStatus(
      List<String> userIDs, {
        String? operationID,
      }) {
    return _channel
        .invokeMethod(
      'subscribeUsersStatus',
      _buildParam({
        'userIDs': userIDs,
        'operationID': Utils.checkOperationID(operationID),
      }),
    )
        .then(
            (value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  /// 取消订阅用户状态
  /// [userIDs] 用户 ID 列表
  Future unsubscribeUsersStatus(
      List<String> userIDs, {
        String? operationID,
      }) {
    return _channel.invokeMethod(
      'unsubscribeUsersStatus',
      _buildParam({
        'userIDs': userIDs,
        'operationID': Utils.checkOperationID(operationID),
      }),
    );
  }

  /// 获取已订阅用户状态列表
  Future<List<UserStatusInfo>> getSubscribeUsersStatus({
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
      'getSubscribeUsersStatus',
      _buildParam({
        'operationID': Utils.checkOperationID(operationID),
      }),
    )
        .then(
            (value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  /// 获取指定用户的当前状态
  /// [userIDs] 用户 ID 列表
  Future<List<UserStatusInfo>> getUserStatus(
      List<String> userIDs, {
        String? operationID,
      }) {
    return _channel
        .invokeMethod(
      'getUserStatus',
      _buildParam({
        'userIDs': userIDs,
        'operationID': Utils.checkOperationID(operationID),
      }),
    )
        .then(
            (value) => Utils.toList(value, (map) => UserStatusInfo.fromJson(map)));
  }

  @Deprecated('请使用 [getUsersInfo] 代替')
  Future<List<PublicUserInfo>> getUsersInfoWithCache(
      List<String> userIDs, {
        String? operationID,
      }) {
    return getUsersInfo(userIDList: userIDs, operationID: operationID);
  }

  /// 全局消息免打扰
  /// [status] 0：正常；1：不接收任何消息；2：仅接收在线消息，不接收离线消息
  @Deprecated('请使用 [setSelfInfo] 代替')
  Future<dynamic> setGlobalRecvMessageOpt({
    required int status,
    String? operationID,
  }) {
    return setSelfInfo(globalRecvMsgOpt: status);
  }

  static Map<String, dynamic> _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'userManager';
    return Utils.cleanMap(param);
  }
}
