import 'package:civil_manager/utils/routes/routes.dart';
import 'package:civil_manager/utils/routes/routes_name.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_theme.dart';
import 'package:civil_manager/view_model/auth_view_model.dart';
import 'package:civil_manager/view_model/labour_list_for_attendence_view_model.dart';
import 'package:civil_manager/view_model/labour_reg_view_model.dart';
import 'package:civil_manager/view_model/material_view_model.dart';
import 'package:civil_manager/view_model/receiving_history_view_model.dart';
import 'package:civil_manager/view_model/user_view_model.dart';
import 'package:flutter/material.dart';
import 'package:civil_manager/view/flutter_flow/flutter_flow_util.dart';
import 'package:civil_manager/view/flutter_flow/internationalization.dart';
import 'package:civil_manager/view/flutter_flow/nav/nav.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await FlutterFlowTheme.initialize();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  State<MyApp> createState() => _MyAppState();

  static _MyAppState of(BuildContext context) =>
      context.findAncestorStateOfType<_MyAppState>()!;
}

class _MyAppState extends State<MyApp> {
  Locale? _locale;

  late AppStateNotifier _appStateNotifier;

  bool displaySplashImage = true;

  @override
  void initState() {
    super.initState();
    _appStateNotifier = AppStateNotifier();
    Future.delayed(const Duration(seconds: 1),
        () => setState(() => _appStateNotifier.stopShowingSplashImage()));
  }

  void setLocale(String language) {
    setState(() => _locale = createLocale(language));
  }

  void setThemeMode(ThemeMode mode) => setState(() {
        FlutterFlowTheme.saveThemeMode(mode);
      });

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AuthViewModel()),
        ChangeNotifierProvider(create: (_) => UserViewModel()),
        ChangeNotifierProvider(create: (_) => LabourRegViewModel()),
        ChangeNotifierProvider(create: (_) => LabourListForAttendanceViewModel()),
        ChangeNotifierProvider(create: (_) => ReceivingHistoryViewModel()),
        ChangeNotifierProvider(create: (_) => MaterialViewModel()),
      ],
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Civil Manager",
        initialRoute: RoutesName.splash,
        onGenerateRoute: Routes.generateRoute,
        locale: _locale,
        supportedLocales: const [Locale('en', '')],
        theme: ThemeData(brightness: Brightness.light),
        // darkTheme: ThemeData(brightness: Brightness.dark),
        themeMode: ThemeMode.light,
      ),
    );
    // return MaterialApp.router(
    //   title: 'labour',
    //   localizationsDelegates: const [
    //      FFLocalizationsDelegate(),
    //     GlobalMaterialLocalizations.delegate,
    //     GlobalWidgetsLocalizations.delegate,
    //     GlobalCupertinoLocalizations.delegate,
    //   ],
    //   locale: _locale,
    //   supportedLocales: const [Locale('en', '')],
    //   theme: ThemeData(brightness: Brightness.light),
    //   darkTheme: ThemeData(brightness: Brightness.dark),
    //   themeMode: _themeMode,
    //   routeInformationParser: _router.routeInformationParser,
    //   routerDelegate: _router.routerDelegate,
    // );
  }
}
