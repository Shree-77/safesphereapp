import 'package:flutter/material.dart';

//Packages
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:provider/provider.dart';

//Services

import './Services/navigation_services.dart';
import './Providers/authentication_provider.dart';

//Pages
import './Pages/splash_page.dart';
import './Pages/login_page.dart';

void main() => runApp(SplashPage(
    key: UniqueKey(),
    onInitializationComplete: () {
      runApp(
        MainApp(),
      );
    }));

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthenticationProvider>(
          create: (BuildContext _context) {
            return AuthenticationProvider();
          },
        )
      ],
      child: MaterialApp(
        title: 'Safe-Sphere',
        theme: ThemeData(
            colorScheme: ThemeData.dark().colorScheme.copyWith(
                  background: const Color.fromRGBO(36, 35, 49, 1.0),
                ),
            scaffoldBackgroundColor: const Color.fromRGBO(36, 35, 49, 1.0),
            bottomNavigationBarTheme: const BottomNavigationBarThemeData(
              backgroundColor: Color.fromRGBO(30, 29, 37, 1.0),
            )),
        navigatorKey: NavigationServices.navigatorKey,
        initialRoute: '/login',
        routes: {
          '/login': (BuildContext _context) => LoginPage(),
        },
      ),
    );
  }
}
