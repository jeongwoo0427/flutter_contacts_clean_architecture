import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/app_router.dart';
import 'package:flutter_klleon_homeworkd/core/service/local/hive/hive_service.dart';
import 'package:flutter_klleon_homeworkd/core/service/local/shared_preferences/shared_preferences_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  await appSetup();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> appSetup() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesService.init();

  final bool isFirstApp = SharedPreferencesService().getIsFirstStartApp();
  if(isFirstApp){
    await SharedPreferencesService().setIsFirstStartApp(false);
  }
  await HiveService.init();
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
