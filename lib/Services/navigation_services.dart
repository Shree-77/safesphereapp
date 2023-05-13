import 'package:flutter/material.dart';

class NavigationServices {
  static GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  void removeandNavigateToroute(String _route) {
    navigatorKey.currentState?.popAndPushNamed(_route);
  }

  void navigaToRoute(String _route) {
    navigatorKey.currentState?.pushNamed(_route);
  }

  void navigateToPage(Widget _page) {
    navigatorKey.currentState
        ?.push(MaterialPageRoute(builder: (BuildContext _context) {
      return _page;
    }));
  }
}
