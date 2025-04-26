import 'package:flutter_klleon_homeworkd/core/service/local/hive/hive_service.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/datasource/local/contact_local_data.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/data/model/contact_hive_model.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:hive/hive.dart';

class ContactHiveDataImpl implements ContactLocalData {
  final Box<ContactHiveModel> _box = HiveService().contactBox;

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
