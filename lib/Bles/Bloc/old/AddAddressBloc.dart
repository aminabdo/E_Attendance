import 'package:qimma/Bles/Model/Requests/AddAddressRequest.dart';
import 'package:qimma/Bles/Model/Responses/old/address/AddAddressResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../../ApiRoute.dart';

class AddressBloc extends BaseBloc {

  BehaviorSubject<AddAddressResponse> _add_address = BehaviorSubject<AddAddressResponse>();

  Future<AddAddressResponse> add_address(AddAddressRequest request) async {
    _add_address.value = AddAddressResponse();
    _add_address.value.loading = true ;
    AddAddressResponse response =
    AddAddressResponse.fromMap((await (await repository.post(ApiRoutes.add_address(), request.toJson(), isForm: false)).data));
    _add_address.value = response;
    _add_address.value.loading = false ;

    return response;
  }

  BehaviorSubject<AddAddressResponse> get s_add_address => _add_address;
}

final addressBloc = AddressBloc();
