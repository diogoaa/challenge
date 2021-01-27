import 'package:challenge/data/authentication_data.dart';
import 'package:challenge/helpers/user_helper.dart';
import 'package:challenge/models/user_model.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
part 'authentication_store.g.dart';

class AuthenticateStore = _AuthenticateStoreBase with _$AuthenticateStore;

abstract class _AuthenticateStoreBase with Store {
  final _data = Authenticationdata();

  @observable
  bool loggingIn = false;

  final loginController = TextEditingController();
  final passwordController = TextEditingController();

  @action
  Future<User> login() async {
    loggingIn = true;
    final user = await _data.login(
      login: loginController.text,
      password: passwordController.text,
    );

    loggingIn = false;

    if (user == null) return null;

    await UserHelper.saveUser(user);

    return user;
  }
}
