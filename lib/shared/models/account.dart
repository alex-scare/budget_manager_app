// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_manager_app/shared/helpers/app_icon.dart';
import 'package:isar/isar.dart';

part 'account.g.dart';

@Collection()
class Account {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  String currency;
  double balance;

  @Enumerated(EnumType.name)
  AppIcon icon;

  Account({
    required this.name,
    required this.currency,
    required this.icon,
    this.description = '',
    this.balance = 0,
  });
}
