import 'package:flutter_klleon_homeworkd/core/service/local/hive/seeds/contact_seeds.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/model/contact_hive_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

///Hive 사용을 위한 싱글톤 객체
class HiveService {
  static final HiveService _instance = HiveService._internal();

  HiveService._internal();

  factory HiveService() => _instance;

  ///runApp 이전에 호출
  static Future<void> init() => _instance._initialize();

  late final Box<ContactHiveModel> contactBox;

  Future<void> _initialize() async {
    await Hive.initFlutter();
    await _initAdapters();
    await _initBoxes();
    await _initSeeds();
  }

  Future<void> _initAdapters() async{
    Hive.registerAdapter(ContactHiveModelAdapter());
  }

  Future<void> _initBoxes() async {
    contactBox = await Hive.openBox<ContactHiveModel>('contacts');
  }

  Future<void> _initSeeds() async {
    await contactBox.clear();
    contactBox.addAll(contactSeeds);
  }
}
