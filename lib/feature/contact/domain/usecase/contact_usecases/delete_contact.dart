import 'package:flutter_klleon_homeworkd/core/usecase/base_stream_usecase.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/repository/contact_repository.dart';

class DeleteContact with BaseStreamUseCase<Contact>{
  final ContactRepository _repository;

  DeleteContact({required ContactRepository repository})
      : _repository = repository;

  Future<void> call({required Contact contact}) async {
    await _repository.deleteContact(contact);
    yieldData(contact); //데이터 변경으로 인한 이벤트 추가
  }
}
