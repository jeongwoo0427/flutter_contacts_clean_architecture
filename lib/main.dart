import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/app_router.dart';
import 'package:flutter_klleon_homeworkd/core/service/local/shared_preference_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  await appSetup();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> appSetup() async{
  await Hive.initFlutter();
  SharedPreferencesService.initialize(await SharedPreferences.getInstance());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Contact App',
      routerConfig: appRouter,
    );
  }
}
