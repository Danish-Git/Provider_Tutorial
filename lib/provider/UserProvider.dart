import 'package:flutter/material.dart';
import 'package:provider_tutorial/domain/users.dart';

class UserProvider extends ChangeNotifier{

  User _user = User();

  User get user => _user;

  void setUser (User user){
    _user = user;
    notifyListeners();
  }
}