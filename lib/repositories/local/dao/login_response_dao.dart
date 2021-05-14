import 'package:devicepe_client/repositories/local/app_database.dart';
import 'package:devicepe_client/repositories/network/models/login_response.dart';
import 'package:sembast/sembast.dart';

class LoginResponseDao {
  static const String folderName = "LoginResponse";
  final _dbStore = intMapStoreFactory.store(folderName);

  Future<Database> get _db async => await AppDatabase.instance.database;

  Future insert(LoginResponse request) async {
    await _dbStore.delete(await _db);
    await _dbStore.add(await _db, request.toJson());
  }

  Future update(LoginResponse request) async {
    final finder = Finder(filter: Filter.byKey(request.userId));
    await _dbStore.update(await _db, request.toJson(), finder: finder);
  }

  Future delete(LoginResponse request) async {
    final finder = Finder(filter: Filter.byKey(request.userId));
    await _dbStore.delete(await _db, finder: finder);
  }

  Future deleteAll() async {
    await _dbStore.delete(
      await _db,
    );
  }

  Future<LoginResponse?> retrieve() async {
    final request = await _dbStore.find(await _db);
    List<LoginResponse> a = request.map((snapshot) {
      final books = LoginResponse.fromJson(snapshot.value);
      return books;
    }).toList();

    if (a.isEmpty) {
      return null;
    } else {
      return a[0];
    }
  }
}
