import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

import '../../../../../core/constant/app_enums.dart';

class ContactListScreenState {
  final LoadingStatus status;
  final List<Contact> contacts;
  final bool isLastPage;
  final int currentPage;
  final String searchText;

  ContactListScreenState(
      {required this.status,
      required this.contacts,
      required this.isLastPage,
      required this.currentPage,
      required this.searchText
      });

  factory ContactListScreenState.create({LoadingStatus? status,
    List<Contact>? contacts,
    bool? isLastPage,
    int? currentPage,
    String? searchText,
  }) => ContactListScreenState(
      status: status??LoadingStatus.initial,
      contacts: contacts??const [],
      isLastPage: isLastPage??false,
      currentPage: currentPage?? 0,
      searchText: searchText??''
  );

  ContactListScreenState copyWith(
          {LoadingStatus? status,
          List<Contact>? contacts,
          bool? isLastPage,
          int? currentPage,
          String? searchText,
          }) =>
      ContactListScreenState(
          status: status ?? this.status,
          contacts: contacts ?? this.contacts,
          isLastPage: isLastPage ?? this.isLastPage,
          currentPage: currentPage ?? this.currentPage,
          searchText: searchText ?? this.searchText,
      );
}
