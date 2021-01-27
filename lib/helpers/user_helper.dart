import 'package:challenge/helpers/secure_storage.dart';
import 'package:challenge/models/user_model.dart';

class UserHelper {
  static Future saveUser(User user) async {
    await SecureStorage.save('user', user.toJson());
  }

  static Future<User> getUser() async {
    final userJson = await SecureStorage.read('user');

    final user = User.fromJson(userJson);

    return user;
  }

  static Future removeUser() async {
    await SecureStorage.remove('user');
  }

  static Future<String> getHome() async {
    try {
      final user = await getUser();

      return user == null ? '/login' : '/home';
    } catch (e) {
      return '/login';
    }
  }
}
