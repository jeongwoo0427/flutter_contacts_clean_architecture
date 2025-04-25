import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

class AddContact {
  final ContactRepository _repository;

  AddContact({required ContactRepository repository})
      : _repository = repository;

  Future<void> call({required Contact contact}) => _repository.addContact(contact);
}
