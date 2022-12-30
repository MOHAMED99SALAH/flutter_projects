import 'package:shared_preferences/shared_preferences.dart';

class cashData {
  cashData();

  _saveData(bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();

    shared_data.setBool("STATE", state);
  }

  _saveDataa(String name, String username, String Pass, bool state) async {
    SharedPreferences shared_data = await SharedPreferences.getInstance();
    shared_data.setString("NAME", name);
    shared_data.setString("USERNAME", username);
    shared_data.setString("PASS", Pass);
    shared_data.setBool("STATE", state);
  }

  _help(bool help) async {
    SharedPreferences help_data = await SharedPreferences.getInstance();
    help_data.setBool("HELP", help);
  }
}
