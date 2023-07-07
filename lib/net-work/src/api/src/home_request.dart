import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:web_flutter/config/config.dart';
import 'package:web_flutter/model/model.dart';
import 'package:web_flutter/net-work/request.dart';

class HomeRequest {
  static Future<List<UserModelEntity>?> getUser({
    int status = 0,
  }) async {
    try {
      var params = {
        "status": status,
      };
      var json = await requestClient.get(APIS.user, queryParameters: params)
          as List<dynamic>;
      return json.map((e) => UserModelEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<AccountModelEntity>?> getAccount({
    int status = 0,
  }) async {
    try {
      var params = {
        "status": status,
      };
      var json = await requestClient.get(APIS.account, queryParameters: params)
          as List<dynamic>;
      return json.map((e) => AccountModelEntity.fromJson(e)).toList();
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postBatchTask({
    BatchTaskModelEntity? params,
  }) async {
    try {
      var json = await requestClient.post(APIS.batchTask, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postAccount({
    required String cookie,
    required String dayMaxReport,
    required String serverId,
  }) async {
    try {
      var params = {
        "cookie": cookie,
        "day_max_report": dayMaxReport,
        "server_id": serverId,
      };
      var json = await requestClient.post(APIS.batchAccount, data: params);

      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postDelete({
    required String table,
    required String id,
  }) async {
    try {
      var params = {
        "table": table,
        "id": id,
      };
      var json = await requestClient.post(APIS.delete, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }

  static Future<dynamic> postReason({
    required String reason,
  }) async {
    try {
      var params = {
        "reason": reason,
      };

      var json = await _dio.post(
        APIS.reason,
        data: _convertRequestData(params),
      );
      return json;
    } catch (e) {
      rethrow;
    }
  }

    static Future<dynamic> postAddServer({
    required String iname,
    required String location,
    required String isp,
  }) async {
    try {
      var params = {
        "iname": iname,
        "location": location,
        "isp": isp,
      };
      var json = await _dio.post(
        APIS.addServer,
        data: _convertRequestData(params),
      );
      // var json = await requestClient.post(APIS.batchTask, data: params);
      return json;
    } catch (e) {
      rethrow;
    }
  }
}

Dio _dio = Dio(
  BaseOptions(
    baseUrl: RequestConfig.url,
    connectTimeout: const Duration(milliseconds: RequestConfig.connectTimeout),
  ),
);
_convertRequestData(data) {
  if (data != null) {
    data = jsonDecode(jsonEncode(data));
  }
  return data;
}
