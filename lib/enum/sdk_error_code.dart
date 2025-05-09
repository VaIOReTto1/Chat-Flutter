/// SDK 错误码
class SDKErrorCode {
  /// 网络请求错误
  static const int networkRequestError = 10000;

  /// 网络等待超时错误
  static const int networkWaitTimeoutError = 10001;

  /// 参数错误
  static const int parameterError = 10002;

  /// 上下文超时错误，通常是在用户已经登出时出现
  static const int contextTimeoutError = 10003;

  /// 资源未完全加载，通常是未初始化或登录未完成
  static const int resourceNotLoaded = 10004;

  /// 未知错误，查看错误消息获取详细信息
  static const int unknownError = 10005;

  /// SDK 内部错误，查看错误消息获取详细信息
  static const int sdkInternalError = 10006;

  /// 用户已设置拒绝被添加
  static const int refuseToAddFriends = 10013;

  /// 用户不存在或未注册
  static const int userNotExistOrNotRegistered = 10100;

  /// 用户已登出
  static const int userHasLoggedOut = 10101;

  /// 用户正在尝试重新登录，检查登录状态避免重复登录
  static const int repeatLogin = 10102;

  /// 上传的文件不存在
  static const int uploadFileNotExist = 10200;

  /// 消息解压失败
  static const int messageDecompressionFailed = 10201;

  /// 消息解码失败
  static const int messageDecodingFailed = 10202;

  /// 不支持的长连接二进制协议
  static const int unsupportedLongConnection = 10203;

  /// 消息发送重复
  static const int messageRepeated = 10204;

  /// 不支持的消息内容类型
  static const int messageContentTypeNotSupported = 10205;

  /// 不支持的会话操作
  static const int unsupportedSessionOperation = 10301;

  /// 群 ID 不存在
  static const int groupIDNotExist = 10400;

  /// 群组类型不正确
  static const int wrongGroupType = 10401;

  /// 服务器内部错误，通常是内部网络错误，检查服务器节点是否正常运行
  static const int serverInternalError = 500;

  /// 服务器参数错误，检查请求体和头部参数是否正确
  static const int serverParameterError = 1001;

  /// 权限不足，通常是头部的 token 不正确，或者尝试执行未授权的操作
  static const int insufficientPermissions = 1002;

  /// 数据库主键重复
  static const int duplicateDatabasePrimaryKey = 1003;

  /// 数据库记录未找到
  static const int databaseRecordNotFound = 1004;

  /// 用户 ID 不存在
  static const int userIDNotExist = 1101;

  /// 用户已注册
  static const int userAlreadyRegistered = 1102;

  /// 群组不存在
  static const int groupNotExis = 1201;

  /// 群组已存在
  static const int groupAlreadyExists = 1202;

  /// 用户不在该群组中
  static const int userIsNotInGroup = 1203;

  /// 群组已解散
  static const int groupDisbanded = 1204;

  /// 群组申请已处理，无需重复处理
  static const int groupApplicationHasBeenProcessed = 1206;

  /// 不能添加自己为好友
  static const int notAddMyselfAsAFriend = 1301;

  /// 你已被对方拉黑
  static const int hasBeenBlocked = 1302;

  /// 对方不是你的好友
  static const int notFriend = 1303;

  /// 已经是好友关系，无需重新申请
  static const int alreadyAFriendRelationship = 1304;

  /// 消息已读功能已关闭
  static const int messageReadFunctionIsTurnedOff = 1401;

  /// 你在群中被禁言
  static const int youHaveBeenBanned = 1402;

  /// 群组已被禁言
  static const int groupHasBeenBanned = 1403;

  /// 该消息已被撤回
  static const int messageHasBeenRetracted = 1404;

  /// 授权已过期
  static const int licenseExpired = 1405;

  /// Token 已过期
  static const int tokenHasExpired = 1501;

  /// Token 无效
  static const int tokenInvalid = 1502;

  /// Token 格式错误
  static const int tokenFormatError = 1503;

  /// Token 尚未生效
  static const int tokenHasNotYetTakenEffect = 1504;

  /// 未知的 Token 错误
  static const int unknownTokenError = 1505;

  /// 被踢出的 Token 无效
  static const int thekickedOutTokenIsInvalid = 1506;

  /// Token 不存在
  static const int tokenNotExist = 1507;

  /// 连接数超出网关最大限制
  static const int connectionsExceedsMaximumLimit = 1601;

  /// 握手参数错误
  static const int handshakeParameterError = 1602;

  /// 文件上传已过期
  static const int fileUploadExpired = 1701;
}
