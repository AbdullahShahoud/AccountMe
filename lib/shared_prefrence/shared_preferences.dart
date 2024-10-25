import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static  SharedPreferences? sharedpreferences;
  static init()async{
     CacheHelper.sharedpreferences=await SharedPreferences.getInstance();
  }
  
  static Future<bool?> getBool(String key,SharedPreferences sharedpreferences)async {
    return await  sharedpreferences.getBool(key);
  }
  static Future<bool?> putBool(String key,bool data,SharedPreferences sharedpreferences)async {
    return await sharedpreferences.setBool(key, data);
  }

  static Future<bool?> putInt(String key,int data,SharedPreferences sharedpreferences)async {
    return await sharedpreferences.setInt(key, data);
  }
  static Future<bool?> putDouble(String key,double data,SharedPreferences sharedpreferences)async {
    return await sharedpreferences.setDouble(key, data);
  }
  static Future<int?> getInt(String key,SharedPreferences sharedpreferences)async {
    return await  sharedpreferences.getInt(key);
  }
  static Future<double?> getDouble(String key,SharedPreferences sharedpreferences)async {
    return await  sharedpreferences.getDouble(key);
  }
}

