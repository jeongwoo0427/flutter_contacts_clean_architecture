import '../../../../../core/usecase/base_stream_usecase.dart';
import '../../entity/contact.dart';
import '../../repository/contact_repository.dart';

class UpdateContact with BaseStreamUseCase<Contact>{
  final ContactRepository _repository;

  UpdateContact({required ContactRepository repository})
      : _repository = repository;

  Future<void> call({required Contact contact}) async {
    final updatedContact = await _repository.updateContact(contact);
    yieldData(updatedContact); //데이터 변경으로 인한 이벤트 추가
  }
}
