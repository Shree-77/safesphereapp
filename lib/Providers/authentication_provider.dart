//Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//Models

import '../models/chat_user.dart';

//Services
import '../Services/database_services.dart';
import '../Services/navigation_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationServices _navigationService;
  late final DatabaseService _databaseService;

  late ChatUser user;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationServices>();
    _databaseService = GetIt.instance.get<DatabaseService>();

    _auth.authStateChanges().listen((_user) {
      if (_user != null) {
        _databaseService.updateUserLastSeenTime(_user.uid);
        _databaseService.getUser(_user.uid).then(
          (_snapshot) {
            Map<String, dynamic> _userData =
                _snapshot.data()! as Map<String, dynamic>;
            user = ChatUser.fromJSON(
              {
                "uid": _user.uid,
                "name": _userData["name"],
                "email": _userData["email"],
                "lastActive": _userData["lastActive"],
                "image": _userData["image"],
              },
            );
            _navigationService.removeandNavigateToroute('/home');
          },
        );
      } else {
        _navigationService.removeandNavigateToroute('/login');
      }
    });
  }

  Future<void> loginUsingEmailAndPassword(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
    } on FirebaseAuthException {
      print("Error logging user into Firebase");
    } catch (e) {
      print(e);
    }
  }
}
