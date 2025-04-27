import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

abstract class ContactRepository{
  Future<List<Contact>> getPagedContacts({required int page, required int limit});
  //신규 데이터 생성 완료 후 생성된 데이터 가져옴
  Future<Contact> addContact(Contact contact);
  //데이터 수정 완료 후 수정된 데이터 가져옴
  Future<Contact> updateContact(Contact contact);
  Future<void> deleteContact(Contact contact);
}