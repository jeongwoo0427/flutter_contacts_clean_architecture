import 'package:flutter/cupertino.dart';
import 'package:go_router/go_router.dart';

class ContactManageScreen extends StatefulWidget {
  const ContactManageScreen({super.key});

  @override
  State<ContactManageScreen> createState() => _ContactManageScreenState();
}

class _ContactManageScreenState extends State<ContactManageScreen> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          leading:
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text('Cancel'), onPressed: () {
                context.pop();
              }),
          trailing:
              CupertinoButton(
                  padding: EdgeInsets.zero,
                  child: const Text('Done'), onPressed: () {}),
        ),
        child: Column(
          children: [],
        ));
  }
}
