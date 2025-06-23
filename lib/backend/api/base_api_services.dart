import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'package:flutter/services.dart';
import 'package:htca_app/constants/exports.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class BaseAPIService with LogoutMixin {
  String? accessToken;
  String? refreshToken;

  /// instance of Dio
  Dio dio = Dio(
    BaseOptions(
      baseUrl: AppUrls.baseUrlProd,
    ),
  );

  // ChuckInterceptorSingleton chuck = ChuckInterceptorSingleton();

  List<RequestOptions> futureCalls = [];

  void setToken(String? token) {
    if (token != null) {
      accessToken = token;
      dio.options.headers['content-Type'] = 'application/json';
      dio.options.headers["authorization"] = accessToken;
    }
  }

  updateBaseUrl(String baseUrl, {String? token}) {
    dio.options = BaseOptions(baseUrl: baseUrl);
    setToken(token);
  }

  bool usingThisBaseUrl(String baseUrl) {
    return dio.options.baseUrl == baseUrl;
  }

  BaseAPIService() {
    final PrettyDioLogger requestsLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
    );

    /// Add prettyDioLogger into dio interceptor
    dio.interceptors.add(requestsLogger);

    /// Add chuck_interceptor into dio interceptor
    // chuck.attachToDio(dio);

    /// Interceptor wrappers
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (RequestOptions options, RequestInterceptorHandler handler) {
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },

        /// On Dio Error
        onError: (error, handler) {
          appPrint("BaseService onError handler");
          int? statusCode = error.response?.statusCode;
          appPrint('RespData: ${error.response?.data}, status: $statusCode');

          String? errorMsg;
          try {
            errorMsg = error.response?.data?['message'];
          } catch (e) {
            appPrint("Assign errorMsg failed: $e");
            errorMsg = '$e';
          }

          // Dismiss Loader
          CustomDialogs.dismiss();

          /// 400 is thrown when bad request
          if (statusCode == 400) {
            // Show the error message toast
            CustomToast.show(message: errorMsg);
          } else if (statusCode == 401) {
            /// 401 is thrown when access token is expired.
            clearSavedData();
          } else if (statusCode == 403) {
            // Show the error message toast
            CustomToast.show(message: errorMsg);
          } else if (statusCode == 404) {
            // Show the error message toast
            if (AppGlobals.showError) {
              CustomToast.show(message: errorMsg);
            }
          } else if (statusCode == 409) {
            // Show the error message toast
            CustomToast.show(message: errorMsg);
          } else if (statusCode == 412) {
            // Precondition Failed
            // Show the error message toast
            CustomToast.show(message: errorMsg);
          } else if (statusCode == 500) {
            if (AppGlobals.showError) {
              // Show the error message toast
              CustomToast.show(message: 'Internal Server Error');
            }
          } else if (statusCode == 503) {
            // Show the error message toast
            CustomToast.show(message: 'Internal Server Error');
          } else {
            // Show the error message toast
            CustomToast.show(message: errorMsg);
          }

          return handler.next(error);
        },
      ),
    );

    // dio.httpClientAdapter = _createHttpClientAdapter(AppUrls.sslCertificate);
  }

  HttpClientAdapter _createHttpClientAdapter(sslCertificate) {
    final IOHttpClientAdapter adapter = IOHttpClientAdapter();

    adapter.createHttpClient = () {
      SecurityContext securityContext =
          SecurityContext(withTrustedRoots: false);

      try {
        // Load the PEM file
        final Future<ByteData> certificate = rootBundle.load(sslCertificate);
        certificate.then((data) {
          securityContext
              .setTrustedCertificatesBytes(data.buffer.asUint8List());
        });
      } catch (e) {
        appPrint('Error loading SSL certificate: $e');
      }

      return HttpClient(context: securityContext)
        ..badCertificateCallback =
            (X509Certificate cert, String host, int port) {
          return false; // Block untrusted certificates
        };
    };

    return adapter;
  }
}

mixin LogoutMixin {
  void clearSavedData() {
    // StorageHelper.clearData(); // clear saved data
    //
    // isar.writeTxn(() async {
    //   await isar.clear(); //Clean DB
    // });
    //
    // StorageHelper.saveVariable(AppKeys.devMode,
    //     APIService.instance.usingThisBaseUrl(AppUrls.baseUrlDev));
    // Get.offAll(() => const Login());
  }
}
