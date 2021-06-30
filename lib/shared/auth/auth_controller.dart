import 'package:flutter/material.dart';
import 'package:payflow/shared/models/user_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthController {
  UserModel? _user;
  SharedPreferences? ps;

  get user => _user!;

  void setUser({UserModel? user, required BuildContext context}) {
    if (user != null) {
      saveUser(user);
      _user = user;
      Navigator.pushReplacementNamed(context, "/home", arguments: user);
    } else {
      Navigator.pushReplacementNamed(context, "/login");
    }
  }

  Future<void> saveUser(UserModel user) async {
    ps = await SharedPreferences.getInstance();
    try {
      await ps!.setString("user", user.toJson());
      return;
    } catch (e) {
      throw e;
    }
  }

  Future<void> currentUser(BuildContext context) async {
    ps = await SharedPreferences.getInstance();
    try {
      await Future.delayed(Duration(seconds: 2));
      if (ps!.containsKey("user")) {
        final json = ps!.getString("user");
        setUser(context: context, user: UserModel.fromJson(json!));
        return;
      } else {
        setUser(context: context, user: null);
      }
    } catch (e) {
      throw e;
    }
  }
}
