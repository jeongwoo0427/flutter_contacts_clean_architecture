import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository{
  final ContactLocalData _localData;

  ContactRepositoryImpl({required ContactLocalData localData}) : _localData=localData;

  @override
  Future<void> addContact(Contact contact) async {
    await _localData.addContact(contact);
  }

  @override
  Future<void> deleteContact(Contact contact) async{
    await _localData.deleteContact(contact);
  }

  @override
  Future<List<Contact>> getPagedContacts({required int page}) async{
    return await _localData.getContacts();
  }

  @override
  Future<void> updateContact(Contact contact) async{
    await _localData.updateContact(contact);
  }

}