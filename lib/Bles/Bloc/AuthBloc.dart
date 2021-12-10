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

class AuthBloc extends BaseBloc {

  BehaviorSubject<LoginResponse> _login = BehaviorSubject<LoginResponse>();
  BehaviorSubject<SignupResponse> _signup = BehaviorSubject<SignupResponse>();

  Future<LoginResponse> login(LoginRequest user) async {
    bool logined = false ;
    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);
    await database?.reference()?.child('users')?.once()?.then((snapshot) async {
      Map<String, dynamic> element = Map<String, dynamic>.from(snapshot.value as Map<dynamic, dynamic>);
      await element.forEach((key, element) {
        log("log ---> ${element}");
        if((element["phone"].toString() == user.eamilOrPhone
            ||element["email"].toString() == user.eamilOrPhone) &&
            element["password"].toString() == user.password){
          logined = true ;
          var response = LoginResponse(
              status: 1,
              data: UserData(
                firstName: element['first_name'],
                lastName: element['last_name'],
                email: element['email'],
                password: element['password'],
                phone: element['phone'],
                lat: element['lat'],
                lng: element['lng'],
                time: DateTime.now().toString(),
                type: element['type'],
                active: element['active'],
              ),
              message: "done"
          );
          //AppUtils.saveUserData(response.data);
          _login.sink.add(response);
        }
      });

      if(!logined){
        _login.sink.add(LoginResponse(
            status: 0,
            data: UserData(),
            message: "error username or password"
        ));
      }
    });
  }

  Future<SignupResponse> signup(SignupRequest user) async {

    final FirebaseApp app = await Firebase.initializeApp();
    final FirebaseDatabase database = FirebaseDatabase(app: app);

    try {
      await database.reference().child('users').child("${user.phone}").set(
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
    return userData;
  }
  BehaviorSubject<LoginResponse> get s_login => _login;
}

final authBloc = AuthBloc();