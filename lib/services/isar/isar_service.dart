import 'dart:io';

import 'package:budget_manager_app/services/dev_logger/dev_logger.dart';
import 'package:budget_manager_app/services/file_system/file_system_service.dart';
import 'package:budget_manager_app/shared/models/account.dart';
import 'package:budget_manager_app/shared/models/category.dart';
import 'package:budget_manager_app/shared/models/payee.dart';
import 'package:budget_manager_app/shared/models/transaction.dart';
import 'package:isar/isar.dart';

final _log = DevLogger('isar');
const isarDirName = 'isar';

const List<CollectionSchema> _isarSchemas = [
  AccountSchema,
  CategorySchema,
  PayeeSchema,
  TransactionSchema,
];

class IsarService {
  // singleton boilerplate
  static final IsarService _singleton = IsarService._internal();
  factory IsarService() => _singleton;
  IsarService._internal() {
    isar = _initIsar();
  }
  // end singleton boilerplate

  late Future<Isar> isar;

  Future<Isar> _initIsar() async {
    final dir = await FileSystemService.getDocumentsDirectory();
    final isarDir = Directory('${dir.path}/$isarDirName');

    if (!isarDir.existsSync()) {
      isarDir.createSync();
    }

    _log.info('service started');
    return Isar.openSync(_isarSchemas, directory: isarDir.path);
  }
}
