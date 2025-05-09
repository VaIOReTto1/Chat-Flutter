import 'package:chat_flutter/models/message/picture_info.dart';

/// 图片消息内容
class PictureElem {
  /// 原始路径
  String? sourcePath;

  /// 原始图片对象
  PictureInfo? sourcePicture;

  /// 大图对象
  PictureInfo? bigPicture;

  /// 缩略图对象
  PictureInfo? snapshotPicture;

  PictureElem({this.sourcePath, this.sourcePicture, this.bigPicture, this.snapshotPicture});

  PictureElem.fromJson(Map<String, dynamic> json) {
    sourcePath = json['sourcePath'];
    sourcePicture = json['sourcePicture'] != null ? PictureInfo.fromJson(json['sourcePicture']) : null;
    bigPicture = json['bigPicture'] != null ? PictureInfo.fromJson(json['bigPicture']) : null;
    snapshotPicture = json['snapshotPicture'] != null ? PictureInfo.fromJson(json['snapshotPicture']) : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['sourcePath'] = sourcePath;
    if (sourcePicture != null) {
      data['sourcePicture'] = sourcePicture?.toJson();
    }
    if (bigPicture != null) {
      data['bigPicture'] = bigPicture?.toJson();
    }
    if (snapshotPicture != null) {
      data['snapshotPicture'] = snapshotPicture?.toJson();
    }
    return data;
  }
}
