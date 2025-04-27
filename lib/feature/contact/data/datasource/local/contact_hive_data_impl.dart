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
    ///RDB 시스템처럼 랜덤한 ID값 부여
    await _box.add(ContactHiveModel.fromEntity(contact.copyWith(id: _uuid.v4())));
    return contact;
  }

  @override
  Future<void> updateContact(Contact contact) async {
    final key = _findKeyById(contact.id);
    if (key != null) {
      await _box.put(key, ContactHiveModel.fromEntity(contact));
    }
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    final key = _findKeyById(contact.id);
    if (key != null) {
      await _box.delete(key);
    }
  }

  @override
  Future<List<Contact>> getContacts() async {
    return _box.values.map((e) => e.toEntity()).toList();
  }

  dynamic _findKeyById(String id) {
    return _box.keys.firstWhere(
          (key) => (_box.get(key) as ContactHiveModel).id == id,
      orElse: () => null,
    );
  }
}
