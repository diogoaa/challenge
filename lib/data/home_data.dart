import 'package:challenge/helpers/routes_api.dart';
import 'package:challenge/models/weather_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class Homedata {
  Future<List<Weather>> findWeathers({@required String token}) async {
    var weathers = List<Weather>();

    try {
      Response<List> response = await Dio().get(
        RoutesApi.WEATHER,
        options: Options(
          contentType: 'application/json',
          headers: {'token': token},
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
        print(response.data);
      }
    } catch (e) {
      print(e);
    }

    return weathers;
  }
}
