
import '../../../domain/entity/contact.dart';

abstract class ContactLocalData{
  Future<Contact> addContact(Contact contact);
  Future<Contact> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
  Future<List<Contact>> getPagedContacts({required int page, required int limit, required String searchText});
}