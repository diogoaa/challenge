import 'package:challenge/helpers/routes_api.dart';
import 'package:challenge/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Homedata {
  Future<List<Weather>> findWeathers(
      {@required String token, @required bool useAuth}) async {
    var weathers = List<Weather>();

    try {
      Response response = await Dio().get(
        useAuth ? RoutesApi.WEATHER_AUTH : RoutesApi.WEATHER,
        options: Options(
          contentType: 'application/json',
          headers: {'Authorization': token},
          followRedirects: false,
          validateStatus: (status) {
            return status < 500;
          },
        ),
      );

      if (response.statusCode == 200) {
        response.data.forEach((json) {
          weathers.add(Weather.fromJson(json));
        });
      } else {
        print(response.statusCode);
        print(response.statusMessage);
        print(response.data);
      }
    } catch (e) {
      print(e);
    }

    return weathers;
  }
}
