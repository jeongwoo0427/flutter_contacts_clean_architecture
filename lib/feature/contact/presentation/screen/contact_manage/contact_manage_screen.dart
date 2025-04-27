import 'package:flutter/cupertino.dart';
import 'package:flutter_klleon_homeworkd/core/widget/cupertino_divider.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/presentation/screen/contact_manage/contact_manage_screen_state_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constant/app_enums.dart';
import '../../../../../core/mixin/validator_mixin.dart';

class ContactManageScreenArguments {
  final ManageMode manageMode;
  final Contact contact;

  ContactManageScreenArguments({
    required this.manageMode,
    required this.contact,
  });
}

class ContactManageScreen extends ConsumerStatefulWidget {
  final ContactManageScreenArguments arguments;

  const ContactManageScreen({super.key, required this.arguments});

  @override
  ConsumerState<ContactManageScreen> createState() => _ContactManageScreenState();
}

class _ContactManageScreenState extends ConsumerState<ContactManageScreen> with ValidatorMixin {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
    final Contact contact = widget.arguments.contact;
    _nameController.text = contact.name;
    _phoneController.text = contact.phone;
    _emailController.text = contact.email ?? '';
  }

  @override
  Widget build(BuildContext context) {
    final state = ref.watch(contactManageScreenStateProvider);
    final notifier = ref.read(contactManageScreenStateProvider.notifier);

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        navigationBar: CupertinoNavigationBar(
          middle: Text(widget.arguments.manageMode == ManageMode.create ? 'Add' : 'Edit'),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Cancel'),
            onPressed: () => context.pop(),
          ),
          trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Text('Done'),
            onPressed: () {
              if (checkValidate()) {
                final contact = widget.arguments.contact.copyWith(
                  name: _nameController.text.trim(),
                  phone: _phoneController.text.trim(),
                  email: _emailController.text.trim().isEmpty ? null : _emailController.text.trim(),
                );
                if (widget.arguments.manageMode == ManageMode.create) {
                  notifier.addContact(contact);
                } else if (widget.arguments.manageMode == ManageMode.edit) {
                  notifier.updateContact(contact);
                }
                context.pop();
              }
            },
          ),
        ),
        child: SafeArea(
          child: Form(
            key: validationKey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                Column(
                  spacing: 20,
                  children: [
                    CupertinoTextFormFieldRow(
                      maxLength: ValidatorConstants.nameMaxLength,
                      padding: EdgeInsets.zero,
                      placeholder: 'Name (Required)',
                      validator: validateName,
                      controller: _nameController,
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    CupertinoTextFormFieldRow(
                      maxLength: ValidatorConstants.phoneMaxLength,
                      padding: EdgeInsets.zero,
                      placeholder: 'Phone Number (Required)',
                      validator: validatePhoneNumber,
                      controller: _phoneController,
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    CupertinoDivider(),
                    CupertinoTextFormFieldRow(
                      maxLength: ValidatorConstants.emailMaxLength,
                      padding: EdgeInsets.zero,
                      placeholder: 'Email',
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return null; // 이메일은 optional
                        }
                        return validateEmail(value);
                      },
                      controller: _emailController,
                      decoration: BoxDecoration(
                        color: CupertinoColors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    const SizedBox(height: 20),
                    if(widget.arguments.manageMode == ManageMode.edit)Row(
                      children: [
                        Expanded(
                          child: CupertinoButton(
                            minSize: 40,
                            padding: EdgeInsets.zero,
                            color: CupertinoColors.white,
                            child: const Text(
                              'Delete',
                              style: TextStyle(color: CupertinoColors.destructiveRed),
                            ),
                            onPressed: () {
                              showCupertinoDialog(
                                context: context,
                                builder: (context) => CupertinoAlertDialog(
                                  title: const Text('Delete Contact'),
                                  content: const Text('Are you sure you want to delete this contact?'),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: const Text('Cancel'),
                                      onPressed: () => Navigator.of(context).pop(),
                                    ),
                                    CupertinoDialogAction(
                                      isDestructiveAction: true,
                                      child: const Text('Delete'),
                                      onPressed: () {
                                        notifier.deleteContact(widget.arguments.contact);
                                        Navigator.of(context).pop();
                                        context.pop();
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
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
