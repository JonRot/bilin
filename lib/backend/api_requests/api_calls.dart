import 'dart:convert';

import 'package:flutter/foundation.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class LatlngAPICall {
  static Future<ApiCallResponse> call({
    String? cEPVar = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'latlngAPI',
      apiUrl: 'https://cep.awesomeapi.com.br/json/$cEPVar',
      callType: ApiCallType.GET,
      headers: {},
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? ruaAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.address''',
      ));
  static String? estadoAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.state''',
      ));
  static String? bairroAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.district''',
      ));
  static String? cidadeAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.city''',
      ));
  static String? latAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lat''',
      ));
  static String? lngAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.lng''',
      ));
  static String? cepAPI(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.cep''',
      ));
}

class DistanceAPICall {
  static Future<ApiCallResponse> call({
    String? local1 = '',
    String? local2 = '',
    String? mode = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'distanceAPI',
      apiUrl:
          'https://maps.googleapis.com/maps/api/distancematrix/json?origins=$local1&destinations=$local2&mode=$mode&key=AIzaSyAiz6K04zInyBbdk9aEJjzpNnpcwqqOyfk',
      callType: ApiCallType.GET,
      headers: {},
      params: {
        'local1': local1,
        'local2': local2,
        'mode': mode,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      isStreamingApi: false,
      alwaysAllowBody: false,
    );
  }

  static String? kmDistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].distance.text''',
      ));
  static String? timeDistance(dynamic response) =>
      castToType<String>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.text''',
      ));
  static int? timeDistanceSec(dynamic response) => castToType<int>(getJsonField(
        response,
        r'''$.rows[:].elements[:].duration.value''',
      ));
}

class ApiPagingParams {
  int nextPageNumber = 0;
  int numItems = 0;
  dynamic lastResponse;

  ApiPagingParams({
    required this.nextPageNumber,
    required this.numItems,
    required this.lastResponse,
  });

  @override
  String toString() =>
      'PagingParams(nextPageNumber: $nextPageNumber, numItems: $numItems, lastResponse: $lastResponse,)';
}

String _toEncodable(dynamic item) {
  if (item is DocumentReference) {
    return item.path;
  }
  return item;
}

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("List serialization failed. Returning empty list.");
    }
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar, toEncodable: _toEncodable);
  } catch (_) {
    if (kDebugMode) {
      print("Json serialization failed. Returning empty json.");
    }
    return isList ? '[]' : '{}';
  }
}
