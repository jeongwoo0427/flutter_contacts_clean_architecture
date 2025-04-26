class ContactListScreenState {
  final String text;

  ContactListScreenState({this.text = ''});

  ContactListScreenState copyWith({String? text}) =>
      ContactListScreenState(text: text ?? this.text);
}
