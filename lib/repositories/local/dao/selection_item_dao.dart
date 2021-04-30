import 'package:devicepe_client/dto/selection_item.dart';
import 'package:devicepe_client/repositories/local/app_database.dart';
import 'package:sembast/sembast.dart';

class SelectionItemDao {
  static const String folderName = "SelectionItem";
  final _dbStore = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(SelectionItem request) async {
    await _dbStore.add(await _db, request.toJson());
  }

  Future insertAll(List<SelectionItem> request) async {
    await _dbStore.delete(await _db);
    request.forEach((element) {
      insert(element);
    });
  }

  Future update(SelectionItem request) async {
    final finder = Finder(filter: Filter.byKey(request.name));
    await _dbStore.update(await _db, request.toJson(), finder: finder);
  }

  Future delete(SelectionItem request) async {
    final finder = Finder(filter: Filter.byKey(request.name));
    await _dbStore.delete(await _db, finder: finder);
  }

  Future deleteAll() async {
    await _dbStore.delete(
      await _db,
    );
  }

  Future<List<SelectionItem>> retrieve() async {
    final request = await _dbStore.find(await _db);
    List<SelectionItem> a = request.map((snapshot) {
      final books = SelectionItem.fromJson(snapshot.value);
      return books;
    }).toList();

    return a;
  }
}
