import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

class ContactListScreenState {
  final String text;
  final List<Contact> contacts;

  ContactListScreenState({this.text = '', this.contacts = const []});

  ContactListScreenState copyWith({String? text, List<Contact>? contacts}) =>
      ContactListScreenState(text: text ?? this.text, contacts: contacts?? this.contacts);
}
