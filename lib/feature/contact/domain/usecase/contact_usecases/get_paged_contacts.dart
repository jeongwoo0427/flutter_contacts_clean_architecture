import '../../entity/contact.dart';
import '../../repository/contact_repository.dart';

class GetPagedContacts {
  final ContactRepository _repository;

  GetPagedContacts({required ContactRepository repository})
      : _repository = repository;

  Future<List<Contact>> call({required int page, required int limit, required String searchText}) => _repository.getPagedContacts(page: page, limit: limit, searchText: searchText);
}
