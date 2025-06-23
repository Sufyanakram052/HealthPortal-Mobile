//
// // import 'package:chuck_interceptor/chuck.dart';
// import 'package:dio/dio.dart';
// import 'package:flutter/foundation.dart';
//
// import '../constants/globals.dart';
//
// class ChuckInterceptorSingleton {
//   static final ChuckInterceptorSingleton _instance =
//       ChuckInterceptorSingleton._internal();
//   late final Chuck chuck;
//
//   factory ChuckInterceptorSingleton() {
//     return _instance;
//   }
//
//   ChuckInterceptorSingleton._internal() {
//     chuck = Chuck(
//       showNotification: true, //Constants.isInterceptorEnable,
//       navigatorKey: AppGlobals.navigatorKey,
//       showInspectorOnShake: true,
//       // notificationIcon: 'app_icon',
//     );
//   }
//
//   void showInspector() {
//     chuck.showInspector();
//   }
//
//   void attachToDio(Dio dio) {
//     dio.interceptors.add(chuck.getDioInterceptor());
//   }
// }
