import 'package:hive_flutter/hive_flutter.dart';

class StorageService{
  static final StorageService _instance = StorageService._internal();
  StorageService._internal();
  factory StorageService()=>_instance;

  ///runApp 이전에 호출
  static Future<void> init() async  {
    await Hive.initFlutter();
  }
}