import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fetching_api/Models/user_model.dart';
import 'package:riverpod_fetching_api/Services/services.dart';

final userProviderData = FutureProvider<List<UserModel>>(
  (ref) async {
    return ref.watch(userProvider).getUsers();
  },
);
