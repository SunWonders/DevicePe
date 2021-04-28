import 'package:devicepe_client/repositories/local/app_database.dart';
import 'package:devicepe_client/repositories/network/models/login_request.dart';
import 'package:sembast/sembast.dart';

class LoginRequestDao {
  static const String folderName = "LoginRequest";
  final _dbStore = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(LoginRequest request) async {
    await _dbStore.delete(await _db);
    await _dbStore.add(await _db, request.toJson());
  }

  Future update(LoginRequest request) async {
    final finder = Finder(filter: Filter.byKey(request.username));
    await _dbStore.update(await _db, request.toJson(), finder: finder);
  }

  Future delete(LoginRequest request) async {
    final finder = Finder(filter: Filter.byKey(request.username));
    await _dbStore.delete(await _db, finder: finder);
  }

  Future deleteAll() async {
    await _dbStore.delete(
      await _db,
    );
  }

  Future<LoginRequest> retrieve() async {
    final request = await _dbStore.find(await _db);
    List<LoginRequest> a = request.map((snapshot) {
      final books = LoginRequest.fromJson(snapshot.value);
      return books;
    }).toList();

    if (a.isEmpty) {
      return null;
    } else {
      return a[0];
    }
  }
}
