import 'package:budget_manager_app/shared/models/account.dart';
import 'package:budget_manager_app/shared/repositories/base_repository.dart';

class AccountRepository extends BaseRepository<Account> {
  // singleton boilerplate
  static final AccountRepository _singleton = AccountRepository._internal();
  factory AccountRepository() => _singleton;
  AccountRepository._internal() : super();
  // end singleton boilerplate
}
