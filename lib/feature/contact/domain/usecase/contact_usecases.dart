
import '../repository/contact_repository.dart';
import 'contact_usecases/add_contact.dart';
import 'contact_usecases/delete_contact.dart';
import 'contact_usecases/get_paged_contacts.dart';
import 'contact_usecases/update_contact.dart';

///Contact와 완련된 UseCase를 한번에 모아두는 객체
class ContactUseCases {
  final AddContact addContact;
  final UpdateContact updateContact;
  final GetPagedContacts getPagedContacts;
  final DeleteContact deleteContact;

  ContactUseCases(
      {required this.addContact,
      required this.updateContact,
      required this.deleteContact,
      required this.getPagedContacts});

  // 팩토리 생성자를 통해 Repository 일괄 적용
  factory ContactUseCases.fromRepository(ContactRepository repository) {
    return ContactUseCases(
        addContact: AddContact(repository: repository),
        updateContact: UpdateContact(repository: repository),
        deleteContact: DeleteContact(repository: repository),
        getPagedContacts: GetPagedContacts(repository: repository));
  }
}
