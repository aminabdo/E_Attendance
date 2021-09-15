import 'dart:developer';

import 'package:qimma/Bles/Model/Requests/LoginRequest.dart';
import 'package:qimma/Bles/Model/Requests/SignupRequest.dart';
import 'package:qimma/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:qimma/Bles/Model/Responses/old/auth/SignupResponse.dart';
import 'package:qimma/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiRoute.dart';

class AuthBloc extends BaseBloc {

  BehaviorSubject<LoginResponse> _login = BehaviorSubject<LoginResponse>();
  BehaviorSubject<SignupResponse> _signup = BehaviorSubject<SignupResponse>();

  Future<LoginResponse> login(LoginRequest request) async {

    _login.value = LoginResponse();
    _login.value.loading = true ;
    log("AuthBloc -> login ");
    LoginResponse response = LoginResponse.fromMap((await repository.post(ApiRoutes.login(),request.toJson()))?.data);
    _login.value = response;
    _login.value.loading = false ;

    return response;
  }

  Future<SignupResponse> signup(SignupRequest request) async {
    _signup.value = SignupResponse();
    _signup.value.loading = true ;
    SignupResponse response = SignupResponse.fromMap(await (await (repository.post(ApiRoutes.register(), await request.toJson(), isForm: true))). data);
    _signup.value = response;
    _signup.value.loading = false ;
    return response;
  }

  BehaviorSubject<LoginResponse> get s_login => _login;
}

final authBloc = AuthBloc();