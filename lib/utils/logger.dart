import '../enum/sdk_error_code.dart';

class Logger {
  static const _tag = '[chat_flutter]';

  /// 普通日志
  static void log(String message) {
    print('$_tag [INFO] $message');
  }

  /// 警告日志
  static void warn(String message) {
    print('$_tag [WARN] $message');
  }

  /// 错误日志
  static void error(String message) {
    print('$_tag [ERROR] $message');
  }

  /// SDK 错误日志，包含错误码和消息
  static void sdkError(int code, String message) {
    print('$_tag [SDK_ERROR] code=$code, message=$message');
  }

  /// 错误码与描述映射表
  static const Map<int, String> _errorMessages = {
    SDKErrorCode.networkRequestError: '网络请求错误',
    SDKErrorCode.networkWaitTimeoutError: '网络等待超时错误',
    SDKErrorCode.parameterError: '参数错误',
    SDKErrorCode.contextTimeoutError: '上下文超时错误',
    SDKErrorCode.resourceNotLoaded: '资源未加载',
    SDKErrorCode.unknownError: '未知错误',
    SDKErrorCode.sdkInternalError: 'SDK 内部错误',
    SDKErrorCode.refuseToAddFriends: '用户拒绝添加好友',
    SDKErrorCode.userNotExistOrNotRegistered: '用户不存在或未注册',
    SDKErrorCode.userHasLoggedOut: '用户已登出',
    SDKErrorCode.repeatLogin: '重复登录尝试',
    SDKErrorCode.uploadFileNotExist: '上传文件不存在',
    SDKErrorCode.messageDecompressionFailed: '消息解压失败',
    SDKErrorCode.messageDecodingFailed: '消息解码失败',
    SDKErrorCode.unsupportedLongConnection: '不支持的长连接二进制协议',
    SDKErrorCode.messageRepeated: '消息重复发送',
    SDKErrorCode.messageContentTypeNotSupported: '不支持的消息内容类型',
    SDKErrorCode.unsupportedSessionOperation: '不支持的会话操作',
    SDKErrorCode.groupIDNotExist: '群 ID 不存在',
    SDKErrorCode.wrongGroupType: '群组类型不正确',
    SDKErrorCode.serverInternalError: '服务器内部错误',
    SDKErrorCode.serverParameterError: '服务器参数错误',
    SDKErrorCode.insufficientPermissions: '权限不足',
    SDKErrorCode.duplicateDatabasePrimaryKey: '数据库主键重复',
    SDKErrorCode.databaseRecordNotFound: '数据库记录未找到',
    SDKErrorCode.userIDNotExist: '用户 ID 不存在',
    SDKErrorCode.userAlreadyRegistered: '用户已注册',
    SDKErrorCode.groupNotExis: '群组不存在',
    SDKErrorCode.groupAlreadyExists: '群组已存在',
    SDKErrorCode.userIsNotInGroup: '用户不在该群组中',
    SDKErrorCode.groupDisbanded: '群组已解散',
    SDKErrorCode.groupApplicationHasBeenProcessed: '群组申请已处理',
    SDKErrorCode.notAddMyselfAsAFriend: '不能添加自己为好友',
    SDKErrorCode.hasBeenBlocked: '已被对方拉黑',
    SDKErrorCode.notFriend: '对方不是你的好友',
    SDKErrorCode.alreadyAFriendRelationship: '已经是好友关系',
    SDKErrorCode.messageReadFunctionIsTurnedOff: '消息已读功能已关闭',
    SDKErrorCode.youHaveBeenBanned: '你在群中被禁言',
    SDKErrorCode.groupHasBeenBanned: '群组已被禁言',
    SDKErrorCode.messageHasBeenRetracted: '消息已被撤回',
    SDKErrorCode.licenseExpired: '授权已过期',
    SDKErrorCode.tokenHasExpired: 'Token 已过期',
    SDKErrorCode.tokenInvalid: 'Token 无效',
    SDKErrorCode.tokenFormatError: 'Token 格式错误',
    SDKErrorCode.tokenHasNotYetTakenEffect: 'Token 尚未生效',
    SDKErrorCode.unknownTokenError: '未知的 Token 错误',
    SDKErrorCode.thekickedOutTokenIsInvalid: '被踢出的 Token 无效',
    SDKErrorCode.tokenNotExist: 'Token 不存在',
    SDKErrorCode.connectionsExceedsMaximumLimit: '连接数超出网关最大限制',
    SDKErrorCode.handshakeParameterError: '握手参数错误',
    SDKErrorCode.fileUploadExpired: '文件上传已过期',
  };

  /// 根据错误码查询并打印对应的错误信息
  static void printErrorByCode(int code) {
    final message = _errorMessages[code] ?? '未定义的错误码: $code';
    sdkError(code, message);
  }
}
