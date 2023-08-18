import 'package:budget_manager_app/shared/models/transaction.dart';
import 'package:budget_manager_app/shared/repositories/transactions_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final transactionsServicePod = ChangeNotifierProvider((_) {
  return TransactionsService();
});

class TransactionsService extends ChangeNotifier {
  Stream<List<Transaction>> listenAllTransactions() async* {
    yield* TransactionsRepository().listenAll();
  }

  Future<List<Transaction>> getAllTransactions() async {
    return TransactionsRepository().getAll();
  }
}
