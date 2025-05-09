import '../message/file_elem.dart';
import '../message/picture_elem.dart';
import '../message/sound_elem.dart';
import '../message/video_elem.dart';

/// OA 通知
class OANotification {
  /// 标题
  String? notificationName;

  /// 头像
  String? notificationFaceURL;

  /// 类型
  int? notificationType;

  /// 文本内容
  String? text;

  /// 跳转链接
  String? externalUrl;

  /// 0: 仅文本通知
  /// 1: 文本 + 图片通知
  /// 2: 文本 + 视频通知
  /// 3: 文本 + 文件通知
  int? mixType;

  /// 图片信息
  PictureElem? pictureElem;

  /// 声音信息
  SoundElem? soundElem;

  /// 视频信息
  VideoElem? videoElem;

  /// 文件信息
  FileElem? fileElem;

  /// 扩展字段
  String? ex;

  OANotification({
    this.notificationName,
    this.notificationFaceURL,
    this.notificationType,
    this.text,
    this.externalUrl,
    this.mixType,
    this.pictureElem,
    this.soundElem,
    this.videoElem,
    this.fileElem,
    this.ex,
  });

  OANotification.fromJson(Map<String, dynamic> json) {
    notificationName = json['notificationName'];
    notificationFaceURL = json['notificationFaceURL'];
    notificationType = json['notificationType'];
    text = json['text'];
    externalUrl = json['externalUrl'];
    mixType = json['mixType'];
    pictureElem = json['pictureElem'] != null ? PictureElem.fromJson(json['pictureElem']) : null;
    soundElem = json['soundElem'] != null ? SoundElem.fromJson(json['soundElem']) : null;
    videoElem = json['videoElem'] != null ? VideoElem.fromJson(json['videoElem']) : null;
    fileElem = json['fileElem'] != null ? FileElem.fromJson(json['fileElem']) : null;
    ex = json['ex'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['notificationName'] = notificationName;
    data['notificationFaceURL'] = notificationFaceURL;
    data['notificationType'] = notificationType;
    data['text'] = text;
    data['externalUrl'] = externalUrl;
    data['mixType'] = mixType;
    if (pictureElem != null) {
      data['pictureElem'] = pictureElem!.toJson();
    }
    if (soundElem != null) {
      data['soundElem'] = soundElem!.toJson();
    }
    if (videoElem != null) {
      data['videoElem'] = videoElem!.toJson();
    }
    if (fileElem != null) {
      data['fileElem'] = fileElem!.toJson();
    }
    data['ex'] = ex;
    return data;
  }
}