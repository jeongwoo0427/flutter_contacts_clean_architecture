import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../../core/constant/app_enums.dart';
import '../../../domain/entity/contact.dart';
import '../../../domain/usecase/contact_usecases.dart';
import '../../providers.dart';
import 'contact_list_screen_state.dart';

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
    fetchPage(isFirst: true);
    _useCases.addContact.stream.listen(_addContact);
    _useCases.updateContact.stream.listen(_updateContact);
    _useCases.deleteContact.stream.listen(_deleteContact);
  }

  void search({required String searchText}) {
    state = ContactListScreenState.create(searchText: searchText);
    fetchPage(isFirst: true);
  }

  Future<void> fetchPage({bool isFirst = false}) async {
    if (state.isLastPage) return;

    if (!isFirst) {
      state = state.copyWith(
        status: LoadingStatus.loading,
        currentPage: state.currentPage + 1,
      );
    }

    final list =
        await _useCases.getPagedContacts(page: state.currentPage, limit: 30, searchText: state.searchText);

    state = state.copyWith(
      status: LoadingStatus.success,
      contacts: [...state.contacts, ...list],
      isLastPage: list.isEmpty,
    );
  }

  void _addContact(Contact contact) {
    state = state.copyWith(
      contacts: [contact, ...state.contacts],
    );
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
