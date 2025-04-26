import 'package:shared_preferences/shared_preferences.dart';

///Shared Preferences 사용을 위한 싱글톤 객체
class CacheService{

  static final CacheService _instance = CacheService._internal();
  CacheService._internal();
  factory CacheService()=>_instance;

  ///runApp 이전에 호출
  static Future<void> init() async  {
    _instance._initialize(await SharedPreferences.getInstance());
  }

  void _initialize(SharedPreferences sharedPreferences) {
    _preferences = sharedPreferences;
  }

  late final SharedPreferences _preferences;

  bool isFirstStartApp() => _preferences.getBool('IS_FIRST_START_APP') ?? true;

  Future<void> setIsFirstStartApp(bool isFirstStartApp) async => await _preferences.setBool('IS_FIRST_START_APP', isFirstStartApp);

}