import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:flutter/services.dart';

import '../../enum/listener_type.dart';
import '../../enum/login_status.dart';
import '../../models/conversation_info.dart';
import '../../models/group/group_application_info.dart';
import '../../models/group/group_info.dart';
import '../../models/group/group_members_info.dart';
import '../../models/init_config.dart';
import '../../models/input_status_changed_data.dart';
import '../../models/message/Message.dart';
import '../../models/message/read_receipt_info.dart';
import '../../models/message/revoked_info.dart';
import '../../models/user/black_list_info.dart';
import '../../models/user/friend_appliction_info.dart';
import '../../models/user/friend_info.dart';
import '../../models/user/user_info.dart';
import '../../models/user/user_status_info.dart';
import '../../utils/logger.dart';
import '../../utils/utils.dart';
import '../listener/connect_listener.dart';
import '../listener/listener_for_service.dart';
import '../listener/upload_file_listener.dart';
import 'im_conversation_manager.dart';
import 'im_friendship_manager.dart';
import 'im_group_manager.dart';
import 'im_message_manager.dart';
import 'im_user_manager.dart';

/// IM 管理器
class IMManager {
  final MethodChannel _channel;
  late ConversationManager conversationManager;
  late FriendshipManager friendshipManager;
  late MessageManager messageManager;
  late GroupManager groupManager;
  late UserManager userManager;

  late OnConnectListener _connectListener;
  OnListenerForService? _listenerForService;
  OnUploadFileListener? _uploadFileListener;
  OnUploadLogsListener? _uploadLogsListener;

  late String userID;
  late UserInfo userInfo;
  bool isLogined = false;
  String? token;

  IMManager(this._channel) {
    conversationManager = ConversationManager(_channel);
    friendshipManager = FriendshipManager(_channel);
    messageManager      = MessageManager(_channel);
    groupManager        = GroupManager(_channel);
    userManager         = UserManager(_channel);
    _addNativeCallback(_channel);
  }

  void _addNativeCallback(MethodChannel channel) {
    channel.setMethodCallHandler((call) async {
      try {
        Logger.log('Flutter 收到回调: ${call.method} ${call.arguments}');
        if (call.method == ListenerType.connectListener) {
          String type = call.arguments['type'];
          switch (type) {
            case 'onConnectFailed':
              int? errCode = call.arguments['errCode'];
              String? errMsg = call.arguments['errMsg'];
              _connectListener.connectFailed(errCode, errMsg);
              break;
            case 'onConnecting':
              _connectListener.connecting();
              break;
            case 'onConnectSuccess':
              _connectListener.connectSuccess();
              break;
            case 'onKickedOffline':
              _connectListener.kickedOffline();
              break;
            case 'onUserTokenExpired':
              _connectListener.userTokenExpired();
              break;
            case 'onUserTokenInvalid':
              _connectListener.userTokenInvalid();
              break;
          }
        } else if (call.method == ListenerType.userListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSelfInfoUpdated':
              userInfo = Utils.toObj(data, (map) => UserInfo.fromJson(map));
              userManager.listener.selfInfoUpdated(userInfo);
              break;
            case 'onUserStatusChanged':
              final status = Utils.toObj(data, (map) => UserStatusInfo.fromJson(map));
              userManager.listener.userStatusChanged(status);
              break;
          }
        } else if (call.method == ListenerType.groupListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onGroupApplicationAccepted':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationAccepted(i);
              break;
            case 'onGroupApplicationAdded':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationAdded(i);
              break;
            case 'onGroupApplicationDeleted':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationDeleted(i);
              break;
            case 'onGroupApplicationRejected':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              groupManager.listener.groupApplicationRejected(i);
              break;
            case 'onGroupDismissed':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.groupDismissed(i);
              break;
            case 'onGroupInfoChanged':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.groupInfoChanged(i);
              break;
            case 'onGroupMemberAdded':
              final i = Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberAdded(i);
              break;
            case 'onGroupMemberDeleted':
              final i = Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberDeleted(i);
              break;
            case 'onGroupMemberInfoChanged':
              final i = Utils.toObj(data, (map) => GroupMembersInfo.fromJson(map));
              groupManager.listener.groupMemberInfoChanged(i);
              break;
            case 'onJoinedGroupAdded':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.joinedGroupAdded(i);
              break;
            case 'onJoinedGroupDeleted':
              final i = Utils.toObj(data, (map) => GroupInfo.fromJson(map));
              groupManager.listener.joinedGroupDeleted(i);
              break;
          }
        } else if (call.method == ListenerType.advancedMsgListener) {
          var type = call.arguments['type'];
          // var id = call.arguments['data']['id'];
          switch (type) {
            case 'onMsgDeleted':
              var value = call.arguments['data']['message'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.msgListener.msgDeleted(msg);
              break;
            case 'onNewRecvMessageRevoked':
              var value = call.arguments['data']['messageRevoked'];
              var info = Utils.toObj(value, (map) => RevokedInfo.fromJson(map));
              messageManager.msgListener.newRecvMessageRevoked(info);
              break;
            case 'onRecvC2CReadReceipt':
              var value = call.arguments['data']['msgReceiptList'];
              var list = Utils.toList(value, (map) => ReadReceiptInfo.fromJson(map));
              messageManager.msgListener.recvC2CReadReceipt(list);
              break;
            case 'onRecvNewMessage':
              var value = call.arguments['data']['message'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.msgListener.recvNewMessage(msg);
              break;
            case 'onRecvOfflineNewMessage':
              var value = call.arguments['data']['message'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.msgListener.recvOfflineNewMessage(msg);
              break;
            case 'onRecvOnlineOnlyMessage':
              var value = call.arguments['data']['message'];
              final msg = Utils.toObj(value, (map) => Message.fromJson(map));
              messageManager.msgListener.recvOnlineOnlyMessage(msg);
              break;
          }
        } else if (call.method == ListenerType.msgSendProgressListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          String msgID = data['clientMsgID'] ?? '';
          int progress = data['progress'] ?? 100;
          switch (type) {
            case 'onProgress':
              messageManager.msgSendProgressListener?.progress(
                msgID,
                progress,
              );
              break;
          }
        } else if (call.method == ListenerType.conversationListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onSyncServerStart':
              print('dart onSyncServerStart: $data');
              conversationManager.listener.syncServerStart(data);
              break;
            case 'onSyncServerProgress':
              conversationManager.listener.syncServerProgress(data);
              break;
            case 'onSyncServerFinish':
              conversationManager.listener.syncServerFinish(data);
              break;
            case 'onSyncServerFailed':
              conversationManager.listener.syncServerFailed(data);
              break;
            case 'onNewConversation':
              var list = Utils.toList(data, (map) => ConversationInfo.fromJson(map));
              conversationManager.listener.newConversation(list);
              break;
            case 'onConversationChanged':
              var list = Utils.toList(data, (map) => ConversationInfo.fromJson(map));
              conversationManager.listener.conversationChanged(list);
              break;
            case 'onTotalUnreadMessageCountChanged':
              conversationManager.listener.totalUnreadMessageCountChanged(data ?? 0);
              break;
            case 'onConversationUserInputStatusChanged':
              final i = Utils.toObj(data, (map) => InputStatusChangedData.fromJson(map));
              conversationManager.listener.conversationUserInputStatusChanged(i);
              break;
          }
        } else if (call.method == ListenerType.friendListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];

          switch (type) {
            case 'onBlackAdded':
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.listener.blackAdded(u);
              break;
            case 'onBlackDeleted':
              final u = Utils.toObj(data, (map) => BlacklistInfo.fromJson(map));
              friendshipManager.listener.blackDeleted(u);
              break;
            case 'onFriendAdded':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendAdded(u);
              break;
            case 'onFriendApplicationAccepted':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationAccepted(u);
              break;
            case 'onFriendApplicationAdded':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationAdded(u);
              break;
            case 'onFriendApplicationDeleted':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationDeleted(u);
              break;
            case 'onFriendApplicationRejected':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              friendshipManager.listener.friendApplicationRejected(u);
              break;
            case 'onFriendDeleted':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendDeleted(u);
              break;
            case 'onFriendInfoChanged':
              final u = Utils.toObj(data, (map) => FriendInfo.fromJson(map));
              friendshipManager.listener.friendInfoChanged(u);
              break;
          }
        } else if (call.method == ListenerType.customBusinessListener) {
          String type = call.arguments['type'];
          String data = call.arguments['data'];
          switch (type) {
            case 'onRecvCustomBusinessMessage':
              messageManager.customBusinessListener?.recvCustomBusinessMessage(data);
              break;
          }
        } else if (call.method == ListenerType.listenerForService) {
          String type = call.arguments['type'];
          String data = call.arguments['data'];
          switch (type) {
            case 'onFriendApplicationAccepted':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              _listenerForService?.friendApplicationAccepted(u);
              break;
            case 'onFriendApplicationAdded':
              final u = Utils.toObj(data, (map) => FriendApplicationInfo.fromJson(map));
              _listenerForService?.friendApplicationAdded(u);
              break;
            case 'onGroupApplicationAccepted':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              _listenerForService?.groupApplicationAccepted(i);
              break;
            case 'onGroupApplicationAdded':
              final i = Utils.toObj(data, (map) => GroupApplicationInfo.fromJson(map));
              _listenerForService?.groupApplicationAdded(i);
              break;
            case 'onRecvNewMessage':
              final msg = Utils.toObj(data, (map) => Message.fromJson(map));
              _listenerForService?.recvNewMessage(msg);
              break;
          }
        } else if (call.method == ListenerType.uploadLogsListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'onProgress':
              int size = data['size'];
              int current = data['current'];
              _uploadLogsListener?.onProgress(current, size);
          }
        } else if (call.method == ListenerType.uploadFileListener) {
          String type = call.arguments['type'];
          dynamic data = call.arguments['data'];
          switch (type) {
            case 'complete':
              String id = data['id'];
              int size = data['size'];
              String url = data['url'];
              int type = data['type'];
              _uploadFileListener?.complete(id, size, url, type);
              break;
            case 'hashPartComplete':
              String id = data['id'];
              String partHash = data['partHash'];
              String fileHash = data['fileHash'];
              _uploadFileListener?.hashPartComplete(id, partHash, fileHash);
              break;
            case 'hashPartProgress':
              String id = data['id'];
              int index = data['index'];
              int size = data['size'];
              String partHash = data['partHash'];
              _uploadFileListener?.hashPartProgress(id, index, size, partHash);
              break;
            case 'open':
              String id = data['id'];
              int size = data['size'];
              _uploadFileListener?.open(id, size);
              break;
            case 'partSize':
              String id = data['id'];
              int partSize = data['partSize'];
              int num = data['num'];
              _uploadFileListener?.partSize(id, partSize, num);
              break;
            case 'uploadProgress':
              String id = data['id'];
              int fileSize = data['fileSize'];
              int streamSize = data['streamSize'];
              int storageSize = data['storageSize'];
              _uploadFileListener?.uploadProgress(id, fileSize, streamSize, storageSize);
              break;
            case 'uploadID':
              String id = data['id'];
              String uploadID = data['uploadID'];
              _uploadFileListener?.uploadID(id, uploadID);
              break;
            case 'uploadPartComplete':
              String id = data['id'];
              int index = data['index'];
              int partSize = data['partSize'];
              String partHash = data['partHash'];
              _uploadFileListener?.uploadPartComplete(id, index, partSize, partHash);
              break;
          }
        }
      }  catch (e, s) {
        Logger.error("回调失败了。${call.method} ${call.arguments['type']} ${call.arguments['data']} $e $s");
      }
      return Future.value(null);
    });
  }

  /// 初始化 SDK
  Future<bool?> init(
      InitConfig config,
      OnConnectListener listener, {
        String? operationID,
      }) {
    _connectListener = listener;
    config.logFilePath ??= config.dataDir;
    return _channel.invokeMethod<bool>(
      'initSDK',
      _buildParam({
        ...config.toMap(),
        'operationID': Utils.checkOperationID(operationID),
      }),
    );
  }

  /// 初始化 SDK
  /// [platformID] 平台 ID，[IMPlatform]
  /// [apiAddr] SDK 接口地址
  /// [wsAddr] SDK WebSocket 地址
  /// [dataDir] SDK 数据库存储目录
  /// [logLevel] 日志级别，1：不打印日志
  /// [isNeedEncryption] 是否需要加密，true 表示加密
  /// [isCompression] 是否需要压缩，true 表示压缩
  /// [isLogStandardOutput] 是否输出到标准输出，true 表示输出
  /// [logFilePath] 日志文件路径
  /// [operationID] 操作 ID
  Future<dynamic> initSDK({
    required int platformID,
    required String apiAddr,
    required String wsAddr,
    required String dataDir,
    required OnConnectListener listener,
    int logLevel = 6,
    bool isNeedEncryption = false,
    bool isCompression = false,
    bool isLogStandardOutput = true,
    String? logFilePath,
    String? operationID,
  }) {
    _connectListener = listener;
    return _channel.invokeMethod(
      'initSDK',
      _buildParam(
        {
          'platformID': platformID,
          'apiAddr': apiAddr,
          'wsAddr': wsAddr,
          'dataDir': dataDir,
          'logLevel': logLevel,
          'isCompression': isCompression,
          'isNeedEncryption': isNeedEncryption,
          'isLogStandardOutput': isLogStandardOutput,
          'logFilePath': logFilePath,
          'systemType': 'flutter',
          'operationID': Utils.checkOperationID(operationID),
        },
      ),
    );
  }

  /// 反初始化 SDK
  void unInitSDK() {
    _channel.invokeMethod('unInitSDK', _buildParam({}));
  }

  /// 登录
  /// [userID] 用户 ID
  /// [token] 从业务服务器获取的登录凭证
  /// [defaultValue] 登录失败时的默认返回值工厂
  /// [checkLoginStatus] 是否检测当前登录状态，默认为 true
  Future<UserInfo> login({
    required String userID,
    required String token,
    String? operationID,
    Future<UserInfo> Function()? defaultValue,
    bool checkLoginStatus = true,
  }) async {
    int? status;
    if (checkLoginStatus) {
      // 1：登出 2：登录中 3：已登录
      status = await getLoginStatus();
    }
    if (status != LoginStatus.logging && status != LoginStatus.logged) {
      await _channel.invokeMethod(
        'login',
        _buildParam({
          'userID': userID,
          'token': token,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );
    }
    isLogined = true;
    this.userID = userID;
    this.token = token;
    try {
      return userInfo = await userManager.getSelfUserInfo();
    } catch (error, stackTrace) {
      log('login 出错: $error\n$stackTrace');
      if (defaultValue != null) {
        return userInfo = await defaultValue();
      }
      return Future.error(error, stackTrace);
    }
  }

  /// 注销
  Future<dynamic> logout({String? operationID}) async {
    var value = await _channel.invokeMethod(
      'logout',
      _buildParam({
        'operationID': Utils.checkOperationID(operationID),
      }),
    );
    isLogined = false;
    token = null;
    return value;
  }

  /// 获取登录状态
  /// 返回值：1：登出 2：登录中 3：已登录
  Future<int?> getLoginStatus({String? operationID}) =>
      _channel.invokeMethod<int>(
        'getLoginStatus',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取当前登录用户 ID
  Future<String> getLoginUserID() async => userID;

  /// 获取当前登录用户信息
  Future<UserInfo> getLoginUserInfo() async => userInfo;

  /// 上传文件
  /// [id] 对应 [OnUploadFileListener] 的回调 ID，用于区分文件回调
  /// [filePath] 本地文件路径
  /// [fileName] 文件名
  /// [contentType] 文件类型
  /// [cause] 上传原因
  Future uploadFile({
    required String id,
    required String filePath,
    required String fileName,
    String? contentType,
    String? cause,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'uploadFile',
        _buildParam({
          'id': id,
          'filePath': filePath,
          'name': fileName,
          'contentType': contentType,
          'cause': cause,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 更新 Firebase 客户端注册 Token
  /// [fcmToken] Firebase Token
  Future updateFcmToken({
    required String fcmToken,
    required int expireTime,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'updateFcmToken',
        _buildParam({
          'fcmToken': fcmToken,
          'expireTime': expireTime,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 上传日志
  /// [ex] 额外信息
  /// [line] 日志行号
  Future uploadLogs({
    String? ex,
    int line = 0,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'uploadLogs',
        _buildParam({
          'ex': ex,
          'line': line,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 打印日志
  /// [logLevel] 日志级别
  /// [file] 文件名
  /// [line] 行号
  /// [msgs] 日志内容
  /// [err] 错误信息
  /// [keyAndValues] 额外键值对
  Future logs({
    int logLevel = 5,
    String? file,
    int line = 0,
    String? msgs,
    String? err,
    List<dynamic>? keyAndValues,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'logs',
        _buildParam({
          'line': line,
          'logLevel': logLevel,
          'file': file,
          'msgs': msgs,
          'err': err,
          if (keyAndValues != null) 'keyAndValue': jsonEncode(keyAndValues),
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 设置日志上传监听器
  void setUploadLogsListener(OnUploadLogsListener listener) {
    _uploadLogsListener = listener;
  }

  /// 设置文件上传监听器
  void setUploadFileListener(OnUploadFileListener listener) {
    _uploadFileListener = listener;
  }

  /// 设置服务端监听器（仅 Android 支持）
  Future setListenerForService(OnListenerForService listener) {
    if (Platform.isAndroid) {
      _listenerForService = listener;
      return _channel.invokeMethod(
        'setListenerForService',
        _buildParam({}),
      );
    } else {
      throw UnsupportedError('仅支持 Android 平台');
    }
  }

  MethodChannel get channel => _channel;

  static Map<String, dynamic> _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'imManager';
    return Utils.cleanMap(param);
  }
}
