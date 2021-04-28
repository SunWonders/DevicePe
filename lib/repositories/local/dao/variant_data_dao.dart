import 'package:devicepe_client/repositories/local/app_database.dart';
import 'package:devicepe_client/repositories/network/models/variant_response_model.dart';
import 'package:sembast/sembast.dart';

class VariantDataDao {
  static const String folderName = "VariantData";
  final _dbStore = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(VariantData request) async {
    await _dbStore.delete(await _db);
    await _dbStore.add(await _db, request.toJson());
  }

  Future update(VariantData request) async {
    final finder = Finder(filter: Filter.byKey(request.id));
    await _dbStore.update(await _db, request.toJson(), finder: finder);
  }

  Future delete(VariantData request) async {
    final finder = Finder(filter: Filter.byKey(request.id));
    await _dbStore.delete(await _db, finder: finder);
  }

  Future deleteAll() async {
    await _dbStore.delete(
      await _db,
    );
  }

  Future<VariantData> retrieve() async {
    final request = await _dbStore.find(await _db);
    List<VariantData> a = request.map((snapshot) {
      final books = VariantData.fromJson(snapshot.value);
      return books;
    }).toList();

    if (a.isEmpty) {
      return null;
    } else {
      return a[0];
    }
  }
}
