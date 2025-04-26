import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

abstract class ContactLocalData{
  Future<void> addContact(Contact contact);
  Future<void> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
  Future<List<Contact>> getContacts();
}