/// 自定义业务消息监听器
class OnCustomBusinessListener {
  /// 收到自定义业务消息回调
  Function(String s)? onRecvCustomBusinessMessage;

  OnCustomBusinessListener({this.onRecvCustomBusinessMessage});

  /// 调用收到自定义业务消息回调
  void recvCustomBusinessMessage(String s) {
    onRecvCustomBusinessMessage?.call(s);
  }
}
