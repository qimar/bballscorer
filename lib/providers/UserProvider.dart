import 'package:SportRabbit/services/graphql_services/user_services/UserService.dart';
import 'package:flutter/material.dart';
// import 'package:ytadmin/model/user_model.dart';
// import 'package:ytadmin/service/UserService.dart';

class UserProvider extends ChangeNotifier {
  bool _loading = false;
  // getter
  bool get loading => _loading;
  // setter
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  UserModel? _user;
  // getter
  UserModel? get user => _user;
  set setUser(UserModel value) {
    _user = value;
    notifyListeners();
  }

  bool isUserLoggedIn = false;

  Future<UserModel> userSigning(
      BuildContext context,
      TextEditingController emailController,
      TextEditingController passwordController) async {
    loading = true;
    setUser = (await UserService.signIn(
        context, emailController, passwordController))!;
    // if (_user!.accessToken!.isNotEmpty) {
    // if (_user!.accessToken.isNotEmpty) {
    isUserLoggedIn = true;
    notifyListeners();
    // }
    loading = false;
    return user!;
  }

  getUserData() async {
    return user;
  }
}
