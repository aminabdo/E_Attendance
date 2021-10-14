import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:E_Attendance/utils/app_utils.dart';
import 'package:E_Attendance/utils/base/BasePostResponse.dart';
import 'package:E_Attendance/utils/base/BaseRequest.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../ApiRoute.dart';



Options get options => Options(
  followRedirects: false,
  validateStatus: (status) {
    return status < 500;
  },
  headers: {
    'content-type': 'application/x-www-form-urlencoded',
    'Authorization': AppUtils.userData == null ? '' : 'Bearer ${AppUtils.userData.token}',
    'lang' : AppUtils.getLanguage() ?? 'ar'
  },
);

class BaseApiProvider {
  String baseUrl = "";
  String token = "";

  d1io1() {
    dio.interceptors.clear();

    dio.options.baseUrl = baseUrl;
    return dio;
  }

  Dio dio = Dio();

  FormData formData;

  void printe(Response response) {
    if (response == null) {
      print("null response");
    } else {
      print("response message " + response.statusMessage);
      print("response message " + response.statusCode.toString());
    }
  }

  Future<Response> generalGet(String urlExtension) async {
    try {
      print("options ---> $options");
      Response response = await dio.get(
        ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtension)),
        options: options,
      );

      log("log $urlExtension -> \n $response");
      log("log $urlExtension -> end ---=====-----=-=-=-=-=--==-");
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<Response> generalDelete(String urlExtention) async {
    try {
      Response response = await dio.delete(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options);

      print(response);
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<Response> generalPost(String urlExtention, Map<dynamic, dynamic> request, {bool isForm = false}) async {
    try {
      Response response = await dio.post(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options,
          data: isForm ? FormData.fromMap(request) : request,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      });
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<Response> generalPostUpload(
      String urlExtention, FormData request) async {
    try {
      Response response = await dio.post(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options,
          data: request,
      onSendProgress: (int sent, int total) {
        print("$sent $total");
      });
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<Response> generalPut(
      String urlExtention, Map<dynamic, dynamic> request) async {
    try {
      Response response = await dio.put(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options,
          data: request);
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }

  Future<Response> generalPostObject(
      String urlExtention,BaseRequest request) async {
    try {
      BasePostResponse response = await dio.post(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options,
          data: request);
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }




  Future<Response> generalPatch(String urlExtention, Map<dynamic, dynamic> request) async {
    try {
      Response response = await dio.patch(
          ApiRoutesUpdate().getLink(ApiRoutes.generalGet(urlExtention)),
          options: options,
          data: request).catchError((onError){

      });
      return response;
    } catch (error, stacktrace) {
      print("response 000 ");
      print("Exception occured: $error stackTrace: $stacktrace");
      return null;
    }
  }





}
