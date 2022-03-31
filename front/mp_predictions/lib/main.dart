import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:mp_predictions/src/base.dart';

void main() {
  runApp(const MyApp());
}

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MaterialApp(
        title: 'Microplastics Predictions',
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        debugShowCheckedModeBanner: false,
        supportedLocales: const [
          Locale('pt', 'BR'), // English
        ],
        initialRoute: "/",
        navigatorKey: navigatorKey,
        routes: <String, WidgetBuilder>{
          "/": (BuildContext context) => Base(),
          "/about": (BuildContext context) => Base(),
          "/ref": (BuildContext context) => Base(),
        },
      ),
    );
  }
}

