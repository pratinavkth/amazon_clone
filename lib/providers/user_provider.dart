import 'package:flutter/material.dart';
import 'package:amazon_clone/models/user.dart';

class UserProvider extends ChangeNotifier {
  User _user = User(
    name: '',
    email: '',
    password: '',
    id: '',
    address: '',
    type: '',
    token: '',
  );

  User get user => _user;

  void setUSer(String user){
    _user = User.fromJson(user);
    notifyListeners();
  }
}