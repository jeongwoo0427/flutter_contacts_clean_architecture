import 'package:flutter/material.dart';

class ValidatorConstants {
  static const int emailMaxLength = 100;
  static const int emailMinLength = 1;

  static const int nameMaxLength = 30;
  static const int nameMinLength = 1;

  static const int phoneMaxLength = 15;
  static const int phoneMinLength = 1;
}

mixin class ValidatorMixin {
  final validationKey = GlobalKey<FormState>();

  bool checkValidate() {
    return validationKey.currentState!.validate();
  }

  String? validateName(String? value) {
    final trimmedValue = value?.trim() ?? '';

    if (trimmedValue.isEmpty) {
      return 'Name is required.';
    }
    if (trimmedValue.length > ValidatorConstants.nameMaxLength) {
      return 'Name must be less than ${ValidatorConstants.nameMaxLength} characters.';
    }
    if (trimmedValue.length < ValidatorConstants.nameMinLength) {
      return 'Name must be at least ${ValidatorConstants.nameMinLength} characters.';
    }
    return null;
  }

  String? validatePhoneNumber(String? value) {
    final trimmedValue = value?.trim() ?? '';

    if (trimmedValue.isEmpty) {
      return 'Phone number is required.';
    }
    if (trimmedValue.length > ValidatorConstants.phoneMaxLength) {
      return 'Phone number must be less than ${ValidatorConstants.phoneMaxLength} digits.';
    }
    if (trimmedValue.length < ValidatorConstants.phoneMinLength) {
      return 'Phone number must be at least ${ValidatorConstants.phoneMinLength} digits.';
    }

    return null;
  }

  String? validateEmail(String? value) {
    final trimmedValue = value?.trim() ?? '';

    if (trimmedValue.isEmpty) {
      return 'Email is required.';
    }
    if (trimmedValue.length > ValidatorConstants.emailMaxLength) {
      return 'Email must be less than ${ValidatorConstants.emailMaxLength} characters.';
    }
    if (trimmedValue.length < ValidatorConstants.emailMinLength) {
      return 'Email must be at least ${ValidatorConstants.emailMinLength} characters.';
    }
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(trimmedValue)) {
      return 'Enter a valid email address.';
    }
    return null;
  }
}
