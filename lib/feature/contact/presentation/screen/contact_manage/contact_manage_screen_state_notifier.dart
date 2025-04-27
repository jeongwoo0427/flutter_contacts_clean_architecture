import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/providers.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_manage/contact_manage_screen_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../domain/usecase/contact_usecases.dart';

final contactManageScreenStateProvider = StateNotifierProvider<
    ContactManageScreenStateNotifier,
    ContactManageScreenState>((ref) => ContactManageScreenStateNotifier(useCase: ref.read(contactUseCasesProvider)));

class ContactManageScreenStateNotifier
    extends StateNotifier<ContactManageScreenState> {
  ContactManageScreenStateNotifier({required ContactUseCases useCase})
      : _useCases = useCase,
        super(ContactManageScreenState());

  final ContactUseCases _useCases;

  Future<void> addContact(Contact contact) async{
    await _useCases.addContact(contact: contact);
  }

  Future<void> updateContact(Contact contact) async{
    await _useCases.updateContact(contact: contact);
  }

  Future<void> deleteContact(Contact contact) async{
    await _useCases.deleteContact(contact: contact);
  }
}
