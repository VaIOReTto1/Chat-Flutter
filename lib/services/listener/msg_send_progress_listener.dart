/// 消息发送进度监听器
class OnMsgSendProgressListener {
  /// 发送进度回调，返回客户端消息 ID 和进度百分比
  Function(String clientMsgID, int progress)? onProgress;

  OnMsgSendProgressListener({this.onProgress});

  /// 调用发送进度回调
  void progress(String clientMsgID, int progress) {
    onProgress?.call(clientMsgID, progress);
  }
}
