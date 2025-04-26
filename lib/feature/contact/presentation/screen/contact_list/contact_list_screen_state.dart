import 'package:flutter_klleon_homeworkd/core/constant/app_constants.dart';
import 'package:flutter_klleon_homeworkd/feature/contact/domain/entity/contact.dart';

class ContactListScreenState {
  final LoadingStatus status;
  final List<Contact> contacts;
  final bool isLastPage;
  final int currentPage;

  ContactListScreenState(
      {required this.status,
      required this.contacts,
      required this.isLastPage,
      required this.currentPage});

  factory ContactListScreenState.create() => ContactListScreenState(
      status: LoadingStatus.initial,
      contacts: const [],
      isLastPage: false,
      currentPage: 0);

  ContactListScreenState copyWith(
          {LoadingStatus? status,
          List<Contact>? contacts,
          bool? isLastPage,
          int? currentPage}) =>
      ContactListScreenState(
          status: status ?? this.status,
          contacts: contacts ?? this.contacts,
          isLastPage: isLastPage ?? this.isLastPage,
          currentPage: currentPage ?? this.currentPage);
}
