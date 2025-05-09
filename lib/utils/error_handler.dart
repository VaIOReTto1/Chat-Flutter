import 'package:dio/dio.dart';

class SDKException implements Exception {
  final String message;
  SDKException(this.message);
}

class ErrorHandler {
  static SDKException handleDioError(DioException e) {
    if (e.response != null) {
      switch (e.response!.statusCode) {
        case 400:
          return SDKException('请求参数错误');
        case 401:
          return SDKException('未授权');
        case 500:
          return SDKException('服务器内部错误');
        default:
          return SDKException('网络错误');
      }
    } else {
      return SDKException('网络连接失败');
    }
  }
}
