import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

class ContactRepositoryImpl implements ContactRepository{
  final ContactLocalData _localData;

  ContactRepositoryImpl({required ContactLocalData localData}) : _localData=localData;

  @override
  Future<void> addContact(Contact contact) {
    // TODO: implement addContact
    throw UnimplementedError();
  }

  @override
  Future<void> deleteContact(Contact contact) {
    // TODO: implement deleteContact
    throw UnimplementedError();
  }

  @override
  Future<List<Contact>> getPagedContacts({required int page}) {
    // TODO: implement getPagedContacts
    throw UnimplementedError();
  }

  @override
  Future<void> updateContact(Contact contact) {
    // TODO: implement updateContact
    throw UnimplementedError();
  }

}