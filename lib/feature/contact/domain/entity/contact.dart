import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact_interface.dart';

class Contact implements IContact {
  @override
  final String id;
  @override
  final String name;
  @override
  final String phone;
  @override
  final String? email;
  @override
  final DateTime createdAt;
  @override
  final DateTime? updatedAt;

  Contact(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.createdAt,
      required this.updatedAt});

  factory Contact.create(
          {String? id,
          String? name,
          String? phone,
          String? email,
          DateTime? birthDay,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Contact(
          id: id ?? '',
          name: name ?? '',
          phone: phone ?? '',
          email: email ?? '',
          createdAt: createdAt ?? DateTime.now(),
          updatedAt: updatedAt);

  Contact copyWith(
          {String? id,
          String? name,
          String? phone,
          String? email,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Contact(
          id: id ?? this.id,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt);
}
