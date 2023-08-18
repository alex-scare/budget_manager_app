import 'package:budget_manager_app/shared/repositories/transactions_repository.dart';
import 'package:flutter/foundation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final transactionsServicePod = ChangeNotifierProvider((_) {
  return TransactionsService();
});

class TransactionsService extends ChangeNotifier {
  TransactionsRepository get repository => TransactionsRepository();
}
