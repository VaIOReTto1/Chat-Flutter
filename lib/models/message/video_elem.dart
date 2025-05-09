/// 视频消息内容
class VideoElem {
  /// 视频路径
  String? videoPath;

  /// 视频的唯一标识符（UUID）
  String? videoUUID;

  /// 视频的 URL 地址
  String? videoUrl;

  /// 视频的 MIME 类型
  String? videoType;

  /// 视频文件大小（字节）
  int? videoSize;

  /// 视频时长（秒）
  int? duration;

  /// 视频截图的路径
  String? snapshotPath;

  /// 视频截图的唯一标识符（UUID）
  String? snapshotUUID;

  /// 视频截图的文件大小（字节）
  int? snapshotSize;

  /// 视频截图的 URL 地址
  String? snapshotUrl;

  /// 视频截图的宽度
  int? snapshotWidth;

  /// 视频截图的高度
  int? snapshotHeight;

  /// 构造函数
  VideoElem({
    this.videoPath,
    this.videoUUID,
    this.videoUrl,
    this.videoType,
    this.videoSize,
    this.duration,
    this.snapshotPath,
    this.snapshotUUID,
    this.snapshotSize,
    this.snapshotUrl,
    this.snapshotWidth,
    this.snapshotHeight,
  });

  /// 从 JSON 数据创建 VideoElem 实例
  VideoElem.fromJson(Map<String, dynamic> json) {
    videoPath = json['videoPath'];
    videoUUID = json['videoUUID'];
    videoUrl = json['videoUrl'];
    videoType = json['videoType'];
    videoSize = json['videoSize'];
    duration = json['duration'];
    snapshotPath = json['snapshotPath'];
    snapshotUUID = json['snapshotUUID'];
    snapshotSize = json['snapshotSize'];
    snapshotUrl = json['snapshotUrl'];
    snapshotWidth = json['snapshotWidth'];
    snapshotHeight = json['snapshotHeight'];
  }

  /// 将 VideoElem 实例转换为 JSON 数据
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['videoPath'] = videoPath;
    data['videoUUID'] = videoUUID;
    data['videoUrl'] = videoUrl;
    data['videoType'] = videoType;
    data['videoSize'] = videoSize;
    data['duration'] = duration;
    data['snapshotPath'] = snapshotPath;
    data['snapshotUUID'] = snapshotUUID;
    data['snapshotSize'] = snapshotSize;
    data['snapshotUrl'] = snapshotUrl;
    data['snapshotWidth'] = snapshotWidth;
    data['snapshotHeight'] = snapshotHeight;
    return data;
  }
}