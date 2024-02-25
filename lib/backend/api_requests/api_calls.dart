import 'dart:convert';
import 'dart:typed_data';
import '../schema/structs/index.dart';

import '/flutter_flow/flutter_flow_util.dart';
import 'api_manager.dart';

export 'api_manager.dart' show ApiCallResponse;

const _kPrivateApiFunctionName = 'ffPrivateApiCall';

class ThreadsCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'threads',
      apiUrl: 'https://api.openai.com/v1/threads',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic threadid(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class MessageCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
    String? content = '',
    String? threadid = '',
  }) async {
    final ffApiRequestBody = '''
{
  "role": "user",
  "content": "${content}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'message',
      apiUrl: 'https://api.openai.com/v1/threads/${threadid}/messages',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }
}

class RunCall {
  static Future<ApiCallResponse> call({
    String? threadid = '',
    String? apiKey = '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',
    String? assistantid = 'asst_ygunswMQ0TqVgXJIIod3wnOw',
  }) async {
    final ffApiRequestBody = '''
{
  "assistant_id": "${assistantid}"
}''';
    return ApiManager.instance.makeApiCall(
      callName: 'run',
      apiUrl: 'https://api.openai.com/v1/threads/${threadid}/runs',
      callType: ApiCallType.POST,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      body: ffApiRequestBody,
      bodyType: BodyType.JSON,
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic runid(dynamic response) => getJsonField(
        response,
        r'''$.id''',
      );
}

class RetrieverunCall {
  static Future<ApiCallResponse> call({
    String? threadid = '',
    String? runid = '',
    String? apiKey = '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',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'retrieverun',
      apiUrl: 'https://api.openai.com/v1/threads/${threadid}/runs/${runid}',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {},
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static String? status(dynamic response) => castToType<String>(getJsonField(
        response,
        r'''$.status''',
      ));
}

class MessagesCall {
  static Future<ApiCallResponse> call({
    String? apiKey = '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',
    String? threadid = '',
  }) async {
    return ApiManager.instance.makeApiCall(
      callName: 'messages',
      apiUrl: 'https://api.openai.com/v1/threads/${threadid}/messages',
      callType: ApiCallType.GET,
      headers: {
        'Authorization': 'Bearer ${apiKey}',
        'OpenAI-Beta': 'assistants=v1',
      },
      params: {
        'limit': 1,
      },
      returnBody: true,
      encodeBodyUtf8: false,
      decodeUtf8: false,
      cache: false,
      alwaysAllowBody: false,
    );
  }

  static dynamic data(dynamic response) => getJsonField(
        response,
        r'''$.data[0].content[0]''',
      );
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

String _serializeList(List? list) {
  list ??= <String>[];
  try {
    return json.encode(list);
  } catch (_) {
    return '[]';
  }
}

String _serializeJson(dynamic jsonVar, [bool isList = false]) {
  jsonVar ??= (isList ? [] : {});
  try {
    return json.encode(jsonVar);
  } catch (_) {
    return isList ? '[]' : '{}';
  }
}
