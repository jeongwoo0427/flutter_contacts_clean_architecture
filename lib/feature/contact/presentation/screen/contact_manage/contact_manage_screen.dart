import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/widget/cupertino_divider.dart';
import 'package:go_router/go_router.dart';

class ContactManageScreen extends StatefulWidget {
  const ContactManageScreen({super.key});

  @override
  State<ContactManageScreen> createState() => _ContactManageScreenState();
}

class _ContactManageScreenState extends State<ContactManageScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        navigationBar: CupertinoNavigationBar(
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Cancel'),
            onPressed: () => context.pop(),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Done'),
            onPressed: () {},
          ),
        ),
        child: SafeArea(
          child: ListView(
            // 스크롤 가능하게 (iOS Form 스타일)
            padding: const EdgeInsets.all(16),
            children: [
              Column(
                spacing: 20,
                children: [
                  CupertinoTextField(
                    placeholder: 'Name (Required)',
                    controller: _nameController,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white, // <<< 흰색 TextField
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  CupertinoTextField(
                    placeholder: 'Phone Number (Required)',
                    controller: _phoneController,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  CupertinoDivider(),
                  CupertinoTextField(
                    placeholder: 'Email',
                    controller: _emailController,
                    decoration: BoxDecoration(
                      color: CupertinoColors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  const SizedBox(height: 20,),
                  Row(
                    children: [
                      Expanded(
                        child: CupertinoButton(
                          minSize: 40,
                          padding: EdgeInsets.zero,
                          color: CupertinoColors.white,
                          child: const Text('Delete',
                              style: TextStyle(color: CupertinoColors.destructiveRed,)),
                          onPressed: () {
                            showCupertinoDialog(
                              context: context,
                              builder: (context) => CupertinoAlertDialog(
                                title: const Text('Delete Contact'),
                                content: const Text(
                                    'Are you sure you want to delete this contact?'),
                                actions: [
                                  CupertinoDialogAction(
                                    child: const Text('Cancel'),
                                    onPressed: () =>
                                        Navigator.of(context).pop(),
                                  ),
                                  CupertinoDialogAction(
                                    isDestructiveAction: true,
                                    child: const Text('Delete'),
                                    onPressed: () {
                                      // TODO: 삭제 로직
                                      Navigator.of(context).pop();
                                      context.pop(); // 삭제 후 화면 닫기
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
