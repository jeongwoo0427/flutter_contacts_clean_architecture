import 'package:flutter_klleon_homeworkd/core/service/local/hive/hive_service.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/model/contact_hive_model.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

class ContactHiveDataImpl implements ContactLocalData {
  final Box<ContactHiveModel> _box = HiveService().contactBox;
  final _uuid = const Uuid();

  @override
  Future<Contact> addContact(Contact contact) async {
    //RDB 시스템처럼 랜덤한 ID값 부여
    final newContact =
        contact.copyWith(id: _uuid.v4(), createdAt: DateTime.now());
    await _box.add(ContactHiveModel.fromEntity(newContact));
    return newContact;
  }

  @override
  Future<Contact> updateContact(Contact contact) async {
    final key = _findKeyById(contact.id);
    final updatedContact = contact.copyWith(updatedAt: DateTime.now());
    if (key != null) {
      await _box.put(key, ContactHiveModel.fromEntity(updatedContact));
    }
    return updatedContact;
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    final key = _findKeyById(contact.id);
    if (key != null) {
      await _box.delete(key);
    }
  }

  @override
  Future<List<Contact>> getPagedContacts({
    required int page,
    required int limit,
  }) async {

    await Future.delayed(const Duration(milliseconds: 1000)); // More Loading 인디케이터 표시를 위해 강제 딜레이

    final startIndex = (page) * limit;

    final contactsList = _box.values.map((e) => e.toEntity()).toList();

    // 이름 기준으로 오름차순 정렬
    contactsList.sort((a, b) => a.name.compareTo(b.name));

    if (startIndex >= contactsList.length) {
      // 시작 인덱스가 데이터 길이보다 크면 빈 리스트 반환
      return [];
    }

    final endIndex = (startIndex + limit).clamp(0, contactsList.length);

    return contactsList.sublist(startIndex, endIndex);
  }



  dynamic _findKeyById(String id) {
    return _box.keys.firstWhere(
      (key) => (_box.get(key) as ContactHiveModel).id == id,
      orElse: () => null,
    );
  }
}
