import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:E_Attendance/E_Attendance_user/data/repository/attendance_repository_imp.dart';
import 'package:E_Attendance/pages/spalsh/spalsh_page.dart';
import 'package:E_Attendance/utils/consts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'E_Attendance_user/local/Trans.dart';
import 'admin/users_list.dart';
import 'pages/spalsh/spalsh_page.dart';
import 'utils/app_localization.dart';
import 'widgets/custom_scroll_behavior.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final FirebaseApp app = await Firebase.initializeApp();

  final FirebaseDatabase database = FirebaseDatabase(app: app);
  AttendanceRepositoryImp repositoryImp = AttendanceRepositoryImp();

  runApp(
    MyApp(
      languageCode:
          (await SharedPreferences.getInstance()).getString('langCode') ?? 'ar',
    ),
  );
}

class MyApp extends StatefulWidget {
  final String languageCode;

  const MyApp({Key key, this.languageCode = 'ar'}) : super(key: key);

  static void setLocale(BuildContext context, Locale locale) {
    _MyAppState state = context.findAncestorStateOfType<_MyAppState>();

    state.setState(() {
      state._locale = locale;
    });
  }

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Locale _locale;

  bool _initialized = false;
  bool _error = false;

  // Define an async function to initialize FlutterFire
  void initializeFlutterFire() async {
    try {
      // Wait for Firebase to initialize and set `_initialized` state to true
      await Firebase.initializeApp();
      setState(() {
        log("_initialized = true");
        _initialized = true;
      });
    } catch (e) {
      // Set `_error` state to true if Firebase initialization fails
      setState(() {
        log("_error = true;  ${e}");
        _error = true;
      });
    }
  }

  @override
  void initState() {
    initializeFlutterFire();
    super.initState();
    setLanguage();
  }

  setLanguage() async {
    _locale = Locale(widget.languageCode);
    if (mounted) setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: appName,
      color: mainColor,
      debugShowCheckedModeBanner: false,
      translations: LocalString(),
      locale: Locale('ar'),
      localizationsDelegates: [
        // AppLocalizationsDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      builder: (context, child) {
        ScreenUtil.init(context, designSize: Size(412, 870));
        return AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle.dark.copyWith(
            statusBarColor: Colors.transparent,
          ),
          child: ScrollConfiguration(
            child: child,
            behavior: CustomScrollBehavior(),
          ),
        );
      },
      supportedLocales: [
        const Locale('en'), // English
        const Locale('ar'), // Arabic
      ],
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Builder(
        builder: (context) {
          return Directionality(
            child: SplashPage(),
            //  child: ClientInfoPage(),
            textDirection: Localizations.localeOf(context).languageCode == 'ar'
                ? TextDirection.rtl
                : TextDirection.ltr,
          );
        },
      ),
    );
  }
}

class test {
  test1() async {}
}
