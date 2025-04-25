class Contact{
  final String id;
  final String name;
  final String phone;
  final String? email;
  final DateTime? birthDay;
  final DateTime createdAt;
  final DateTime? updatedAt;

  Contact(
      {required this.id,
      required this.name,
      required this.phone,
      required this.email,
      required this.birthDay,
      required this.createdAt,
      required this.updatedAt});

  Contact copyWith(
          {String? id,
          String? name,
          String? phone,
          String? email,
          DateTime? birthDay,
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      Contact(
          id: id ?? this.id,
          name: name ?? this.name,
          phone: phone ?? this.phone,
          email: email ?? this.email,
          birthDay: birthDay ?? this.birthDay,
          createdAt: createdAt ?? this.createdAt,
          updatedAt: updatedAt ?? this.updatedAt);
}
