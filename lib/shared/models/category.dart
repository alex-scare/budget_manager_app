// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:budget_manager_app/shared/helpers/app_icon.dart';
import 'package:isar/isar.dart';

part 'category.g.dart';

@Collection()
class Category {
  Id id = Isar.autoIncrement;
  String name;
  String description;
  DateTime createdAt;

  @Enumerated(EnumType.name)
  CategoryType type;

  @Enumerated(EnumType.name)
  AppIcon icon;

  Category({
    required this.name,
    required this.type,
    required this.icon,
    this.description = '',
  }) : createdAt = DateTime.now();

  Category.income({
    required this.name,
    required this.icon,
    this.description = '',
  })  : createdAt = DateTime.now(),
        type = CategoryType.income;

  Category.expense({
    required this.name,
    required this.icon,
    this.description = '',
  })  : createdAt = DateTime.now(),
        type = CategoryType.expense;
}

enum CategoryType {
  income,
  expense,
  ;
}
