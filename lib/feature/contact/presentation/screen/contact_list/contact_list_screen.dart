import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    final Contact contact = Contact.create();
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Contacts'),),
      child: Center(
        child: Text(contact.createdAt.toString()),
      ),
    );
  }
}
