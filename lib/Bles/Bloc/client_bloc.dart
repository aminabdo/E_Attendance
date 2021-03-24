import 'dart:async';

import 'package:qimma/Bles/Model/Requests/AddClientToRepresentativeRequest.dart';
import 'package:qimma/Bles/Model/Responses/client/AddClientToRepresentativeResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/ClientOfRepresentativeResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiRoute.dart';

class ClientBloc extends BaseBloc {
  BehaviorSubject<AllClientsResponse> _all_clients =
      BehaviorSubject<AllClientsResponse>();
  BehaviorSubject<ClientOfRepresentativeResponse>
      _all_clients_of_representative =
      BehaviorSubject<ClientOfRepresentativeResponse>();
  BehaviorSubject<AddClientToRepresentativeResponse>
      _add_client_to_representative =
      BehaviorSubject<AddClientToRepresentativeResponse>();

  Future<AllClientsResponse> getAllClients() async {
    _all_clients.value = AllClientsResponse();
    _all_clients.value.loading = true;
    AllClientsResponse response = AllClientsResponse.fromMap(
        (await repository.get(ApiRoutes.all_users())).data);
    _all_clients.value = response;
    _all_clients.value.loading = false;
    return response;
  }

  Future<ClientOfRepresentativeResponse> getClientsOfRepresentative() async {
    _all_clients_of_representative.value = ClientOfRepresentativeResponse();
    _all_clients_of_representative.value.loading = true;
    ClientOfRepresentativeResponse response =
        ClientOfRepresentativeResponse.fromMap(
            (await repository.get(ApiRoutes.getClientsOfRepresentative()))
                .data);
    _all_clients_of_representative.value = response;
    _all_clients_of_representative.value.loading = false;
    return response;
  }

  Future<AddClientToRepresentativeResponse> addClientToRepresentative(
      AddClientToRepresentativeRequest request) async {
    _add_client_to_representative.value = AddClientToRepresentativeResponse();
    _add_client_to_representative.value.loading = true;
    AddClientToRepresentativeResponse response =
        AddClientToRepresentativeResponse.fromMap((await repository.post(
                ApiRoutes.addClientToRepresentative(), request.toJson()))
            .data);
    _add_client_to_representative.value = response;
    _add_client_to_representative.value.loading = false;
    return response;
  }

  BehaviorSubject<AllClientsResponse> get all_clients => _all_clients;
  BehaviorSubject<ClientOfRepresentativeResponse>
      get all_clients_of_representative => _all_clients_of_representative;
  BehaviorSubject<AddClientToRepresentativeResponse>
      get add_client_to_representative => _add_client_to_representative;
}

final clientBloc = ClientBloc();
