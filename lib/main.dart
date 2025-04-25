import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/router/app_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

void main() async{
  await Hive.initFlutter();
  runApp(const ProviderScope(child: MyApp()));
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
