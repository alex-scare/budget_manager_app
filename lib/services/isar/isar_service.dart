import 'dart:io';

import 'package:budget_manager_app/services/dev_logger/dev_logger.dart';
import 'package:budget_manager_app/services/file_system/file_system_service.dart';
import 'package:budget_manager_app/shared/models/account.dart';
import 'package:budget_manager_app/shared/models/category.dart';
import 'package:budget_manager_app/shared/models/payee.dart';
import 'package:budget_manager_app/shared/models/transaction.dart';
import 'package:isar/isar.dart';

const List<CollectionSchema> _isarSchemas = [
  AccountSchema,
  CategorySchema,
  PayeeSchema,
  TransactionSchema,
];

class IsarService {
  final _log = DevLogger('isar');
  static const _isarFileName = 'isar_db';
  static const isarDirName = 'isar';

  // singleton boilerplate
  static final IsarService _singleton = IsarService._internal();
  factory IsarService() => _singleton;
  IsarService._internal() {
    isar = _initIsar();
  }
  // end singleton boilerplate

  late Future<Isar> isar;

  Future<Isar> _initIsar([File? file]) async {
    final dir = await FileSystemService.getDocumentsDirectory();
    final isarDir = Directory('${dir.path}/$isarDirName');
    final isarFilePath = '${isarDir.path}/$_isarFileName.isar';

    if (file != null) {
      File(isarFilePath).writeAsBytesSync(file.readAsBytesSync());
    }

    if (!isarDir.existsSync()) {
      isarDir.createSync();
    }

    _log.info('service started');
    return Isar.openSync(
      _isarSchemas,
      directory: isarDir.path,
      name: _isarFileName,
    );
  }

  Future<void> shareBackupFile() async {
    final dir = await FileSystemService.getAppTemporaryDirectory();
    final file = File('${dir.path}/$_isarFileName.isar');

    if (file.existsSync()) {
      file.deleteSync();
    }

    final isar = await this.isar;
    await isar.copyToFile(file.path);

    await FileSystemService.shareFile(file);
    file.delete();
  }

  Future<void> restoreFromFile() async {
    final file = await FileSystemService.pickFile(allowedExtensions: ['isar']);

    if (file == null) return;

    await (await isar).close();
    isar = _initIsar(file);
  }
}
