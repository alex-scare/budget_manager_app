// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

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

  // Data class generated methods and constructors

  Transaction._danger({
    required this.amount,
    required this.performedAt,
    required this.id,
    this.description = '',
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'description': description,
      'performedAt': performedAt.millisecondsSinceEpoch,
      'amount': amount,
    };
  }

  factory Transaction.fromMap(Map<String, dynamic> map) {
    return Transaction._danger(
      id: map['id'],
      description: map['description'] as String,
      performedAt:
          DateTime.fromMillisecondsSinceEpoch(map['performedAt'] as int),
      amount: map['amount'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory Transaction.fromJson(String source) =>
      Transaction.fromMap(json.decode(source) as Map<String, dynamic>);
}
