import 'dart:async';

import 'package:qimma/Bles/Model/Requests/AddClientRequest.dart';
import 'package:qimma/Bles/Model/Requests/AddClientToRepresentativeRequest.dart';
import 'package:qimma/Bles/Model/Requests/SetDeptRequest.dart';
import 'package:qimma/Bles/Model/Responses/DeleteClientResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/AddClientResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/AddClientToRepresentativeResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/AllClientsResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/ClientOfRepresentativeResponse.dart';
import 'package:qimma/Bles/Model/Responses/client/SetDeptResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiRoute.dart';

class ClientBloc extends BaseBloc {
  BehaviorSubject<AllClientsResponse> _all_clients =
      BehaviorSubject<AllClientsResponse>();
  BehaviorSubject<SetDeptResponse> _setDept =
      BehaviorSubject<SetDeptResponse>();
  BehaviorSubject<DeleteClientResponse> _delete_client =
      BehaviorSubject<DeleteClientResponse>();
  BehaviorSubject<ClientOfRepresentativeResponse>
      _all_clients_of_representative =
      BehaviorSubject<ClientOfRepresentativeResponse>();
  BehaviorSubject<AddClientToRepresentativeResponse>
      _add_client_to_representative =
      BehaviorSubject<AddClientToRepresentativeResponse>();
  BehaviorSubject<AddClientResponse>
      _add_client =
      BehaviorSubject<AddClientResponse>();

  Future<AllClientsResponse> getAllClients() async {
    _all_clients.value = AllClientsResponse();
    _all_clients.value.loading = true;
    AllClientsResponse response = AllClientsResponse.fromMap(
        (await repository.get(ApiRoutes.all_users())).data);
    _all_clients.value = response;
    _all_clients.value.loading = false;
    return response;
  }

  Future<SetDeptResponse> setDept(
      {int clientId, SetDeptRequest request}) async {


    print("setDept --- >  client id ----->>>> $clientId");
    _setDept.value = SetDeptResponse();
    _setDept.value.loading = true;
    _setDept.value = _setDept.value;
    SetDeptResponse response = SetDeptResponse.fromMap((await repository.post(
            ApiRoutes.setDept(clientId: clientId), request.toJson()))
        .data);
    _setDept.value = response;
    _setDept.value.loading = false;
    _setDept.value = _setDept.value;
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

  Future<DeleteClientResponse> deleteClient({String clientId}) async {
    _delete_client.value = DeleteClientResponse();
    _delete_client.value.loading = true;
    DeleteClientResponse response = DeleteClientResponse.fromMap(
        (await repository.get(ApiRoutes.deleteClient(clientId))).data);
    _delete_client.value = response;
    _delete_client.value.loading = false;
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

  Future<AddClientResponse> addClient(
      AddClientRequest request) async {
    _add_client.value = AddClientResponse();
    _add_client.value.loading = true;
    AddClientResponse response =
            AddClientResponse.fromMap((await repository.post(
                ApiRoutes.addClient(), request.toJson()))
            .data);
    _add_client.value = response;
    _add_client.value.loading = false;
    return response;
  }

  BehaviorSubject<AllClientsResponse> get all_clients => _all_clients;
  BehaviorSubject<SetDeptResponse> get set_dept => _setDept;
  BehaviorSubject<ClientOfRepresentativeResponse>
      get all_clients_of_representative => _all_clients_of_representative;
  BehaviorSubject<AddClientToRepresentativeResponse>
      get add_client_to_representative => _add_client_to_representative;
  BehaviorSubject<AddClientResponse> get add_client => _add_client;
  BehaviorSubject<DeleteClientResponse> get delete_client => _delete_client;

}

final clientBloc = ClientBloc();
