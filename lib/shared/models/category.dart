// ignore_for_file: public_member_api_docs, sort_constructors_first
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

  Category({
    required this.name,
    required this.type,
    this.description = '',
  }) : createdAt = DateTime.now();

  Category.income({required this.name, this.description = ''})
      : createdAt = DateTime.now(),
        type = CategoryType.income;

  Category.expense({required this.name, this.description = ''})
      : createdAt = DateTime.now(),
        type = CategoryType.expense;
}

enum CategoryType {
  income,
  expense,
  ;
}
