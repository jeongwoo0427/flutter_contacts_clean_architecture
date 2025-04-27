import '../../../../../core/usecase/base_stream_usecase.dart';
import '../../entity/contact.dart';
import '../../repository/contact_repository.dart';

class AddContact with BaseStreamUseCase<Contact>{
  final ContactRepository _repository;

  AddContact({required ContactRepository repository})
      : _repository = repository;

  Future<void> call({required Contact contact}) async{
    final newContact = await _repository.addContact(contact);
    yieldData(newContact); //데이터 변경으로 인한 이벤트 추가
  }
}
