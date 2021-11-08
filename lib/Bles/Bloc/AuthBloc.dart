import 'dart:developer';
import 'dart:io';

import 'package:E_Attendance/utils/app_utils.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:E_Attendance/Bles/Model/Requests/LoginRequest.dart';
import 'package:E_Attendance/Bles/Model/Requests/SignupRequest.dart';
import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:E_Attendance/Bles/Model/Responses/old/auth/SignupResponse.dart';
import 'package:E_Attendance/utils/base/BaseBloc.dart';
import 'package:rxdart/rxdart.dart';

import '../ApiRoute.dart';

class AuthBloc extends BaseBloc {

  BehaviorSubject<LoginResponse> _login = BehaviorSubject<LoginResponse>();
  BehaviorSubject<SignupResponse> _signup = BehaviorSubject<SignupResponse>();

  Future<LoginResponse> login(LoginRequest user) async {

    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    await database?.reference()?.child('users')?.limitToLast(1000)?.onChildAdded?.forEach((element) {
      if(element.snapshot.value["phone"].toString() == user.eamilOrPhone &&
      element.snapshot.value["active"].toString() == "1" &&
      element.snapshot.value["password"].toString() == user.password){
        var response = LoginResponse(
            status: 1,
            data: UserData(
                firstName: element.snapshot.value['first_name'],
                lastName: element.snapshot.value['last_name'],
                email: element.snapshot.value['email'],
                password: element.snapshot.value['password'],
                phone: element.snapshot.value['phone'],
                lat: element.snapshot.value['lat'],
                lng: element.snapshot.value['lng'],
                time: DateTime.now().toString()
            ),
            message: "done"
        );
        //AppUtils.saveUserData(response.data);
        _login.sink.add(response);

      }

    });

    return LoginResponse(
        status: 0,
        data: UserData(),
        message: "done"
    );
  }

  Future<SignupResponse> signup(SignupRequest user) async {

    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    try {
      await database.reference().child('users').child("${user.phone}ـ${user.password}").set(
          await user.toJson());
    }catch(e){
      log("eroooooo->>> ${e.toString()}");
      await database.reference().child('users').child("${user.phone}").set(
          await user.toJson());
    }
    var userData = SignupResponse(
        status: 1,
        data: UserData(
            firstName: user.firstName,
            lastName: user.lastName,
            email: user.email,
            password: user.password,
            phone: user.phone,
            lat: user.lat,
            lng: user.lng,
            time: DateTime.now().toString(),
            active : "1"
        ),
        message: "done"
    );
    AppUtils.saveUserData(userData.data);
    return userData;

  }

  BehaviorSubject<LoginResponse> get s_login => _login;
}

final authBloc = AuthBloc();