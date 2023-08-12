import 'package:shared_preferences/shared_preferences.dart';

class LocalDB {
  LocalDB._();
  static final LocalDB instance = LocalDB._();
  late SharedPreferences sp;
  Future<void> onInit() async => sp = await SharedPreferences.getInstance();
}
