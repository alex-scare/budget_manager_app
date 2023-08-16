import 'package:budget_manager_app/services/isar/isar_service.dart';
import 'package:isar/isar.dart';

class BaseRepository<CollectionType> {
  late Future<Isar> isar;

  BaseRepository() {
    isar = IsarService().isar;
  }

  Stream<List<CollectionType>> listenAll() async* {
    final db = await isar;

    yield* db.collection<CollectionType>().where().watch(fireImmediately: true);
  }

  Future<List<CollectionType>> getAll() async {
    final db = await isar;
    return db.collection<CollectionType>().where().findAll();
  }

  Stream<CollectionType> listenById(Id id) async* {
    final db = await isar;
    yield* db
        .collection<CollectionType>()
        .watchObject(id, fireImmediately: true)
        .cast();
  }

  Future<CollectionType?> getById(Id id) async {
    final db = await isar;
    final collection = db.collection<CollectionType>();
    return collection.get(id);
  }

  Future<int> save(CollectionType collection) async {
    final db = await isar;
    return db.writeTxn<int>(() {
      return db.collection<CollectionType>().put(collection);
    });
  }

  Future<void> delete(Id id) async {
    final db = await isar;
    db.writeTxn(() {
      return db.collection<CollectionType>().delete(id);
    });
  }
}
