import 'package:budget_manager_app/shared/models/transaction.dart';
import 'package:budget_manager_app/shared/repositories/base_repository.dart';

class TransactionsRepository extends BaseRepository<Transaction> {
  // singleton boilerplate
  static final TransactionsRepository _singleton =
      TransactionsRepository._internal();
  factory TransactionsRepository() => _singleton;
  TransactionsRepository._internal() : super();
  // end singleton boilerplate}
}
