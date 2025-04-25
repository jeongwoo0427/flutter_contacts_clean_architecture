import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

abstract class ContactRepository{
  Future<List<Contact>> getPagedContacts({required int page});
  Future<void> addContact(Contact contact);
  Future<void> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
}