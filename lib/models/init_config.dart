class InitConfig {
  /// 系统类型
  String systemType;

  /// 平台 ID
  int platformID;

  /// API 地址
  String apiAddr;

  /// WebSocket 地址
  String wsAddr;

  /// 数据目录
  String dataDir;

  /// 日志级别
  int logLevel;

  /// 是否输出日志到标准输出
  bool isLogStandardOutput;

  /// 日志文件路径
  String? logFilePath;

  /// 是否启用压缩
  bool enabledCompression;

  InitConfig({
    required this.platformID,
    required this.apiAddr,
    required this.wsAddr,
    required this.dataDir,
    this.logLevel = 6,
    this.isLogStandardOutput = true,
    this.logFilePath,
    this.enabledCompression = false,
    this.systemType = 'flutter',
  });

  factory InitConfig.fromJson(Map<String, dynamic> json) {
    return InitConfig(
        platformID: json['platformID'],
        apiAddr: json['apiAddr'],
        wsAddr: json['wsAddr'],
        dataDir: json['dataDir'],
        logLevel: json['logLevel'],
        isLogStandardOutput: json['isLogStandardOutput'],
        logFilePath: json['logFilePath'],
        enabledCompression: json['isCompression'],
        systemType: json['systemType']);
  }

  Map<String, dynamic> toMap() {
    return {
      'platformID': platformID,
      'apiAddr': apiAddr,
      'wsAddr': wsAddr,
      'dataDir': dataDir,
      'logLevel': logLevel,
      'isLogStandardOutput': isLogStandardOutput,
      'logFilePath': logFilePath,
      'isCompression': enabledCompression,
      'systemType': systemType,
    };
  }
}
