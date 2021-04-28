//import 'package:devicepe_client/repositories/network/models/login_request.dart';
//import 'package:hive/hive.dart';
//import 'package:path_provider/path_provider.dart';

// class HiveRepo {
//   initState() {
//     openBox();
//   }

//   static String getToken() {
//     var box = Hive.box('token');

//     return box.get('api_token');
//   }

//   static void saveToken(String token) {
//     var box = Hive.box('warrior_data');
//     box.put('api_token', token);
//   }

//   static void saveName(String name) {
//     var box = Hive.box('warrior_data');
//     box.put('name', name);
//   }

//   static String getName(String name) {
//     var box = Hive.box('warrior_data');
//     return box.get('name');
//   }

//   static Future<void> saveLoginDetails(LoginRequest loginRequest) async {
//     var box = await Hive.openBox('warrior_data');
//     await box.put('login_details', loginRequest);
//   }

//   static Future<LoginRequest> getLoginDetails() async {
//     var box = await Hive.openBox('warrior_data');
//     LoginRequest loginRequest = await box.get('login_details');
//     return loginRequest;
//   }

//   Future openBox() async {
//     var dir = await getApplicationDocumentsDirectory();
//     Hive
//       ..init(dir.path)
//       ..registerAdapter(LoginRequestAdapter());
//   }
// }
