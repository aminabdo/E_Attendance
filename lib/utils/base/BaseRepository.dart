import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:E_Attendance/Bles/api_provider/BaseApiProvider.dart';

import 'BasePostResponse.dart';
import 'BaseRequest.dart';

class BaseRepository{

  BaseApiProvider _apiProvider = BaseApiProvider();

  Future<Response> get(String urlExtention) async {
    Response response = await _apiProvider.generalGet(urlExtention);
    return response;
  }


  Future<Response> delete(String urlExtention) async {
    Response response = await _apiProvider.generalDelete(urlExtention);
    return response;
  }

  Future<Response> post(String urlExtention,Map<dynamic,dynamic> request, {bool isForm = false}) async {
    debugPrint("BaseRepository post request ---->>>>>>   ");
    log(request.toString());


    Response response = await _apiProvider.generalPost(urlExtention,request, isForm: isForm);

    debugPrint("BaseRepository post response ---->>>>>>   ");
    log(response.toString());

    return response;
  }


  Future<Response> put(String urlExtention,Map<dynamic,dynamic> request) async {
    debugPrint("BaseRepository post request ---->>>>>>   ");
    debugPrint(request.toString());


    Response response = await _apiProvider.generalPut(urlExtention,request);

    debugPrint("BaseRepository post response ---->>>>>>   ");
    debugPrint(response.toString());

    return response;
  }
  Future<Response> patch(String urlExtention,Map<dynamic,dynamic> request) async {
    debugPrint("BaseRepository patch request ---->>>>>>   ");
    debugPrint(request.toString());


    Response response = await _apiProvider.generalPatch(urlExtention,request);

    debugPrint("BaseRepository patch response ---->>>>>>   ");
    debugPrint(response.toString());

    return response;
  }

  Future<BasePostResponse> postObject(String urlExtention,BaseRequest request) async {
    debugPrint("BaseRepository post request ---->>>>>>   ");
    debugPrint(request.toString());


    BasePostResponse response = await _apiProvider.generalPostObject(urlExtention,request);

    debugPrint("BaseRepository post response ---->>>>>>   ");
    debugPrint(response.toString());

    return response;
  }

  Future<Response> postUpload(String urlExtention,FormData request) async {
    debugPrint("BaseRepository post request ---->>>>>>   ");
    debugPrint(request.toString());


    Response response = await _apiProvider.generalPostUpload(urlExtention,request);

    debugPrint("BaseRepository post response ---->>>>>>   ");
    debugPrint(response.toString());

    return response;
  }

}