import 'package:destinaku/src/core/utils/constant/network_constant.dart';
import 'package:destinaku/src/features/auth/data/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('description', () async {
    await getData();
    expect(true, true);
  });
}

final dio = Dio();
Future<void> getData() async {
  try {
    // URL dari Firebase Realtime Database
    final response = await dio.get('${NetworkConstant.apiUrl}users.json');
    final data = response.data as Map<String, dynamic>;
    final res = response.statusCode;
    final res2 = response.statusMessage;
    final res3 = response.realUri;

    print('statusCode $res');
    print('statusMessage $res2');
    print('realUri $res3');

    // print(response.data); // Output data JSON dari database
    List<UserModel> users = data.entries.map((entry) {
      final id = entry.key; // ID adalah key dari map
      final userJson = entry.value as Map<String, dynamic>;
      return UserModel.fromJson(id, userJson);
    }).toList();

    print(users);
  } on DioException catch (e) {
    print('Error: ${e.response?.data}');
  }
}

Future<void> addData() async {
  try {
    final response = await dio.post(
      '${NetworkConstant.apiUrl}users.json',
      data: {"name": "Rifky martha", "email": "rifky@example.com"},
    );
    print('Data added: ${response.data}');
  } on DioException catch (e) {
    print('Error: ${e.response?.data}');
  }
}
