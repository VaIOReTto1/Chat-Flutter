import 'package:chat_flutter/models/message/picture_elem.dart';
import 'package:chat_flutter/models/message/quote_elem.dart';
import 'package:chat_flutter/models/message/sound_elem.dart';
import 'package:chat_flutter/models/message/text_elem.dart';
import 'package:chat_flutter/models/message/typing_elem.dart';
import 'package:chat_flutter/models/message/video_elem.dart';

import '../../enum/conversation_type.dart';
import 'advanced_text_elem.dart';
import 'at_text_elem.dart';
import 'attached_info_elem.dart';
import 'card_elem.dart';
import 'custom_elem.dart';
import 'face_elem.dart';
import 'file_elem.dart';
import 'location_elem.dart';
import 'merge_elem.dart';
import 'notification_elem.dart';
import 'offline_push_info.dart';

/// 表示一条消息。
///
/// 该类封装了消息的各类属性，包括消息的唯一标识、发送者和接收者信息、消息内容、状态等。
/// 支持多种消息类型，如文本、图片、语音、视频等。
class Message {
  /// 客户端生成的消息 ID，唯一标识一条消息。
  String? clientMsgID;

  /// 服务器生成的消息 ID，唯一标识一条消息。
  String? serverMsgID;

  /// 消息创建时间，Unix 时间戳（毫秒）。
  int? createTime;

  /// 消息发送时间，Unix 时间戳（毫秒）。
  int? sendTime;

  /// 会话类型，参见 [ConversationType] 枚举。
  int? sessionType;

  /// 发送者的用户 ID。
  String? sendID;

  /// 接收者的用户 ID。
  String? recvID;

  /// 消息来源，参见 [MsgFrom] 枚举。
  int? msgFrom;

  /// 消息内容类型，参见 [ContentType] 枚举。
  int? contentType;

  /// 发送者的平台 ID，标识发送消息的平台。
  int? senderPlatformID;

  /// 发送者的昵称。
  String? senderNickname;

  /// 发送者的头像 URL。
  String? senderFaceUrl;

  /// 群组 ID，仅在群聊消息中有效。
  String? groupID;

  /// 消息本地扩展字段。
  String? localEx;

  /// 消息的序列号，用于消息排序。
  int? seq;

  /// 消息是否已读。
  bool? isRead;

  /// 消息被读取的时间，Unix 时间戳（毫秒）。
  int? hasReadTime;

  /// 消息发送状态，参见 [MessageStatus] 枚举。
  int? status;

  /// 是否为表情包消息。
  bool? isReact;

  /// 是否为外部扩展消息。
  bool? isExternalExtensions;

  /// 离线推送信息。
  OfflinePushInfo? offlinePush;

  /// 附加信息。
  String? attachedInfo;

  /// 消息扩展字段。
  String? ex;

  /// 自定义扩展信息，当前用于客户端的消息时间分段。
  Map<String, dynamic> exMap = {};

  /// 图片消息元素。
  PictureElem? pictureElem;

  /// 语音消息元素。
  SoundElem? soundElem;

  /// 视频消息元素。
  VideoElem? videoElem;

  /// 文件消息元素。
  FileElem? fileElem;

  /// @ 信息消息元素。
  AtTextElem? atTextElem;

  /// 地理位置消息元素。
  LocationElem? locationElem;

  /// 自定义消息元素。
  CustomElem? customElem;

  /// 引用消息元素。
  QuoteElem? quoteElem;

  /// 合并消息元素。
  MergeElem? mergeElem;

  /// 通知消息元素。
  NotificationElem? notificationElem;

  /// 表情消息元素。
  FaceElem? faceElem;

  /// 附加信息消息元素。
  AttachedInfoElem? attachedInfoElem;

  /// 文本消息元素。
  TextElem? textElem;

  /// 名片消息元素。
  CardElem? cardElem;

  /// 高级文本消息元素。
  AdvancedTextElem? advancedTextElem;

  /// 正在输入消息元素。
  TypingElem? typingElem;

  /// 构造一个 [Message] 实例。
  ///
  /// [clientMsgID] 客户端生成的消息 ID。
  /// [serverMsgID] 服务器生成的消息 ID。
  /// [createTime] 消息创建时间，Unix 时间戳（毫秒）。
  /// [sendTime] 消息发送时间，Unix 时间戳（毫秒）。
  /// [sessionType] 会话类型，参见 [ConversationType] 枚举。
  /// [sendID] 发送者的用户 ID。
  /// [recvID] 接收者的用户 ID。
  /// [msgFrom] 消息来源，参见 [MsgFrom] 枚举。
  /// [contentType] 消息内容类型，参见 [ContentType] 枚举。
  /// [senderPlatformID] 发送者的平台 ID。
  /// [senderNickname] 发送者的昵称。
  /// [senderFaceUrl] 发送者的头像 URL。
  /// [groupID] 群组 ID，仅在群聊消息中有效。
  /// [localEx] 消息本地扩展字段。
  /// [seq] 消息的序列号。
  /// [isRead] 消息是否已读。
  /// [hasReadTime] 消息被读取的时间，Unix 时间戳（毫秒）。
  /// [status] 消息发送状态，参见 [MessageStatus] 枚举。
  /// [offlinePush] 离线推送信息。
  /// [attachedInfo] 附加信息。
  /// [ex] 消息扩展字段。
  /// [exMap] 自定义扩展信息，当前用于客户端的消息时间分段。
  /// [pictureElem] 图片消息元素。
  /// [soundElem] 语音消息元素。
  /// [videoElem] 视频消息元素。
  /// [fileElem] 文件消息元素。
  /// [atTextElem] @ 信息消息元素。
  /// [locationElem] 地理位置消息元素。
  /// [customElem] 自定义消息元素。
  /// [quoteElem] 引用消息元素。
  /// [mergeElem] 合并消息元素。
  /// [notificationElem] 通知消息元素。
  /// [faceElem] 表情消息元素。
  /// [attachedInfoElem] 附加信息消息元素。
  /// [isExternalExtensions] 是否为外部扩展消息。
  /// [isReact] 是否为表情包消息。
  /// [textElem] 文本消息元素。
  /// [cardElem] 名片消息元素。
  /// [advancedTextElem] 高级文本消息元素。
  /// [typingElem] 正在输入消息元素。
  Message({
    this.clientMsgID,
    this.serverMsgID,
    this.createTime,
    this.sendTime,
    this.sessionType,
    this.sendID,
    this.recvID,
    this.msgFrom,
    this.contentType,
    this.senderPlatformID,
    this.senderNickname,
    this.senderFaceUrl,
    this.groupID,
    this.localEx,
    this.seq,
    this.isRead,
    this.hasReadTime,
    this.status,
    this.offlinePush,
    this.attachedInfo,
    this.ex,
    this.exMap = const <String, dynamic>{},
    this.pictureElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.atTextElem,
    this.locationElem,
    this.customElem,
    this.quoteElem,
    this.mergeElem,
    this.notificationElem,
    this.faceElem,
    this.attachedInfoElem,
    this.isExternalExtensions,
    this.isReact,
    this.textElem,
    this.cardElem,
    this.advancedTextElem,
    this.typingElem,
  });

  /// 从 JSON 数据创建 [Message] 实例。
  ///
  /// [json] 包含消息的所有字段。
  Message.fromJson(Map<String, dynamic> json) {
    clientMsgID = json['clientMsgID'];
    serverMsgID = json['serverMsgID'];
    createTime = json['createTime'];
    sendTime = json['sendTime'];
    sendID = json['sendID'];
    recvID = json['recvID'];
    msgFrom = json['msgFrom'];
    contentType = json['contentType'];
    senderPlatformID = json['senderPlatformID'];
    senderNickname = json['senderNickname'];
    senderFaceUrl = json['senderFaceUrl'];
    groupID = json['groupID'];
    localEx = json['localEx'];
    seq = json['seq'];
    isRead = json['isRead'];
    status = json['status'];
    offlinePush = json['offlinePush'] != null
        ? OfflinePushInfo.fromJson(json['offlinePush'])
        : null;
    attachedInfo = json['attachedInfo'];
    ex = json['ex'];
    exMap = json['exMap'] ?? {};
    sessionType = json['sessionType'];
    pictureElem = json['pictureElem'] != null
        ? PictureElem.fromJson(json['pictureElem'])
        : null;
    soundElem =
    json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem =
    json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem =
    json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    atTextElem =
    json['atTextElem'] != null ? AtTextElem.fromJson(json['atTextElem']) : null;
    locationElem = json['locationElem'] != null
        ? LocationElem.fromJson(json['locationElem'])
        : null;
    customElem =
    json['customElem'] != null ? CustomElem.fromJson(json['customElem']) : null;
    quoteElem =
    json['quoteElem'] != null ? QuoteElem.fromJson(json['quoteElem']) : null;
    mergeElem =
    json['mergeElem'] != null ? MergeElem.fromJson(json['mergeElem']) : null;
    notificationElem =
    json['notificationElem'] != null ? NotificationElem.fromJson(
        json['notificationElem']) : null;
    faceElem =
    json['faceElem'] != null ? FaceElem.fromJson(json['faceElem']) : null;
    attachedInfoElem =
    json['attachedInfoElem'] != null ? AttachedInfoElem.fromJson(
        json['attachedInfoElem']) : null;
    hasReadTime = json['hasReadTime'] ?? attachedInfoElem?.hasReadTime;
    isExternalExtensions = json['isExternalExtensions'];
    isReact = json['isReact'];
    textElem =
    json['textElem'] != null ? TextElem.fromJson(json['textElem']) : null;
    cardElem =
    json['cardElem'] != null ? CardElem.fromJson(json['cardElem']) : null;
    advancedTextElem =
    json['advancedTextElem'] != null ? AdvancedTextElem.fromJson(
        json['advancedTextElem']) : null;
    typingElem =
    json['typingElem'] != null ? TypingElem.fromJson(json['typingElem']) : null;
  }

  /// 将 [Message] 实例转换为 JSON 数据。
  ///
  /// 返回一个包含消息所有字段
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['clientMsgID'] = clientMsgID;
    data['serverMsgID'] = serverMsgID;
    data['createTime'] = createTime;
    data['sendTime'] = sendTime;
    data['sendID'] = sendID;
    data['recvID'] = recvID;
    data['msgFrom'] = msgFrom;
    data['contentType'] = contentType;
    data['senderPlatformID'] = senderPlatformID;
    data['senderNickname'] = senderNickname;
    data['senderFaceUrl'] = senderFaceUrl;
    data['groupID'] = groupID;
    data['localEx'] = localEx;
    data['seq'] = seq;
    data['isRead'] = isRead;
    data['hasReadTime'] = hasReadTime;
    data['status'] = status;
    data['offlinePush'] = offlinePush?.toJson();
    data['attachedInfo'] = attachedInfo;
    data['ex'] = ex;
    data['exMap'] = exMap;
    data['sessionType'] = sessionType;
    data['pictureElem'] = pictureElem?.toJson();
    data['soundElem'] = soundElem?.toJson();
    data['videoElem'] = videoElem?.toJson();
    data['fileElem'] = fileElem?.toJson();
    data['atTextElem'] = atTextElem?.toJson();
    data['locationElem'] = locationElem?.toJson();
    data['customElem'] = customElem?.toJson();
    data['quoteElem'] = quoteElem?.toJson();
    data['mergeElem'] = mergeElem?.toJson();
    data['notificationElem'] = notificationElem?.toJson();
    data['faceElem'] = faceElem?.toJson();
    data['attachedInfoElem'] = attachedInfoElem?.toJson();
    data['isExternalExtensions'] = isExternalExtensions;
    data['isReact'] = isReact;
    data['textElem'] = textElem?.toJson();
    data['cardElem'] = cardElem?.toJson();
    data['advancedTextElem'] = advancedTextElem?.toJson();
    data['typingElem'] = typingElem?.toJson();
    return data;
  }

  /// 获取消息的唯一标识符。
  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Message && runtimeType == other.runtimeType && clientMsgID == other.clientMsgID;

  /// 获取消息的哈希码。
  @override
  int get hashCode => clientMsgID.hashCode;

  /// 更新消息的属性。
  void update(Message message) {
    if (this != message) return;
    serverMsgID = message.serverMsgID;
    createTime = message.createTime;
    sendTime = message.sendTime;
    sendID = message.sendID;
    recvID = message.recvID;
    msgFrom = message.msgFrom;
    contentType = message.contentType;
    senderPlatformID = message.senderPlatformID;
    senderNickname = message.senderNickname;
    senderFaceUrl = message.senderFaceUrl;
    groupID = message.groupID;
    // content = message.content;
    seq = message.seq;
    isRead = message.isRead;
    hasReadTime = message.hasReadTime;
    status = message.status;
    offlinePush = message.offlinePush;
    attachedInfo = message.attachedInfo;
    ex = message.ex;
    exMap = message.exMap;
    sessionType = message.sessionType;
    pictureElem = message.pictureElem;
    soundElem = message.soundElem;
    videoElem = message.videoElem;
    fileElem = message.fileElem;
    atTextElem = message.atTextElem;
    locationElem = message.locationElem;
    customElem = message.customElem;
    quoteElem = message.quoteElem;
    mergeElem = message.mergeElem;
    notificationElem = message.notificationElem;
    faceElem = message.faceElem;
    attachedInfoElem = message.attachedInfoElem;
    textElem = message.textElem;
    cardElem = message.cardElem;
    advancedTextElem = message.advancedTextElem;
    typingElem = message.typingElem;
  }

  /// 判断消息是否为单聊消息。
  bool get isSingleChat => sessionType == ConversationType.single;

  /// 判断消息是否为群聊消息。
  bool get isGroupChat => sessionType == ConversationType.superGroup;
}