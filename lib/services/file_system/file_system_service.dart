import 'dart:io';

import 'package:budget_manager_app/services/dev_logger/dev_logger.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

class FileSystemService {
  static final _log = DevLogger('FileSystemService');

  static Directory? _appSupportDirectory;
  static Directory? _appDocumentsDirectory;
  static Directory? _appTemporaryDirectory;

  static Future<Directory> getSupportDirectory() async {
    return _appSupportDirectory ??= await getApplicationSupportDirectory();
  }

  static Future<Directory> getDocumentsDirectory() async {
    return _appDocumentsDirectory ??= await getApplicationDocumentsDirectory();
  }

  static Future<Directory> getAppTemporaryDirectory() async {
    return _appTemporaryDirectory ??= await getTemporaryDirectory();
  }

  static Future<void> shareFile(File file) async {
    try {
      final String fileName = file.path.split('/').last;

      ShareResult shareResult;
      final files = <XFile>[];
      files.add(XFile(file.path, name: fileName));

      shareResult = await Share.shareXFiles(files);
      if (shareResult.status == ShareResultStatus.unavailable) {
        _log.error(
          'download error: file not found $fileName',
          null,
          StackTrace.current,
        );
      }
    } on PlatformException catch (e, stack) {
      _log.error('platform error: file download error', e, stack);
    } catch (error) {
      _log.error(
        'unknown error: file download error',
        error,
        StackTrace.current,
      );
    }
  }

  static Future<File?> pickFile({
    required List<String> allowedExtensions,
  }) async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.any,
        // allowedExtensions: allowedExtensions,
      );
      if (result != null) {
        final file = File(result.files.single.path!);
        return file;
      }
    } on PlatformException catch (e, stack) {
      _log.error('platform error: file pick error', e, stack);
    } catch (error) {
      _log.error('unknown error: file pick error', error, StackTrace.current);
    }
    return null;
  }
}
