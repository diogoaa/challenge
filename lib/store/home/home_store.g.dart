// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeStore on _HomeStoreBase, Store {
  final _$weathersAtom = Atom(name: '_HomeStoreBase.weathers');

  @override
  ObservableList<Weather> get weathers {
    _$weathersAtom.reportRead();
    return super.weathers;
  }

  @override
  set weathers(ObservableList<Weather> value) {
    _$weathersAtom.reportWrite(value, super.weathers, () {
      super.weathers = value;
    });
  }

  final _$searchingWeathersAtom =
      Atom(name: '_HomeStoreBase.searchingWeathers');

  @override
  bool get searchingWeathers {
    _$searchingWeathersAtom.reportRead();
    return super.searchingWeathers;
  }

  @override
  set searchingWeathers(bool value) {
    _$searchingWeathersAtom.reportWrite(value, super.searchingWeathers, () {
      super.searchingWeathers = value;
    });
  }

  final _$useAuthAtom = Atom(name: '_HomeStoreBase.useAuth');

  @override
  bool get useAuth {
    _$useAuthAtom.reportRead();
    return super.useAuth;
  }

  @override
  set useAuth(bool value) {
    _$useAuthAtom.reportWrite(value, super.useAuth, () {
      super.useAuth = value;
    });
  }

  final _$findWeathersAsyncAction = AsyncAction('_HomeStoreBase.findWeathers');

  @override
  Future<List<Weather>> findWeathers({bool isRefresh = false}) {
    return _$findWeathersAsyncAction
        .run(() => super.findWeathers(isRefresh: isRefresh));
  }

  @override
  String toString() {
    return '''
weathers: ${weathers},
searchingWeathers: ${searchingWeathers},
useAuth: ${useAuth}
    ''';
  }
}
