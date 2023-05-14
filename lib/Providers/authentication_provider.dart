//Packages
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get_it/get_it.dart';

//Services
import '../Services/database_services.dart';
import '../Services/navigation_services.dart';

class AuthenticationProvider extends ChangeNotifier {
  late final FirebaseAuth _auth;
  late final NavigationServices _navigationService;
  late final DatabaseService _databaseService;

  AuthenticationProvider() {
    _auth = FirebaseAuth.instance;
    _navigationService = GetIt.instance.get<NavigationServices>();
    _databaseService = GetIt.instance.get<DatabaseService>();
  }

  Future<void> loginUsingEmailAndPassword(
      String _email, String _password) async {
    try {
      await _auth.signInWithEmailAndPassword(
          email: _email, password: _password);
      print(_auth.currentUser);
    } on FirebaseAuthException {
      print("Error logging user into Firebase");
    } catch (e) {
      print(e);
    }
  }
}
