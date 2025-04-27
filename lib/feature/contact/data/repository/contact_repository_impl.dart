import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

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
  Future<List<Contact>> getPagedContacts({required int page, required int limit}) async {
    await Future.delayed(Duration(milliseconds: 700));
    return await _localData.getPagedContacts(page: page, limit: limit);
  }

  @override
  Future<Contact> updateContact(Contact contact) async {
    final updatedContact = await _localData.updateContact(contact);
    return updatedContact;
  }
}
