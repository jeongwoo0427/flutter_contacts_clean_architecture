
import '../../domain/entity/contact.dart';
import '../../domain/repository/contact_repository.dart';
import '../datasource/local/contact_local_data.dart';

class ContactRepositoryImpl implements ContactRepository {
  final ContactLocalData _localData;

  ContactRepositoryImpl({required ContactLocalData localData})
      : _localData = localData;

  @override
  Future<Contact> addContact(Contact contact) async {
    final newContact = await _localData.addContact(contact);
    return newContact;
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    await _localData.deleteContact(contact);
  }

  @override
  Future<List<Contact>> getPagedContacts({required int page, required int limit, required String searchText}) async {
    return await _localData.getPagedContacts(page: page, limit: limit, searchText: searchText);
  }

  @override
  Future<Contact> updateContact(Contact contact) async {
    final updatedContact = await _localData.updateContact(contact);
    return updatedContact;
  }
}
