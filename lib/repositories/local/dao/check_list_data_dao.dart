import 'package:devicepe_client/repositories/local/app_database.dart';
import 'package:devicepe_client/repositories/network/models/check_list_detail_response.dart';
import 'package:sembast/sembast.dart';

class CheckListDataDao {
  static const String folderName = "CheckListData";
  final _dbStore = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(CheckListData request) async {
    await _dbStore.delete(await _db);
    await _dbStore.add(await _db, request.toJson());
  }

  Future insertAll(List<CheckListData> request) async {
    await _dbStore.delete(await _db);
    for (int i = 0; i < request.length; i++) {
      await _dbStore.add(await _db, request[0].toJson());
    }
  }

  Future update(CheckListData request) async {
    final finder = Finder(filter: Filter.byKey(request.id));
    await _dbStore.update(await _db, request.toJson(), finder: finder);
  }

  Future delete(CheckListData request) async {
    final finder = Finder(filter: Filter.byKey(request.id));
    await _dbStore.delete(await _db, finder: finder);
  }

  Future deleteAll() async {
    await _dbStore.delete(
      await _db,
    );
  }

  Future<CheckListData> retrieve() async {
    final request = await _dbStore.find(await _db);
    List<CheckListData> a = request.map((snapshot) {
      final books = CheckListData.fromJson(snapshot.value);
      return books;
    }).toList();

    if (a.isEmpty) {
      return null;
    } else {
      return a[0];
    }
  }

  Future<List<CheckListData>> retrieveAll() async {
    final request = await _dbStore.find(await _db);
    return request.map((snapshot) {
      final books = CheckListData.fromJson(snapshot.value);
      return books;
    }).toList();
  }
}
