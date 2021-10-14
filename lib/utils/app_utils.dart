import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_absolute_path/flutter_absolute_path.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:multi_image_picker/multi_image_picker.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:E_Attendance/Bles/Model/Responses/login/LoginResponse.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'app_localization.dart';

class AppUtils {
  static String firebaseToken;
  static FirebaseMessaging firebaseMesseging = FirebaseMessaging();

  static UserData userData;

  // language
  static String language;

  static Future<String> loadSavedLanguage() async {
    language = (await SharedPreferences.getInstance()).getString('langCode');
    return language;
  }

  static saveLanguage(String languag) async {
    print("saveLanguage  ---->>>> ${languag}");
    language = languag;
    (await SharedPreferences.getInstance()).setString('langCode', language);
  }

  static String getLanguage() {
    return language;
  }

  static hideKeyboard(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  static String translate(BuildContext context, String key) {
    if (context == null) {
      log("nuuuuuuuuuuulll");
    }
    return AppLocalization.of(context)?.translate(key) ?? 'no translation';
  }

  // method to save last user login data
  static saveUserData(UserData responseBody) {
    SharedPreferences.getInstance().then((pref) {
      String data = jsonEncode(responseBody);
      pref.setString('currentUser', data);
    });
  }

  // method to load last user login data
  static Future<UserData> getUserData() async {
    UserData currentUser;
    SharedPreferences pref = await SharedPreferences.getInstance();
    if (pref.getString('currentUser') == null) {
      return null;
    }
    Map<String, dynamic> currentUserData =
        json.decode(pref.getString('currentUser'));
    currentUser = UserData.fromMap(currentUserData);
    return currentUser;
  }

  static removeUserData() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.remove('currentUser');
  }

  static showToast({@required msg, Color bgColor}) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.BOTTOM,
      backgroundColor: bgColor ?? Colors.red,
      textColor: Colors.white,
      fontSize: 16.0,
    );
  }

  // true if granted : false if denied
  static Future<bool> askPhotosPermission() async {
    bool permissionState = false;
    await PermissionHandler().requestPermissions([
      PermissionGroup.photos,
    ]).then(
      (Map<PermissionGroup, PermissionStatus> map) {
        if (map[PermissionGroup.photos] == PermissionStatus.granted) {
          permissionState = true;
        } else {
          permissionState = false;
        }
      },
    );

    print('state of permission >>>> $permissionState');
    return permissionState;
  }

  // true if granted : false if denied
  static Future<bool> askCameraPermission() async {
    bool permissionState = false;
    await PermissionHandler().requestPermissions([
      PermissionGroup.camera,
    ]).then(
      (Map<PermissionGroup, PermissionStatus> map) {
        if (map[PermissionGroup.camera] == PermissionStatus.granted) {
          permissionState = true;
        } else {
          permissionState = false;
        }
      },
    );

    print('state of permission >>>> $permissionState');
    return permissionState;
  }

  // true if granted : false if denied
  static Future<bool> checkPermissionState(PermissionGroup permissions) async {
    bool permissionState = false;
    await PermissionHandler().checkPermissionStatus(permissions).then(
      (state) {
        if (state == PermissionStatus.granted) {
          permissionState = true;
        } else {
          permissionState = false;
        }
      },
    );
    return permissionState;
  }

  // true if granted : false if denied
  static Future<bool> askLocationPermission() async {
    bool permissionState = false;
    await PermissionHandler().requestPermissions([
      PermissionGroup.location,
    ]).then(
      (Map<PermissionGroup, PermissionStatus> map) {
        if (map[PermissionGroup.location] == PermissionStatus.granted) {
          permissionState = true;
        } else {
          permissionState = false;
        }
      },
    );

    print('state of permission >>>> $permissionState');
    return permissionState;
  }

  static Future<List<File>> getImage(int maxNumber) async {
    bool permissionIsGranted = await AppUtils.askPhotosPermission();
    if (permissionIsGranted) {
      try {
        var selectedImage = await MultiImagePicker.pickImages(
          maxImages: maxNumber,
          cupertinoOptions: CupertinoOptions(takePhotoIcon: "Qimma"),
          materialOptions: MaterialOptions(
            actionBarColor: "#ff16135A",
            actionBarTitle: 'Qimma',
            allViewTitle: "All Photos",
            useDetailsView: false,
            autoCloseOnSelectionLimit: false,
            startInAllView: false,
            selectCircleStrokeColor: "#000000",
          ),
        );

        List<File> files;

        if (selectedImage != null) {
          // print file path
          files = [];
          for (int i = 0; i < selectedImage.length; i++) {
            var path = await FlutterAbsolutePath.getAbsolutePath(
              selectedImage[0].identifier,
            );

            files.add(File(path));
          }

          return files;
        }

        return null;
      } catch (e) {
        print(e);
        return null;
      }
    } else {
      AppUtils.showToast(msg: 'Accept Permission First');
      return null;
    }
  }

  static String calcDate(BuildContext context, String date) {
    var res = DateTime.now().difference(DateTime.parse(date)).inMinutes;
    if (res < 60) {
      return "${res.toString()}   ${AppUtils.translate(context, 'minutes')}";
    }
    res = DateTime.now().difference(DateTime.parse(date)).inHours;

    if (res < 24) {
      return "${res.toString()}   ${AppUtils.translate(context, 'hours')}";
    }
    res = DateTime.now().difference(DateTime.parse(date)).inDays;

    return "${res.toString()}   ${AppUtils.translate(context, 'days')}";
  }

  static void exitFromApp() {
    exit(0);
  }
}
