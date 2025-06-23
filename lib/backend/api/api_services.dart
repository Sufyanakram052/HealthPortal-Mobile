import 'package:dio/dio.dart';
import 'package:htca_app/constants/exports.dart';

import 'base_api_services.dart';

enum APIMethods { get, post, put, patch, delete }

class APIService extends BaseAPIService {
  APIService._(); // Singleton instance
  static final APIService instance = APIService._();

  /// Call api
  Future callApi(
    String url,
    APIMethods? method, {
    dynamic data,
    Map<String, dynamic>? headers,
    bool showLoader = false,
    bool showSuccess = false,
    bool showError = true,
    bool isQueryParameters = false,
    Options? options,
  }) async {
    try {
      if (showLoader) CustomDialogs.showLoading();
      if (headers != null) dio.options.headers = headers;
      AppGlobals.showError = showError;

      Response jsonResponse;
      switch (method) {
        case APIMethods.post:
          jsonResponse = await dio.post(url, data: data, options: options);
          break;
        case APIMethods.put:
          jsonResponse = await dio.put(url, data: data);
          break;
        case APIMethods.patch:
          jsonResponse = await dio.patch(url, data: data);
          break;
        case APIMethods.delete:
          isQueryParameters
              ? jsonResponse = await dio.delete(url, queryParameters: data)
              : jsonResponse = await dio.delete(url, data: data);
          break;
        default:
          // APIMethods.get
          jsonResponse = await dio.get(url, queryParameters: data);
          break;
      }

      if (showLoader) CustomDialogs.dismiss();

      int? statusCode = jsonResponse.statusCode;
      appPrint('STATUS CODE: $statusCode');

      if (statusCode == 200 || statusCode == 201) {
        // Success Response
        var result = jsonResponse.data;

        if (showSuccess) {
          CustomToast.show(message: result['message'], success: true);
        }
        return result['data'] ?? result['success'];
      }
    } on DioException catch (error) {
      appPrint('callApi error: $error');
      if (showLoader) CustomDialogs.dismiss();
      return null;
    }
  }
}
