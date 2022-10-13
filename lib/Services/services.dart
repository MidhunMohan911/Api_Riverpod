import 'dart:convert';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:riverpod_fetching_api/Models/user_model.dart';

class ApiServices {
  String url = 'https://reqres.in/api/users?page=2';

  Future<List<UserModel>> getUsers() async {
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      final List result = jsonDecode(response.body)['data'];
      var totalresult = result.map((e) => UserModel.fromJson(e)).toList();
    
      return totalresult;
    } else {
      throw Exception(response.reasonPhrase);
    }
  }
}

//create provider object

final userProvider = Provider<ApiServices>(
  (ref) => ApiServices(),
);
