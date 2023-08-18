import 'package:budget_manager_app/services/i18n/locale_key.g.dart';
import 'package:budget_manager_app/services/isar/isar_service.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKey.featuresSettingsPageTitle).tr(),
      ),
      body: Column(
        children: [
          FilledButton(
            onPressed: IsarService().shareBackupFile,
            child: const Text('backupFile'),
          ),
          FilledButton(
            onPressed: IsarService().restoreFromFile,
            child: const Text('restore'),
          )
        ],
      ),
    );
  }
}
