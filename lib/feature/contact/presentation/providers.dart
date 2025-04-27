import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_hive_data_impl.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/repository/contact_repository_impl.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/usecase/contact_usecases.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


/// 각 계층별 DI 위한 Providers

/// ----------------------------------------------------------------------------
/// Doamin
/// ----------------------------------------------------------------------------

//Repository
final contactRepositoryProvider = Provider(
      (ref) =>
      ContactRepositoryImpl(
          localData: ref.watch(contactLocalDataProvider)
      ),
);

//UseCase
final contactUseCasesProvider = Provider(
      (ref) =>
      ContactUseCases.fromRepository(ref.read(contactRepositoryProvider)),
);


/// ----------------------------------------------------------------------------
/// Data
/// ----------------------------------------------------------------------------

//Infra (변경 가능)
final contactLocalDataProvider = Provider(
      (ref) => ContactHiveDataImpl(),
);
