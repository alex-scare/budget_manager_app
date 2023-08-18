import 'package:budget_manager_app/shared/repositories/category_repository.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final categoriesPod = ChangeNotifierProvider((_) {
  return CategoriesService();
});

class CategoriesService extends ChangeNotifier {
  CategoriesRepository get repository => CategoriesRepository();
}
