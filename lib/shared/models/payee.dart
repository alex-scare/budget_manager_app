import 'package:isar/isar.dart';

part 'payee.g.dart';

@Collection()
class Payee {
  Id id = Isar.autoIncrement;
  String name;
  String description;

  Payee({
    required this.name,
    this.description = '',
  });
}
