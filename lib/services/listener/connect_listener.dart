/// SDK 连接状态监听器
class OnConnectListener {
  /// 连接失败回调，返回错误码和错误信息
  Function(int? code, String? errorMsg)? onConnectFailed;

  /// 连接成功回调
  Function()? onConnectSuccess;

  /// 正在连接回调
  Function()? onConnecting;

  /// 被踢下线回调
  Function()? onKickedOffline;

  /// 用户 Token 过期回调
  Function()? onUserTokenExpired;

  /// 用户 Token 无效回调
  Function()? onUserTokenInvalid;

  OnConnectListener({
    this.onConnectFailed,
    this.onConnectSuccess,
    this.onConnecting,
    this.onKickedOffline,
    this.onUserTokenExpired,
    this.onUserTokenInvalid,
  });

  /// 调用连接失败回调
  void connectFailed(int? code, String? errorMsg) {
    onConnectFailed?.call(code, errorMsg);
  }

  /// 调用连接成功回调
  void connectSuccess() {
    onConnectSuccess?.call();
  }

  /// 调用正在连接回调
  void connecting() {
    onConnecting?.call();
  }

  /// 调用被踢下线回调
  void kickedOffline() {
    onKickedOffline?.call();
  }

  /// 调用用户 Token 过期回调
  void userTokenExpired() {
    onUserTokenExpired?.call();
  }

  /// 调用用户 Token 无效回调
  void userTokenInvalid() {
    onUserTokenInvalid?.call();
  }
}
