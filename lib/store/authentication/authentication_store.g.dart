// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AuthenticateStore on _AuthenticateStoreBase, Store {
  final _$loggingInAtom = Atom(name: '_AuthenticateStoreBase.loggingIn');

  @override
  bool get loggingIn {
    _$loggingInAtom.reportRead();
    return super.loggingIn;
  }

  @override
  set loggingIn(bool value) {
    _$loggingInAtom.reportWrite(value, super.loggingIn, () {
      super.loggingIn = value;
    });
  }

  final _$loginAsyncAction = AsyncAction('_AuthenticateStoreBase.login');

  @override
  Future<User> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  @override
  String toString() {
    return '''
loggingIn: ${loggingIn}
    ''';
  }
}
