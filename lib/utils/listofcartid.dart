import 'package:shared_preferences/shared_preferences.dart';

class StringListSharedPreferences {
  static const String _key = 'string_list_key';

  Future<List<String>> getStringList() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_key) ?? [];
  }

  Future<void> addStringToList(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = await getStringList();
    list.add(value);
    await prefs.setStringList(_key, list);
  }

  Future<bool> removeStringFromList(String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = await getStringList();
    list.remove(value);
    await prefs.setStringList(_key, list);
    return true;
  }

  Future<num> getLength() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    List<String> list = await getStringList();
    return list.length;
  }

  Future<void> clearAll() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove(_key);
  }
}