/// 日志上传进度监听器
class OnUploadLogsListener {
  /// 上传进度回调，返回当前已上传大小和总大小
  Function(int current, int size)? onUploadProgress;

  OnUploadLogsListener({this.onUploadProgress});

  /// 调用上传进度回调
  void onProgress(int current, int size) {
    onUploadProgress?.call(current, size);
  }
}

/// 文件上传监听器
class OnUploadFileListener {
  /// 上传完成回调，返回文件 ID、文件大小、文件 URL 和类型
  Function(String id, int size, String url, int type)? onComplete;
  /// 分片哈希完成回调，返回文件 ID、分片哈希和文件哈希
  Function(String id, String partHash, String fileHash)? onHashPartComplete;
  /// 分片哈希进度回调，返回文件 ID、分片索引、分片大小和分片哈希
  Function(String id, int index, int size, String partHash)? onHashPartProgress;
  /// 打开文件回调，返回文件 ID 和文件大小
  Function(String id, int size)? onOpen;
  /// 分片大小回调，返回文件 ID、分片大小和分片数量
  Function(String id, int partSize, int num)? onPartSize;
  /// 上传进度回调，返回文件 ID、文件总大小、已上传流大小和存储大小
  Function(String id, int fileSize, int streamSize, int storageSize)? onUploadProgress;
  /// 获取上传 ID 回调，返回文件 ID 和上传 ID
  Function(String id, String uploadID)? onUploadID;
  /// 分片上传完成回调，返回文件 ID、分片索引、分片大小和分片哈希
  Function(String id, int index, int partSize, String partHash)? onUploadPartComplete;

  OnUploadFileListener({
    this.onComplete,
    this.onHashPartComplete,
    this.onHashPartProgress,
    this.onOpen,
    this.onPartSize,
    this.onUploadID,
    this.onUploadProgress,
    this.onUploadPartComplete,
  });

  /// 调用上传完成回调
  void complete(String id, int size, String url, int type) {
    onComplete?.call(id, size, url, type);
  }

  /// 调用分片哈希完成回调
  void hashPartComplete(String id, String partHash, String fileHash) {
    onHashPartComplete?.call(id, partHash, fileHash);
  }

  /// 调用分片哈希进度回调
  void hashPartProgress(String id, int index, int size, String partHash) {
    onHashPartProgress?.call(id, index, size, partHash);
  }

  /// 调用打开文件回调
  void open(String id, int size) {
    onOpen?.call(id, size);
  }

  /// 调用分片大小回调
  void partSize(String id, int partSize, int num) {
    onPartSize?.call(id, partSize, num);
  }

  /// 调用上传进度回调
  void uploadProgress(String id, int fileSize, int streamSize, int storageSize) {
    onUploadProgress?.call(id, fileSize, streamSize, storageSize);
  }

  /// 调用获取上传 ID 回调
  void uploadID(String id, String uploadID) {
    onUploadID?.call(id, uploadID);
  }

  /// 调用分片上传完成回调
  void uploadPartComplete(String id, int index, int partSize, String partHash) {
    onUploadPartComplete?.call(id, index, partSize, partHash);
  }
}
