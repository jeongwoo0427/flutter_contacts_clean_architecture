import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(contactListScreenStateProvider.notifier).fetchContacts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactListScreenStateProvider);
    final notifier = ref.read(contactListScreenStateProvider.notifier);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Contacts'),
        trailing:
            CupertinoButton(
                padding: EdgeInsets.zero,
                child: Icon(CupertinoIcons.add), onPressed: () {
              context.push('/contact-manage');
            }),
      ),
      child: ListView.separated(
          itemCount: state.contacts.length,
          separatorBuilder: (_, __) => Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Divider(
                thickness: 0.5,
                height: 0,
              )),
          itemBuilder: (context, index) => CupertinoListTile(
                title: Text(state.contacts[index].name),
                onTap: () {},
              )),
    );
  }
}
