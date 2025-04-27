import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/constant/app_constants.dart';
import 'package:flutter_klleon_homeworkd/core/widget/cupertino_divider.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state_notifier.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_manage/contact_manage_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}
class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    // 페이지 초기화
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(contactListScreenStateProvider.notifier).init();
    });

    // 스크롤 끝에 도달했을 때 fetchNextPage 호출
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent) {

        ref.read(contactListScreenStateProvider.notifier).fetchNextPage();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactListScreenStateProvider);
    final notifier = ref.read(contactListScreenStateProvider.notifier);
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text('Contacts'),
        trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              context.push('/contact-manage',
                  extra: ContactManageScreenArguments(
                      manageMode: ManageMode.create,
                      contact: Contact.create()));
            }),
      ),
      child: state.status == LoadingStatus.initial
          ? Center(
        child: CupertinoActivityIndicator(),
      )
          : ListView.separated(
          controller: _scrollController,  // ScrollController 연결
          itemCount: state.contacts.length,
          separatorBuilder: (_, __) => CupertinoDivider(),
          itemBuilder: (context, index) => CupertinoListTile(
            title: Text(state.contacts[index].name),
            onTap: () {
              context.push('/contact-manage',
                  extra: ContactManageScreenArguments(
                      manageMode: ManageMode.edit,
                      contact: state.contacts[index]));
            },
          )),
    );
  }
}
