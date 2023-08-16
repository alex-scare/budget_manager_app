import 'package:budget_manager_app/shared/models/account.dart';
import 'package:budget_manager_app/shared/models/category.dart';
import 'package:budget_manager_app/shared/models/payee.dart';
import 'package:isar/isar.dart';

part 'transaction.g.dart';

@Collection()
class Transaction {
  Id id = Isar.autoIncrement;
  String description;
  DateTime performedAt;
  double amount;

  final category = IsarLink<Category>();
  final account = IsarLink<Account>();
  final payee = IsarLink<Payee>();

  Transaction({
    required this.amount,
    required this.performedAt,
    this.description = '',
  });

  factory Transaction.empty() {
    return Transaction(
      amount: 0,
      performedAt: DateTime.now(),
    );
  }
}
