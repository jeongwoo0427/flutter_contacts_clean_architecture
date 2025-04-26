import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/model/contact_hive_model.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:hive/hive.dart';

class ContactHiveDataImpl implements ContactLocalData {
  late Box<ContactHiveModel> _box;

  Future<void> init() async {
    _box = await Hive.openBox<ContactHiveModel>('contacts');

    if (_box.isEmpty) {
      final List<Contact> entities = [
        Contact.create(name: '김정우', phone: '010-1234-5678'),
        Contact.create(name: '김개발', phone: '010-9999-1234'),
        Contact.create(name: '홍길동', phone: '010-9999-2345'),
        Contact.create(name: '안지환', phone: '010-9999-3456'),
        Contact.create(name: '강석영', phone: '010-9999-4567'),
      ];

      await _box.addAll(entities.map((e) => ContactHiveModel.fromEntity(e)));
    }
  }

  @override
  Future<void> addContact(Contact contact) async {
    await _box.add(ContactHiveModel.fromEntity(contact));
  }

  @override
  Future<void> deleteContact(Contact contact) async {
    final key = _box.keys.firstWhere(
      (key) => (_box.get(key) as ContactHiveModel).id == contact.id,
      orElse: () => null,
    );

    if (key != null) {
      await _box.delete(key);
    }
  }

  @override
  Future<List<Contact>> getContacts() async {
    return _box.values.map((e) => e.toEntity()).toList();
  }
}
