import 'package:flutter_klleon_homeworkd/core/constant/app_constants.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/providers.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/contact_usecases.dart';

///ViewModel에서 사용할 의존성 주입 후 사용
final contactListScreenStateProvider = StateNotifierProvider<
        ContactListScreenStateNotifier, ContactListScreenState>(
    (ref) => ContactListScreenStateNotifier(
        useCases: ref.read(contactUseCaseProvider)));

class ContactListScreenStateNotifier
    extends StateNotifier<ContactListScreenState> {
  ContactListScreenStateNotifier({required ContactUseCases useCases})
      : _useCases = useCases,
        super(ContactListScreenState.create());

  final ContactUseCases _useCases;

  Future<void> fetchNextPage({required bool isFirst}) async {
    if (state.isLastPage) return;

    if (!isFirst) {
      state = state.copyWith(status: LoadingStatus.loading);
    }

    final list = await _useCases.getPagedContacts(page: state.currentPage);
    state = state.copyWith(
      status: LoadingStatus.success,
      contacts: list,
      isLastPage: true,
      currentPage: state.currentPage + 1,
    );
  }
}
