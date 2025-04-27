import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_klleon_homeworkd/core/widget/cupertino_divider.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_list/contact_list_screen_state_notifier.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_manage/contact_manage_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_enums.dart';

class ContactListScreen extends ConsumerStatefulWidget {
  const ContactListScreen({super.key});

  @override
  ConsumerState<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends ConsumerState<ContactListScreen> {
  late ScrollController _scrollController;
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(contactListScreenStateProvider.notifier).init();
    });

    _scrollController.addListener(() {
      if (_scrollController.position.pixels >
          _scrollController.position.maxScrollExtent - 50) {
        final state = ref.read(contactListScreenStateProvider);
        if (state.status != LoadingStatus.loading) {
          ref.read(contactListScreenStateProvider.notifier).fetchPage();
        }
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactListScreenStateProvider);
    final notifier = ref.read(contactListScreenStateProvider.notifier);

    final contacts = state.contacts;

    return GestureDetector(
      onTap: () {
        FocusManager.instance.primaryFocus?.unfocus();
      },
      child: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Contacts'),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: Icon(CupertinoIcons.add),
            onPressed: () {
              context.push(
                '/contact-manage',
                extra: ContactManageScreenArguments(
                  manageMode: ManageMode.create,
                  contact: Contact.create(),
                ),
              );
            },
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CupertinoSearchTextField(
                  controller: _searchController,
                  onSuffixTap: () {
                    _searchController.text = '';
                    notifier.search(searchText: '');
                  },
                  onSubmitted: (text) {
                    notifier.search(searchText: text);
                  },
                ),
              ),
              Expanded(
                child: state.status == LoadingStatus.initial
                    ? const Center(child: CupertinoActivityIndicator())
                    : ListView.separated(
                        controller: _scrollController,
                        itemCount: contacts.length + 1,
                        separatorBuilder: (_, __) => CupertinoDivider(),
                        itemBuilder: (context, index) {
                          if (index == contacts.length) {
                            return SizedBox(
                              height: 100,
                              child: Center(
                                child: state.status == LoadingStatus.loading
                                    ? const CupertinoActivityIndicator()
                                    : const SizedBox(),
                              ),
                            );
                          }

                          return CupertinoListTile(
                            title: Text(contacts[index].name),
                            onTap: () {
                              FocusManager.instance.primaryFocus?.unfocus();
                              context.push(
                                '/contact-manage',
                                extra: ContactManageScreenArguments(
                                  manageMode: ManageMode.edit,
                                  contact: contacts[index],
                                ),
                              );
                            },
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
