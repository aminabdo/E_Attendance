// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:location/location.dart';
import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/utils/app_utils.dart';

class FingPage extends StatefulWidget {
  @override
  _FingPageState createState() => _FingPageState();
}

class _FingPageState extends State<FingPage> {
  final LocalAuthentication auth = LocalAuthentication();

  String fingerPrint = "";
  bool pickingLocation = false;
  LocationData _locationData;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => isSupported
              ? _SupportState.supported
              : _SupportState.unsupported),
        );
  }
  // ()? -1 : -2;
    Future<void> _authenticateWithBiometrics(bool checkin) async {
      getLocation(checkin);
      return;
    bool authenticated = false;
    try {
      authenticated = await auth.authenticate(
          localizedReason:
              'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      fingerPrint = authenticated.toString();
      getLocation(checkin);
    } on PlatformException catch (e) {
      AppUtils.showToast(msg: "feature_not_enable".tr);

      return;
    }
    if (!mounted) return;


  }

  void getLocation(bool checkin) async {
    var locationPermissionGranted = await AppUtils.askLocationPermission();
    if (locationPermissionGranted) {
      Location location = new Location();

      bool _serviceEnabled;
      PermissionStatus _permissionGranted;

      _serviceEnabled = await location.serviceEnabled();
      if (!_serviceEnabled) {
        _serviceEnabled = await location.requestService();
        if (!_serviceEnabled) {
          AppUtils.showToast(msg: 'open_gps'.tr);
          setState(() {
            pickingLocation = false;
          });
          return;
        }
      }

      _permissionGranted = await location.hasPermission();
      if (_permissionGranted == PermissionStatus.DENIED) {
        _permissionGranted = await location.requestPermission();
        if (_permissionGranted != PermissionStatus.GRANTED) {
          AppUtils.showToast(msg: 'permission_denied'.tr);
          setState(() {
            pickingLocation = false;
          });
          return;
        }
      }

      _locationData = await location.getLocation();

      if (Geolocator.distanceBetween(
          _locationData.latitude,
          _locationData.longitude,
          _locationData.latitude,
          _locationData.longitude) <
          100) {
        AppUtils.showToast(msg: "location in range done");
        AttendanceRepositoryImp repo = AttendanceRepositoryImp();
        UserData user = (await AppUtils.getUserData()) ?? UserData();
        user.lat = "${_locationData.latitude}";
        user.lng = "${_locationData.longitude}";
        if (checkin) {
          log("1111111");
          repo.checkin(user: user);
        } else {
          log("2222222");
          repo.checkout(user: user);
        }
      } else {
        AppUtils.showToast(msg: "location is so far your comapny");
      }
      setState(() {
        pickingLocation = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            Column(
              children: [
                GestureDetector(
                  onTap: () {
                    _authenticateWithBiometrics(true);
                  },
                  child: Image.asset('assets/images/logoo.jpeg'),
                ), // image logo
                MaterialButton(
                  onPressed: () {
                    _authenticateWithBiometrics(true);
                  },
                  child: Text('check_in'.tr),
                ),  // checkin
                MaterialButton(
                  onPressed: () {
                    _authenticateWithBiometrics(false);
                  },
                  child: Text("check_out".tr),
                ),  // checkout
              ],
            ),
          ],
        ),
      ),
    );
  }



}

enum _SupportState {
  unknown,
  supported,
  unsupported,
}
