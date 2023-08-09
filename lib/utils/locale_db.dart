import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  LocalDB._();
  static final LocalDB instance = LocalDB._();
  late SharedPreferences sp;

  onInit() async => sp = await SharedPreferences.getInstance();

  Future<bool> setString(String key, String value) async {
    await sp.setString(key, value);
    return true;
  }

  Future<bool> setBool(String key, bool value) async {
    await sp.setBool(key, value);
    return true;
  }

  String getString(String key) {
    var value = sp.getString(key);
    return (value == null) ? '' : value;
  }

  bool getBool(String key) {
    bool? value = sp.getBool(key);
    return (value != null) ? value : false;
  }

  Future remove(String key) async {
    await sp.remove(key);
    return true;
  }

  //
  // Future<String> getToken() async {
  //   var userData = SPService.instance.getString(AppKeys.kUser);
  //   var token = userData.isNotEmpty
  //       ? User.fromJson(jsonDecode(userData)).token.toString()
  //       : '';
  //   log('token || $token');
  //   return token;
  // }

  // User user = User();
  // Future<User> getUser() async {
  //   var userData = SPService.instance.getString(AppKeys.kUser);
  //   try {
  //     user = User.fromJson(jsonDecode(userData));
  //   } catch (_) {}
  //   user = user;
  //   log('user || $user');
  //   return user;
  // }
  //
  //
}
