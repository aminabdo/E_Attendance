import 'dart:convert';
import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:dio/dio.dart';

abstract class AllClientsRepository {
  Future<List<Data>> getAllClients();
}

class AllOfferRepositoryApi implements AllClientsRepository {
  String urlServer = 'https://qimmaapi.codecaique.com/api';
  bool makeOfferDone;

  @override
  Future<List<Data>> getAllClients() async {
    final Response response =
        await Dio().get('$urlServer/Representative/users_of_representative');
    if (response.statusCode == 200) {
      var responseAsJson = json.decode(response.data.toString());
      int length = Client.fromJson(responseAsJson).data.length;
      List<Data> list = [];
      for (int i = 0; i < length; i++) {
        list.add(Client.fromJson(responseAsJson).data[i]);
      }
      return list;
    } else {
      throw Exception('Can not load posts');
    }
  }
}
