import 'package:budget_manager_app/core/theme/theme.dart';
import 'package:budget_manager_app/features/app/app.dart';
import 'package:budget_manager_app/services/dev_logger/dev_logger.dart';
import 'package:budget_manager_app/services/i18n/global_i18n_handler.dart';
import 'package:budget_manager_app/services/i18n/i18n_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final log = DevLogger('root');

void main() async {
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  log.empty();
  log.infoWithDelimiters('app starting test');

  SystemChrome.setSystemUIOverlayStyle(AppTheme.overlayStyleLight);
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await I18nService.init();

  runApp(const ProviderScope(child: GlobalI18nHandler(child: App())));
}
