import 'package:flutter_klleon_homeworkd/core/constant/app_constants.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/providers.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/entity/contact.dart';
import '../../../domain/usecase/contact_usecases.dart';

final contactListScreenStateProvider = StateNotifierProvider<
    ContactListScreenStateNotifier, ContactListScreenState>(
  (ref) => ContactListScreenStateNotifier(
    useCases: ref.read(contactUseCasesProvider),
  ),
);

class ContactListScreenStateNotifier
    extends StateNotifier<ContactListScreenState> {
  ContactListScreenStateNotifier({required ContactUseCases useCases})
      : _useCases = useCases,
        super(ContactListScreenState.create());

  final ContactUseCases _useCases;

  Future<void> init() async {
    fetchNextPage(isFirst: true);
    _useCases.addContact.stream.listen(_addContact);
    _useCases.updateContact.stream.listen(_updateContact);
    _useCases.deleteContact.stream.listen(_deleteContact);
  }

  Future<void> fetchNextPage({required bool isFirst}) async {
    if (state.isLastPage) return;

    if (!isFirst) {
      state = state.copyWith(
        status: LoadingStatus.loading,
        currentPage: state.currentPage + 1,
      );
    }

    final list = await _useCases.getPagedContacts(page: state.currentPage);

    state = state.copyWith(
      status: LoadingStatus.success,
      contacts: [...list],
      isLastPage: list.isEmpty,
    );
  }

  void _sortContacts() {
    final sortedContacts = [...state.contacts]
      ..sort((a, b) => a.name.compareTo(b.name));
    state = state.copyWith(contacts: sortedContacts);
  }

  void _addContact(Contact contact) {
    state.contacts.add(contact);
    _sortContacts();
    state = state.copyWith();
  }

  void _updateContact(Contact contact) {
    state = state.copyWith(
      contacts:
          state.contacts.map((c) => c.id == contact.id ? contact : c).toList(),
    );
  }

  void _deleteContact(Contact contact) {
    state = state.copyWith(
      contacts: state.contacts.where((c) => c.id != contact.id).toList(),
    );
  }
}
