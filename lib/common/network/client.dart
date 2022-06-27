import 'dart:convert';
import 'dart:io';
import 'package:dsvm_app/common/local/local_app.dart';
import 'package:dsvm_app/common/utils/format_util.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../constants/string_constants.dart';
import '../exceptions/connect_exception.dart';
import '../exceptions/server_exception.dart';
import '../exceptions/timeout_exception.dart';
import '../exceptions/token_expired_exception.dart';
import '../global/global_app_cache.dart';
import 'app_header.dart';
import 'configs.dart';

class  AppClient {
  AppHeader? header;
  final GlobalAppCache globalAppCatch;
  final LocalApp localApp;

  AppClient(this.globalAppCatch, this.localApp);

  // void setHeader(AppHeader header) {
  //   String? source =
  //       localApp.getDataFromLocal(KeySaveLocalConstant.saveSourceInstall);
  //   AppPosition? currentPosition = globalAppCatch.appPosition;
  //
  //   // gán tọa độ của user hiện tại
  //   if (header.lat == null || header.lat == 0) {
  //     header.lat = currentPosition?.latitude;
  //   }
  //   if (header.lng == null || header.lng == 0) {
  //     header.lng = currentPosition?.longitude;
  //   }
  //
  //   // nếu vẫn ko có thì gán tọa độ defaut của app
  //   if (header.lat == null || header.lat == 0) {
  //     header.lat = Configurations.latGstore;
  //   }
  //   if (header.lng == null || header.lng == 0) {
  //     header.lng = Configurations.lngGstore;
  //   }
  //
  //   header.source = source;
  //   this.header = header;
  // }

  Future<Map> get(
    String endPoint, {
    bool handleData = true,
    bool reRun =
        false, // = true. dùng trong TH token đc refresh lại và chạy lại
  }) async {
    await _checkConnectionAndPosition();
    var url = Uri.parse('${Configurations.host}$endPoint');
    Response? response;
    String fullRequets = '';
    var data;
    try {
      response = await http.get(url, headers: header?.toJson() ?? {}).timeout(
          Duration(seconds: Configurations.connectTimeout), onTimeout: () {
        throw TimeOutException();
      });
      fullRequets = 'endPoint: ${Configurations.host}$endPoint \n'
          'Token: ${header?.accessToken} \n'
          'Response: ${response.body} \n';
      data = json.decode(response.body);
    } catch (e) {
      if (e.runtimeType == TimeOutException) {
        throw TimeOutException();
      }
      throw ServerException();
    }

    if (!handleData) {
      return data;
    }
    bool checkExpired =
        _handleErrorCode(data, fullRequest: fullRequets, isPost: false);
    if (checkExpired) {
      if (reRun) {
        throw TokenExpiredException(errorText: fullRequets);
      }
      return await get(endPoint, handleData: handleData, reRun: true);
    }
    return data;
  }

  Future<Map> post(
    String endPoint, {
    dynamic body,
    String? contentType,
    bool handleResponse = true,
    bool encodeBody = true,
    bool formData = false,
    bool reRun = false,
  }) async {
    await _checkConnectionAndPosition();
    var url = Uri.parse('${Configurations.host}$endPoint');
    String resultResponse = '';
    Map<String, dynamic> data = {};
    String fullRequets = '';
    try {
      if (formData) {
        var request = http.MultipartRequest('POST', url)
          ..fields.addAll(FormatUtils.convertInternalLinkedHashMapToMap(body));
        request.headers.addAll(header?.toJson() ?? {});
        var response = await request.send().timeout(
            Duration(seconds: Configurations.connectTimeout), onTimeout: () {
          throw TimeOutException();
        });
        resultResponse = await response.stream.bytesToString();
      } else {
        Response? response = await http
            .post(
          url,
          body: body != null ? (encodeBody ? json.encode(body) : body) : null,
          headers: header?.toJson() ?? {},
        )
            .timeout(Duration(seconds: Configurations.connectTimeout),
                onTimeout: () {
          throw TimeOutException();
        });
        resultResponse = response.body;
      }

      fullRequets = 'endPoint: ${Configurations.host}$endPoint\n'
          'Token: ${header?.accessToken}\n'
          'body: $body\n'
          'Response: $resultResponse\n';
      data = json.decode(resultResponse);
      if (!handleResponse) {
        return data;
      }
    } catch (e) {
      if (e.runtimeType == TimeOutException) {
        throw TimeOutException();
      }
      throw ServerException();
    }

    // check expired token
    bool checkExpired = _handleErrorCode(data, fullRequest: fullRequets);
    if (checkExpired) {
      if (reRun) {
        throw TokenExpiredException(errorText: fullRequets);
      }
      final dataNew = await post(
        endPoint,
        reRun: true,
        body: body,
        formData: formData,
        contentType: contentType,
        encodeBody: encodeBody,
        handleResponse: handleResponse,
      );
      return dataNew;
    }
    return data;
  }


  Future _checkConnectionAndPosition() async {
    try {
      final result = await InternetAddress.lookup('google.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {}
    } catch (e) {
      throw ConnectException(message: StringConst.connectError);
    }
  }

  bool _handleErrorCode(Map<String, dynamic> body,
      {String? fullRequest, bool isPost = true}) {
    if (body['Code'] == 423) {
      /// Xóa tài khoản từ admin
      throw TokenExpiredException();
    }
    if (body['Code'] == 401) {
      return true;
    }
    if (body['Code'] != 200) {
      throw ServerException(
        message: body['Message'],
        errorCode: body['Code'],
        errorText: '$fullRequest',
      );
    }
    return false;
  }
}
