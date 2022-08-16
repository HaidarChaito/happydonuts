import 'package:firebase_storage/firebase_storage.dart';

class Item {
  final String name;
  final String url;
  final Reference ref;

  const Item(
    this.name,
    this.url,
    this.ref,
  );

  String get nameWithoutExtension {
    return name.split(RegExp(r"(\.+)"))[0];
  }
}
