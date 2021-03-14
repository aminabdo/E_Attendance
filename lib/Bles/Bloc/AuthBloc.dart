import 'package:qimma/Bles/Model/Requests/LoginRequest.dart';
import 'package:qimma/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiRoute.dart';

class AuthBloc extends BaseBloc {

  BehaviorSubject<LoginResponse> _login = BehaviorSubject<LoginResponse>();

  Future<LoginResponse> login(LoginRequest request) async {
    _login.value = LoginResponse();
    _login.value.loading = true ;
    LoginResponse response = LoginResponse.fromMap((await repository.post(ApiRoutes.login(),request.toJson())).data);
    _login.value = response;
    _login.value.loading = false ;
    return response;
  }

  BehaviorSubject<LoginResponse> get s_login => _login;
}

final authBloc = AuthBloc();