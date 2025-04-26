import 'package:shared_preferences/shared_preferences.dart';

///Shared Preferences 사용을 위한 싱글톤 객체
class SharedPreferencesService{

  static final SharedPreferencesService _instance = SharedPreferencesService._internal();

  SharedPreferencesService._internal();

  factory SharedPreferencesService(){
    return _instance;
  }

  ///runApp 이전에 호출
  factory SharedPreferencesService.initialize(SharedPreferences sharedPreferences){
    _instance._initialize(sharedPreferences);
    return _instance;
  }

  late final SharedPreferences _preferences;


  void _initialize(SharedPreferences sharedPreferences) {
    _preferences = sharedPreferences;
  }


  bool isFirstStartApp() => _preferences.getBool('IS_FIRST_START_APP') ?? true;

  Future<void> setIsFirstStartApp(bool isFirstStartApp) async => await _preferences.setBool('IS_FIRST_START_APP', isFirstStartApp);

}