// Copyright 2013 The Flutter Authors. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

// ignore_for_file: public_member_api_docs

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:local_auth/local_auth.dart';


class FingPage extends StatefulWidget {
  @override
  _FingPageState createState() => _FingPageState();
}

class _FingPageState extends State<FingPage> {
  final LocalAuthentication auth = LocalAuthentication();
  _SupportState _supportState = _SupportState.unknown;
  bool _canCheckBiometrics;
  List<BiometricType> _availableBiometrics;
  String _authorized = 'Not Authorized';
  bool _isAuthenticating = false;

  @override
  void initState() {
    super.initState();
    auth.isDeviceSupported().then(
          (isSupported) => setState(() => _supportState = isSupported
          ? _SupportState.supported
          : _SupportState.unsupported),
    );
  }

  Future<void> _checkBiometrics() async {
    bool canCheckBiometrics;
    try {
      canCheckBiometrics = await auth.canCheckBiometrics;
    } on PlatformException catch (e) {
      canCheckBiometrics = false;
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _canCheckBiometrics = canCheckBiometrics;
    });
  }

  Future<void> _getAvailableBiometrics() async {
    List<BiometricType> availableBiometrics;
    try {
      availableBiometrics = await auth.getAvailableBiometrics();
    } on PlatformException catch (e) {
      availableBiometrics = <BiometricType>[];
      print(e);
    }
    if (!mounted) return;

    setState(() {
      _availableBiometrics = availableBiometrics;
    });
  }

  Future<void> _authenticate() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason: 'Let OS determine authentication method',
          useErrorDialogs: true,
          stickyAuth: true);
      setState(() {
        _isAuthenticating = false;
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    setState(
            () => _authorized = authenticated ? 'Authorized' : 'Not Authorized');
  }

  Future<void> _authenticateWithBiometrics() async {
    bool authenticated = false;
    try {
      setState(() {
        _isAuthenticating = true;
        _authorized = 'Authenticating';
      });
      authenticated = await auth.authenticate(
          localizedReason:
          'Scan your fingerprint (or face or whatever) to authenticate',
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true);
      setState(() {
        _isAuthenticating = false;
        _authorized = 'Authenticating';
      });
    } on PlatformException catch (e) {
      print(e);
      setState(() {
        _isAuthenticating = false;
        _authorized = "Error - ${e.message}";
      });
      return;
    }
    if (!mounted) return;

    final String message = authenticated ? 'Authorized' : 'Not Authorized';
    setState(() {
      _authorized = message;
    });
  }

  void _cancelAuthentication() async {
    await auth.stopAuthentication();
    setState(() => _isAuthenticating = false);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: ListView(
          padding: const EdgeInsets.only(top: 30),
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (_supportState == _SupportState.unknown)
                  CircularProgressIndicator()
                else if (_supportState == _SupportState.supported)
                  Text("This device is supported")
                else
                  Text("This device is not supported -> ${_supportState}"),
                Divider(height: 100),
                Text('Can check biometrics: $_canCheckBiometrics\n'),
                ElevatedButton(
                  child: const Text('Check biometrics'),
                  onPressed: _checkBiometrics,
                ),
                Divider(height: 100),
                Text('Available biometrics: $_availableBiometrics\n'),
                ElevatedButton(
                  child: const Text('Get available biometrics'),
                  onPressed: _getAvailableBiometrics,
                ),
                Divider(height: 100),
                Text('Current State: $_authorized\n'),
                (_isAuthenticating)
                    ? ElevatedButton(
                  onPressed: _cancelAuthentication,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Cancel Authentication"),
                      Icon(Icons.cancel),
                    ],
                  ),
                )
                    : Column(
                  children: [
                    ElevatedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Authenticate'),
                          Icon(Icons.perm_device_information),
                        ],
                      ),
                      onPressed: _authenticate,
                    ),
                    ElevatedButton(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(_isAuthenticating
                              ? 'Cancel'
                              : 'Authenticate: biometrics only'),
                          Icon(Icons.fingerprint),
                        ],
                      ),
                      onPressed: _authenticateWithBiometrics,
                    ),
                  ],
                ),
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

// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_screenutil/screenutil.dart';
// import 'package:local_auth/auth_strings.dart';
// import 'package:location/location.dart';
// import 'package:qimma/Bles/Bloc/AuthBloc.dart';
// import 'package:qimma/Bles/Model/Requests/SignupRequest.dart';
// import 'package:qimma/Bles/Model/Responses/old/auth/SignupResponse.dart';
// import 'package:qimma/pages/home/home_page.dart';
// import 'package:qimma/utils/app_patterns.dart';
// import 'package:qimma/utils/app_utils.dart';
// import 'package:qimma/utils/consts.dart';
// import 'package:qimma/widgets/my_app_bar.dart';
// import 'package:qimma/widgets/my_button.dart';
// import 'package:qimma/widgets/my_button2.dart';
// import 'package:qimma/widgets/my_loader.dart';
// import 'package:qimma/widgets/my_text_form_field.dart';
// import 'package:qimma/widgets/signup_background_image.dart';
// import 'package:local_auth/local_auth.dart';
//
//
// class FingurePage extends StatefulWidget {
//   @override
//   _FingurePageState createState() => _FingurePageState();
// }
//
// class _FingurePageState extends State<FingurePage> {
//
//   final ScreenUtil screenUtil = ScreenUtil();
//   final formKey = GlobalKey<FormState>();
//
//   bool loading = false;
//
//   bool pickingLocation = false;
//
//   File profileImage;
//
//   LocationData _locationData;
//
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return LoadingOverlay(
//       isLoading: loading,
//       progressIndicator: Loader(),
//       color: Colors.white,
//       opacity: .5,
//       child: Scaffold(
//         body: Container(
//           width: size.width,
//           height: size.height,
//           child: Stack(
//             children: [
//               SignupBackgroundImage(),
//               SingleChildScrollView(
//                 child: Padding(
//                   padding: EdgeInsets.all(screenUtil.setWidth(10.0)),
//                   child: Column(
//                     children: [
//                       Text("enter your fingur print"),
//                       Column(
//
//                       ),
//                       space(),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           MyAppBar(
//                             text: AppUtils.translate(
//                                 context, 'register_new_account'),
//                           ),
//                           Expanded(
//                             child: Container(
//                               height: screenUtil.setHeight(120),
//                               decoration: BoxDecoration(
//                                 image: DecorationImage(
//                                   image: Image.asset('assets/images/logo.jpeg')
//                                       .image,
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                       SizedBox(
//                           height: MediaQuery.of(context).padding.top
//                       ),
//                       space(),
//                       GestureDetector(
//                         onTap: () async {
//
//                           var localAuth = LocalAuthentication();
//                           bool didAuthenticate =
//                           await localAuth.authenticate(
//                               localizedReason: 'Please authenticate to show account balance');
//
//                           didAuthenticate = await localAuth.authenticate(
//                               localizedReason: 'Please authenticate to show account balance',
//                               biometricOnly: true);
//
//                           didAuthenticate =
//                           await localAuth.authenticate(
//                               localizedReason: 'Please authenticate to show account balance',
//                               useErrorDialogs: false);
//
//                           bool canCheckBiometrics =
//                           await localAuth.canCheckBiometrics;
//
//
//                           const iosStrings = const IOSAuthMessages(
//                               cancelButton: 'cancel',
//                               goToSettingsButton: 'settings',
//                               goToSettingsDescription: 'Please set up your Touch ID.',
//                               lockOut: 'Please reenable your Touch ID');
//                           await localAuth.authenticate(
//                               localizedReason: 'Please authenticate to show account balance',
//                               useErrorDialogs: false,
//                               iOSAuthStrings: iosStrings);
//
//
//                           List<BiometricType> availableBiometrics =
//                           await auth.getAvailableBiometrics();
//
//                           if (Platform.isIOS) {
//                             if (availableBiometrics.contains(BiometricType.face)) {
//                               // Face ID.
//                             } else if (availableBiometrics.contains(BiometricType.fingerprint)) {
//                               // Touch ID.
//                             }
//                           }
//                         },
//                         child: CircleAvatar(
//                           radius: 200,
//                           backgroundImage: profileImage == null
//                               ? Image.asset('assets/images/fing.png').image
//                               : Image.file(profileImage).image,
//                         ),
//                       ),
//                       space(),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget space() {
//     return SizedBox(
//       height: 30,
//     );
//   }
//
//
//
//
//   final LocalAuthentication auth = LocalAuthentication();
//   _SupportState _supportState = _SupportState.unknown;
//   bool _canCheckBiometrics;
//   List<BiometricType> _availableBiometrics;
//   String _authorized = 'Not Authorized';
//   bool _isAuthenticating = false;
//
//
//   Future<void> _authenticateWithBiometrics() async {
//     bool authenticated = false;
//     try {
//       setState(() {
//         _isAuthenticating = true;
//         _authorized = 'Authenticating';
//       });
//       authenticated = await auth.authenticate(
//           localizedReason:
//           'Scan your fingerprint (or face or whatever) to authenticate',
//           useErrorDialogs: true,
//           stickyAuth: true,
//           biometricOnly: true);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = 'Authenticating';
//       });
//     } on PlatformException catch (e) {
//       print(e);
//       setState(() {
//         _isAuthenticating = false;
//         _authorized = "Error - ${e.message}";
//       });
//       return;
//     }
//     if (!mounted) return;
//
//     final String message = authenticated ? 'Authorized' : 'Not Authorized';
//     setState(() {
//       _authorized = message;
//     });
//   }
//
//   void _cancelAuthentication() async {
//     await auth.stopAuthentication();
//     setState(() => _isAuthenticating = false);
//   }
// }
// enum _SupportState {
//   unknown,
//   supported,
//   unsupported,
// }
