import 'package:flutter_klleon_homeworkd/core/usecase/base_stream_usecase.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

class AddContact with BaseStreamUseCase<Contact>{
  final ContactRepository _repository;

  AddContact({required ContactRepository repository})
      : _repository = repository;

  Future<void> call({required Contact contact}) async{
    final newContact = await _repository.addContact(contact);
    yieldData(newContact);
  }
}
