import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

abstract class ContactRepository{
  Future<List<Contact>> getPagedContacts({required int page, required int limit});
  Future<Contact> addContact(Contact contact);
  Future<Contact> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
}