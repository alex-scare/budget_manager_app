// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:isar/isar.dart';

part 'account.g.dart';

@Collection()
class Account {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  String currency;
  double balance;

  Account({
    required this.name,
    required this.currency,
    this.description = '',
    this.balance = 0,
  });
}
