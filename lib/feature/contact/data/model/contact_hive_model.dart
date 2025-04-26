import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact_interface.dart';
import 'package:hive/hive.dart';

part 'contact_hive_model.g.dart';


@HiveType(typeId: 1)
class ContactHiveModel extends HiveObject implements IContact {
  @HiveField(0)
  @override
  final String id;

  @HiveField(1)
  @override
  final String name;

  @HiveField(2)
  @override
  final String phone;

  @HiveField(3)
  @override
  final String? email;

  @HiveField(4)
  @override
  final DateTime? birthDay;

  @HiveField(5)
  @override
  final DateTime createdAt;

  @HiveField(6)
  @override
  final DateTime? updatedAt;

  ContactHiveModel(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.birthDay,
      required this.createdAt,
      required this.updatedAt});

  factory ContactHiveModel.fromEntity(Contact contact) => ContactHiveModel(
      id: contact.id,
      name: contact.name,
      phone: contact.phone,
      email: contact.email,
      birthDay: contact.birthDay,
      createdAt: contact.createdAt,
      updatedAt: contact.updatedAt);

  Contact toEntity() => Contact(
      id: id,
      name: name,
      phone: phone,
      email: email,
      birthDay: birthDay,
      createdAt: createdAt,
      updatedAt: updatedAt);
}
