import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_){
      ref.read(contactListScreenStateProvider.notifier);
    });
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactListScreenStateProvider);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(middle: Text('Contacts'),),
      child: Center(
        child: Text(state.text),
      ),
    );
  }
}
