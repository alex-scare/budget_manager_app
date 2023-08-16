import 'package:budget_manager_app/shared/models/category.dart';
import 'package:budget_manager_app/shared/repositories/base_repository.dart';

class CategoriesRepository extends BaseRepository<Category> {
  // singleton boilerplate
  static final CategoriesRepository _singleton =
      CategoriesRepository._internal();
  factory CategoriesRepository() => _singleton;
  CategoriesRepository._internal() : super();
  // end singleton boilerplate
}
