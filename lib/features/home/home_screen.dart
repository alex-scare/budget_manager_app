import 'package:budget_manager_app/services/i18n/locale_key.g.dart';
import 'package:budget_manager_app/shared/models/transaction.dart';
import 'package:budget_manager_app/shared/services/transactions_service.dart';
import 'package:budget_manager_app/shared/widgets/custom_app_bar.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomeScreen extends HookConsumerWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context, ref) {
    final transactions = ref.watch(transactionsServicePod);

    return Scaffold(
      appBar: CustomAppBar(
        title: const Text(LocaleKey.featuresHomePageTitle).tr(),
      ),
      body: StreamBuilder(
        initialData: const [].cast<Transaction>(),
        stream: transactions.repository.listenAll(),
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data?.length ?? 0,
            itemBuilder: (context, index) {
              final current = snapshot.data?[index] ?? Transaction.empty();
              return ListTile(
                title: Text(current.performedAt.toString()),
                subtitle: Text(current.amount.toString()),
              );
            },
          );
        },
      ),
    );
  }
}
