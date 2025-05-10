import 'package:flutter/foundation.dart';

import '../../models/conversation_info.dart';
import '../../models/input_status_changed_data.dart';

/// 会话监听器
class OnConversationListener {
  /// 会话列表变更回调
  Function(List<ConversationInfo> list)? onConversationChanged;

  /// 新会话创建回调
  Function(List<ConversationInfo> list)? onNewConversation;

  /// 未读总消息数变更回调
  Function(int count)? onTotalUnreadMessageCountChanged;

  /// 开始从服务器同步回调，参数表示是否重装同步
  Function(bool? reinstalled)? onSyncServerStart;

  /// 从服务器同步进度回调
  Function(int? progress)? onSyncServerProgress;

  /// 完成从服务器同步回调，参数表示是否重装同步
  Function(bool? reinstalled)? onSyncServerFinish;

  /// 从服务器同步失败回调，参数表示是否重装同步
  Function(bool? reinstalled)? onSyncServerFailed;

  /// 输入状态变更回调
  ValueChanged<InputStatusChangedData>? onInputStatusChanged;

  OnConversationListener({
    this.onConversationChanged,
    this.onNewConversation,
    this.onTotalUnreadMessageCountChanged,
    this.onSyncServerStart,
    this.onSyncServerProgress,
    this.onSyncServerFinish,
    this.onSyncServerFailed,
    this.onInputStatusChanged,
  });

  /// 调用会话列表变更回调
  void conversationChanged(List<ConversationInfo> list) {
    onConversationChanged?.call(list);
  }

  /// 调用新会话创建回调
  void newConversation(List<ConversationInfo> list) {
    onNewConversation?.call(list);
  }

  /// 调用未读总消息数变更回调
  void totalUnreadMessageCountChanged(int count) {
    onTotalUnreadMessageCountChanged?.call(count);
  }

  /// 调用开始从服务器同步回调
  void syncServerStart(bool? reinstalled) {
    onSyncServerStart?.call(reinstalled);
  }

  /// 调用从服务器同步进度回调
  void syncServerProgress(int? progress) {
    onSyncServerProgress?.call(progress);
  }

  /// 调用同步失败回调
  void syncServerFailed(bool? reinstalled) {
    onSyncServerFailed?.call(reinstalled);
  }

  /// 调用同步完成回调
  void syncServerFinish(bool? reinstalled) {
    onSyncServerFinish?.call(reinstalled);
  }

  /// 调用输入状态变更回调
  void conversationUserInputStatusChanged(InputStatusChangedData data) {
    onInputStatusChanged?.call(data);
  }
}
