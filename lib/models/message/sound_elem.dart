/// 语音消息内容
class SoundElem {
  /// 语音唯一标识符
  String? uuid;

  /// 语音文件路径
  String? soundPath;

  /// 语音文件 URL 地址
  String? sourceUrl;

  /// 语音文件大小（字节）
  int? dataSize;

  /// 语音时长（秒）
  int? duration;

  SoundElem({this.uuid, this.soundPath, this.sourceUrl, this.dataSize, this.duration});

  SoundElem.fromJson(Map<String, dynamic> json) {
    uuid = json['uuid'];
    soundPath = json['soundPath'];
    sourceUrl = json['sourceUrl'];
    dataSize = json['dataSize'];
    duration = json['duration'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uuid'] = uuid;
    data['soundPath'] = soundPath;
    data['sourceUrl'] = sourceUrl;
    data['dataSize'] = dataSize;
    data['duration'] = duration;
    return data;
  }
}
