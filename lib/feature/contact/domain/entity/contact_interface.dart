abstract class IContact{
  String get id;
  String get name;
  String get phone;
  String? get email;
  DateTime? get birthDay;
  DateTime get createdAt;
  DateTime? get updatedAt;
}