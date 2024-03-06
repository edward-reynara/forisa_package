// import 'dart:io';
//
// import '../models/platform_model.dart';
// import '../services/PlatformService.dart';
// import '../utils/CryptoUtil.dart';
// import '../utils/FormatUtil.dart';
// import 'package:dio/dio.dart' as HttpClient;
// import 'package:flutter_secure_storage/flutter_secure_storage.dart';
// import 'package:get/instance_manager.dart';
//
// class APIProvider {
//   final FlutterSecureStorage secureStorage = const FlutterSecureStorage();
//   final PlatformService _platformService = Get.find<PlatformService>();
//
//   static const String SUCCESS_API_CODE = '000000';
//   static const String INVALID_TOKEN_API_CODE = '800000';
//   static const String INPUT_ERROR_API_CODE = '100000';
//   static const String GENERAL_ERROR_API_CODE = '999999';
//   static const String INVALID_AUTHCODE_API_CODE = '800001';
//   static const String INVALID_VERSION_API_CODE = '800002';
//   static const PAGE_SIZE = 10;
//   static const PAGE_INIT = 1;
//   String apiUrl = "";
//   String clientAppCode = "";
//   String clientApiId = "";
//   String clientApiKey = "";
//
//   HttpClient.BaseOptions? baseOptions;
//   HttpClient.Dio? apiClient;
//   HttpClient.Dio? unAuthClient;
//   static final HttpClient.Dio _rawApiClient = HttpClient.Dio();
//   // static DioCacheManager? _cacheManager;
//
//   APIProvider({required this.apiUrl, required String clientAppCode, required String clientApiId, required String clientApiKey})
//       : baseOptions = HttpClient.BaseOptions(
//     baseUrl: apiUrl,
//     connectTimeout: const Duration(milliseconds: 10000),
//     receiveTimeout: const Duration(milliseconds: 100000),
//     followRedirects: true,
//     headers: {
//       "Accept": "application/json",
//       "X-Requested-With": "XMLHttpRequest",
//     },
//   ) {
//     apiClient ??= HttpClient.Dio(baseOptions);
//
//     // apiClient!.interceptors.add(getCacheManager().interceptor);
//     apiClient!.interceptors.add(
//       HttpClient.InterceptorsWrapper(
//           onResponse: (response, handler) {
//         // print('resp interceptor : ${response.data}');
//
//         return handler.next(response);
//       }, onRequest: (options, handler) async {
//         // print('req interceptor');
//
//         options.headers.addAll(await getAuthorizedHeader());
//
//         // print('Dio : ${options.uri.path}');
//         // print('Dio : ${options.queryParameters.toString()}');
//
//         return handler.next(options);
//       }, onError: (HttpClient.DioException e, handler) {
//         print(e.message);
//         return handler.next(e);
//       }),
//     );
//   }
//
//   Future<Map<String, String>> getAuthorizedHeader() async {
//     String? token = await secureStorage.read(key: 'token');
//     String reqTime = FormatUtil.formatIdDate(FormatDateType.reqtime_header, DateTime.now());
//     PlatformModel platformModel = await _platformService.getPlatformInfo();
//
//     Map<String, String> headers = {};
//
//     if (token != null) {
//       headers['Authorization'] = 'Bearer $token';
//     }
//     headers['appcode'] = clientAppCode;
//     headers['ostype'] = Platform.operatingSystem;
//     headers['osver'] = platformModel.buildNumber;
//     headers['clientid'] = clientApiId;
//     headers['authcode'] =
//         CryptoUtil.genAuthCodeHeader(clientApiKey, clientAppCode, '0', reqTime);
//     headers['reqtime'] = reqTime;
//
//     return headers;
//   }
//
//   HttpClient.Dio getUnAuthApiClient({HttpClient.BaseOptions? options}) {
//     unAuthClient ??= HttpClient.Dio(options ??
//           HttpClient.BaseOptions(
//               baseUrl: apiUrl,
//               connectTimeout: const Duration(milliseconds: 20000),
//               receiveTimeout: const Duration(milliseconds: 100000),
//               headers: {
//                 "Accept": "application/json",
//                 "X-Requested-With": "XMLHttpRequest",
//               }));
//
//     return unAuthClient!;
//   }
//
//   HttpClient.Dio getApiClient() {
//     return apiClient!;
//   }
//
//   static HttpClient.Dio getRawApiClient() {
//     return _rawApiClient;
//   }
//
//   // static HttpClient.Options getCacheOptions() =>
//   //     buildCacheOptions(Duration(days: 1), maxStale: Duration(days: 2));
//
//   // static DioCacheManager getCacheManager() {
//   //   if (_cacheManager == null) {
//   //     _cacheManager = DioCacheManager(CacheConfig(
//   //       baseUrl: ConfigApp.apiUrl,
//   //     ));
//   //   }
//   //
//   //   return _cacheManager!;
//   // }
// }
