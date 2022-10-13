import 'package:flutter/material.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_fetching_api/Models/user_model.dart';
import 'package:riverpod_fetching_api/Services/services.dart';
import 'package:riverpod_fetching_api/View/detail_screen.dart';
import 'package:riverpod_fetching_api/repository/data_provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final value = ref.watch(userProviderData);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riverpod'),
        centerTitle: true,
      ),
      body: value.when(
        data: (value) {
          List<UserModel> userList = value;

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: userList.length,
                  itemBuilder: (context, index) {
                    var user = userList[index];

                    return Card(
                      color: Colors.grey[800],
                      elevation: 4,
                      margin: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 6),
                      child: ListTile(
                        onTap: () =>
                            Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => DetailScreen(item: user),
                        )),
                        title: Text(
                          user.firstName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        subtitle: Text(
                          user.lastName,
                          style: const TextStyle(color: Colors.white),
                        ),
                        trailing: CircleAvatar(
                          backgroundImage: NetworkImage(user.avatar),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          );
        },
        error: (error, _) => Text(
          error.toString(),
          style: const TextStyle(color: Colors.black, fontSize: 30),
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
      ),
    );
  }
}
