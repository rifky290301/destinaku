import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  void login() {
    _isLoggedIn = true;
    notifyListeners(); // Memicu pembaruan untuk refreshListenable
  }

  void logout() {
    _isLoggedIn = false;
    notifyListeners(); // Memicu pembaruan untuk refreshListenable
  }
}
