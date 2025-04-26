import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/app_router.dart';
import 'package:flutter_klleon_homeworkd/core/service/local/cache_service.dart';
import 'package:flutter_klleon_homeworkd/core/service/local/storage_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() async{
  await appSetup();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> appSetup() async{
  await CacheService.init();
  await StorageService.init();
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
