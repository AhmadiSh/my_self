import 'dart:io';

import 'package:dio/dio.dart';
import 'package:my_self/core/network/dio_connectivity_request_retrier.dart';
import 'package:my_self/core/utils/logger_helper.dart';


class RetryOnConnectionChangeInterceptor extends Interceptor {
  RetryOnConnectionChangeInterceptor({
    required this.requestRetrier,
  });

  final DioConnectivityRequestRetrier requestRetrier;

  @override
  // ignore: avoid_renaming_method_parameters
  Future<void> onError(DioError err, ErrorInterceptorHandler errorInterceptorHandler) async {
    if (_shouldRetry(err)) {
      try {
        errorInterceptorHandler.resolve(await requestRetrier.scheduleRequestRetry(err.requestOptions));
      } catch (e) {
        LoggerHelper.logger.e(e);
      }
    }
    errorInterceptorHandler.next(err);
  }

  bool _shouldRetry(DioError err) => err.error != null && err.error is SocketException;
}
