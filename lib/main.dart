import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'core/app_router.dart';
import 'core/service/local/hive/hive_service.dart';
import 'core/service/local/shared_preferences/shared_preferences_service.dart';

void main() async{
  //앱 실행 전 기본 설정 세팅
  await setupApp();
  runApp(const ProviderScope(child: MyApp()));
}

Future<void> setupApp() async{
  WidgetsFlutterBinding.ensureInitialized();

  await SharedPreferencesService.init();

  final bool isFirstApp = SharedPreferencesService().getIsFirstStartApp();
  if(isFirstApp){
    await SharedPreferencesService().setIsFirstStartApp(false);
  }
  //Hive서비스 사용 설정
  //앱 최소 실행시 더미데이터 추가
  await HiveService.init(initSeed: isFirstApp);

  //강제 초기화코드
  //await SharedPreferencesService().removeIsFirstStartApp();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Contacts App',
      routerConfig: appRouter,
    );
  }
}
