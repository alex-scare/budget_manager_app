import 'package:budget_manager_app/services/i18n/locale_key.g.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKey.featuresHomePageTitle).tr(),
      ),
      body: const Text('geello'),
    );
  }
}
