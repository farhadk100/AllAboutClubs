
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager{
  SharedPreferences? sp;

  SharedPreferencesManager(){
    SharedPreferences.getInstance().then((value) => sp = value);
  }
}