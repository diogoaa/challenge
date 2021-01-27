import 'dart:convert';

import 'package:challenge/helpers/routes_api.dart';
import 'package:challenge/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Authenticationdata {
  Future<User> login(
      {@required String login, @required String password}) async {
    User user;

    try {
      Response response = await Dio().post(
        RoutesApi.LOGIN,
        data: {
          "login": login,
          "password": password,
        },
        options: Options(
          contentType: 'application/json',
          // headers: {'Accept': '*/*'},
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        user = User.fromJson(response.data);
      } else {
        print(response.data);
      }
    } catch (e) {
      print(e);
    }

    return user;
  }
}
