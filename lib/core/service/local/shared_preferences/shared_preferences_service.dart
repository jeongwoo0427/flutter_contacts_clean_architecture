import 'package:shared_preferences/shared_preferences.dart';

///Shared Preferences 사용을 위한 싱글톤 객체
class SharedPreferencesService{

  static final SharedPreferencesService _instance = SharedPreferencesService._internal();
  SharedPreferencesService._internal();
  factory SharedPreferencesService()=>_instance;

  ///runApp 이전에 호출
  static Future<void> init() => _instance._initialize();

  Future<void> _initialize() async {
    _preferences = await SharedPreferences.getInstance();
  }

  late final SharedPreferences _preferences;

  bool getIsFirstStartApp() => _preferences.getBool('IS_FIRST_START_APP') ?? true;

  Future<void> setIsFirstStartApp(bool isFirstStartApp) async => await _preferences.setBool('IS_FIRST_START_APP', isFirstStartApp);

  Future<void> removeIsFirstStartApp() async => await _preferences.remove('IS_FIRST_START_APP');

}