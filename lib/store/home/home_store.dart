import 'dart:async';

import 'package:challenge/data/home_data.dart';
import 'package:challenge/helpers/user_helper.dart';
import 'package:challenge/models/weather_model.dart';
import 'package:mobx/mobx.dart';
part 'home_store.g.dart';

class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final _data = Homedata();

  @observable
  ObservableList<Weather> weathers = ObservableList<Weather>();

  @observable
  bool searchingWeathers = false;

  @action
  Future<List<Weather>> findWeathers({bool isRefresh: false}) async {
    if (!isRefresh) searchingWeathers = true;
    final user = await UserHelper.getUser();

    final response = await _data.findWeathers(token: user?.token);

    weathers.clear();
    weathers.addAll(response);

    searchingWeathers = false;

    return weathers;
  }

  Future syncData() async {
    Timer.periodic(
      Duration(seconds: 50),
      (Timer t) => findWeathers(),
    );
  }
}
