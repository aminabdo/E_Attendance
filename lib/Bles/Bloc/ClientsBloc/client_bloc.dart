import 'dart:async';

import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class ClientBloc extends BaseBloc {
  BehaviorSubject<AllClientsResponse> _all_clents =
      BehaviorSubject<AllClientsResponse>();

  Future<AllClientsResponse> getAllClients() async {
    _all_clents.value = AllClientsResponse();
    _all_clents.value.loading = true;
    AllClientsResponse response = AllClientsResponse.fromMap(
        (await repository.get(ApiRoutes.all_users())).data);
    _all_clents.value = response;
    _all_clents.value.loading = false;
    return response;
  }

  BehaviorSubject<AllClientsResponse> get all_clents => _all_clents;
}

final clientBloc = ClientBloc();
