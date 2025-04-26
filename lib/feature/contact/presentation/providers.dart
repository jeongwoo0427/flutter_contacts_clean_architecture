import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_hive_data_impl.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/repository/contact_repository_impl.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/usecase/contact_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// 각 계층별 의존성 주입(DI)을 위한 Providers

/// ----------------------------------------------------------------------------
/// Doamin
/// ----------------------------------------------------------------------------

//Repository
final contactRepositoryProvider = Provider(
      (ref) =>
      ContactRepositoryImpl(
          localData: ref.read(contactLocalDataProvider)
      ),
);

//UseCase
final contactUseCaseProvider = Provider(
      (ref) =>
      ContactUseCases.fromRepository(ref.read(contactRepositoryProvider)),
);


/// ----------------------------------------------------------------------------
/// Data
/// ----------------------------------------------------------------------------

//Infra
final contactLocalDataProvider = Provider(
      (ref) async {
    final data = ContactHiveDataImpl();
    await data.init();
    return data;
  },
);
