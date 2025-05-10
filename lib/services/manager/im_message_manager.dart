import 'dart:async';

import 'package:flutter/services.dart';

import '../../enum/message_status.dart';
import '../../models/message/Message.dart';
import '../../models/message/advanced_message.dart';
import '../../models/message/at_user_info.dart';
import '../../models/message/file_elem.dart';
import '../../models/message/offline_push_info.dart';
import '../../models/message/picture_info.dart';
import '../../models/message/rich_message_info.dart';
import '../../models/message/sound_elem.dart';
import '../../models/message/video_elem.dart';
import '../../models/search/search_params.dart';
import '../../models/search/search_result.dart';
import '../../utils/utils.dart';
import '../listener/advanced_msg_listener.dart';
import '../listener/custom_business_listener.dart';
import '../listener/msg_send_progress_listener.dart';

/// 消息管理器
class MessageManager {
  final MethodChannel _channel;

  /// 消息发送进度监听器
  OnMsgSendProgressListener? msgSendProgressListener;

  /// 高级消息监听器
  late OnAdvancedMsgListener msgListener;

  /// 自定义业务消息监听器
  OnCustomBusinessListener? customBusinessListener;

  MessageManager(this._channel);

  /// 设置高级消息监听器
  /// [listener] 高级消息监听器实例
  Future setAdvancedMsgListener(OnAdvancedMsgListener listener) {
    msgListener = listener;
    return _channel.invokeMethod(
      'setAdvancedMsgListener',
      _buildParam({'id': listener.id}),
    );
  }

  /// 设置消息发送进度监听器
  /// [listener] 发送进度监听器实例
  void setMsgSendProgressListener(OnMsgSendProgressListener listener) {
    msgSendProgressListener = listener;
  }

  /// 发送消息
  /// [message] 消息对象
  /// [offlinePushInfo] 离线推送展示信息
  /// [userID] 接收者用户ID
  /// [groupID] 接收者群组ID
  /// [isOnlineOnly] 是否仅在线发送
  /// [operationID] 操作ID
  Future<Message> sendMessage({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'sendMessage',
            _buildParam({
              'message': message.toJson(),
              'offlinePushInfo': offlinePushInfo.toJson(),
              'userID': userID ?? '',
              'groupID': groupID ?? '',
              'isOnlineOnly': isOnlineOnly,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 从本地存储删除消息
  /// [conversationID] 会话ID
  /// [clientMsgID] 客户端消息ID
  /// [operationID] 操作ID
  Future deleteMessageFromLocalStorage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'deleteMessageFromLocalStorage',
        _buildParam({
          'conversationID': conversationID,
          'clientMsgID': clientMsgID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 从本地和服务器删除指定消息
  /// [conversationID] 会话ID
  /// [clientMsgID] 客户端消息ID
  /// [operationID] 操作ID
  Future<dynamic> deleteMessageFromLocalAndSvr({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'deleteMessageFromLocalAndSvr',
        _buildParam({
          'conversationID': conversationID,
          'clientMsgID': clientMsgID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 删除所有本地消息记录
  /// [operationID] 操作ID
  Future<dynamic> deleteAllMsgFromLocal({String? operationID}) =>
      _channel.invokeMethod(
        'deleteAllMsgFromLocal',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 删除所有本地及服务器消息记录
  /// [operationID] 操作ID
  Future<dynamic> deleteAllMsgFromLocalAndSvr({String? operationID}) =>
      _channel.invokeMethod(
        'deleteAllMsgFromLocalAndSvr',
        _buildParam({
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 插入单聊消息到本地存储
  /// [receiverID] 接收者ID
  /// [senderID] 发送者ID
  /// [message] 消息对象
  /// [operationID] 操作ID
  Future<Message> insertSingleMessageToLocalStorage({
    String? receiverID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'insertSingleMessageToLocalStorage',
            _buildParam({
              'message': message?.toJson(),
              'receiverID': receiverID,
              'senderID': senderID,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 插入群聊消息到本地存储
  /// [groupID] 群组ID
  /// [senderID] 发送者ID
  /// [message] 消息对象
  /// [operationID] 操作ID
  Future<Message> insertGroupMessageToLocalStorage({
    String? groupID,
    String? senderID,
    Message? message,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'insertGroupMessageToLocalStorage',
            _buildParam({
              'message': message?.toJson(),
              'groupID': groupID,
              'senderID': senderID,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建文本消息
  /// [text] 文本内容
  /// [operationID] 操作ID
  Future<Message> createTextMessage({
    required String text,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createTextMessage',
            _buildParam({
              'text': text,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建 @ 文本消息
  /// [text] 文本内容
  /// [atUserIDList] 被@用户ID列表
  /// [atUserInfoList] 被@用户信息列表
  /// [quoteMessage] 引用消息
  /// [operationID] 操作ID
  Future<Message> createTextAtMessage({
    required String text,
    required List<String> atUserIDList,
    List<AtUserInfo> atUserInfoList = const [],
    Message? quoteMessage,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createTextAtMessage',
            _buildParam({
              'text': text,
              'atUserIDList': atUserIDList,
              'atUserInfoList': atUserInfoList.map((e) => e.toJson()).toList(),
              'quoteMessage': quoteMessage?.toJson(),
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建图片消息
  /// [imagePath] 图片本地路径
  /// [operationID] 操作ID
  Future<Message> createImageMessage({
    required String imagePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createImageMessage',
            _buildParam({
              'imagePath': imagePath,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 从完整路径创建图片消息
  /// [imagePath] 图片本地路径
  Future<Message> createImageMessageFromFullPath({
    required String imagePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createImageMessageFromFullPath',
        _buildParam({
          'imagePath': imagePath,
          "operationID": Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建声音消息
  /// [soundPath] 音频本地路径
  /// [duration] 时长（秒）
  /// [operationID] 操作ID
  Future<Message> createSoundMessage({
    required String soundPath,
    required int duration,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createSoundMessage',
            _buildParam({
              'soundPath': soundPath,
              'duration': duration,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 从完整路径创建声音消息
  /// [soundPath] 音频本地路径
  /// [duration] 时长（秒）
  Future<Message> createSoundMessageFromFullPath({
    required String soundPath,
    required int duration,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createSoundMessageFromFullPath',
        _buildParam({
          'soundPath': soundPath,
          "duration": duration,
          "operationID": Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建视频消息
  /// [videoPath] 视频本地路径
  /// [videoType] 视频类型
  /// [duration] 时长（秒）
  /// [snapshotPath] 默认截图路径
  /// [operationID] 操作ID
  Future<Message> createVideoMessage({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createVideoMessage',
            _buildParam({
              'videoPath': videoPath,
              'videoType': videoType,
              'duration': duration,
              'snapshotPath': snapshotPath,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 从完整路径创建视频消息
  /// [videoPath] 视频本地路径
  /// [videoType] 视频类型
  /// [duration] 时长（秒）
  /// [snapshotPath] 默认截图路径
  /// [operationID] 操作ID
  Future<Message> createVideoMessageFromFullPath({
    required String videoPath,
    required String videoType,
    required int duration,
    required String snapshotPath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createVideoMessageFromFullPath',
          _buildParam({
            'videoPath': videoPath,
            'videoType': videoType,
            'duration': duration,
            'snapshotPath': snapshotPath,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建文件消息
  /// [filePath] 文件本地路径
  /// [fileName] 文件名
  /// [operationID] 操作ID
  Future<Message> createFileMessage({
    required String filePath,
    required String fileName,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'createFileMessage',
            _buildParam({
              'filePath': filePath,
              'fileName': fileName,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 从完整路径创建文件消息
  /// [filePath] 文件本地路径
  /// [fileName] 文件名
  /// [operationID] 操作ID
  Future<Message> createFileMessageFromFullPath({
    required String filePath,
    required String fileName,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createFileMessageFromFullPath',
          _buildParam({
            'filePath': filePath,
            'fileName': fileName,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建合并消息
  /// [messageList] 选中的消息列表
  /// [title] 汇总标题
  /// [summaryList] 汇总内容
  Future<Message> createMergerMessage({
    required List<Message> messageList,
    required String title,
    required List<String> summaryList,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createMergerMessage',
          _buildParam({
            'messageList': messageList.map((e) => e.toJson()).toList(),
            'title': title,
            'summaryList': summaryList,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建一条转发消息
  /// [message] 要转发的消息
  Future<Message> createForwardMessage({
    required Message message,
    String? operationID,
  }) {
    return _channel
        .invokeMethod(
        'createForwardMessage',
        _buildParam({
          'message': message.toJson(),
          "operationID": Utils.checkOperationID(operationID),
        }))
        .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));
  }

  /// 创建位置消息
  /// [latitude] 纬度
  /// [longitude] 经度
  /// [description] 自定义描述
  Future<Message> createLocationMessage({
    required double latitude,
    required double longitude,
    required String description,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createLocationMessage',
          _buildParam({
            'latitude': latitude,
            'longitude': longitude,
            'description': description,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建自定义消息
  /// [data] 自定义数据
  /// [extension] 自定义扩展内容
  /// [description] 自定义描述内容
  Future<Message> createCustomMessage({
    required String data,
    required String extension,
    required String description,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createCustomMessage',
          _buildParam({
            'data': data,
            'extension': extension,
            'description': description,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建引用消息
  /// [text] 回复内容
  /// [quoteMsg] 被回复的消息
  Future<Message> createQuoteMessage({
    required String text,
    required Message quoteMsg,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createQuoteMessage',
          _buildParam({
            'quoteText': text,
            'quoteMessage': quoteMsg.toJson(),
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建一条卡片消息
  /// [data] 自定义数据
  Future<Message> createCardMessage({
    required String userID,
    required String nickname,
    String? faceURL,
    String? ex,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createCardMessage',
          _buildParam({
            'cardMessage': {
              'userID': userID,
              'nickname': nickname,
              'faceURL': faceURL,
              'ex': ex,
            },
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 创建自定义表情消息
  /// [index] 位置表情，根据索引匹配
  /// [data] URL 表情，直接通过 URL 显示
  Future<Message> createFaceMessage({
    int index = -1,
    String? data,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
          'createFaceMessage',
          _buildParam({
            'index': index,
            'data': data,
            "operationID": Utils.checkOperationID(operationID),
          }))
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));


  /// 撤回消息
  /// [conversationID] 会话ID
  /// [clientMsgID] 客户端消息ID
  /// [operationID] 操作ID
  Future revokeMessage({
    required String conversationID,
    required String clientMsgID,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'revokeMessage',
        _buildParam({
          'conversationID': conversationID,
          'clientMsgID': clientMsgID,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 设置自定义业务消息监听器
  /// [listener] 自定义业务消息监听器实例
  Future setCustomBusinessListener(OnCustomBusinessListener listener) {
    customBusinessListener = listener;
    return _channel.invokeMethod(
      'setCustomBusinessListener',
      _buildParam({}),
    );
  }

  /// 设置消息本地扩展字段
  /// [conversationID] 会话ID
  /// [clientMsgID] 客户端消息ID
  /// [localEx] 本地扩展字段
  /// [operationID] 操作ID
  Future setMessageLocalEx({
    required String conversationID,
    required String clientMsgID,
    required String localEx,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'setMessageLocalEx',
        _buildParam({
          'conversationID': conversationID,
          'clientMsgID': clientMsgID,
          'localEx': localEx,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 设置应用角标
  /// [count] 角标数字
  /// [operationID] 操作ID
  Future setAppBadge(
    int count, {
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'setAppBadge',
        _buildParam({
          'count': count,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  static Map<String, dynamic> _buildParam(Map<String, dynamic> param) {
    param['ManagerName'] = 'messageManager';
    return Utils.cleanMap(param);
  }

  /// 搜索本地消息
  /// [conversationID] 根据会话 ID 查询，传入 null 则全局搜索
  /// [keywordList] 搜索关键字列表，目前只支持单个关键字
  /// [keywordListMatchType] 关键字匹配模式，1 表示 AND，2 表示 OR（当前未使用）
  /// [senderUserIDList] 发送者用户 ID 列表（当前未使用）
  /// [messageTypeList] 消息类型列表
  /// [searchTimePosition] 搜索起始时间点，默认为 0，表示从当前时间开始；UTC 时间戳，单位秒
  /// [searchTimePeriod] 从起始时间点往前的时间范围，单位秒，默认为 0 表示不限制；传入 24*60*60 表示过去一天
  /// [pageIndex] 当前页码
  /// [count] 每页消息数量
  Future<SearchResult> searchLocalMessages({
    String? conversationID,
    List<String> keywordList = const [],
    int keywordListMatchType = 0,
    List<String> senderUserIDList = const [],
    List<int> messageTypeList = const [],
    int searchTimePosition = 0,
    int searchTimePeriod = 0,
    int pageIndex = 1,
    int count = 40,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'searchLocalMessages',
            _buildParam({
              'filter': {
                'conversationID': conversationID,
                'keywordList': keywordList,
                'keywordListMatchType': keywordListMatchType,
                'senderUserIDList': senderUserIDList,
                'messageTypeList': messageTypeList,
                'searchTimePosition': searchTimePosition,
                'searchTimePeriod': searchTimePeriod,
                'pageIndex': pageIndex,
                'count': count,
              },
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) =>
              Utils.toObj(value, (map) => SearchResult.fromJson(map)));

  /// 标记消息为已读
  /// [conversationID] 会话 ID
  /// [messageIDList] 要标记为已读的客户端消息 ID 列表
  @Deprecated('请使用 markConversationMessageAsRead')
  Future markMessagesAsReadByMsgID({
    required String conversationID,
    required List<String> messageIDList,
    String? operationID,
  }) =>
      _channel.invokeMethod(
        'markMessagesAsReadByMsgID',
        _buildParam({
          'conversationID': conversationID,
          'messageIDList': messageIDList,
          'operationID': Utils.checkOperationID(operationID),
        }),
      );

  /// 获取聊天记录（指定消息之前）
  /// [conversationID] 会话 ID，可用于查询通知会话
  /// [startMsg] 从该消息开始查询 count 条消息；返回列表中末尾元素为最新消息，下一页请传入 list.first
  /// [count] 本次请求获取的消息条数
  Future<AdvancedMessage> getAdvancedHistoryMessageList({
    String? conversationID,
    Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'getAdvancedHistoryMessageList',
            _buildParam({
              'conversationID': conversationID ?? '',
              'startClientMsgID': startMsg?.clientMsgID ?? '',
              'count': count ?? 40,
              'viewType': viewType.rawValue,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) =>
              Utils.toObj(value, (map) => AdvancedMessage.fromJson(map)));

  /// 获取聊天记录（指定消息之后）
  /// 用于在全局搜索定位到一条消息后，获取该消息之后的新消息
  /// [conversationID] 会话 ID，可用于查询通知会话
  /// [startMsg] 从该消息开始查询 count 条消息；返回列表中末尾元素为最新消息，下一页请传入 list.last
  /// [count] 本次请求获取的消息条数
  Future<AdvancedMessage> getAdvancedHistoryMessageListReverse({
    String? conversationID,
    Message? startMsg,
    GetHistoryViewType viewType = GetHistoryViewType.history,
    int? count,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'getAdvancedHistoryMessageListReverse',
            _buildParam({
              'conversationID': conversationID ?? '',
              'startClientMsgID': startMsg?.clientMsgID ?? '',
              'count': count ?? 40,
              'viewType': viewType.rawValue,
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) =>
              Utils.toObj(value, (map) => AdvancedMessage.fromJson(map)));

  /// 查找消息详情
  /// [searchParams] 查询参数列表
  /// [operationID] 操作 ID，可选
  Future<SearchResult> findMessageList({
    required List<SearchParams> searchParams,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
            'findMessageList',
            _buildParam({
              'searchParams': searchParams.map((e) => e.toJson()).toList(),
              'operationID': Utils.checkOperationID(operationID),
            }),
          )
          .then((value) =>
              Utils.toObj(value, (map) => SearchResult.fromJson(map)));

  /// 富文本消息
  /// [text] 文本内容
  /// [list] 富文本消息详情列表
  Future<Message> createAdvancedTextMessage({
    required String text,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createAdvancedTextMessage',
        _buildParam({
          'text': text,
          'richMessageInfoList': list.map((e) => e.toJson()).toList(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 带引用的富文本消息
  /// [text] 回复的文本内容
  /// [quoteMsg] 被回复的消息
  /// [list] 富文本消息详情列表
  Future<Message> createAdvancedQuoteMessage({
    required String text,
    required Message quoteMsg,
    List<RichMessageInfo> list = const [],
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createAdvancedQuoteMessage',
        _buildParam({
          'quoteText': text,
          'quoteMessage': quoteMsg.toJson(),
          'richMessageInfoList': list.map((e) => e.toJson()).toList(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 发送消息（不使用 OSS）
  /// [message] 消息对象（可由 createImageMessageByURL、createSoundMessageByURL、createVideoMessageByURL、createFileMessageByURL 创建）
  /// [offlinePushInfo] 离线推送展示信息
  /// [userID] 接收者用户 ID，可选
  /// [groupID] 接收者群组 ID，可选
  /// [isOnlineOnly] 是否仅在线发送，默认为 false
  /// [operationID] 操作 ID，可选
  Future<Message> sendMessageNotOss({
    required Message message,
    required OfflinePushInfo offlinePushInfo,
    String? userID,
    String? groupID,
    bool isOnlineOnly = false,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'sendMessageNotOss',
        _buildParam({
          'message': message.toJson(),
          'offlinePushInfo': offlinePushInfo.toJson(),
          'userID': userID ?? '',
          'groupID': groupID ?? '',
          'isOnlineOnly': isOnlineOnly,
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 通过 URL 创建图片消息
  Future<Message> createImageMessageByURL({
    required PictureInfo sourcePicture,
    required PictureInfo bigPicture,
    required PictureInfo snapshotPicture,
    String? sourcePath,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createImageMessageByURL',
        _buildParam({
          'sourcePath': sourcePath,
          'sourcePicture': sourcePicture.toJson(),
          'bigPicture': bigPicture.toJson(),
          'snapshotPicture': snapshotPicture.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 通过 URL 创建声音消息
  Future<Message> createSoundMessageByURL({
    required SoundElem soundElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createSoundMessageByURL',
        _buildParam({
          'soundElem': soundElem.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 通过 URL 创建视频消息
  Future<Message> createVideoMessageByURL({
    required VideoElem videoElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createVideoMessageByURL',
        _buildParam({
          'videoElem': videoElem.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));

  /// 通过 URL 创建文件消息
  Future<Message> createFileMessageByURL({
    required FileElem fileElem,
    String? operationID,
  }) =>
      _channel
          .invokeMethod(
        'createFileMessageByURL',
        _buildParam({
          'fileElem': fileElem.toJson(),
          'operationID': Utils.checkOperationID(operationID),
        }),
      )
          .then((value) => Utils.toObj(value, (map) => Message.fromJson(map)));
}
