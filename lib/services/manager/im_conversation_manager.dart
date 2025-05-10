import 'package:flutter/services.dart';
import 'dart:async';
import 'dart:developer';

import '../../models/conversation_info.dart';
import '../../models/conversation_req.dart';
import '../../utils/utils.dart';
import '../listener/conversation_listener.dart';

/// 会话管理器
class ConversationManager {
  final MethodChannel _channel;
  late OnConversationListener listener;

  ConversationManager(this._channel);

  /// 设置会话监听器
  Future setConversationListener(OnConversationListener listener) {
    this.listener = listener;
    return _channel.invokeMethod(
      'setConversationListener',
      _buildParam({}),
    );
  }

  /// 获取所有会话列表
  Future<List<ConversationInfo>> getAllConversationList({String? operationID}) =>
      _channel
          .invokeMethod(
        'getAllConversationList',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// 分页获取会话列表
  /// [offset] 起始索引
  /// [count] 每页数量
  Future<List<ConversationInfo>> getConversationListSplit({
    int offset = 0,
    int count = 20,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getConversationListSplit',
        _buildParam({
          'offset': offset,
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// 查询或创建单个会话
  /// [sourceID] 单聊为用户ID，群聊为群组ID
  /// [sessionType] 会话类型，参考 ConversationType
  Future<ConversationInfo> getOneConversation({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getOneConversation',
        _buildParam({
          'sourceID': sourceID,
          'sessionType': sessionType,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toObj(value, (map) => ConversationInfo.fromJson(map)));

  /// 根据会话ID列表批量获取会话
  Future<List<ConversationInfo>> getMultipleConversation({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getMultipleConversation',
        _buildParam({
          'conversationIDList': conversationIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// 设置会话草稿
  /// [conversationID] 会话ID
  /// [draftText] 草稿内容
  Future setConversationDraft({
    required String conversationID,
    required String draftText,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'setConversationDraft',
        _buildParam({
          'conversationID': conversationID,
          'draftText': draftText,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 置顶/取消置顶会话
  Future pinConversation({
    required String conversationID,
    required bool isPinned,
    String? operationID,
  }) {
    final req = ConversationReq(isPinned: isPinned);
    return setConversation(conversationID, req, operationID: operationID);
  }

  /// 隐藏指定会话
  Future hideConversation({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'hideConversation',
        _buildParam({
          'conversationID': conversationID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 隐藏所有会话
  Future hideAllConversations({String? operationID}) =>
      _channel.invokeMethod(
        'hideAllConversations',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 根据 sourceID 和 sessionType 查询会话 ID
  Future<dynamic> getConversationIDBySessionType({
    required String sourceID,
    required int sessionType,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'getConversationIDBySessionType',
        _buildParam({
          'sourceID': sourceID,
          'sessionType': sessionType,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取未读消息总数
  Future<dynamic> getTotalUnreadMsgCount({String? operationID}) =>
      _channel.invokeMethod(
        'getTotalUnreadMsgCount',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取会话消息免打扰设置列表
  Future<List<dynamic>> getConversationRecvMessageOpt({
    required List<String> conversationIDList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'getConversationRecvMessageOpt',
        _buildParam({
          'conversationIDList': conversationIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toListMap(value));

  /// 本地和服务器上删除会话及消息
  Future<dynamic> deleteConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'deleteConversationAndDeleteAllMsg',
        _buildParam({
          'conversationID': conversationID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 清空会话消息
  Future<dynamic> clearConversationAndDeleteAllMsg({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'clearConversationAndDeleteAllMsg',
        _buildParam({
          'conversationID': conversationID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 重置 @ 提及状态（等价于 groupAtType=0）
  Future<dynamic> resetConversationGroupAtType({
    required String conversationID,
    String? operationID,
  }) {
    final req = ConversationReq(groupAtType: 0);
    return setConversation(conversationID, req, operationID: operationID);
  }

  /// 查询 @ 全员 标签
  Future<dynamic> getAtAllTag({String? operationID}) =>
      _channel.invokeMethod(
        'getAtAllTag',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 全局 @ 全员 标识符
  String get atAllTag => 'AtAllTag';

  /// 标记会话消息为已读
  Future markConversationMessageAsRead({
    required String conversationID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'markConversationMessageAsRead',
        _buildParam({
          'conversationID': conversationID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 按名称搜索会话
  Future<List<ConversationInfo>> searchConversations(
      String name, {
        String? operationID,
      }) =>
      _channel
          .invokeMethod(
        'searchConversations',
        _buildParam({
          'name': name,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) =>
          Utils.toList(value, (map) => ConversationInfo.fromJson(map)));

  /// 简单排序会话列表：先置顶，再按最新消息或草稿时间倒序
  List<ConversationInfo> simpleSort(List<ConversationInfo> list) => list
    ..sort((a, b) {
      final aPinned = a.isPinned == true;
      final bPinned = b.isPinned == true;
      if (aPinned == bPinned) {
        final aTime = (a.draftTextTime! > a.latestMsgSendTime!)
            ? a.draftTextTime!
            : a.latestMsgSendTime!;
        final bTime = (b.draftTextTime! > b.latestMsgSendTime!)
            ? b.draftTextTime!
            : b.latestMsgSendTime!;
        return bTime.compareTo(aTime);
      }
      return aPinned ? -1 : 1;
    });

  /// 改变输入框焦点状态
  Future changeInputStates({
    required String conversationID,
    required bool focus,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'changeInputStates',
        _buildParam({
          'conversationID': conversationID,
          'focus': focus,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取对方输入状态列表
  Future<List<int>?> getInputStates(
      String conversationID,
      String userID, {
        String? operationID,
      }) =>
      _channel
          .invokeMethod(
        'getInputStates',
        _buildParam({
          'conversationID': conversationID,
          'userID': userID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) {
        log('getInputStates: \$value');
        return List<int>.from(Utils.toListMap(value));
      });

  /// 通用设置会话属性
  Future setConversation(
      String conversationID,
      ConversationReq req, {
        String? operationID,
      }) =>
      _channel.invokeMethod(
        'setConversation',
        _buildParam({
          'conversationID': conversationID,
          'req': req.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 构建 MethodChannel 参数，自动添加 ManagerName 并清理空值
  static Map _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'conversationManager';
    return Utils.cleanMap(param);
  }
}
